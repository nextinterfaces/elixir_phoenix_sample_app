defmodule SampleApp.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SampleApp.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> SampleApp.Posts.create_post()

    post
  end
end
