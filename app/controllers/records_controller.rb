class RecordsController < ApplicationController
  def index
    @records = Record.all
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
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])

    if @record.update(record_params)
      flash[:success] = '日記は更新されました'
      redirect_to @record
    else
      flash.now[:danger] = '日記は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    flash[:success] = '日記は削除されました'
    redirect_to root_url
  end
end
