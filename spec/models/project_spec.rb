require 'rails_helper'

RSpec.describe Project, type: :model do
  subject {
    create(:project)
  }
  it "creates a record" do
    expect {
      subject
    }.to change { described_class.count }.by(1)
  end

  context "validation" do
    subject {
      project = build(:project, params)
      project.valid?
      project.errors.full_messages
    }
    context "name is blank" do
      let(:params) {
        {
          name: "",
          status: "draft"
        }
      }
      it "fails with missing name error" do
        expect(subject).to eq ["Name can't be blank"]
      end
    end

    context "name is duplicated" do
      let(:project_name) { "My Project" }
      let!(:project) { create(:project,
                             name: project_name)}
      let(:params) {
        {
          name: project_name,
          status: "draft"
        }
      }
      it "fails with duplicate name error" do
        expect(subject).to eq ["Name has already been taken"]
      end

    end

    context "status is blank" do
      let(:params) {
        {
          name: "test",
          status: ""
        }
      }
      it "fails with missing status error" do
        expect(subject).to eq ["Status is not included in the list"]
      end

    end
  end

  context "relationships" do
    let(:project) { create(:project) }
    let(:comment1) { create(:comment, project: project) }
    let(:comment2) { create(:comment, project: project) }
    context "comments" do
      subject { project.comments }
      it "can have them" do
        expect(subject).to eq [comment1, comment2]
      end
    end
  end
end
