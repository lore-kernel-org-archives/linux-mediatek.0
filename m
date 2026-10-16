Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0FBCC6B38
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QunjdoyS2VP8sVHK+P0nXc1zdB5/E8xy4McPChK5nU8=; b=Cp2/T7J9HpXzhf52xXz3owzaZi
	D56IkkNvAZ4w8Cdz1NjFPGY3e0zP9azt6F9bvFN9u+tgkFkbU5+I3BTMnP+Vj3HvTqf+8kYO/i4Ag
	0Ot09MYXhy+EFVitrev/SXYCMDxkuoMJp3oZ0adQoNvyukyL079jV9Vreb4kRYxhmqpmplaBi7x9b
	vq5HpJz2W46RMSBB+izLBEwL70tas4iaPY0hi2TQ2LT3I40HBWZGJI1gFrgR3AP7xyeOaWjJDz74v
	6gXAuiZR9VHzRskL85SLNhybzckCynaDGMCBhVFDSBW9+ouQPGNt38jxk29zsSxUgth+z55f7umm0
	M9KgZx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkAW-00000003KDd-0Px0;
	Fri, 16 Oct 2026 15:48:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkAS-00000003KCl-3Q7E;
	Fri, 16 Oct 2026 15:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QunjdoyS2VP8sVHK+P0nXc1zdB5/E8xy4McPChK5nU8=; b=2nnl7trSgRrRUbAJxW1SdJLoWN
	K04uHr8nJfWn8jwwmC7nWzH0RF3e2neTXAB/KvB6LoE+YfjktMLA2/NREFk2DVUV6Ye601vessMks
	ui1BXN10jjodbJUb58fqOwUYCyRlAoMiv1zQGtaQ85Jh1M8OSm0j9ztH9exwJI3proO0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xHkAF-00BAwL-HC; Fri, 16 Oct 2026 17:48:11 +0200
Date: Fri, 16 Oct 2026 17:48:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@kernel.org>, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 7/9] net: stmmac: mediatek: use TX clock
 phase shift in RGMII mode with 1Gbps speed
Message-ID: <1f347450-a68b-44e2-8b57-53204eb61e55@lunn.ch>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-7-25daf2bbcf35@collabora.com>
 <eabe305d-bb0f-4927-919a-21b025ec145d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eabe305d-bb0f-4927-919a-21b025ec145d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_084824_854519_77E746C3 
X-CRM114-Status: GOOD (  14.15  )
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

> > +static void mt8195_fix_mac_speed(void *priv, phy_interface_t interface,
> > +				 int speed, unsigned int mode)
> > +{
> > +	struct mediatek_dwmac_plat_data *priv_plat = priv;
> > +	const struct mediatek_dwmac_variant *variant;
> > +	struct mac_delay_struct *mac_delay;
> > +	u32 tx_delay_stage_val, reg_offset;
> > +	u32 reg_val = 0;
> > +
> > +	if (!priv_plat)
> > +		return;
> > +
> > +	mac_delay = &priv_plat->mac_delay;
> > +	variant = priv_plat->variant;
> > +
> > +	if (!mac_delay->tx_delay ||
> > +	    (interface != PHY_INTERFACE_MODE_RGMII &&
> > +	     interface != PHY_INTERFACE_MODE_RGMII_RXID))
> > +		return;
> 
> I don't think this is right. PHY_INTERFACE_MODE_RGMII in that context comes
> from the devicetree, and therefore means "RGMII delays are implemented through
> traces on the PCB", the MAC isn't supposed to insert any. RXID means "TX delays
> are on PCB, RX delays are internal).
> 
> I'd expect the condition here to be:
> 
> > +	if (!mac_delay->tx_delay ||
> > +	    (interface != PHY_INTERFACE_MODE_RGMII_ID &&
> > +	     interface != PHY_INTERFACE_MODE_RGMII_TXID))
> > +		return;

I would maybe base it on the value of tx-internal-delay-ps. If it is
2000, then add the delay here. But that has implications for the
interface mode value passed to the PHY.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

We could keep mt8195 KISS, and reject all these properties, and let
the PHY add the delays.

	Andrew

