# msf-ws.ru
# Metasploit data web service

require 'pathname'
@framework_path = '.'
root = Pathname.new(@framework_path).expand_path
@framework_lib_path = root.join('lib')
$LOAD_PATH << @framework_lib_path unless $LOAD_PATH.include?(@framework_lib_path)

require 'msfenv'

if ENV['MSF_LOCAL_LIB']
  $LOAD_PATH << ENV['MSF_LOCAL_LIB'] unless $LOAD_PATH.include?(ENV['MSF_LOCAL_LIB'])
end

# Note: setup Rails environment before calling require
require 'msf/core/web_services/metasploit_api_app'

# run Msf::WebServices::JsonRpcApp
run MetasploitApiApp
