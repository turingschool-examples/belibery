class FansController < ApplicationController
  def index
    @fans = Fan.all
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def create
    @fan = Fan.new(fan_params)

    if @fan.save
      redirect_to fan_path(@fan), notice: "You have created a fan."
    else
      flash.now[:alert] = "The fan was not created. Please try again."
      render :new
    end
  end

  def new
    @fan = Fan.new
  end

  def destroy
    fan = Fan.find(params[:id])
    fan.destroy

    redirect_to fans_path, notice: "The fan was deleted."
  end

  private

  def fan_params
    params.require(:fan).permit(:name, :email)
  end
end
