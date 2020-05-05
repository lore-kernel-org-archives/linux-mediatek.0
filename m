Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6CAC47256
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 17:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1B7206B9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 17:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aqPczjjJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qQ2MvF5u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1B7206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5sYFloMKYTeJm31kG8Uf25r2MUFsffZLCu+Ra74H6A=; b=aqPczjjJKREq2d
	swQjJoML2je2iE9KaBHSlmKVlulPJcxdfJo2QGBd/FR9VZvjzjlXHoWom5mERZPcpN7wjXRQTqxWA
	qpxWDbRdPNTC5dSKHDsKA5wNL2GdVquGA/43/FjazsNtBUAtAFvRmisnMpb18r1kF6NsktNQ6UyAZ
	aREA2mp1H0PFskJDB/BzRIN1yqyHVJopxndQSZK/2hgizYenyRF5qtWUGwWC7X74MYnGKJKIYryEL
	UdvZ2mx+gWh0XBlSkxkCqSvKMtMt3qOeSb/kqURo7lb9/2CJ7TlaR+OqWenDkshQpn91lHzv94E9V
	bX4qNIKt070Z3GNQynzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW1fC-0007Vk-51; Tue, 05 May 2020 17:47:26 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW1f9-0007UK-3P; Tue, 05 May 2020 17:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+R73Z4jVWXCfBPkWr/ITaVNISegdk9AM0hchGPNJ8Sc=; b=qQ2MvF5uTgTfl+Fohrz1RdJXhA
 jbKJkUtbz4bOmvpVN6BZvX4xrqBf8368xqyVXN9pj3mu5y6CHTKEBzV8hYeZQXFyuM0lhfILWQiWn
 7tQckNZ3aDVY5LOkHKjulgNx5/2306VdzhHpCgzN29KlMn4zb+v52g8MZafJrHKY0UOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jW1ev-000y9n-Ug; Tue, 05 May 2020 19:47:09 +0200
Date: Tue, 5 May 2020 19:47:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
Message-ID: <20200505174709.GD224913@lunn.ch>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505140231.16600-7-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_104723_150632_857414D5 
X-CRM114-Status: GOOD (  13.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +static struct net_device *mtk_mac_get_netdev(struct mtk_mac_priv *priv)
> +{
> +	char *ptr = (char *)priv;
> +
> +	return (struct net_device *)(ptr - ALIGN(sizeof(struct net_device),
> +						 NETDEV_ALIGN));
> +}

Bit of an odd way to do it. It is much more normal to just have

    return priv->netdev;

> +static struct sk_buff *mtk_mac_alloc_skb(struct net_device *ndev)
> +{
> +	uintptr_t tail, offset;
> +	struct sk_buff *skb;
> +
> +	skb = dev_alloc_skb(MTK_MAC_MAX_FRAME_SIZE);
> +	if (!skb)
> +		return NULL;
> +
> +	/* Align to 16 bytes. */
> +	tail = (uintptr_t)skb_tail_pointer(skb);
> +	if (tail & (MTK_MAC_SKB_ALIGNMENT - 1)) {
> +		offset = tail & (MTK_MAC_SKB_ALIGNMENT - 1);
> +		skb_reserve(skb, MTK_MAC_SKB_ALIGNMENT - offset);
> +	}
> +
> +	/* Ensure 16-byte alignment of the skb pointer: eth_type_trans() will
> +	 * extract the Ethernet header (14 bytes) so we need two more bytes.
> +	 */
> +	skb_reserve(skb, 2);

NET_IP_ALIGN

There might also be something in skbuf.h which will do your 16 byte
alignment for you.

> +static int mtk_mac_enable(struct net_device *ndev)
> +{
> +	struct mtk_mac_priv *priv = netdev_priv(ndev);
> +	unsigned int val;
> +	int ret;
> +
> +	mtk_mac_nic_disable_pd(priv);
> +	mtk_mac_intr_mask_all(priv);
> +	mtk_mac_dma_stop(priv);
> +	netif_carrier_off(ndev);

Attaching the PHY will turn the carrier off.  If you are using phylib
correctly, you should not have to touch the carrier status, phylib
will do it for you.

> +	/* Configure flow control */
> +	val = MTK_MAC_VAL_FC_CFG_SEND_PAUSE_TH_2K;
> +	val <<= MTK_MAC_OFF_FC_CFG_SEND_PAUSE_TH;
> +	val |= MTK_MAC_BIT_FC_CFG_BP_EN;
> +	val |= MTK_MAC_BIT_FC_CFG_UC_PAUSE_DIR;
> +	regmap_write(priv->regs, MTK_MAC_REG_FC_CFG, val);
> +
> +	/* Set SEND_PAUSE_RLS to 1K */
> +	val = MTK_MAC_VAL_EXT_CFG_SND_PAUSE_RLS_1K;
> +	val <<= MTK_MAC_OFF_EXT_CFG_SND_PAUSE_RLS;
> +	regmap_write(priv->regs, MTK_MAC_REG_EXT_CFG, val);

Pause is something this is auto-negotiated. You should be setting this
in your link change notifier which phylib will call when the link goes
up.

> +static int mtk_mac_mdio_rwok_wait(struct mtk_mac_priv *priv)
> +{
> +	unsigned long start = jiffies;
> +	unsigned int val;
> +
> +	for (;;) {
> +		regmap_read(priv->regs, MTK_MAC_REG_PHY_CTRL0, &val);
> +		if (val & MTK_MAC_BIT_PHY_CTRL0_RWOK)
> +			break;
> +
> +		udelay(10);
> +		if (time_after(jiffies, start + MTK_MAC_WAIT_TIMEOUT))
> +			return -ETIMEDOUT;
> +	}

regmap_read_poll_timeout() ?

> +static int mtk_mac_mdio_read(struct mii_bus *mii, int phy_id, int regnum)
> +{
> +	struct mtk_mac_priv *priv = mii->priv;
> +	unsigned int val, data;
> +	int ret;

It would be good if here and in _write() you check for C45 addresses
and return -EOPNOTSUP.

> +
> +	mtk_mac_mdio_rwok_clear(priv);
> +
> +	val = (regnum << MTK_MAC_OFF_PHY_CTRL0_PREG);
> +	val &= MTK_MAC_MSK_PHY_CTRL0_PREG;
> +	val |= MTK_MAC_BIT_PHY_CTRL0_RDCMD;
> +
> +	regmap_write(priv->regs, MTK_MAC_REG_PHY_CTRL0, val);
> +
> +	ret = mtk_mac_mdio_rwok_wait(priv);
> +	if (ret)
> +		return ret;
> +
> +	regmap_read(priv->regs, MTK_MAC_REG_PHY_CTRL0, &data);
> +
> +	data &= MTK_MAC_MSK_PHY_CTRL0_RWDATA;
> +	data >>= MTK_MAC_OFF_PHY_CTRL0_RWDATA;
> +
> +	return data;
> +}

> +static int mtk_mac_mdio_init(struct net_device *ndev)
> +{
> +	struct mtk_mac_priv *priv = netdev_priv(ndev);
> +	struct device *dev = mtk_mac_get_dev(priv);
> +	struct device_node *of_node, *mdio_node;
> +	int ret;
> +
> +	of_node = dev->of_node;
> +
> +	mdio_node = of_get_child_by_name(of_node, "mdio");
> +	if (!mdio_node)
> +		return -ENODEV;
> +
> +	if (!of_device_is_available(mdio_node)) {
> +		ret = -ENODEV;
> +		goto out_put_node;
> +	}
> +
> +	priv->mii = devm_mdiobus_alloc(dev);
> +	if (!priv->mii) {
> +		ret = -ENOMEM;
> +		goto out_put_node;
> +	}
> +
> +	snprintf(priv->mii->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
> +	priv->mii->name = "mdio";

It is normal to include something like 'MTK' in the name.

> +	priv->mii->parent = dev;
> +	priv->mii->read = mtk_mac_mdio_read;
> +	priv->mii->write = mtk_mac_mdio_write;
> +	priv->mii->priv = priv;
> +
> +	ret = of_mdiobus_register(priv->mii, mdio_node);
> +
> +out_put_node:
> +	of_node_put(mdio_node);
> +	return ret;
> +}

  Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
