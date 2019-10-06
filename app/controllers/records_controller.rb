class RecordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :show, :destroy]

  def index
    @records = current_user.records
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      flash[:success] = '日記が正常に投稿されました'
      redirect_to @record
    else
      flash.now[:danger] = '日記が正常に投稿されませんでした'
      render :new
    end
  end

  def edit
    set_record
  end

  def update
    set_record
    if @record.update(record_params)
      flash[:success] = '日記は更新されました'
      redirect_to @record
    else
      flash.now[:danger] = '日記は更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_record
    @record.destroy
    flash[:success] = '日記は削除されました'
    redirect_to root_url
  end

  private

  def set_record
    @record =  Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:title, :content)
  end

  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @records
      redirect_to root_url
    end
  end
end
