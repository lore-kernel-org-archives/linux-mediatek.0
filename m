Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CD5C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1luyxt6XqoqNG1cOwcZcNryytjX2axh+qChWLTs2RA=; b=lAxBujZ4LW0F67Kp8aIqVr80Ry
	LDYYEq2yloZ9+P5pHpyoOKHpafhGz5vAWk5wXtNidawrJMJNjNQzIwe/C4lRlj4uqR56WTXPkHr4g
	oEI3Or3vf4xJYopp6Zce4j50KrdbomLUCHxunUCMTMxj8m93EIk8pVm3icyFVpeCJD9zTn8S9hsZt
	07FPT5m2hc+EWaf173SFvIpo3ayWIUqBXm4D8ju8WvPPmxUPR7IWIjiyb7nzZeeDoLq538p3VdGjZ
	VRXxVan8OWC3YAW1XePdAcfDoV8tOp8BYsg+85lVGfrY3jAarjk26p853ocByvMe+iDyQfV5LZkzQ
	34UO1IdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9UTb-00H03E-NN; Thu, 07 Jul 2022 16:35:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9UTO-00Gzgj-Pp; Thu, 07 Jul 2022 16:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W1luyxt6XqoqNG1cOwcZcNryytjX2axh+qChWLTs2RA=; b=N/UN3+bi39NJCUQzYPqEOzHjMx
	a7WrcFu5Z7e+Q940v0ahh8EWaOvTIsTHAa15FPHTOTXxepvjmlI07CLFq1e1CacbY8j6u4h4G3K73
	R4HHmqkSMA2z/TcbA8S1qN0FkFedfGFm5nce6pv4RTUD7PnHIEZa5QGzJHQtKriivsSNAZw7qy0aK
	n1LfOowZaH/NxnMDlhJJG6GeHKUGBQx02rj92fSihJSd2KdHWUGhnqSrXnL3KGGY+wakFbj2gV2Fo
	v9DYTp3u2PPoxW21IU4DzFUB0Zp5d4N138/YyAki16pmNYuMCHrtRGqcZBYr8fHUHDTvh2TMpHgvi
	agbgIp0g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33230)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o9UR4-00047L-Je; Thu, 07 Jul 2022 17:33:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o9UQz-0005PK-4Z; Thu, 07 Jul 2022 17:32:57 +0100
Date: Thu, 7 Jul 2022 17:32:57 +0100
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
Message-ID: <YscKuTXeXFX0tCap@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
 <Ysa85mJIUfo5m4dJ@shell.armlinux.org.uk>
 <20220707154303.236xaeape7isracw@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707154303.236xaeape7isracw@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_093526_888207_47899C65 
X-CRM114-Status: GOOD (  30.34  )
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

On Thu, Jul 07, 2022 at 06:43:03PM +0300, Vladimir Oltean wrote:
> On Thu, Jul 07, 2022 at 12:00:54PM +0100, Russell King (Oracle) wrote:
> > More importantly, we need your input on Ocelot, which you are listed as
> > a maintainer for, and Ocelot is the only DSA driver that does stuff
> > differently (due to the rate adapting PCS). It doesn't set
> > mac_capabilities, and therefore phylink_set_max_fixed_link() will not
> > work here.
> > 
> > Has Ocelot ever made use of this DSA feature where, when nothing is
> > specified for a CPU or DSA port, we use an effective fixed-link setup
> > with an interface mode that gives the highest speed? Or does this not
> > apply to this DSA driver?
> > 
> > Thanks.
> 
> I'm fine with both the ocelot and sja1105 drivers.
> 
> The ocelot driver has 3 users:
> 
> - felix_vsc9959 (arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi) on NXP
>   LS1028A, where the CPU ports have and have always had a fixed-link
>   node in the SoC dtsi. LS1028A based boards should include the SoC
>   dtsi. If other board DT writers don't do that or if they delete the
>   fixed-link node from the CPU ports, that's not my problem and I don't
>   really want to help them.
> 
> - seville_vsc9953 (arch/powerpc/boot/dts/fsl/t1040si-post.dtsi) on NXP
>   T1040. Same thing, embedded switch, not my fault if the fixed-link
>   disappears from the SoC dtsi.

Great, so I'll mark ocelot is safe.

> - Colin Foster's SPI-controlled VSC7512 (still downstream). He has an
>   Ethernet cable connecting the CPU port to a Beaglebone Black, so he
>   has a phy-handle on the CPU port, so definitely not nothing. I believe
>   his work hasn't made it to production in any case, so enforcing
>   validation now shouldn't bother him too much if at all.

Ok, thanks.

> As for sja1105, there is DT validation that checks for the presence of
> all required properties in sja1105_parse_ports_node().

Looking at those, it requires all of:

- a phy mode to be specified (as determined by of_get_phy_mode())
- a phy-handle or of_phy_is_fixed_link() to return true

otherwise it errors out.

> There is some DT validation in felix_parse_ports_node() too, but it
> doesn't check that all specifiers that phylink might use are there.

Phylink (correction, fwnode_get_phy_node() which is not part of phylink
anymore) will look for phy-handle, phy, or phy-device. This is I don't
see that there's any incompatibility between what the driver is doing
and what phylink does.

If there's a fixed-link property, then sja1105_parse_ports_node() is
happy, and so will phylink. If there's a phy-handle, the same is true.
If there's a "phy" or "phy-device" then sja1105_parse_ports_node()
errors out. That's completely fine.

"phy" and "phy-device" are the backwards compatibility for DT - I
believe one of them is the ePAPR specified property that we in Linux
have decided to only fall back on if there's not our more modern
"phy-handle" property.

It seems We have a lot of users of "phy" in DT today, so we can't drop
that from generic code such as phylink, but I haven't found any users
of "phy-device".

> I'd really like to add some validation before I gain any involuntary
> users, but all open-coded constructs I can come up with are clumsy.
> What would you suggest, if I explicitly don't want to rely on
> context-specific phylink interpretation of empty OF nodes, and rather
> error out?

So I also don't see a problem - sja1105 rejects DTs that fail to
describe a port using at least one of a phy-handle, a fixed-link, or
a managed in-band link, and I don't think it needs to do further
validation, certainly not for the phy describing properties that
the kernel has chosen to deprecate for new implementations.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

