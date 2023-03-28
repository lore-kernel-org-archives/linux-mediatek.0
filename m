Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D4AC77B62
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+3vKgAYziYUNd1/YtEm0M2tEuJj+3Sc+fTWjNKvGfM=; b=GWYIYLVDiYZ3w/ob7CF3SqSveU
	DHHjRe1rJpDF/ilK/2fK7k8Ef+QMb5yT5JewD7D1GDBQ0Ib4H18jxohWIR31c0lyKB1vTl7cuIdvW
	ZDd+vfJvw+nc3uRILmk5uGYf1Fo9vJwIhWt8ezkTThQYOlIjni+XgVwZYsELmB0glHe5IGyUxBlKK
	OFBnMgBpAJe9kitgg3eqIGnIvx5uzok4x/iNATunJVvbij5o46zordiY7rYpzfnPfkhDlJK8W+xiw
	RMr3eJNa5ucOk43jjBGJa03kbFoA/LcSTRdSJzPWLlmFtahIaLgNFBrEJNP1RvHwXO41spDtwAEB+
	1ICvGY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9rE-00EiIa-0E;
	Tue, 28 Mar 2023 13:59:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9rA-00EiHD-0u;
	Tue, 28 Mar 2023 13:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v+3vKgAYziYUNd1/YtEm0M2tEuJj+3Sc+fTWjNKvGfM=; b=AA0Yc10UggUYifkJN5+9WMeg/m
	NbiCMrPKVFf6g1DW046vTIOwTs44SSQzGVWuxI1tzR7ly2TQhW5HM+jXggnfndYrHltFlTBSEKcKL
	9Xg60iIePWc/Y02BGM6fzgQXzmsW5vJcupJ3NPHBIUAQVko6k3bM+WZB5g+ETK3UtLf4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ph9r3-008eUK-Ek; Tue, 28 Mar 2023 15:59:17 +0200
Date: Tue, 28 Mar 2023 15:59:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next 2/2] net: dsa: mt7530: introduce MMIO driver
 for MT7988 SoC
Message-ID: <7e6915bf-f773-4644-b0a7-3cd0730dad8b@lunn.ch>
References: <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCLmwm01FK7laSqs@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCLmwm01FK7laSqs@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_065924_319148_614B91A3 
X-CRM114-Status: GOOD (  13.60  )
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

> I agree that using regmap would be better and I have evaluated that
> approach as well. As regmap doesn't allow lock-skipping and mt7530.c is
> much more complex than xrs700x in the way indirect access to its MDIO bus
> and interrupts work, using regmap accessors for everything would not be
> trivial.

O.K, so lets go another way.

Study the low level accesors, and put an abstraction over
them. Provide an MDIO set and an MMIO set.

> To illustrate what I'm talking about, let me show some examples in the
> current code for which I don't see a way to use regmap:
> 634) static int
> 635) mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
> 636)                   int regnum)
> 637) {
> 638)   struct mii_bus *bus = priv->bus;
> 639)   struct mt7530_dummy_poll p;
> 640)   u32 reg, val;
> 641)   int ret;
> 642) 
> 643)   INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
> 644) 
> 645)   mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);

So you need an abstract lock() and an unlock(). Maybe the MMIO
implementation is a NOP? And the MDIO implementation does a real lock?

> 646) 
> 647)   ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
> 648)                            !(val & MT7531_PHY_ACS_ST), 20, 100000);

_mt7530_unlocked_read and presumably _mt7530_unlocked_write()?

> 649)   if (ret < 0) {
> 650)           dev_err(priv->dev, "poll timeout\n");
> 651)           goto out;
> 652)   }
> 653) 
> 654)   reg = MT7531_MDIO_CL45_ADDR | MT7531_MDIO_PHY_ADDR(port) |
> 655)         MT7531_MDIO_DEV_ADDR(devad) | regnum;
> 656)   mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);

mt7530_write() and mt7530_read()

Put the MDIO accessors in the _mdio.c file, and the MMIO accessors in
the _mmio.c file. Pass them to the core. If you have the abstraction
correct, the core should not care how the registers are accessed.

	 Andrew

