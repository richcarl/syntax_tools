
include ../vsn.mk

EMULATOR=beam
EBIN=../ebin
INCLUDE=../include

APP_TARGET=$(EBIN)/syntax_tools.app

ERL_COMPILE_FLAGS += -I$(INCLUDE) +warn_unused_vars +nowarn_shadow_vars +warn_unused_import +warn_missing_spec +warn_untyped_record

SOURCES= \
	epp_dodger.erl \
	erl_recomment.erl \
	erl_tidy.erl \
	erl_comment_scan.erl \
	erl_syntax.erl \
	igor.erl \
	erl_prettypr.erl \
	erl_syntax_lib.erl \
	prettypr.erl

OBJECTS=$(SOURCES:%.erl=$(EBIN)/%.$(EMULATOR)) $(APP_TARGET)

all: $(OBJECTS)

clean:
	-rm -f $(OBJECTS)

$(EBIN)/%.$(EMULATOR):%.erl
	erlc -pa $(EBIN) -W $(ERL_COMPILE_FLAGS) -o$(EBIN) $<

$(APP_TARGET): syntax_tools.app.src ../vsn.mk
	sed -e 's;%VSN%;$(SYNTAX_TOOLS_VSN);' $< > $@
