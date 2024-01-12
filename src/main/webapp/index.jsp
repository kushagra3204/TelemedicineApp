<%
    request.getSession().invalidate();
%>
<!DOCTYPE html>
<html class lang="en-US">
    <head>
        <meta charset="UTF-8">
        <title>Telemedicine App</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no" />
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=2.0, minimum-scale=1, user-scalable=yes">
        <style id='global-styles-inline-css' type='text/css'>
        body {
            --wp--preset--color--black: #000000;
            --wp--preset--color--cyan-bluish-gray: #abb8c3;
            --wp--preset--color--white: #ffffff;
            --wp--preset--color--pale-pink: #f78da7;
            --wp--preset--color--vivid-red: #cf2e2e;
            --wp--preset--color--luminous-vivid-orange: #ff6900;
            --wp--preset--color--luminous-vivid-amber: #fcb900;
            --wp--preset--color--light-green-cyan: #7bdcb5;
            --wp--preset--color--vivid-green-cyan: #00d084;
            --wp--preset--color--pale-cyan-blue: #8ed1fc;
            --wp--preset--color--vivid-cyan-blue: #0693e3;
            --wp--preset--color--vivid-purple: #9b51e0;
            --wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg, rgba(6, 147, 227, 1) 0%, rgb(155, 81, 224) 100%);
            --wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg, rgb(122, 220, 180) 0%, rgb(0, 208, 130) 100%);
            --wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg, rgba(252, 185, 0, 1) 0%, rgba(255, 105, 0, 1) 100%);
            --wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg, rgba(255, 105, 0, 1) 0%, rgb(207, 46, 46) 100%);
            --wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg, rgb(238, 238, 238) 0%, rgb(169, 184, 195) 100%);
            --wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg, rgb(74, 234, 220) 0%, rgb(151, 120, 209) 20%, rgb(207, 42, 186) 40%, rgb(238, 44, 130) 60%, rgb(251, 105, 98) 80%, rgb(254, 248, 76) 100%);
            --wp--preset--gradient--blush-light-purple: linear-gradient(135deg, rgb(255, 206, 236) 0%, rgb(152, 150, 240) 100%);
            --wp--preset--gradient--blush-bordeaux: linear-gradient(135deg, rgb(254, 205, 165) 0%, rgb(254, 45, 45) 50%, rgb(107, 0, 62) 100%);
            --wp--preset--gradient--luminous-dusk: linear-gradient(135deg, rgb(255, 203, 112) 0%, rgb(199, 81, 192) 50%, rgb(65, 88, 208) 100%);
            --wp--preset--gradient--pale-ocean: linear-gradient(135deg, rgb(255, 245, 203) 0%, rgb(182, 227, 212) 50%, rgb(51, 167, 181) 100%);
            --wp--preset--gradient--electric-grass: linear-gradient(135deg, rgb(202, 248, 128) 0%, rgb(113, 206, 126) 100%);
            --wp--preset--gradient--midnight: linear-gradient(135deg, rgb(2, 3, 129) 0%, rgb(40, 116, 252) 100%);
            --wp--preset--duotone--dark-grayscale: url('#wp-duotone-dark-grayscale');
            --wp--preset--duotone--grayscale: url('#wp-duotone-grayscale');
            --wp--preset--duotone--purple-yellow: url('#wp-duotone-purple-yellow');
            --wp--preset--duotone--blue-red: url('#wp-duotone-blue-red');
            --wp--preset--duotone--midnight: url('#wp-duotone-midnight');
            --wp--preset--duotone--magenta-yellow: url('#wp-duotone-magenta-yellow');
            --wp--preset--duotone--purple-green: url('#wp-duotone-purple-green');
            --wp--preset--duotone--blue-orange: url('#wp-duotone-blue-orange');
            --wp--preset--font-size--small: 13px;
            --wp--preset--font-size--medium: 20px;
            --wp--preset--font-size--large: 36px;
            --wp--preset--font-size--x-large: 42px;
            --wp--preset--spacing--20: 0.44rem;
            --wp--preset--spacing--30: 0.67rem;
            --wp--preset--spacing--40: 1rem;
            --wp--preset--spacing--50: 1.5rem;
            --wp--preset--spacing--60: 2.25rem;
            --wp--preset--spacing--70: 3.38rem;
            --wp--preset--spacing--80: 5.06rem;
        }

        :where(.is-layout-flex) {
            gap: 0.5em;
        }

        body .is-layout-flow>.alignleft {
            float: left;
            margin-inline-start: 0;
            margin-inline-end: 2em;
        }

        body .is-layout-flow>.alignright {
            float: right;
            margin-inline-start: 2em;
            margin-inline-end: 0;
        }

        body .is-layout-flow>.aligncenter {
            margin-left: auto !important;
            margin-right: auto !important;
        }

        body .is-layout-constrained>.alignleft {
            float: left;
            margin-inline-start: 0;
            margin-inline-end: 2em;
        }

        body .is-layout-constrained>.alignright {
            float: right;
            margin-inline-start: 2em;
            margin-inline-end: 0;
        }

        body .is-layout-constrained>.aligncenter {
            margin-left: auto !important;
            margin-right: auto !important;
        }

        body .is-layout-constrained> :where(:not(.alignleft):not(.alignright):not(.alignfull)) {
            max-width: var(--wp--style--global--content-size);
            margin-left: auto !important;
            margin-right: auto !important;
        }

        body .is-layout-constrained>.alignwide {
            max-width: var(--wp--style--global--wide-size);
        }

        body .is-layout-flex {
            display: flex;
        }

        body .is-layout-flex {
            flex-wrap: wrap;
            align-items: center;
        }

        body .is-layout-flex>* {
            margin: 0;
        }

        :where(.wp-block-columns.is-layout-flex) {
            gap: 2em;
        }

        .has-black-color {
            color: var(--wp--preset--color--black) !important;
        }

        .has-cyan-bluish-gray-color {
            color: var(--wp--preset--color--cyan-bluish-gray) !important;
        }

        .has-white-color {
            color: var(--wp--preset--color--white) !important;
        }

        .has-pale-pink-color {
            color: var(--wp--preset--color--pale-pink) !important;
        }

        .has-vivid-red-color {
            color: var(--wp--preset--color--vivid-red) !important;
        }

        .has-luminous-vivid-orange-color {
            color: var(--wp--preset--color--luminous-vivid-orange) !important;
        }

        .has-luminous-vivid-amber-color {
            color: var(--wp--preset--color--luminous-vivid-amber) !important;
        }

        .has-light-green-cyan-color {
            color: var(--wp--preset--color--light-green-cyan) !important;
        }

        .has-vivid-green-cyan-color {
            color: var(--wp--preset--color--vivid-green-cyan) !important;
        }

        .has-pale-cyan-blue-color {
            color: var(--wp--preset--color--pale-cyan-blue) !important;
        }

        .has-vivid-cyan-blue-color {
            color: var(--wp--preset--color--vivid-cyan-blue) !important;
        }

        .has-vivid-purple-color {
            color: var(--wp--preset--color--vivid-purple) !important;
        }

        .has-black-background-color {
            background-color: var(--wp--preset--color--black) !important;
        }

        .has-cyan-bluish-gray-background-color {
            background-color: var(--wp--preset--color--cyan-bluish-gray) !important;
        }

        .has-white-background-color {
            background-color: var(--wp--preset--color--white) !important;
        }

        .has-pale-pink-background-color {
            background-color: var(--wp--preset--color--pale-pink) !important;
        }

        .has-vivid-red-background-color {
            background-color: var(--wp--preset--color--vivid-red) !important;
        }

        .has-luminous-vivid-orange-background-color {
            background-color: var(--wp--preset--color--luminous-vivid-orange) !important;
        }

        .has-luminous-vivid-amber-background-color {
            background-color: var(--wp--preset--color--luminous-vivid-amber) !important;
        }

        .has-light-green-cyan-background-color {
            background-color: var(--wp--preset--color--light-green-cyan) !important;
        }

        .has-vivid-green-cyan-background-color {
            background-color: var(--wp--preset--color--vivid-green-cyan) !important;
        }

        .has-pale-cyan-blue-background-color {
            background-color: var(--wp--preset--color--pale-cyan-blue) !important;
        }

        .has-vivid-cyan-blue-background-color {
            background-color: var(--wp--preset--color--vivid-cyan-blue) !important;
        }

        .has-vivid-purple-background-color {
            background-color: var(--wp--preset--color--vivid-purple) !important;
        }

        .has-black-border-color {
            border-color: var(--wp--preset--color--black) !important;
        }

        .has-cyan-bluish-gray-border-color {
            border-color: var(--wp--preset--color--cyan-bluish-gray) !important;
        }

        .has-white-border-color {
            border-color: var(--wp--preset--color--white) !important;
        }

        .has-pale-pink-border-color {
            border-color: var(--wp--preset--color--pale-pink) !important;
        }

        .has-vivid-red-border-color {
            border-color: var(--wp--preset--color--vivid-red) !important;
        }

        .has-luminous-vivid-orange-border-color {
            border-color: var(--wp--preset--color--luminous-vivid-orange) !important;
        }

        .has-luminous-vivid-amber-border-color {
            border-color: var(--wp--preset--color--luminous-vivid-amber) !important;
        }

        .has-light-green-cyan-border-color {
            border-color: var(--wp--preset--color--light-green-cyan) !important;
        }

        .has-vivid-green-cyan-border-color {
            border-color: var(--wp--preset--color--vivid-green-cyan) !important;
        }

        .has-pale-cyan-blue-border-color {
            border-color: var(--wp--preset--color--pale-cyan-blue) !important;
        }

        .has-vivid-cyan-blue-border-color {
            border-color: var(--wp--preset--color--vivid-cyan-blue) !important;
        }

        .has-vivid-purple-border-color {
            border-color: var(--wp--preset--color--vivid-purple) !important;
        }

        .has-vivid-cyan-blue-to-vivid-purple-gradient-background {
            background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;
        }

        .has-light-green-cyan-to-vivid-green-cyan-gradient-background {
            background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;
        }

        .has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background {
            background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;
        }

        .has-luminous-vivid-orange-to-vivid-red-gradient-background {
            background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;
        }

        .has-very-light-gray-to-cyan-bluish-gray-gradient-background {
            background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;
        }

        .has-cool-to-warm-spectrum-gradient-background {
            background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;
        }

        .has-blush-light-purple-gradient-background {
            background: var(--wp--preset--gradient--blush-light-purple) !important;
        }

        .has-blush-bordeaux-gradient-background {
            background: var(--wp--preset--gradient--blush-bordeaux) !important;
        }

        .has-luminous-dusk-gradient-background {
            background: var(--wp--preset--gradient--luminous-dusk) !important;
        }

        .has-pale-ocean-gradient-background {
            background: var(--wp--preset--gradient--pale-ocean) !important;
        }

        .has-electric-grass-gradient-background {
            background: var(--wp--preset--gradient--electric-grass) !important;
        }

        .has-midnight-gradient-background {
            background: var(--wp--preset--gradient--midnight) !important;
        }

        .has-small-font-size {
            font-size: var(--wp--preset--font-size--small) !important;
        }

        .has-medium-font-size {
            font-size: var(--wp--preset--font-size--medium) !important;
        }

        .has-large-font-size {
            font-size: var(--wp--preset--font-size--large) !important;
        }

        .has-x-large-font-size {
            font-size: var(--wp--preset--font-size--x-large) !important;
        }

        .wp-block-navigation a:where(:not(.wp-element-button)) {
            color: inherit;
        }

        :where(.wp-block-columns.is-layout-flex) {
            gap: 2em;
        }

        .wp-block-pullquote {
            font-size: 1.5em;
            line-height: 1.6;
        }
    </style>
        <link
            href="https://khealth.com/wp-content/themes/khealth/dist/bundle.css?v=392cade3"
            rel="stylesheet"
            type="text/css">
        <meta name="google-site-verification"
            content="8zjTO7d48YA-rTuR2c5C7OP-liBOMAlbLWv66XfpU2k" />

    </head>

    <body class="default-header  banner-deactivated  ">

        <header class="header theme-cyan">
            <div class="container">
                <nav class="menu new-menu">
                    <div class="hide-mobile">
                        <div class="nav-menu-hldr">
                            <a href="/" class="logo">
                                <h3>Telemedicine App</h3>
                            </a>
                        </div>
                    </div>
                    <ul class="menu-list menu-list-login">
                        <li class="menu-item menu-zindex">
                            <a href="signin.jsp" tabindex="0" role="button"
                                aria-current="page" title="Log in"
                                class="loginCTA">
                                Log in
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <main role="main" id="body-main" class="main-body" tabindex="-1">
            <div style="position:relative">
                <div class="section-hero section-hero-parallax "
                    id="hero-parallax" style="background-color:#00406b">
                    <div
                        class="parallax parallax-background  hero-parallax-dark"
                        style='padding-top:50px'>
                        <div class="container">
                            <div class="row a-center">
                                <div class="col-md-6"
                                    style="padding-bottom: 40px;">
                                    <div class="hero-parallax-title">
                                        <h1
                                            id="h-check-your-symptoms-the-smart-way">CHECK
                                            YOUR SYMPTOMS THE SMART WAY</h1>
                                    </div>
                                    <div class="hero-parallax-subtitle normal">
                                        <p>Instant free information based on the
                                            treatment and diagnosis of millions
                                            of People Like You.</p>
                                    </div>
                                    <div class="hero-parallax-cta">
                                        <a role="button"
                                            href="signin.jsp"
                                            class="btn btn-primary" tabindex="0"
                                            target="_blank"
                                            style=background-color:#c6f7e7;color:#00406b;
                                            onMouseOver=' ' onFocus=' '
                                            onMouseOut=' ' onBlur=' '>
                                            GET STARTED </a>
                                    </div>
                                    <div
                                        class="hero-parallax-content disclaimer-copy">
                                    </div>
                                </div>
                                <div
                                    class="col-md-6 a-s-e hero-parallax-attachment-full"
                                    style='padding-bottom:0px;'>
                                    <img decoding="async"
                                        class="attachment-full size-full hide-mobile"
                                        src="https://khealth.com/wp-content/uploads/2021/10/hero-symptom-checker-circles.png"
                                        alt="Smartphone" />
                                    <img decoding="async"
                                        class="attachment-full size-full hide-desktop"
                                        src="https://khealth.com/wp-content/uploads/2021/10/hero-symptom-checker-circles.png"
                                        alt="Smartphone" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <style>
            .parallax-background {
                background-image: url('')
            }
            .parallax-background-iphone {
                background-image: url('')
            }
            #hero-parallax .disclaimer-copy p {
                color: #ffffff !important;
            }
            #hero-parallax .disclaimer-copy p a {
                color: #c6f7e7 !important;
            }
            @media screen and (min-width: 981px) {
                .parallax-background {
                    background-image: url('')
                }
            }
        </style>
            <div class="social-proof-banner-block">
                <div class="container">
                    <div class="s-p-b-hldr col-12 ">
                        <ul class="s-p-items">
                            <li>
                                <div class="s-p-img-hldr">
                                    <div class="img-alignment">
                                        <img decoding="async"
                                            src="https://khealth.com/wp-content/uploads/2021/08/icon-stethoscope-shield-dark.png"
                                            alt="Stethoscope icon" />
                                    </div>
                                </div>
                                <p class="s-p-copy">Powered by millions of
                                    medical<br>records, doctors and AI</p>
                            </li>
                            <li>
                                <div class="s-p-img-hldr">
                                    <div class="img-alignment">
                                        <img decoding="async"
                                            src="https://khealth.com/wp-content/uploads/2023/05/icon-star-rating-45.png"
                                            alt="Icon of a star with 4.5 in the middle" />
                                    </div>
                                </div>
                                <p class="s-p-copy">8M+ users, 50k+ ratings</p>
                            </li>
                            <li>
                                <div class="s-p-img-hldr">
                                    <div class="img-alignment">
                                        <img decoding="async"
                                            src="https://khealth.com/wp-content/uploads/2021/08/icon-clock-dark.png"
                                            alt="Dark clock icon" />
                                    </div>
                                </div>
                                <p class="s-p-copy">Free 24/7 personalized
                                    information</p>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="three-columns-block">
                <div class="container  ">
                    <p class="tc_subtitle"></p>
                    <h2 id="h-you-tell-us-whats-wrong-then-its-our-turn">You
                        tell us what&#8217;s wrong. Then it&#8217;s our turn.</h2>
                    <div class="row ">
                        <div class="col-md-4 ">
                            <div class="t_c_item">
                                <img decoding="async"
                                    src="https://khealth.com/wp-content/uploads/2021/07/icon-bigger-yellow-phone-2.png"
                                    alt="Yellow phone"
                                    aria-label="decorative image of Yellow phone"
                                    style="max-width:" />
                                <h3 class="t_c_item-title"
                                    class="t_c_item-title"
                                    id="h-you-or-your-kid-feels-sick">You (or
                                    your kid) feels sick </h3>
                                <p class="t_c_item-desc">Open the Telemedicine app
                                    and tell us what's going on. We'll ask the
                                    necessary questions to provide you with
                                    information on what might be wrong.</p>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="t_c_item">
                                <img decoding="async"
                                    src="https://khealth.com/wp-content/uploads/2021/10/Content-Hub-icon-constelation-green-1.png"
                                    alt="Hub icon image"
                                    aria-label="decorative image of Hub icon image"
                                    style="max-width:" />
                                <h3 class="t_c_item-title"
                                    class="t_c_item-title"
                                    id="h-we-give-you-the-details">We give you
                                    the details</h3>
                                <p class="t_c_item-desc">Using our combined
                                    knowledge from millions of medical records
                                    and thousands of doctors, we instantly show
                                    you how others were diagnosed and treated.
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="t_c_item" style="margin-bottom:0px">
                                <img decoding="async"
                                    src="https://khealth.com/wp-content/uploads/2021/07/icon-bigger-blue-cross-1.png"
                                    alt="Icon of a medical cross"
                                    aria-label="decorative image of Icon of a medical cross"
                                    style="max-width:" />
                                <h3 class="t_c_item-title"
                                    class="t_c_item-title"
                                    id="h-together-we-take-action">Together,
                                    we
                                    take action</h3>
                                <p class="t_c_item-desc">We'll tell you about
                                    common treatments and what to watch out for.
                                    If you want to chat with our medical team,
                                    you can connect with someone instantly in
                                    the app.</p>
                            </div>
                        </div>
                    </div>
                    <a href="signin.jsp"
                        class="btn btn-primary btn-primary-mint" role="button"
                        tabindex="0">Try
                        it for free</a>
                </div>
            </div>
            <style>
            .three-columns-block .container .row {
                gap: 42px 0;
            }

            @media only screen and (min-width: 768px) {
                .three-columns-block .container.padding-narrow {
                    width: 59%;
                }
            }

            @media only screen and (max-width: 981px) {
                .three-columns-block .col-md-3 {
                    width: 50%;
                }
            }
        </style>
            <div id="what-we-treat"
                style="background-image:url('https://khealth.com/wp-content/uploads/2021/08/what-we-treat.png')">
                <div class="container">
                    <p class="small_text_what_we_treat">CONDITIONS WE COVER</p>
                    <h2 class="title_what_we_treat" class="title_what_we_treat"
                        id="h-examples-of-what-we-can-diagnose-and-treat-remotely">Examples
                        of what we can diagnose and treat remotely</h2>
                    <ul class="row">
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Back and neck pain</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Cold and flu
                                        symptoms</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Dental infections</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Fatigue</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Indigestion</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Rashes</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Asthma</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6">
                            <div class="treat_link_box">
                                <div class="treat_link_info">
                                    <p class="treat_text">Allergies</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div>
                        <p class="text_what_we_treat">and hundreds more chronic
                            and urgent conditions</p>
                    </div>
                </div>
            </div>

            <style>
            #what-we-treat {
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>
    </body>
</html>