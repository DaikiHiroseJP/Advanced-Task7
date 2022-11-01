class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @book = Book.new
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.owner_id = current_user.id
    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @team.update(team_params)
      redirect_to teams_path
    else
      render "edit"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :outline, :image)
  end

  def ensure_correct_user
    @team = Team.find(params[:id])
    unless @team.owner_id = current_user.id
      redirect_to teams_path
    end
  end
end
