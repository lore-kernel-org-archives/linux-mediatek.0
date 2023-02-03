Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ECDC05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5r0JwlkwF0W5R7Dh3RpHn9R6byVUmGVJI5gSn97Wh4=; b=lpp+XQHwBlq8nviMjVkKbdOZdr
	P/Te5BL/zOc5Q5XN9YYPDDN3I9aBmuC9h8ZL7bcyajamgvU1JnzFNopeZiSZ/z1AqJBhief+ws0bQ
	0PIvmSFamrW8J9qVrIPrRQgW81M8CrNoktN6/dWMeg3g/eH+XFHVegzut9XqczI7kB7VwtVvAgsbA
	nf4rDCw0292OeDCI2rFwuMeCOiQiPjSLqkVFJlS1o0SiQk/ig10J2DWUKI6JRGEjqh/gQyaDQM7Tc
	YNnSV0NHwBXpCAHSP28tA2c1JcuuC624tvB4W/cdcqEWPF8TAW7huWbccHJKTWy5tZh/3fSPFg2pQ
	O+/CurVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwz7-002ORs-Pa; Fri, 03 Feb 2023 14:24:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwiC-002FxK-PZ; Fri, 03 Feb 2023 14:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+5r0JwlkwF0W5R7Dh3RpHn9R6byVUmGVJI5gSn97Wh4=; b=w7/csSHS6VJfiCZilLoEjy2Y71
	nW0KNyVr5pHUV3umJE5GbaVZmV+ty/0ILVWJHnx18VBXeQ4PKiR0Qi2uXK4U9vP/h4QX1iZJ3YMbo
	K5Ei6T6XJoxH6iUENFN7f7K5TQRdZkKedmMhkgd5sLfWyP2rD9DAW6iZSvT0XxrQshsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pNwi7-0040Ot-M5; Fri, 03 Feb 2023 15:06:39 +0100
Date: Fri, 3 Feb 2023 15:06:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 2/9] net: ethernet: mtk_eth_soc: set MDIO bus clock
 frequency
Message-ID: <Y90U7ydTIxox/Gey@lunn.ch>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_060644_971100_B25AE2DF 
X-CRM114-Status: GOOD (  10.84  )
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

>  static int mtk_mdio_init(struct mtk_eth *eth)
>  {
>  	struct device_node *mii_np;
> +	int clk = 25000000, max_clk = 2500000, divider = 1;
>  	int ret;
> +	u32 val;

Reverse Christmas tree please.

> +
> +	if (!of_property_read_u32(mii_np, "clock-frequency", &val))
> +		max_clk = val;
> +
> +	while (clk / divider > max_clk) {
> +		if (divider >= 63)
> +			break;
> +
> +		divider++;
> +	};

Please add some range checks here. Return -EINVAL if val > max_clock.
Also, if divider = 63 indicating the requested clock is too slow.

> +
> +	val = mtk_r32(eth, MTK_PPSC);
> +	val |= PPSC_MDC_TURBO;
> +	mtk_w32(eth, val, MTK_PPSC);
> +
> +	/* Configure MDC Divider */
> +	val = mtk_r32(eth, MTK_PPSC);
> +	val &= ~PPSC_MDC_CFG;
> +	val |= FIELD_PREP(PPSC_MDC_CFG, divider);
> +	mtk_w32(eth, val, MTK_PPSC);

Can these two writes to MTK_PPSC be combined into one? 

val |= FIELD_PREP(PPSC_MDC_CFG, divider) | PPSC_MDC_TURBO;

    Andrew

