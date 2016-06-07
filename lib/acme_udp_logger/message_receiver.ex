defmodule AcmeUdpLogger.MessageReceiver do
    use GenServer

    def start_link(opts \\ []) do
        GenServer.start_link(__MODULE__,:ok,opts)
    end

    def init (:ok) do
        {:ok,_socket} = :gen_udp.open(21337)
    end

    def handle_info({:upd,_socket,_ip,_port,data},state) do
        IO.puts inspect(data)
        {:noreply,state}
    end

    def handle_info({_,socket},state) do
        {:noreply,state}
    end
end
