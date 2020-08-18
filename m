Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3FEC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:09:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C4F2076E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wlWukbtK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C4F2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D7GqRgyAJIs2o0fvws6/iXaAvymfIsalxX35+1IODbw=; b=wlWukbtKOXZSBEgDpyIPZXm/f
	6aIhd0n/B3bjWxcGl7Z2R+NtVFbpAGYiwRndWovXzaFWKdYwNOsUVxazjD1HyEtJ6cqsljX8GDXRG
	ubRURS0YDujjt1TA7PCa8nY9SPgQmIWpyb/1lWx15YOj/w6bH+NVdJmvAUtBM45hhBqbFXnT8/47v
	EhSscYgkWz+F+wyzeKOZaA52VsobulFTUNPZ+YCIqoN7jmReN9aqhpRKy0ONm+HkAKpOAK36bgJJt
	5ZxSxChgt6dpSQ+kUEe2WWoqHjBeglQVdZFtWYChHLJSkvDfx7qt/iYeFE1yROR88JCodekpqUxOq
	gRx0UnnuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84Ag-0002kS-F5; Tue, 18 Aug 2020 16:09:10 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k84Ae-0002jq-Fs
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 16:09:09 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1k84AX-009vyk-Nw; Tue, 18 Aug 2020 18:09:01 +0200
Date: Tue, 18 Aug 2020 18:09:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
Message-ID: <20200818160901.GF2330298@lunn.ch>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_120908_577257_F6A9E63A 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, frank-w@public-files.de,
 f.fainelli@gmail.com, dqfext@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 03:14:10PM +0800, Landen Chao wrote:
> Add new support for MT7531:
> 
> MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> port 6 only supports SGMII interface. Cpu port 5 supports either RGMII
> or SGMII in different HW sku. Due to SGMII interface support, pll, and
> pad setting are different from MT7530. This patch adds different initial
> setting, and SGMII phylink handlers of MT7531.
> 
> MT7531 SGMII interface can be configured in following mode:
> - 'SGMII AN mode' with in-band negotiation capability
>     which is compatible with PHY_INTERFACE_MODE_SGMII.
> - 'SGMII force mode' without in-bnad negotiation

band

>     which is compatible with 10B/8B encoding of
>     PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
> - 2.5 times faster clocked 'SGMII force mode' without in-bnad negotiation

band

> +static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
> +			      phy_interface_t interface)
> +{
> +	u32 val;
> +
> +	if (!mt7531_is_rgmii_port(priv, port)) {
> +		dev_err(priv->dev, "RGMII mode is not available for port %d\n",
> +			port);
> +		return -EINVAL;
> +	}
> +
> +	val = mt7530_read(priv, MT7531_CLKGEN_CTRL);
> +	val |= GP_CLK_EN;
> +	val &= ~GP_MODE_MASK;
> +	val |= GP_MODE(MT7531_GP_MODE_RGMII);
> +	val &= ~(TXCLK_NO_REVERSE | RXCLK_NO_DELAY);
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +		val |= TXCLK_NO_REVERSE;
> +		val |= RXCLK_NO_DELAY;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		val |= TXCLK_NO_REVERSE;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val |= RXCLK_NO_DELAY;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

You need to be careful here. If the MAC is doing the RGMII delays, you
need to ensure the PHY is not. What interface mode is passed to the
PHY?

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
