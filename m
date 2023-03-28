Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2D2C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DtwdEl7M8lat7V4Pesuw/CaJv4iPyhKHtYTCPJM2gk=; b=SIpizr7XcyPyaJ18SGH5qYHV5l
	fZhiV6PZQcOTexjYrfGtQGTFkATjsuUjuG0mEJYguDmRsHyYYJ0/jgQGqkKQHMJ/VUMwsok5U9noO
	YCmUEeQgAnfD8AiRoH9V1oI2mWAfpWKaL1Tk9TClflSeev//G0+n32OjKtbUAc7mn5RvcL+uD7+gv
	wHpX8R+XEZ+2iezzrt2C+v3qBE9zfCTs58lNwXGjkXubASRUXenTUS0kitBriznGJ8pbuDyfK+7YS
	30fCpkALVd6xQTbZRhsJ2Iem+FVZqunvmxCjgYTH1I7MXybuctvQWAbyny7N5vGd7z5HVoHDGYXFu
	51vDXgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph949-00EVBM-1i;
	Tue, 28 Mar 2023 13:08:45 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph941-00EV8R-33;
	Tue, 28 Mar 2023 13:08:43 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ph93p-0007Z5-0i;
	Tue, 28 Mar 2023 15:08:25 +0200
Date: Tue, 28 Mar 2023 14:08:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <ZCLmwm01FK7laSqs@makrotopia.org>
References: <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_060837_982096_6BE856CE 
X-CRM114-Status: GOOD (  25.24  )
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

Hi Andrew,

On Tue, Mar 28, 2023 at 03:58:50AM +0200, Andrew Lunn wrote:
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -118,6 +118,9 @@ core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
> >  	struct mii_bus *bus = priv->bus;
> >  	int ret;
> >  
> > +	if (!bus)
> > +		return 0;
> > +
> >  	/* Write the desired MMD Devad */
> >  	ret = bus->write(bus, 0, MII_MMD_CTRL, devad);
> >  	if (ret < 0)
> > @@ -147,11 +150,13 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
> >  {
> >  	struct mii_bus *bus = priv->bus;
> >  
> > -	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +	if (bus)
> > +		mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> >  
> >  	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
> >  
> > -	mutex_unlock(&bus->mdio_lock);
> > +	if (bus)
> > +		mutex_unlock(&bus->mdio_lock);
> >  }
> >  
> >  static void
> > @@ -160,6 +165,9 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
> >  	struct mii_bus *bus = priv->bus;
> >  	u32 val;
> >  
> > +	if (!bus)
> > +		return;
> > +
> >  	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> >  
> >  	val = core_read_mmd_indirect(priv, reg, MDIO_MMD_VEND2);
> > @@ -189,6 +197,11 @@ mt7530_mii_write(struct mt7530_priv *priv, u32 reg, u32 val)
> >  	u16 page, r, lo, hi;
> >  	int ret;
> >  
> > +	if (priv->base_addr) {
> > +		iowrite32(val, priv->base_addr + reg);
> > +		return 0;
> > +	}
> > +
> >  	page = (reg >> 6) & 0x3ff;
> >  	r  = (reg >> 2) & 0xf;
> >  	lo = val & 0xffff;
> > @@ -218,6 +231,9 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
> >  	u16 page, r, lo, hi;
> >  	int ret;
> >  
> > +	if (priv->base_addr)
> > +		return ioread32(priv->base_addr + reg);
> > +
> >  	page = (reg >> 6) & 0x3ff;
> >  	r = (reg >> 2) & 0xf;
> >  
> 
> This looks pretty ugly.
> 
> A much better way to do this is to use regmap. Take a look at xrs700x
> and how it has both an i2c and an mdio version.

I agree that using regmap would be better and I have evaluated that
approach as well. As regmap doesn't allow lock-skipping and mt7530.c is
much more complex than xrs700x in the way indirect access to its MDIO bus
and interrupts work, using regmap accessors for everything would not be
trivial.

To illustrate what I'm talking about, let me show some examples in the
current code for which I don't see a way to use regmap:
634) static int
635) mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
636)                   int regnum)
637) {
638)   struct mii_bus *bus = priv->bus;
639)   struct mt7530_dummy_poll p;
640)   u32 reg, val;
641)   int ret;
642) 
643)   INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
644) 
645)   mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
646) 
647)   ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
648)                            !(val & MT7531_PHY_ACS_ST), 20, 100000);
649)   if (ret < 0) {
650)           dev_err(priv->dev, "poll timeout\n");
651)           goto out;
652)   }
653) 
654)   reg = MT7531_MDIO_CL45_ADDR | MT7531_MDIO_PHY_ADDR(port) |
655)         MT7531_MDIO_DEV_ADDR(devad) | regnum;
656)   mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
657) 
658)   ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
659)                            !(val & MT7531_PHY_ACS_ST), 20, 100000);
660)   if (ret < 0) {
661)           dev_err(priv->dev, "poll timeout\n");
662)           goto out;
663)   }
664) 
665)   reg = MT7531_MDIO_CL45_READ | MT7531_MDIO_PHY_ADDR(port) |
666)         MT7531_MDIO_DEV_ADDR(devad);
667)   mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
668) 
669)   ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
670)                            !(val & MT7531_PHY_ACS_ST), 20, 100000);
671)   if (ret < 0) {
672)           dev_err(priv->dev, "poll timeout\n");
673)           goto out;
674)   }
675) 
676)   ret = val & MT7531_MDIO_RW_DATA_MASK;
677) out:
678)   mutex_unlock(&bus->mdio_lock);
679) 
680)   return ret;
681) }

So here we can of course use regmap_read_poll_timeout and a bunch of
readmap_write operations. However, each of them will individually acquire
and release the mdio bus mutex while the current code acquires the lock
at the top of the function and then uses unlocked operations.
regmap currently doesn't offer any way to skip the locking and/or perform
locking manually. regmap_read, regmap_write, regmap_update_bits, ... always
acquire and release the lock on each operation.

While in the above example this might just imply a performance hit, look
here:

1958) static void
1959) mt7530_irq_bus_sync_unlock(struct irq_data *d)
1960) {
1961)   struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
1962) 
1963)   mt7530_mii_write(priv, MT7530_SYS_INT_EN, priv->irq_enable);
1964)   mutex_unlock(&priv->bus->mdio_lock);
1965) }

So in this case the lock has previously been acquired and the
register is written when releasing the lock.
The above function is being used as .irq_bus_sync_unlock...

Hence there are two ways to go:
1. Extend regmap to allow callers to perform locking manually and
   provide unlocked variants of all operations.
   This would allow us to then convert all the mt7530_{read,write,rmw},
   mt7530_mii_{read,write}, ... calls to use regmap_* calls instead.

2. Use regmap to only provide locked access and keep open-coding the
   cases where unlocked access is used while manually acquiring the
   bus mutex in such cases, as it is the case now.

3. Use regmap to only provide unlocked access to beging with and
   keep taking care of locking in mt7530.c as it is now. This would be
   easy, but then all those ugly checks you criticized would still
   be needed. Ie. `if (priv->base_addr) ...` would of course go away,
   but all the other `if (priv->bus) ...` checks would have to stay.

Let me know what you think and how I should proceed.


Thank you!


Best regards


Daniel

