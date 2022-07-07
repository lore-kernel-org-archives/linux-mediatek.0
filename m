Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE6FCCA479
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meTVCLauPT8tVIXdbiSRm0UrVZwGUwqcYXp+qq9WOhg=; b=yOQXxq6CmI54Fb5XRJaWhsnTVX
	3JS4op3JsTX8BUEg505HW4GYHoMXgp1yxetQpFke0i/tiM3N3Efaelva84HKRU/+WFrwIUdrV1wG+
	sp8rob5YbTHNnie51O7DQ2XGH9Ap93kJZrFlJdIy5MrDuMQ1GDAHuDGJwChb3hRZZmBEEgzelS6aI
	P0zBvGdKefShIw8Id7fldduM39gqzj7uVtd0C4EE5RliBxNN+y8u0hkTN3dIAl9KDTorj+kx8Yj7+
	AbF85azN35xDkQ6eAj6BT7IVdeEyZVYj+2xjZRVIuXw5Ey/Grb+frShiQ2Q3pi4+oqGn6vL8PYT2x
	jB5fayEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9PGC-00FinR-LT; Thu, 07 Jul 2022 11:01:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9PG1-00FikI-Hk; Thu, 07 Jul 2022 11:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=meTVCLauPT8tVIXdbiSRm0UrVZwGUwqcYXp+qq9WOhg=; b=QhwPrliKQE2sX6Vo81x5t3GmUz
	0frJ+45A0xAQG6fYJLL30EAE34Z0C1AYKNqxRPXZ+ef79FpNVuTwQsh5ZboleolRvK/oGX5nrzXaK
	PJOdM2/Qb2fSfCDJqlWMDbBWLPd3lxHanjKIaxsvmeMcPw3babpGJtx+xYvXyKqVWZQvwIX+feRdi
	MCJbvK+C/xLcWMuCOhxMc6qo5cWypGaxY41SM3xLEmy9GfbrXETZpT1yCd3LDrPJpLgIg4aThM96V
	HU3NsH7a+JFN3T7O5hJ3YGgO1nafpbH1UyVWhMncs78DpHT7fut8WIV1lAufurr4W3WK+vkKeHNaT
	tyjHpQTA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33218)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o9PFk-0003nU-T9; Thu, 07 Jul 2022 12:01:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o9PFe-0005Db-VO; Thu, 07 Jul 2022 12:00:54 +0100
Date: Thu, 7 Jul 2022 12:00:54 +0100
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
Message-ID: <Ysa85mJIUfo5m4dJ@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706102621.hfubvn3wa6wlw735@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_040117_632182_1E9CC512 
X-CRM114-Status: GOOD (  18.61  )
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

On Wed, Jul 06, 2022 at 01:26:21PM +0300, Vladimir Oltean wrote:
> Hello,
> 
> On Tue, Jul 05, 2022 at 10:48:07AM +0100, Russell King (Oracle) wrote:
> > diff --git a/net/dsa/port.c b/net/dsa/port.c
> > index 35b4e1f8dc05..34487e62eb03 100644
> > --- a/net/dsa/port.c
> > +++ b/net/dsa/port.c
> > @@ -1525,6 +1525,7 @@ int dsa_port_phylink_create(struct dsa_port *dp)
> >  {
> >  	struct dsa_switch *ds = dp->ds;
> >  	phy_interface_t mode, def_mode;
> > +	struct device_node *phy_np;
> >  	int err;
> >  
> >  	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
> > @@ -1559,6 +1560,13 @@ int dsa_port_phylink_create(struct dsa_port *dp)
> >  		return PTR_ERR(dp->pl);
> >  	}
> >  
> > +	if (dp->type == DSA_PORT_TYPE_CPU || dp->type == DSA_PORT_TYPE_DSA) {
> > +		phy_np = of_parse_phandle(dp->dn, "phy-handle", 0);
> > +		of_node_put(phy_np);
> > +		if (!phy_np)
> > +			err = phylink_set_max_fixed_link(dp->pl);
> 
> Can we please limit phylink_set_max_link_speed() to just the CPU ports
> where a fixed-link property is also missing, not just a phy-handle?
> Although to be entirely correct, we can also have MLO_AN_INBAND, which
> wouldn't be covered by these 2 checks and would still represent a valid
> DT binding.

More importantly, we need your input on Ocelot, which you are listed as
a maintainer for, and Ocelot is the only DSA driver that does stuff
differently (due to the rate adapting PCS). It doesn't set
mac_capabilities, and therefore phylink_set_max_fixed_link() will not
work here.

Has Ocelot ever made use of this DSA feature where, when nothing is
specified for a CPU or DSA port, we use an effective fixed-link setup
with an interface mode that gives the highest speed? Or does this not
apply to this DSA driver?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

