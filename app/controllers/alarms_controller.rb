class AlarmsController < ApplicationController
before_filter :authenticate_user!
skip_before_filter  :verify_authenticity_token

  def index
    @alarms = current_user.alarms.all
  end

  def new
    @alarms = current_user.alarms.all
    @alarm = current_user.alarms.new
  end
 
  def create
    @alarm = current_user.alarms.new(post_params)
    #debug(post_params.inspect)
    #Rails.logger.debug post_params.inspect

    @alarm.save
    redirect_to(alarms_path)
  end

  def edit
    render :layout => 'blank'
      @alarms = current_user.alarms.all
      @alarm = Alarm.find(params[:id])
     # if @alarm.user_id != current_user.id
     #   render :file => File.join(Rails.root, 'public', '500.html')
     # end
  end

  def update
    @alarm = Alarm.find(params[:id])
    if @alarm.update_attributes(params[:alarm])
      @alarm.save
      redirect_to(@alarm)
    else
      redirect_to('index')
    end
  end




  def destroy
    @post = Alarm.find(params[:id])
    @post.destroy
   
    redirect_to(new_alarm_path)
  end

  def show
    @alarm = Alarm.find(params[:id])
  end


  def sleep
    render :layout => 'goodnight'
  end


  private
  def post_params
    params.require(:alarm).permit(:title, :wakeup_reminder_time, :sleeping_hour, :sleeping_minute, :is_dismiss, :sleep_reminder_time, :sleep_reminder_type,
            :sleeping_ampm, :repeat_monday,  :repeat_tuesday,  :repeat_wednesday,  :repeat_thursday,  :repeat_friday,  :repeat_saturday,
             :repeat_sunday, :wakeup_hour, :wakeup_minute, :wakeup_ampm, :sleep_reminder_time_unit)
  end


end
