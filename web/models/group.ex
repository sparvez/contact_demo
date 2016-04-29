defmodule Nested.Group do
  use Nested.Web, :model

  schema "groups" do
    field :name, :string

    has_many :contacts_groups, Nested.ContactGroup
    has_many :contacts, through: [:contacts_groups, :contacts]
    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end