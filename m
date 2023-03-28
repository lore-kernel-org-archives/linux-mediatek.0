Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A5EC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 23:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30mVqDBt3qPVcDnNfWuY2qH9ovkW25QV8iQXSPqOSa4=; b=NXZUxUjtLhC0ISwpMam/TJ1U/a
	ktM+flmsO6kLV3IBvS9F25D4DUTfOlI5YC+Y0SCehgHiu9HBRKwM5x9gSBQtSmUcy165mBLHJuhtk
	Qu4yzhPv31mGhYeT6v104WUCzeFbYUkrywvgCrzxxgAN8ULj3mN7oraHb5VaaNvqJwInLsAiMVGsX
	5eMF0zBX9PK3TwBN9pCgRkABt29YfN3TWox3pgcNIk5omh8VSbm/pP7NgJTRn1QfNpXANL6Xf3yAz
	cZlEW6QnYuQte02wr+aSs0APL22GxB6pBll+419pV7lRiPsfxvr0CYYwGJk5v8qR5qNVV/WlYZAIk
	lpDyH65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phIQH-00G5V5-24;
	Tue, 28 Mar 2023 23:08:13 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phIQE-00G5UW-2G;
	Tue, 28 Mar 2023 23:08:12 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phIQ9-000450-1v;
	Wed, 29 Mar 2023 01:08:05 +0200
Date: Wed, 29 Mar 2023 00:08:02 +0100
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
Subject: Re: [RFC PATCH net-next v2 2/2] net: dsa: mt7530: introduce MMIO
 driver for MT7988 SoC
Message-ID: <ZCNzUrgTUGVF6YxF@makrotopia.org>
References: <cover.1680041193.git.daniel@makrotopia.org>
 <6f628e3a56ad8390b1f5a00b86b61c54d66d3106.1680041193.git.daniel@makrotopia.org>
 <8494e02c-6c04-46c9-af86-a414f27fcf23@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8494e02c-6c04-46c9-af86-a414f27fcf23@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_160811_040519_90311B18 
X-CRM114-Status: GOOD (  34.29  )
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

On Wed, Mar 29, 2023 at 12:45:37AM +0200, Andrew Lunn wrote:
> > @@ -146,11 +149,13 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
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
> 
> All this if (bus) is pretty ugly.
> 
> First off, what is this mutex actually protecting? And why is the same
> protection not required for MMIO?

The mutex is protecting the MDIO bus. Each access to any register of the
MT753x switch requires at least two operations on the MDIO bus.
Hence if there is congruent access, e.g. due to PCS or PHY polling, this
can mess up and interfere with another ongoing register access sequence.

You may argue that we should just use regmap's locking API for that, as
it is done also when creating the pcs-mtk-lynxi instance. However, some
things like interrupt handling require more complex (as in: not covered
by regmap_update_bits) pseudo-atomic operations, so the idea was to keep
the locking just like it was before for MDIO-connected MT753x switches
and provide a lock-less regmap replacing the former mt7530_mii_write() and 
mt7530_mii_read() functions.

If we use MMIO we can directly access the 32-bit wide registers and hence
do not require locking.

> 
> If you have a convincing argument the mutex is not needed, please add
> two helpers:
> 
> mt7530_mutex_lock(struct mt7530_priv *priv)
> mt7530_mutex_unlock(struct mt7530_priv *priv)
> 
> and hide the if inside that. As part of the commit message, explain
> why the mutex is not needed for MDIO.

Ok, will do.

> 
> Adding these helpers and changing all calls can be a preparation
> patch. It is the sort of patch which should be obviously correct.

Understood.

> 
> > @@ -2588,6 +2664,8 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
> >  	case PHY_INTERFACE_MODE_NA:
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +	case PHY_INTERFACE_MODE_10GKR:
> >  		/* handled in SGMII PCS driver */
> >  		return 0;
> >  	default:
> > @@ -2712,7 +2790,9 @@ static void mt753x_phylink_mac_link_up(struct dsa_switch *ds, int port,
> >  	 * variants.
> >  	 */
> >  	if (interface == PHY_INTERFACE_MODE_TRGMII ||
> > -	    (phy_interface_mode_is_8023z(interface))) {
> > +	    interface == PHY_INTERFACE_MODE_USXGMII ||
> > +	    interface == PHY_INTERFACE_MODE_10GKR ||
> > +	    phy_interface_mode_is_8023z(interface)) {
> >  		speed = SPEED_1000;
> >  		duplex = DUPLEX_FULL;
> >  	}
> 
> This looks like something which should be in a separate patch.

Ok, I will put it into a separate patch before adding support for
MT7988 which is the only switch supporting those modes (and also
requiring them).

> 
> > +static int mt7988_setup(struct dsa_switch *ds)
> > +{
> > +	struct mt7530_priv *priv = ds->priv;
> > +	u32 unused_pm = 0;
> > +	int i;
> > +
> > +	/* Reset the switch */
> > +	reset_control_assert(priv->rstc);
> > +	udelay(20);
> > +	reset_control_deassert(priv->rstc);
> > +	udelay(20);
> > +
> > +	/* Reset the switch PHYs */
> > +	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
> > +
> > +	/* BPDU to CPU port */
> > +	mt7530_rmw(priv, MT7531_CFC, MT7531_CPU_PMAP_MASK,
> > +		   BIT(MT7988_CPU_PORT));
> > +	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
> > +		   MT753X_BPDU_CPU_ONLY);
> > +
> > +	/* Enable and reset MIB counters */
> > +	mt7530_mib_reset(ds);
> > +
> > +	for (i = 0; i < MT7530_NUM_PORTS; i++) {
> > +		/* Disable forwarding by default on all ports */
> > +		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
> > +			   PCR_MATRIX_CLR);
> > +
> > +		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
> > +
> > +		if (dsa_is_unused_port(ds, i))
> > +			unused_pm |= BIT(i);
> > +		else if (dsa_is_cpu_port(ds, i))
> > +			mt753x_cpu_port_enable(ds, i);
> > +		else
> > +			mt7530_port_disable(ds, i);
> > +
> > +		/* Enable consistent egress tag */
> > +		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
> > +			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
> > +	}
> > +
> > +	ds->configure_vlan_while_not_filtering = true;
> > +
> > +	/* Flush the FDB table */
> > +	return mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> 
> Is this really specific to the mt7988? 

While the setup function is somehow similar to mt7530_setup or
mt7531_setup there are also differences. It would be possible to
split this more, so more common parts can be shared, such as the
loop over the ports which is the same as for MT7531.
The way initial reset is carried out as well as setting up the CPU
port is specific to MT7988.

> 
>    Andrew

