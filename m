Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19275C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvdEIYYYkIBNIphyeovfwOBCnQAQsyfyDCazfo+ptac=; b=ZK41AORno7LG0uLMEHpTyHbnOS
	45pzTlcHd6q+sVe8t3nb1dve6R8il4939+29l7hRlGVWR5+Y8qAaTZmQkSXBd/HLKDXFGp5LHWeQV
	/WHyR3wg7U9kgjsj35aqIeMsqgx4zX/T6OXKQOtzyAfTHLcqH5RFheDPyONJw4MQjTYsJvgwltGn4
	oPEZCrnGQhdYiRefSdh2rvwmcWd3PtRi4FSYa++tAiA92SBcxcA6TqGvOIoI8j2Oj0+j3ujtJDLlH
	FGv5cYAB8k7+0Jywv1EiJTopT9+c6PQuVY2wvzSOlDLkxmEaQ/z2bHYsgAVnv7wwOmZYqtTd/0KCz
	wQb/etFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s93B4-0000000EbeG-38Im;
	Mon, 20 May 2024 13:35:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s93B1-0000000EbdW-1XgL;
	Mon, 20 May 2024 13:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KvdEIYYYkIBNIphyeovfwOBCnQAQsyfyDCazfo+ptac=; b=0Fn4CyZ6sIsex8ug8E1lVRfHYM
	YkjjrNDxDIKdB/4AtWOLmYn6AnYCNtklor1/x1VLM6sxaJhP1EZTdAqOlbAEeVtl34e4HAaLh0cMY
	wLzTG2KfwRUcL5He7OG3DbvllFMTk+6EdFh1KOKztgR+VVLJu2ksMJPYYVIXUO1MvRI4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s93Ao-00FhQJ-Ld; Mon, 20 May 2024 15:35:30 +0200
Date: Mon, 20 May 2024 15:35:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v3 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <1158a657-1b95-4d7f-9371-41eec5388441@lunn.ch>
References: <20240520113456.21675-1-SkyLake.Huang@mediatek.com>
 <20240520113456.21675-6-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520113456.21675-6-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_063543_782313_E50BE5CC 
X-CRM114-Status: GOOD (  11.91  )
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

> +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> +{
> +	struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
> +	struct device *dev = &phydev->mdio.dev;
> +	const struct firmware *fw;
> +	struct pinctrl *pinctrl;
> +	int ret, i;
> +	u16 reg;
> +
> +	if (!priv->fw_loaded) {
> +		if (!priv->md32_en_cfg_base || !priv->pmb_addr) {
> +			dev_err(dev, "MD32_EN_CFG base & PMB addresses aren't valid\n");
> +			return -EINVAL;
> +		}

...

> +static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
> +{
> +	struct mtk_i2p5ge_phy_priv *priv;
> +
> +	priv = devm_kzalloc(&phydev->mdio.dev,
> +			    sizeof(struct mtk_i2p5ge_phy_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	switch (phydev->drv->phy_id) {
> +	case MTK_2P5GPHY_ID_MT7988:
> +		priv->pmb_addr = ioremap(MT7988_2P5GE_PMB_BASE, MT7988_2P5GE_PMB_LEN);
> +		if (!priv->pmb_addr)
> +			return -ENOMEM;
> +		priv->md32_en_cfg_base = ioremap(MT7988_2P5GE_MD32_EN_CFG_BASE,
> +						 MT7988_2P5GE_MD32_EN_CFG_LEN);
> +		if (!priv->md32_en_cfg_base)
> +			return -ENOMEM;
> +
> +		/* The original hardware only sets MDIO_DEVS_PMAPMD */
> +		phydev->c45_ids.mmds_present |= (MDIO_DEVS_PCS | MDIO_DEVS_AN |
> +						 MDIO_DEVS_VEND1 | MDIO_DEVS_VEND2);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

How can priv->md32_en_cfg_base or priv->pmb_addr not be set in
mt798x_2p5ge_phy_config_init()

	Andrew

