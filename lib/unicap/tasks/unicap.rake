namespace :load do
  task :defaults do
    set :unicorn_config, -> { File.join(current_path, 'config/unicorn.rb') }
    set :unicorn_pid,    -> { File.join(current_path, 'tmp/pids/unicorn.pid') }
    set :unicorn_roles,  -> { :app }
  end
end

namespace :unicorn do
  def start_unicorn
    within current_path do
      info 'Starting Unicorn ...'
      execute :bundle, :exec, :unicorn_rails, "-c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end

  def stop_unicorn
    info 'Stopping Unicorn ...'
    execute :kill, "-s QUIT #{pid}"
  end

  def restart_unicorn
    info 'Restarting Unicorn ...'
    execute :kill, "-s USR2 #{pid}"
  end

  def remove_pid
    info 'Removing pid ...'
    execute :rm, fetch(:unicorn_pid)
  end

  def pid_exists?
    test("[ -e #{fetch(:unicorn_pid)} ]")
  end

  def pid_running?
    test("kill -0 #{pid}")
  end

  def pid
    "`cat #{fetch(:unicorn_pid)}`"
  end

  desc 'Start Unicorn'
  task :start do
    on roles(fetch(:unicorn_roles)) do
      if pid_exists? && pid_running?
        info 'Unicorn is running ...'
      else
        if pid_exists?
          remove_pid
        end

        start_unicorn
      end
    end
  end

  desc 'Stop Unicorn'
  task :stop do
    on roles(fetch(:unicorn_roles)) do
      if pid_exists?
        pid_running? ? stop_unicorn : remove_pid
      else
        info 'Unicorn is not running ...'
      end
    end
  end

  desc 'Restart Unicorn'
  task :restart do
    invoke 'unicorn:start'

    on roles(fetch(:unicorn_roles)) do
      restart_unicorn
    end
  end
end
