namespace :backburner do

  def backburner_args
    args = []
    #args << "-n #{fetch(:backburner_workers)}" unless fetch(:backburner_workers).nil?
    args << "-q #{fetch(:backburner_queues).join(',')}" unless fetch(:backburner_queues).nil?
    args << "-P #{backburner_pid}"
    args << "-l #{backburner_log}"
    args << "-d"
    args.join(' ')
  end

  def backburner_roles
    fetch(:backburner_roles)
  end

  def backburner_bin
    'backburner'
  end

  def backburner_pid
    fetch(:backburner_pid)
  end

  def backburner_log
    fetch(:backburner_log) 
  end

  desc 'Stop the backburner process'
  task :stop do
    on roles(backburner_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, backburner_bin, "-k -P #{backburner_pid}"
        end
      end
    end
  end

  desc 'Start the backburner process'
  task :start do
    on roles(backburner_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, backburner_bin, backburner_args
        end
      end
    end
  end

  desc 'Restart the backburner process'
  task :restart do
    on roles(backburner_roles) do
      Rake::Task["backburner:stop"].invoke
      Rake::Task["backburner:start"].invoke
    end
  end

  after 'deploy:reverted', 'backburner:stop'
  after 'deploy:updated', 'backburner:stop'
  after 'deploy:published', 'backburner:start'
end

namespace :load do
  task :defaults do
    set :backburner_pid, -> { File.join(shared_path, 'tmp', 'pids', 'backburner.pid') }
    set :backburner_log, -> { File.join(shared_path, 'log', 'backburner.log') }
    set :backburner_queues, nil
    set :backburner_roles, :app
  end
end
