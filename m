Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBABC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBJongGPmQbNDPL1C13va/wJFI4Dmus5YndL1Jp9674=; b=e8K7Kt4HYekq2QF+mGAZt1Bl51
	Fs0rKS5XdxbUUtPO1Bs3hILiHjdrK5clk3MhO3uc2/w923d4mi6sFfFTwASzBfDkR42/SkVaJmjgY
	wVEV8XiLONdzBUqLl1oqvSc6zKg2Vdv+zqq14B+v7CcHiwb89HqryRXVzAhZC2KnsufAwxYy6spQe
	BcxPRfp7Hxz05F29o0EaMBF4JI6I3ABHcQgFHnPyD+VJimTPdJEviTGd39vUbxRCHZTNT2f6LAKbZ
	ThzFfeYL+WgtCY0NpehzdTAIxTOLd4q8pJpbxrDTYBBR319eJpZkzPWZMBcPuFcGY/MIVTd6fILC2
	vgz2J6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXSB-008Hbz-U9; Thu, 21 Jul 2022 14:47:03 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXRt-008HBv-DG; Thu, 21 Jul 2022 14:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bBJongGPmQbNDPL1C13va/wJFI4Dmus5YndL1Jp9674=; b=iEv354gEGUTIPBDIt6H6KZ701+
	gc5HiO3BSkjGhHrYyOBz0V0OvNeSrEHgSvOtLOVIwHsigLaMfLoUEutM4sYBkDoT3d4m2vsFsZBp0
	uAtJGMnq4Jq3a7EzCl0G8u4YpWzHRwdc29CFntUT62igGob0juaJSTqpDCFM0Rwd16e8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oEXRV-00B36m-L5; Thu, 21 Jul 2022 16:46:21 +0200
Date: Thu, 21 Jul 2022 16:46:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <YtlmvWzrX/2YebGK@lunn.ch>
References: <20220715172444.yins4kb2b6b35aql@skbuf>
 <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
 <20220715222348.okmeyd55o5u3gkyi@skbuf>
 <YtHw0O5NB6kGkdwV@shell.armlinux.org.uk>
 <20220716105711.bjsh763smf6bfjy2@skbuf>
 <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
 <20220716123608.chdzbvpinso546oh@skbuf>
 <YtUec3GTWTC59sky@shell.armlinux.org.uk>
 <20220720224447.ygoto4av7odsy2tj@skbuf>
 <20220721134618.axq3hmtckrumpoy6@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721134618.axq3hmtckrumpoy6@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_074645_551636_19702669 
X-CRM114-Status: GOOD (  19.62  )
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

> On the other hand I found arm64/boot/dts/marvell/cn9130-crb.dtsi, where
> the switch, a "marvell,mv88e6190"-compatible (can't determine going just
> by that what it actually is) has this:
> 
> 			port@a {
> 				reg = <10>;
> 				label = "cpu";
> 				ethernet = <&cp0_eth0>;
> 			};

Both CPU and DSA ports default to their maximum speed, if nothing else
is specified. If this is a 6393X, port 10 can do 10Gbps, and that is
how the port will be configured by the driver. It is undefined how it
actually implement this maximum speed, if there are multiple choices,
if in band is enabled or not etc. This is historical, the first
mv88e6xxx devices had a mixture of Fast and 1G ethernet interfaces,
and it was simply to choosing between MII and GMII. The platform data
at that time had no way to express link information, and this simple
default mechanism was enough to get boards of the time working.

> To illustrate how odd the situation is, I am able to follow the phandle
> to the CPU port and find a comment that it's a 88E6393X, and that the
> CPU port uses managed = "in-band-status":
> 
> &cp0_eth0 {
> 	/* This port is connected to 88E6393X switch */
> 	status = "okay";
> 	phy-mode = "10gbase-r";
> 	managed = "in-band-status";
> 	phys = <&cp0_comphy4 0>;
> };
> 
> Open question: is it sane to even do what we're trying here, to create a
> fixed-link for port@a (which makes the phylink instance use MLO_AN_FIXED)
> when &cp0_eth0 uses MLO_AN_INBAND? My simple mind thinks that if all
> involved drivers were to behave correctly

Define 'correctly', given that some of these drivers and devices have
been around much longer than device tree, etc.

     Andrew


