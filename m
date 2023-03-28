Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E98C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 01:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKs+8fXhqTJfjVIS1poqWe1vyBspCLp4bXvIsT+t6sM=; b=LTE36yGXOPIy+oVny0B5hqYiB9
	39lEbhh4x+4t95xiwtc3iKtaiCVdJ6Il+VULRWfEoKe8sgABM6ZgGLcLhO5J0UEqtD6TM3nGjIvVs
	WA7U3pOUfF544Q9z9iCjyxhLMC0KTU9pnFLO4r1bBUQPq5lOxEKQEATrCQ/VZz3+ji6t5tZL2kz22
	bf8Ii5ndnfgRv7SzKJv2IWRzPp+okJI0QvCGx4fcZWtL5sv1hnqNLRv20Fz4GONrZaHjAeZ9YLl99
	leJuaDWoV9JV0u631qRFT0NUZdUr1vDYR4zn3YfyjO/0kDff1QTaY81GQGy5pdaQ/mRIdJqRPBu79
	D44HlhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgyc1-00CqST-2D;
	Tue, 28 Mar 2023 01:59:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgyby-00CqRA-2S;
	Tue, 28 Mar 2023 01:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NKs+8fXhqTJfjVIS1poqWe1vyBspCLp4bXvIsT+t6sM=; b=fMsxPumtXZHfua+/Z+RkRLNzW0
	6xLg9V86MTvXecaFQ0IEt6v/BvqFZYom640FJAe+u8sY7h6yIzKGWrI6MC/IocDkmxT90kuxoZs45
	5v0AWd4oR0dsiIW3LOe6D63nbyvPPmh/Susd70Mc+PYHA/jNvCaMzgWGs+dlH6mqOkiw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pgybq-008aTz-AI; Tue, 28 Mar 2023 03:58:50 +0200
Date: Tue, 28 Mar 2023 03:58:50 +0200
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
Message-ID: <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
References: <ZCIML310vc8/uoM4@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCIML310vc8/uoM4@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_185858_797728_E2DB5BC0 
X-CRM114-Status: GOOD (  14.01  )
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

> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -118,6 +118,9 @@ core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
>  	struct mii_bus *bus = priv->bus;
>  	int ret;
>  
> +	if (!bus)
> +		return 0;
> +
>  	/* Write the desired MMD Devad */
>  	ret = bus->write(bus, 0, MII_MMD_CTRL, devad);
>  	if (ret < 0)
> @@ -147,11 +150,13 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  {
>  	struct mii_bus *bus = priv->bus;
>  
> -	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> +	if (bus)
> +		mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
>  
>  	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
>  
> -	mutex_unlock(&bus->mdio_lock);
> +	if (bus)
> +		mutex_unlock(&bus->mdio_lock);
>  }
>  
>  static void
> @@ -160,6 +165,9 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
>  	struct mii_bus *bus = priv->bus;
>  	u32 val;
>  
> +	if (!bus)
> +		return;
> +
>  	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
>  
>  	val = core_read_mmd_indirect(priv, reg, MDIO_MMD_VEND2);
> @@ -189,6 +197,11 @@ mt7530_mii_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  	u16 page, r, lo, hi;
>  	int ret;
>  
> +	if (priv->base_addr) {
> +		iowrite32(val, priv->base_addr + reg);
> +		return 0;
> +	}
> +
>  	page = (reg >> 6) & 0x3ff;
>  	r  = (reg >> 2) & 0xf;
>  	lo = val & 0xffff;
> @@ -218,6 +231,9 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
>  	u16 page, r, lo, hi;
>  	int ret;
>  
> +	if (priv->base_addr)
> +		return ioread32(priv->base_addr + reg);
> +
>  	page = (reg >> 6) & 0x3ff;
>  	r = (reg >> 2) & 0xf;
>  

This looks pretty ugly.

A much better way to do this is to use regmap. Take a look at xrs700x
and how it has both an i2c and an mdio version.

    Andrew

