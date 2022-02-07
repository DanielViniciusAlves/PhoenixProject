defmodule Discuss.TopicsTest do
  use Discuss.DataCase

  alias Discuss.Topics

  describe "users" do
    alias Discuss.Topics.User

    import Discuss.TopicsFixtures

    @invalid_attrs %{email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Topics.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Topics.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email"}

      assert {:ok, %User{} = user} = Topics.create_user(valid_attrs)
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Topics.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email"}

      assert {:ok, %User{} = user} = Topics.update_user(user, update_attrs)
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Topics.update_user(user, @invalid_attrs)
      assert user == Topics.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Topics.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Topics.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Topics.change_user(user)
    end
  end

  describe "topics" do
    alias Discuss.Topics.Topic

    import Discuss.TopicsFixtures

    @invalid_attrs %{title: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Topics.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Topics.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Topic{} = topic} = Topics.create_topic(valid_attrs)
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Topics.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Topic{} = topic} = Topics.update_topic(topic, update_attrs)
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Topics.update_topic(topic, @invalid_attrs)
      assert topic == Topics.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Topics.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Topics.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Topics.change_topic(topic)
    end
  end
end
