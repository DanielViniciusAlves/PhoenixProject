defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topics
  alias Discuss.Topics.Topic

  def new(conn, params) do
    changeset = Discuss.Topics.Topic.changeset(%Discuss.Topics.Topic{}, %{})
  end
end
