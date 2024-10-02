class ClientController < ApplicationController
  def home
    if params[:codigo_rastreio].present?
      conn = Faraday.new(url: 'http://localhost:3000')
      response = conn.get("rastreio/#{params[:codigo_rastreio]}")
      puts response.body
      if response.body === ''
        flash[:alert] = "Pedido não encontrado."
      else
        @order = JSON.parse(response.body)
        @order["pedido"]["data_fornecimento"] = Time.parse(@order["pedido"]["data_fornecimento"])
        @order["pedido"]["created_at"] = Time.parse(@order["pedido"]["created_at"])
        @order["pedido"]["updated_at"] = Time.parse(@order["pedido"]["updated_at"])
        flash[:alert] = "Pedido encontrado."
      end
    end
  end

  def order
  end

end
