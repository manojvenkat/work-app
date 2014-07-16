class GroupsController < ApplicationController
	def create_group(group_title="")		
		myGroup = groups.new(group_title)
		if myGroup.save			
			user_group_entry = user_groups.new(group_id=myGroup.id,user_id=self.id)
			if user_group_entry.save
				flash[:success] = "You successfully created a group named ".to_s + group_title
			else
				## Support an error message.
			end
		else
			## Support an error message.
		end
	end
end
