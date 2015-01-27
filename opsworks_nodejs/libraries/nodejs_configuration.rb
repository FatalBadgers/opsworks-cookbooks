module OpsWorks
  module NodejsConfiguration
    def self.npm_install(app_name, app_config, app_root_path, npm_install_options)
      if File.exists?("#{app_root_path}/package.json")
        Chef::Log.info("package.json detected. Running npm #{npm_install_options}.")
        Chef::Log.info("bower.json detected. Running bower install.")
        Chef::Log.info(OpsWorks::ShellOut.shellout("sudo su - #{app_config[:user]} -c 'cd #{app_root_path} && npm #{npm_install_options}' 2>&1"))
        Chef::Log.info(OpsWorks::ShellOut.shellout("npm install -g bower 2>&1"))
        Chef::Log.info(OpsWorks::ShellOut.shellout("bower install --allow-root 2>&1"))
      end
    end
  end
end
