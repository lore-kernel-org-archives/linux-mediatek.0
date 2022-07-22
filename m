Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF5DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzQ8w7rKAbkoZSRPJucJAgUKh5DCe2hdLAcL4aCnnMM=; b=swUNDZ5MPuLyaqai6GSs+P2H9v
	rMeWCaDrZ2XNM5fjnOOzbinQNGL+iV7k3uETGkUa1XDg7SkbzPV1ag8APR0ai5R2LznRFTJkGEkJI
	ErfDP2vXP4oOkrxSUcjEZoXfSSYjZdtI4DCE6eRVIAvHj7/ktfupV1zLUoBszcaewujeRpRfbrzcx
	xFcCKSnV4hwH9mxidisD4ZF1z5b148v9//mGByC7jwMTdfbmY+NgtEpoJTHvka8YHLDmYybNHZAFy
	RwKS5upgoZWOoHUwVY8kVk7bxYteeLtRJwviH38v8LofRK4V+O0UTNmWijFjKNy5DmaEYeoZP3Ru+
	bx2XUFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsbQ-004wiY-SH; Fri, 22 Jul 2022 13:22:00 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsZx-004vSh-Oe; Fri, 22 Jul 2022 13:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uzQ8w7rKAbkoZSRPJucJAgUKh5DCe2hdLAcL4aCnnMM=; b=6M9TuGazI4VSoJjq0Q/Cvs2mB1
	nIo1v/t8G4J4dFKa6IX82Q4VNZsaTLN5Zg0caUFGesKBHe0zkpVo+KMDaQEC5mi2vUQrXaZH2euZe
	7/OEkNcwx6P7d7/6i9usYKNx5ub6s1TnBdg6nweAQ3IFbkRdxh2FzH0Iwk/EMoWeIQak=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oEsZY-00B8mU-Ce; Fri, 22 Jul 2022 15:20:04 +0200
Date: Fri, 22 Jul 2022 15:20:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
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
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <YtqkBPZUe5j262Z8@lunn.ch>
References: <Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
 <20220721151533.3zomvnfogshk5ze3@skbuf>
 <20220721192145.1f327b2a@dellmb>
 <20220721192145.1f327b2a@dellmb>
 <20220721182216.z4vdaj4zfb6w3emo@skbuf>
 <YtnBmFm8Jhokgp7Q@shell.armlinux.org.uk>
 <20220721213645.57ne2jf7f6try4ec@skbuf>
 <YtpfmF37FmfY6BV5@shell.armlinux.org.uk>
 <20220722105238.qhfq5myqa4ixkvy4@skbuf>
 <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_062029_859313_A08CE7B6 
X-CRM114-Status: GOOD (  16.55  )
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

> > The way I understand what you're saying is that there is no guarantee
> > that the DSA master and CPU port will agree whether to use in-band
> > autoneg or not here (and implicitly, there is no guarantee that this
> > link will work):
> > 
> > 	&eth0 {
> > 		phy-mode = "2500base-x";
> > 		managed = "in-band-status";
> > 	};
> > 
> > 	&switch_cpu_port {
> > 		ethernet = <&eth0>;
> > 		phy-mode = "25000base-x";
> 
> I'll assume that 25000 is a typo.
> 
> > 		managed = "in-band-status";
> > 	};
> 
> Today, there is no guarantee - because it depends on how people have
> chosen to implement 2500base-X, and whether the hardware requires the
> use of in-band AN or prohibits it.

In practice, a Marvell MAC and a Marvell switch are likely to work,
since Marvell produce and tested both ends. I would expect this to be
true for any vendor. It is only going to be a problem when you have
devices from different vendors. And they have different
interpretations of what 2500Base-X is.

So far, mixed vendor systems tend to be

1) Freescale FEC and Marvell switches, and the FEC it still only 1G RGMII
2) The smaller simpler devices which are 1G and do not yet use a SERDES.

So this might be a future problem we will have, as more devices start
supporting 2.5G and 5G, but hopefully those future devices follow the
standard.

	Andrew

