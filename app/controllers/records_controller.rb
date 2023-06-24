class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :set_game, only: [:new, :create]

  def index
    @records = Record.all
  end

  def show
  end

  def new
    @record = @game.records.build
  end

  def edit
  end

  def create
    @record = @game.records.build(record_params)

    if @record.save
      redirect_to @record, notice: 'Record was successfully created.'
    else
      render :new
    end
  end

  def update
    if @record.update(record_params)
      redirect_to @record, notice: 'Record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to records_url, notice: 'Record was successfully destroyed.'
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def record_params
    params.require(:record).permit(:game_id) # 追加すべきパラメータをここに追加します
  end
end
