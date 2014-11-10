#-- start of make_header -----------------

#====================================
#  Library MongoDBSvc
#
#   Generated Mon Nov 10 20:54:37 2014  by liujy
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_MongoDBSvc_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_MongoDBSvc_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_MongoDBSvc

MongoDBSvc_tag = $(tag)

#cmt_local_tagfile_MongoDBSvc = $(MongoDBSvc_tag)_MongoDBSvc.make
cmt_local_tagfile_MongoDBSvc = $(bin)$(MongoDBSvc_tag)_MongoDBSvc.make

else

tags      = $(tag),$(CMTEXTRATAGS)

MongoDBSvc_tag = $(tag)

#cmt_local_tagfile_MongoDBSvc = $(MongoDBSvc_tag).make
cmt_local_tagfile_MongoDBSvc = $(bin)$(MongoDBSvc_tag).make

endif

include $(cmt_local_tagfile_MongoDBSvc)
#-include $(cmt_local_tagfile_MongoDBSvc)

ifdef cmt_MongoDBSvc_has_target_tag

cmt_final_setup_MongoDBSvc = $(bin)setup_MongoDBSvc.make
cmt_dependencies_in_MongoDBSvc = $(bin)dependencies_MongoDBSvc.in
#cmt_final_setup_MongoDBSvc = $(bin)MongoDBSvc_MongoDBSvcsetup.make
cmt_local_MongoDBSvc_makefile = $(bin)MongoDBSvc.make

else

cmt_final_setup_MongoDBSvc = $(bin)setup.make
cmt_dependencies_in_MongoDBSvc = $(bin)dependencies.in
#cmt_final_setup_MongoDBSvc = $(bin)MongoDBSvcsetup.make
cmt_local_MongoDBSvc_makefile = $(bin)MongoDBSvc.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)MongoDBSvcsetup.make

#MongoDBSvc :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'MongoDBSvc'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = MongoDBSvc/
#MongoDBSvc::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

MongoDBSvclibname   = $(bin)$(library_prefix)MongoDBSvc$(library_suffix)
MongoDBSvclib       = $(MongoDBSvclibname).a
MongoDBSvcstamp     = $(bin)MongoDBSvc.stamp
MongoDBSvcshstamp   = $(bin)MongoDBSvc.shstamp

MongoDBSvc :: dirs  MongoDBSvcLIB
	$(echo) "MongoDBSvc ok"

cmt_MongoDBSvc_has_prototypes = 1

#--------------------------------------

ifdef cmt_MongoDBSvc_has_prototypes

MongoDBSvcprototype :  ;

endif

MongoDBSvccompile : $(bin)MongoDBQuery.o $(bin)MongoDBSvc.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

MongoDBSvcLIB :: $(MongoDBSvclib) $(MongoDBSvcshstamp)
	$(echo) "MongoDBSvc : library ok"

$(MongoDBSvclib) :: $(bin)MongoDBQuery.o $(bin)MongoDBSvc.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(MongoDBSvclib) $(bin)MongoDBQuery.o $(bin)MongoDBSvc.o
	$(lib_silent) $(ranlib) $(MongoDBSvclib)
	$(lib_silent) cat /dev/null >$(MongoDBSvcstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(MongoDBSvclibname).$(shlibsuffix) :: $(MongoDBSvclib) requirements $(use_requirements) $(MongoDBSvcstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" MongoDBSvc $(MongoDBSvc_shlibflags)
	$(lib_silent) cat /dev/null >$(MongoDBSvcshstamp)

$(MongoDBSvcshstamp) :: $(MongoDBSvclibname).$(shlibsuffix)
	$(lib_silent) if test -f $(MongoDBSvclibname).$(shlibsuffix) ; then cat /dev/null >$(MongoDBSvcshstamp) ; fi

MongoDBSvcclean ::
	$(cleanup_echo) objects MongoDBSvc
	$(cleanup_silent) /bin/rm -f $(bin)MongoDBQuery.o $(bin)MongoDBSvc.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)MongoDBQuery.o $(bin)MongoDBSvc.o) $(patsubst %.o,%.dep,$(bin)MongoDBQuery.o $(bin)MongoDBSvc.o) $(patsubst %.o,%.d.stamp,$(bin)MongoDBQuery.o $(bin)MongoDBSvc.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf MongoDBSvc_deps MongoDBSvc_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
MongoDBSvcinstallname = $(library_prefix)MongoDBSvc$(library_suffix).$(shlibsuffix)

MongoDBSvc :: MongoDBSvcinstall ;

install :: MongoDBSvcinstall ;

MongoDBSvcinstall :: $(install_dir)/$(MongoDBSvcinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(MongoDBSvcinstallname) :: $(bin)$(MongoDBSvcinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(MongoDBSvcinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##MongoDBSvcclean :: MongoDBSvcuninstall

uninstall :: MongoDBSvcuninstall ;

MongoDBSvcuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(MongoDBSvcinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),MongoDBSvcclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),MongoDBSvcprototype)

$(bin)MongoDBSvc_dependencies.make : $(use_requirements) $(cmt_final_setup_MongoDBSvc)
	$(echo) "(MongoDBSvc.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)MongoDBQuery.cc $(src)MongoDBSvc.cc -end_all $(includes) $(app_MongoDBSvc_cppflags) $(lib_MongoDBSvc_cppflags) -name=MongoDBSvc $? -f=$(cmt_dependencies_in_MongoDBSvc) -without_cmt

-include $(bin)MongoDBSvc_dependencies.make

endif
endif
endif

MongoDBSvcclean ::
	$(cleanup_silent) \rm -rf $(bin)MongoDBSvc_deps $(bin)MongoDBSvc_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),MongoDBSvcclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)MongoDBQuery.d

$(bin)$(binobj)MongoDBQuery.d :

$(bin)$(binobj)MongoDBQuery.o : $(cmt_final_setup_MongoDBSvc)

$(bin)$(binobj)MongoDBQuery.o : $(src)MongoDBQuery.cc
	$(cpp_echo) $(src)MongoDBQuery.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(MongoDBSvc_pp_cppflags) $(lib_MongoDBSvc_pp_cppflags) $(MongoDBQuery_pp_cppflags) $(use_cppflags) $(MongoDBSvc_cppflags) $(lib_MongoDBSvc_cppflags) $(MongoDBQuery_cppflags) $(MongoDBQuery_cc_cppflags)  $(src)MongoDBQuery.cc
endif
endif

else
$(bin)MongoDBSvc_dependencies.make : $(MongoDBQuery_cc_dependencies)

$(bin)MongoDBSvc_dependencies.make : $(src)MongoDBQuery.cc

$(bin)$(binobj)MongoDBQuery.o : $(MongoDBQuery_cc_dependencies)
	$(cpp_echo) $(src)MongoDBQuery.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(MongoDBSvc_pp_cppflags) $(lib_MongoDBSvc_pp_cppflags) $(MongoDBQuery_pp_cppflags) $(use_cppflags) $(MongoDBSvc_cppflags) $(lib_MongoDBSvc_cppflags) $(MongoDBQuery_cppflags) $(MongoDBQuery_cc_cppflags)  $(src)MongoDBQuery.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),MongoDBSvcclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)MongoDBSvc.d

$(bin)$(binobj)MongoDBSvc.d :

$(bin)$(binobj)MongoDBSvc.o : $(cmt_final_setup_MongoDBSvc)

$(bin)$(binobj)MongoDBSvc.o : $(src)MongoDBSvc.cc
	$(cpp_echo) $(src)MongoDBSvc.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(MongoDBSvc_pp_cppflags) $(lib_MongoDBSvc_pp_cppflags) $(MongoDBSvc_pp_cppflags) $(use_cppflags) $(MongoDBSvc_cppflags) $(lib_MongoDBSvc_cppflags) $(MongoDBSvc_cppflags) $(MongoDBSvc_cc_cppflags)  $(src)MongoDBSvc.cc
endif
endif

else
$(bin)MongoDBSvc_dependencies.make : $(MongoDBSvc_cc_dependencies)

$(bin)MongoDBSvc_dependencies.make : $(src)MongoDBSvc.cc

$(bin)$(binobj)MongoDBSvc.o : $(MongoDBSvc_cc_dependencies)
	$(cpp_echo) $(src)MongoDBSvc.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(MongoDBSvc_pp_cppflags) $(lib_MongoDBSvc_pp_cppflags) $(MongoDBSvc_pp_cppflags) $(use_cppflags) $(MongoDBSvc_cppflags) $(lib_MongoDBSvc_cppflags) $(MongoDBSvc_cppflags) $(MongoDBSvc_cc_cppflags)  $(src)MongoDBSvc.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: MongoDBSvcclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(MongoDBSvc.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

MongoDBSvcclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library MongoDBSvc
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)MongoDBSvc$(library_suffix).a $(library_prefix)MongoDBSvc$(library_suffix).$(shlibsuffix) MongoDBSvc.stamp MongoDBSvc.shstamp
#-- end of cleanup_library ---------------
