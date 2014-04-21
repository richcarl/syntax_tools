
APPNAME=syntax_tools

SUB_DIRECTORIES = src

include vsn.mk

DOC_OPTS={def,{version,\"$(SYNTAX_TOOLS_VSN)\"}}


all: subdirs

subdirs:
	@for d in $(SUB_DIRECTORIES); do \
	  	(cd $$d; $(MAKE)); \
	done

clean:
	@for d in $(SUB_DIRECTORIES); do \
	  	(cd $$d; $(MAKE) clean); \
	done
	-rm -f doc/*.html doc/stylesheet.css doc/erlang.png doc/edoc-info

docs:
	erl -noshell -eval "edoc:application($(APPNAME), \".\", [$(DOC_OPTS)])" -s init stop
