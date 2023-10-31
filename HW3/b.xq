<result> {
    for $x in /congress/committees/committee[@code = 'HSII']/subcommittee[@displayname='Energy and Mineral Resources']/member[@role='Ranking Member']
    return
        /congress/people/person[@id = $x/@id]
}
</result>