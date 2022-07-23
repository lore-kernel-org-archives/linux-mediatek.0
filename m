Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C1DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Mp3FRv1NWE/yKxK2DguJI6dup1C3V+1ywhTDudkf6Y=; b=xY46SW9dhUuObf9yhpP2UFj6QD
	7bi9jACurthpuHMQuZdHp0a/QxaGHoC2sP6VOnsvf/dnF2GbhhfP1+a0naTX+02pHs8Y5AtE4W2dX
	HBN3qJkte87YsggiKruqSAu8My8TZn5bTxNosz6mtp3IP0u6+m40MIsmCMgy78wH/utJmViX7Dgzg
	2rWvJr6BsgaYbQaZ6XnsJf10aSE53XNIuX8mKllP8edKnxrMODPm1mFaPInmP1eCY0T3yqmhCtjBr
	/ftf8QsrTrEp6EeQg7H2D20Lo6x1tHEcsGzE5vaQrbKDBnD4yLqxPgiMmVim1KJoi/vz9UB9px1yh
	zxCw+UFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFIuT-005z3S-Jf; Sat, 23 Jul 2022 17:27:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFIuG-005yvC-U0; Sat, 23 Jul 2022 17:27:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ECD9CB80D14;
	Sat, 23 Jul 2022 17:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46EAC341C0;
	Sat, 23 Jul 2022 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658597226;
	bh=JtBO3HEfqLTQtzCzKW/NxyX2wNsOWUNYTzoUck7xXUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ol8Q+QJNjYLHFhh7Zd5YnD3B56Am/wMVZhZXBQlXQPz5SJSxXfgah+RpIuL6onO6g
	 1PD+1kdTuEsOmaRqVfHmqdlcSjYn/3lSCqojrr07uvrWXV1zRkFaQoE4f4Xr8H+GJJ
	 F89q5D3fcYU1N4PBilj1GP3EPCRYuGUa5IXtO8yd06kzCoRYEwBd0wwcT33yCmT+Nm
	 WLsq69QANKcmIoDxRCU9KgccbmiBw1pJEDNbkzWBliUktplyEwwsLKaH30p0sap4+i
	 JNRZIg6UuILNjKLJHhlTrBKIxMPAOenTVET6Nm/vEVIZ8TOuNr2OO29ZC6m3xSMCFF
	 NJtdLHfAm7EtA==
Date: Sat, 23 Jul 2022 19:26:55 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alvin __ipraga
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220723192655.46de7cae@thinkpad>
In-Reply-To: <20220722223932.poxim3sxz62lhcuf@skbuf>
References: <YtnBmFm8Jhokgp7Q@shell.armlinux.org.uk>
	<20220721213645.57ne2jf7f6try4ec@skbuf>
	<YtpfmF37FmfY6BV5@shell.armlinux.org.uk>
	<20220722105238.qhfq5myqa4ixkvy4@skbuf>
	<YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
	<20220722124629.7y3p7nt6jmm5hecq@skbuf>
	<YtqjFKUTsH4CK0L+@shell.armlinux.org.uk>
	<20220722165600.lldukpdflv7cjp4j@skbuf>
	<YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
	<YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
	<20220722223932.poxim3sxz62lhcuf@skbuf>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_102713_329341_19059E6F 
X-CRM114-Status: GOOD (  32.21  )
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

On Sat, 23 Jul 2022 01:39:32 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> You mean in general, or with the firmware description you posted above?
> Because the Lynx PCS does the best it can (considering it does this from
> a function that returns void) to complain that you shouldn't put
> MLO_AN_INBAND for 2500base-x.
> 
> static void lynx_pcs_link_up_2500basex(struct mdio_device *pcs,
> 				       unsigned int mode,
> 				       int speed, int duplex)
> {
> 	u16 if_mode = 0;
> 
> 	if (mode == MLO_AN_INBAND) {
> 		dev_err(&pcs->dev, "AN not supported for 2500BaseX\n");
> 		return;
> 	}
> 
> I noticed just earlier today that I made a blunder while upstreaming some
> riser cards for some LS1028A-QDS development boards, and I did just that
> (left 2500base-x with in-band-status). But the system just errors out.
> I need to boot a board and fix that up. They're just NXP development
> systems so not a big issue. Otherwise I'm not aware of what you're
> talking about.
> 
> > However, both will request link status from the PCS side and use that
> > to determine whether the link is up, and use the parameters that the
> > PCS code returns for the link. Since 2500base-X can only operate at
> > 2.5G, PCS code always reports SPEED_2500, and as half duplex is
> > virtually never supported above 1G, DUPLEX_FULL.  
> 
> If you're saying this just because Lynx implements pcs_get_state for
> 2500base-x, it's extremely likely that this simply originates from
> vsc9959_pcs_link_state_2500basex(), which was deleted in ocelot in
> commit 588d05504d2d ("net: dsa: ocelot: use the Lynx PCS helpers in
> Felix and Seville"), and it was always dead code. It wasn't the only
> dead code, remember commit b4c2354537b4 ("net: dsa: felix: delete
> .phylink_mac_an_restart code").
> 
> Since the Lynx PCS prints error messages in inband/2500base-x mode,
> and so did Felix/Ocelot before the code became common, I'm pretty sure
> no one relies on this mode.

Does Lynx PCS support 1000base-x with AN? Because if so, it may be
possible to somehow hack working AN for 2500base-x, as I managed it for
88E6393X in the commit I mentioned (by configuring 1000base-x and then
hacking the PHY speed to 2.5x).

Anyway, I am now looking at the standards, and it seems that all the X
and R have K variant: 1000base-kx, 2500base-kx, 5gbase-kr and
10gbase-kr. These modes have mandatory clause 73 autonegotiation.

So either we need to add these as different modes of the
phy_interface_t type, or we need to differentiate whether clause 37 or
clause 73 AN should be used by another property.

But since 1000base-x supports clause 37 and 1000base-kx clause 73, the
one property that we have, managed="in-band-status" is not enough, if
we keep calling both modes '1000base-x'.

So maybe we really need to add K variants as separate
PHY_INTERFACE_MODED_ constants. That way we can keep assuming clause 37
for 2500base-x, and try to implement it for as much drivers as
possible, by hacking it up...

And I still don't understand this clause 73 AN at all. For example, if
one PHY supports only up to 2.5g speeds, will it complete AN with
another PHY that supports up to 10g speeds, if the second PHY will
(maybe?) try at higher frequency?

Marek


