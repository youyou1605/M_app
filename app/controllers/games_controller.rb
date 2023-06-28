class GamesController < ApplicationController
  before_action :set_user
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def new
    @game = @user.games.build
  end

  def show
  end

  def index
    @games = @user.games.all
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_game
    @game = @user.games.find(params[:id])
  end
end