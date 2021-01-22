<template>
<div>
  <b-navbar toggleable="xl" type="dark" variant="faded" fixed="top" id="bar" tabs>
    <b-navbar-brand href="/">Unpackker</b-navbar-brand>
    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    <b-collapse id="nav-collapse" align="left" is-nav>
      <b-navbar-nav>
      <b-nav-item-dropdown text="Pack" id="dropdown-left" right>
        <b-dropdown-item href="/packker">Pack</b-dropdown-item>
        <b-dropdown-item href="/unpackker">Unpack</b-dropdown-item>
      </b-nav-item-dropdown>
      </b-navbar-nav>
      <b-navbar-nav class="ml-auto">
        <b-nav-item href="/login" right>Login</b-nav-item>
        <b-nav-item href="/signup">SignUp</b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</div>
</template>

<style>
#bar{
    background-color: black;
}
</style>
