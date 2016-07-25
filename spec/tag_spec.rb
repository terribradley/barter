require('spec_helper')

describe(Tag) do
  it "text" do
    skill = Skill.create({:description => "pogo stick racing champion of the universe"})
    tag = Tag.create({:name => "sports"})
    tag.skills.push(skill)
    expect(tag.skills).to(eq([skill]))
  end
end
