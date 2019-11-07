class AttendancesController < ApplicationController

    def index
        @attendances = Attendance.all
        @event = Event.find(params[:event_id])
    end

    def new
        @event = Event.find(params[:event_id])
    end
end
