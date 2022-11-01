class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @teams = Team.all
  end

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
    is_matching_login_user
  end

  def update
    is_matching_login_user
    if @team.update(team_params)
      redirect_to teams_path
    else
      render "edit"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :outline, :team_image)
  end

  def ensure_correct_user
    @team = Team.find(params[:id])
    unless @team.owner_id = current_user.id
      redirect_to teams_path
    end
  end

  def is_matching_login_user
    owner_id = params[:id].to_i
    login_user_id = current_user.id
    if(owner_id != login_user_id)
      redirect_to current_user
    end
  end
end
