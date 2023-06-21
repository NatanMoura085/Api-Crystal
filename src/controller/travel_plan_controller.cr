require "http/server"
require "json"

class TravelPlanController
  def initialize(@context : HTTP::Server::Context)
  end

  def dispatch
    case @context.request.path
    when "/travel-plans"
      case @context.request.method
      when HTTP::Method::GET
        handle_get_travel_plans
      when HTTP::Method::POST
        handle_create_travel_plan
      else
        @context.response.status_code = 405
      end
    when "/travel-plans/:id"
      case @context.request.method
      when HTTP::Method::GET
        handle_get_travel_plan(@context.request.path_params["id"])
      when HTTP::Method::PUT
        handle_update_travel_plan(@context.request.path_params["id"])
      when HTTP::Method::DELETE
        handle_delete_travel_plan(@context.request.path_params["id"])
      else
        @context.response.status_code = 405
      end                                                                                   
    else
      @context.response.status_code = 404
    end
  end

  private def handle_get_travel_plans
    # Lógica para retornar todos os planos de viagem
    # ...
    @context.response.content_type = "application/json"
    @context.response.print(JSON.generate(travel_plans))
  end

  private def handle_create_travel_plan
    # Lógica para criar um novo plano de viagem
    # ...
    @context.response.status_code = 201
  end

  private def handle_get_travel_plan(id : String)
    # Lógica para retornar um plano de viagem específico
    # ...
    @context.response.content_type = "application/json"
    @context.response.print(JSON.generate(travel_plan))
  end

  private def handle_update_travel_plan(id : String)
    # Lógica para atualizar um plano de viagem específico
    # ...
    @context.response.status_code = 200
  end

  private def handle_delete_travel_plan(id : String)
    # Lógica para excluir um plano de viagem específico
    # ...
    @context.response.status_code = 204
  end
end
