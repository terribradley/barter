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
end
