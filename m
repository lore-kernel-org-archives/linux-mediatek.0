Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHLz7R1RA3UdYJZavlFPGvqWZxl/FwRnhvD96NQHXGo=; b=B016x4T7rSUPvdqhIFeS1VuKDs
	qBSRqc7opBhwTlXwAM1e8gpN1UHy8kw0/VbbSaPZnl0VrpuJ3wlDXHCvOx6ebLLG9FCMyn9i9BzPL
	F8Ya4BKbaKVrB9Fz12/PAd6SNprlT5b/MF+B4f017JQL/8oZ11KRiXulY+SzcTHtdobdVu/ESbbjl
	FG0ZgkavqKOlIWSxf6ZIygitlutcL/g5mGDFYD003w5ko1V8MB/FzKKp9+rrYgSJ4AqMWFejAlVzs
	ITxx0wJ2MVpGvQRmRzqIY4Eucqw6pPvF2b1/KbGOk/i4ikY1pCubH9s3FUdR5QEOIuzdK1sTSjKJ1
	cntjn1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOK56-005GJy-7v; Sat, 04 Feb 2023 15:03:56 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOK52-005GGJ-RC; Sat, 04 Feb 2023 15:03:54 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pOK4o-0004gO-0k;
	Sat, 04 Feb 2023 16:03:38 +0100
Date: Sat, 4 Feb 2023 15:02:00 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 9/9] net: dsa: mt7530: use external PCS driver
Message-ID: <Y95zaIJbCj3QIdqC@makrotopia.org>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <20230203221915.tvg4rrjv5cnkshuf@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203221915.tvg4rrjv5cnkshuf@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_070352_924422_792EF081 
X-CRM114-Status: GOOD (  31.10  )
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

Hi Vladimir,

thank you for the review!

On Sat, Feb 04, 2023 at 12:19:15AM +0200, Vladimir Oltean wrote:
> On Fri, Feb 03, 2023 at 07:06:53AM +0000, Daniel Golle wrote:
> > @@ -2728,11 +2612,14 @@ mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
> >  
> >  	switch (interface) {
> >  	case PHY_INTERFACE_MODE_TRGMII:
> > +		return &priv->pcs[port].pcs;
> >  	case PHY_INTERFACE_MODE_SGMII:
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> > -		return &priv->pcs[port].pcs;
> > +		if (!mt753x_is_mac_port(port))
> > +			return ERR_PTR(-EINVAL);
> 
> What is the reason for returning ERR_PTR(-EINVAL) to mac_select_pcs()?

The SerDes PCS units are only available for port 5 and 6. The code
should make sure that the corresponding interface modes are only used
on these two ports, so a BUG_ON(!mt753x_is_mac_port(port)) would also
do the trick, I guess. However, as dsa_port_phylink_mac_select_pcs may
also return ERR_PTR(-EOPNOTSUPP), returning ERR_PTR(-EINVAL) felt like
the right thing to do in that case.
Are you suggesting to use BUG_ON() instead or rather return
ERR_PTR(-EOPNOTSUPP)?


> 
> >  
> > +		return priv->sgmii_pcs[port - 5];
> 
> How about putting the pcs pointer in struct mt7530_port?

There are only two SerDes units available, only for port 5 and port 6.
Hence I wouldn't want to allocate additional unused sizeof(void*) for
ports 0 to 4.

> 
> >  	default:
> >  		return NULL;
> >  	}
> > @@ -3088,8 +2934,6 @@ mt753x_setup(struct dsa_switch *ds)
> >  		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
> >  		priv->pcs[i].priv = priv;
> >  		priv->pcs[i].port = i;
> > -		if (mt753x_is_mac_port(i))
> > -			priv->pcs[i].pcs.poll = 1;
> >  	}
> >  
> >  	ret = priv->info->sw_setup(ds);
> > @@ -3104,6 +2948,15 @@ mt753x_setup(struct dsa_switch *ds)
> >  	if (ret && priv->irq)
> >  		mt7530_free_irq_common(priv);
> 
> You need to patch the previous code to "return ret".
> 
> >  
> > +	if (priv->id == ID_MT7531)
> 
> if the code block below is multi-line (which it is), put braces here too
> 
> or can return early if priv->id != ID_MT7531, and this reduces the
> indentation by one level.
> 
> > +		for (i = 0; i < 2; ++i) {
> 
> could also iterate over all ports and ignore those which have
> !mt753x_is_mac_port(port)
> 
> > +			regmap = devm_regmap_init(ds->dev,
> > +						  &mt7531_regmap_bus, priv,
> > +						  &mt7531_pcs_config[i]);
> 
> can fail
> 
> > +			priv->sgmii_pcs[i] = mtk_pcs_create(ds->dev, regmap,
> > +							    0x128, 0);
> 
> can fail
> 
> Don't forget to do error teardown which isn't leaky
> 
> 0x128 comes from the old definition of MT7531_PHYA_CTRL_SIGNAL3(port),
> so please keep a macro of some sorts to denote the offset of ana_rgc3
> for MT7531, rather than just this obscure magic number.
> 
> > +		}
> > +
> >  	return ret;
> >  }
> >  
> > @@ -3199,7 +3052,7 @@ static const struct mt753x_info mt753x_table[] = {
> >  	},
> >  	[ID_MT7531] = {
> >  		.id = ID_MT7531,
> > -		.pcs_ops = &mt7531_pcs_ops,
> > +		.pcs_ops = &mt7530_pcs_ops,
> >  		.sw_setup = mt7531_setup,
> >  		.phy_read_c22 = mt7531_ind_c22_phy_read,
> >  		.phy_write_c22 = mt7531_ind_c22_phy_write,
> > @@ -3309,7 +3162,7 @@ static void
> >  mt7530_remove(struct mdio_device *mdiodev)
> >  {
> >  	struct mt7530_priv *priv = dev_get_drvdata(&mdiodev->dev);
> > -	int ret = 0;
> > +	int ret = 0, i;
> >  
> >  	if (!priv)
> >  		return;
> > @@ -3328,6 +3181,11 @@ mt7530_remove(struct mdio_device *mdiodev)
> >  		mt7530_free_irq(priv);
> >  
> >  	dsa_unregister_switch(priv->ds);
> > +
> > +	for (i = 0; i < 2; ++i)
> 
> There is no ++i in this driver and there are 11 i++, so please be
> consistent with what exists.

As most likely in all cases a pre-increment is sufficient and less
resource consuming than a post-increment operation we should consider
switching them all to ++i instead of i++.
I will anyway use i++ in v2 for now.

> 
> > +		if (priv->sgmii_pcs[i])
> > +			mtk_pcs_destroy(priv->sgmii_pcs[i]);
> > +
> >  	mutex_destroy(&priv->reg_mutex);
> >  }
> >  

