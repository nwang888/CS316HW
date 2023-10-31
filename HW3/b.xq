<result> {
    for $x in /congress/committees/committee[@code = 'HSII']/subcommittee[@displayname='Energy and Mineral Resources']/member[@role='Chairman']
    return
        /congress/people/person[@id = $x/@id]
}
</result>