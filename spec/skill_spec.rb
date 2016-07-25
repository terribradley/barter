require('spec_helper')

describe(Skill) do
  it('validates presence of description of skills') do
    skill = Skill.new({:description => " "})
    expect(skill.save).to(eq(false))
  end

  it('makes sure the length is at least 20 characters') do
    skill = Skill.new({:description => ("a" * 19)})
    expect(skill.save).to(eq(false))
  end

  it('returns the tags associated with the skill') do
    skill = Skill.create({:description => "pogo stick racing"})
    tag = Tag.create({:name => "sports"})
    tag2 = Tag.create({:name => "health"})
    skill.tags.push(tag)
    skill.tags.push(tag2)
    expect(skill.tags).to(eq([tag, tag2]))
  end
end
