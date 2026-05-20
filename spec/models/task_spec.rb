require "rails_helper"

RSpec.describe Task, type: :model do

  let(:project) { create(:project) }

  it "is valid with a title" do
    task = Task.new(
      title: "Finish project",
      project: project
    )

    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = Task.new(
      title: nil,
      project: project
    )

    expect(task).not_to be_valid
  end

end