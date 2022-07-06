Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7F7C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD6FbA7vYl8p5caB6U3kajFbupuuP7isVoBZ2yXtdBE=; b=w4ENxwS8nwjlU4IHrHHnS7CBXB
	LuTvsBeNOGq/cKALcR4hQP17FiLg/zxCHLhGzV9/aihnmBqqPgC4Z+lY28TM6PGf9aygkRyoLDn33
	G4ILze2PGKesCkhdungKHuBRADRHHmJuZumrTDQ2cza/3iYetB8kM6SuupLYxjxJIKJjDVngS3zgp
	ckFIOFA3CmZxvEDeTmUhQr00iAh3zN6pRu59omKHwLBQ2aegrKfZXDgSJHGVvM0NeDiJ71h77wQAx
	iq9fAPGYcADaBx9MPZifvjqW2akbyM+kaMQy9L9DG70C/ppWF7EEgd8HgW3X/x7oOaL96k8LYzuJO
	KZYYGCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97rf-00BL2S-VR; Wed, 06 Jul 2022 16:27:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97rP-00BKN1-7v; Wed, 06 Jul 2022 16:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mD6FbA7vYl8p5caB6U3kajFbupuuP7isVoBZ2yXtdBE=; b=HJ2Rx3Ktvhc8W7Xp7bEM34kZ80
	YYKJMsVog6jtD9PDr0iJKqyVXeeaUMq9h1uhzFfIO0+gqc5JOYeEn4QsaBWvqKqmpjec3LCUDXvOI
	awjJvnH/82ddtStu7EByFQzcaMArjl0JqDcrevQY7VaowcCMkMgXUKk8RBu1fnUe0FxtXll4xnHbT
	XzgUBlAHY8o6d/QPcZ22vCBX388+xJhwMmPFVIdXK686H6kBQOAJMVkPJyMcGftJ/NIHNwaxMW9nD
	AaUVdjSMD2xnNsRp6GZEM2aP0MbTAaPowH2Stku89wpoaPTAINdnjnPHtBgiZpbdmGuNAO6C+4iUD
	aaAZKPqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o97p2-0002ow-7R; Wed, 06 Jul 2022 17:24:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o97ov-0004Tc-KK; Wed, 06 Jul 2022 17:24:09 +0100
Date: Wed, 6 Jul 2022 17:24:09 +0100
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
Message-ID: <YsW3KSeeQBiWQOz/@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706102621.hfubvn3wa6wlw735@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_092643_310581_9B65A618 
X-CRM114-Status: GOOD (  19.78  )
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

phylink_set_max_fixed_link() already excludes itself:

        if (pl->cfg_link_an_mode != MLO_AN_PHY || pl->phydev || pl->sfp_bus)
                return -EBUSY;

intentionally so that if there is anything specified for the port, be
that a fixed link or in-band, then phylink_set_max_fixed_link() errors
out with -EBUSY.

The only case that it can't detect is if there is a PHY that may be
added to phylink at a later time, and that is what the check above
is for.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

