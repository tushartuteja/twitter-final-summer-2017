namespace :alert do
	desc "Alert users related tasks"
  	task :users => :environment do
		puts " this task was run"
		User.all.each do |user|
			puts user.email
		end
	end


	task :tweets => :environment do
		puts " tweets task was run"

	end
end