Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C18AC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDc7irA5e5zUVtpytP9vUh6O1uTMrjWrHRJNxM2MS04=; b=bbrsa2lLDv+VCPkGrYkbCPVtmV
	zfJcCvYFMkSVKIlJ5kSNb0bx60CeC5XgNdqzheSJ26PsLlmuKFMlqaD85w7X6cP3oS20ofiOUPzti
	KZMiBDIMvH2GAk9tAaGqQvh8Hx49rHMcn8GQJULXDmB3P/MsB2VRkiMGFalK0Iawj5qgXQwVVOwMg
	hDtkaFzh83p/HWCcR4N7BJAd5me/dLmzzUGpEyDt/gwqHS3owV+APAhuukcU57MmdNtR1tcRk5knY
	0HCXSb0yt3shtfNgDsMv6eWjMKzXqy3KXsplW7TBi3Tsj4N1wB5k6zUvCvZFCED5EtNJXKjO8XjY3
	/NUccGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9TkF-00Gpi1-Fp; Thu, 07 Jul 2022 15:48:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Tk3-00Gpf8-Lo; Thu, 07 Jul 2022 15:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IDc7irA5e5zUVtpytP9vUh6O1uTMrjWrHRJNxM2MS04=; b=MCK448ejte9ZbfNyNV4LRrK8JZ
	+TQWrgECYwRAJNxU05h1pBC5ojyB3czH61I9qhO0Mg/RpYOYAQn8oWCgTo4RPkU+5FpWT/q1c8ubU
	62WYHrfS2shO9WKaQIcKd/cnYSXMLF4kcqB3P53bC8gBFu2T84g4vzGIiB5YQ91TFWakwgkfPkg/z
	3XswuhicWZ2WGwwgnpagq4+85bdxG7XgWHjCUd7qpVq0FQvsVaEN0bNOpNcqi8my62xdAw/zwX0dK
	cqPnRV0uR0AS8XKmbiWzABPmvoW2bJUUW4ZuOdMvapTRcfxmRzdbTIJIWmWtGymcWvZp/yluzcNkk
	c4ULaYzg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33228)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o9Tjm-00044h-DB; Thu, 07 Jul 2022 16:48:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o9Tjg-0005O8-5U; Thu, 07 Jul 2022 16:48:12 +0100
Date: Thu, 7 Jul 2022 16:48:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: always use phylink for CPU
 and DSA ports
Message-ID: <YscAPP7mF3KEE1/p@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
 <YsW3KSeeQBiWQOz/@shell.armlinux.org.uk>
 <Ysaw56lKTtKMh84b@shell.armlinux.org.uk>
 <20220707152727.foxrd4gvqg3zb6il@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707152727.foxrd4gvqg3zb6il@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_084835_906215_F3510F53 
X-CRM114-Status: GOOD (  51.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 07, 2022 at 06:27:27PM +0300, Vladimir Oltean wrote:
> On Thu, Jul 07, 2022 at 11:09:43AM +0100, Russell King (Oracle) wrote:
> > On Wed, Jul 06, 2022 at 05:24:09PM +0100, Russell King (Oracle) wrote:
> > > On Wed, Jul 06, 2022 at 01:26:21PM +0300, Vladimir Oltean wrote:
> > > > Can we please limit phylink_set_max_link_speed() to just the CPU ports
> > > > where a fixed-link property is also missing, not just a phy-handle?
> > > > Although to be entirely correct, we can also have MLO_AN_INBAND, which
> > > > wouldn't be covered by these 2 checks and would still represent a valid
> > > > DT binding.
> > > 
> > > phylink_set_max_fixed_link() already excludes itself:
> > > 
> > >         if (pl->cfg_link_an_mode != MLO_AN_PHY || pl->phydev || pl->sfp_bus)
>                                                       ~~~~~~~~~~
> 
> If not NULL, this is an SFP PHY, right? In other words, it's supposed to protect from
> phylink_sfp_connect_phy() - code involuntarily triggered by phylink_create() ->
> phylink_register_sfp() - and not from calls to phylink_{,fwnode_}connect_phy()
> that were initiated by the phylink user between phylink_create() and
> phylink_set_max_fixed_link(), correct? Those are specified as invalid in the
> kerneldoc and that's about it - that's not what the checking is for, correct?

No, it's not to do with sfps at all, but to do with enforcing the
pre-conditions for the function - that entire line is checking that
(a) we are in a sane state to be called, and (b) there is no
configuration initialisation beyond the default done by
phylink_create() - in other words, there is no in-band or fixed-link
specified.

Let's go through this step by step.

1. pl->cfg_link_an_mode != MLO_AN_PHY
   The default value for cfg_link_an_mode is MLO_AN_PHY. If it's
   anything other than that, then a fixed-link or in-band mode has
   been specified, and we don't want to override that. So this call
   needs to fail.

2. pl->phydev
   If a PHY has been attached, then the pre-condition for calling this
   function immediately after phylink_create() has been violated,
   because the only way it can be non-NULL is if someone's called one of
   the phylink functions that connects a PHY. Note: SFPs will not set
   their PHY here, because, for them to discover that there's a PHY, the
   network interface needs to be up, and it will never be up here... but
   in any case...

3. pl->sfp_bus
   If we have a SFP bus, then we definitely are not going to be
   operating in this default fixed-link mode - because the SFP is going
   to want to set its own parameters.

> > >                 return -EBUSY;
> > > 
> > > intentionally so that if there is anything specified for the port, be
> > > that a fixed link or in-band, then phylink_set_max_fixed_link() errors
> > > out with -EBUSY.
> > > 
> > > The only case that it can't detect is if there is a PHY that may be
> > > added to phylink at a later time, and that is what the check above
> > > is for.
> 
> Here by "PHY added at a later time", you do mean calling phylink_{,fwnode_}connect_phy()
> after phylink_set_max_fixed_link(), right?

Correct.

> So this is what I don't understand. If we've called phylink_set_max_fixed_link()
> we've changed pl->cfg_link_an_mode to MLO_AN_FIXED and this will
> silently break future calls to phylink_{,fwnode_}connect_phy(), so DSA
> predicts if it's going to call either of those connect_phy() functions,
> and calls phylink_set_max_fixed_link() only if it won't. Right?
> 
> You've structured the checks in this "distributed" way because phylink
> can't really predict whether phylink_{,fwnode_}connect_phy() will be
> called after phylink_set_max_fixed_link(), right? I mean, it can
> probably predict the fwnode_ variant, but not phylink_connect_phy, and
> this is why it is up to the caller to decide when to call and when not to.

phylink has no idea whether phylink_fwnode_connect_phy() will be called
with the same fwnode as phylink_create(), so it really can't make any
assumptions about whether there will be a PHY or not.

> 
> > I've updated the function description to mention this detail:
> > 
> > +/**
> > + * phylink_set_max_fixed_link() - set a fixed link configuration for phylink
> > + * @pl: a pointer to a &struct phylink returned from phylink_create()
> > + *
> > + * Set a maximum speed fixed-link configuration for the chosen interface mode
> > + * and MAC capabilities for the phylink instance if the instance has not
> > + * already been configured with a SFP, fixed link, or in-band AN mode. If the
> > + * interface mode is PHY_INTERFACE_MODE_NA, then search the supported
> > + * interfaces bitmap for the first interface that gives the fastest supported
> > + * speed.
> > 
> > Does this address your concern?
> > 
> > Thanks.
> 
> Not really, no, sorry, it just confuses me more.

I find that happens a lot when I try to add more documentation to
clarify things. I sometimes get to the point of deciding its better
_not_ to write any documentation, because documentation just ends up
being confusing and people want more and more detail.

I've got to the point in some case where I've had to spell out which
keys to press on the keyboard for people to formulate the "[PATCH ...]"
thing correctly, because if you put it in quotes, you get people who
will include the quotes even if you tell them not to.

I hate documentation, I seem incapable of writing it in a way people can
understand.

> It should maybe also
> say that this function shouldn't be called if phylink_{,fwnode_}connect_phy()
> is going to be called later.

It's already a precondition that phylink_{,fwnode_}connect_phy() fail if
we're in fixed-link mode (because PHYs have never been supported when in
fixed-link mode - if one remembers, the old fixed-link code used to
provide its own emulation of a PHY to make fixed-links work.) So PHYs
and fixed-links have always been mutually exclusive before phylink, and
continue to be so with phylink.

> Can phylink absorb all this logic, and automatically call phylink_set_max_fixed_link()
> based on the following?
> 
> (1) struct phylink_config gets extended with a bool fallback_max_fixed_link.
> (2) DSA CPU and DSA ports set this to true in dsa_port_phylink_register().
> (3) phylink_set_max_fixed_link() is hooked into this -ENODEV error
>     condition from phylink_fwnode_phy_connect():
> 
> 	phy_fwnode = fwnode_get_phy_node(fwnode);
> 	if (IS_ERR(phy_fwnode)) {
> 		if (pl->cfg_link_an_mode == MLO_AN_PHY)
> 			return -ENODEV; <- here
> 		return 0;
> 	}

My question in response would be - why should this DSA specific behaviour
be handled completely internally within phylink, when it's a DSA
specific behaviour? Why do we need boolean flags for this?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

