class AudiosController < ApplicationController
  def index
    @blob = nil
  end

  def create
    data=params['query']
    save_path = Rails.root.join("public")
    puts params
    audio_data=Base64.decode64(data['data:audio/mp3;base64,'.length .. -1])
    File.open(save_path+"#{Random.rand(100)}_audio.mp3", 'wb') do |f| f.write audio_data end
    redirect_to "#root"
  end

  # def create
  #   @recording = Recording.new(main_object_params)

  #   tempfile = params[:main_object]['target_field']
  #   if tempfile.present?
  #     @conversation.voice_note.attach(io: tempfile, filename: "recording.webm", content_type: "audio/webm")
  #   end

  #   if @recording.save!
  #     respond_to do |format|
  #       format.js
  #     end
  #   else
  #     render :new
  #   end
  # end
end
