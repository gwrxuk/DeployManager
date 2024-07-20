class DeploymentsController < ApplicationController
  def create
    @deployment = Deployment.new(deployment_params)
    if @deployment.save
      MessagingService.new.publish('deployments', @deployment.to_json)
      render json: @deployment, status: :created
    else
      render json: @deployment.errors, status: :unprocessable_entity
    end
  end

  private

  def deployment_params
    params.require(:deployment).permit(:user_id, :application_id, :environment_id, :status)
  end
end
