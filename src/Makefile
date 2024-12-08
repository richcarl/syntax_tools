
include ../vsn.mk

EMULATOR=beam
EBIN=../ebin
PRIV=../priv
INCLUDE=../include

APP_TARGET=$(EBIN)/syntax_tools.app
ERL_COMPILE_FLAGS += -I$(INCLUDE) +warn_deprecated_catch +nowarn_shadow_vars +warn_unused_import +warn_missing_spec +warn_untyped_record

SOURCES= \
	epp_dodger.erl \
	erl_recomment.erl \
	erl_comment_scan.erl \
	erl_syntax.erl \
	erl_prettypr.erl \
	erl_syntax_lib.erl \
	prettypr.erl

MERL_SOURCES= \
	merl.erl \
	merl_transform.erl \
	merl_tests.erl

MERL_OBJECTS=$(MERL_SOURCES:%.erl=$(EBIN)/%.$(EMULATOR))

OBJECTS=$(SOURCES:%.erl=$(EBIN)/%.$(EMULATOR)) $(MERL_OBJECTS) $(APP_TARGET)

all: $(OBJECTS)

clean:
	-rm -f $(OBJECTS)

$(EBIN)/%.$(EMULATOR):%.erl
	erlc -pa $(EBIN) -W $(ERL_COMPILE_FLAGS) -o$(EBIN) $<

$(MERL_OBJECTS): $(INCLUDE)/merl.hrl

# additional dependencies due to the merl parse transform
$(EBIN)/merl_tests.$(EMULATOR): \
	$(EBIN)/merl_transform.$(EMULATOR) $(EBIN)/merl.$(EMULATOR)

# special rules and dependencies to apply the merl transform to itself
$(EBIN)/merl_transform.$(EMULATOR): $(EBIN)/merl.$(EMULATOR) $(PRIV)/merl_transform.$(EMULATOR)
$(PRIV)/merl_transform.$(EMULATOR): merl_transform.erl $(INCLUDE)/merl.hrl
	erlc -DMERL_NO_TRANSFORM $(ERL_COMPILE_FLAGS) -o $(PRIV) $<

$(APP_TARGET): syntax_tools.app.src ../vsn.mk
	sed -e 's;%VSN%;$(SYNTAX_TOOLS_VSN);' $< > $@
