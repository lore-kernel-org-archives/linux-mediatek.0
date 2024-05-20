Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E08C25B7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MTkFW5EKW6VtXAQK1YmzVyloY2FLZZSBaVZDYaOtOU=; b=ozx5XPX7V5yxzYGAbxlYiv1mv6
	tdf3SiDoJFehV/DSWP0pfSpQRzEMbZHmc6uyUVU4hAuj0iIRuJ3lrjbQ9r7GP1dCmPoJMYajHn/5q
	roX/PJAiVgmJbnSjDHVHNgUhKBKuqWgrbD9kBUBc+g/aH56E53M2GQSbimtLvqXWHcVERTDmtUILa
	UeAbnd5bWgUfAIXYaNVz4pQvd5rjQukcSKiwJqG2VN6Tb9rv40UUrlOYmkoa1leXWMTIclLFaZZMG
	6uHB61nJ4cV+AMUG5xuNfpCLQb+U+Kegq6cVTNZIubS//3EWgpUiH+9fiu/y4XUwZw8Kcl1bxuB5a
	XKjp0Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s939c-0000000EbMr-1IJ7;
	Mon, 20 May 2024 13:34:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s939Y-0000000EbME-20NJ;
	Mon, 20 May 2024 13:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7MTkFW5EKW6VtXAQK1YmzVyloY2FLZZSBaVZDYaOtOU=; b=IOp6znxwuh16I4+DNrVElh1uf3
	LQPxTYVNYVj4WuzeoZdhZj+T+Gk58XMxXkoBlL6vFSdxP0Ry9C+M7xeZI21ZO79kC7fSlSZO75pSe
	CUQ4ue2/ndyXxKlu/QhFa2rSXY4PeMxY5Hu06Ef5cqyou1EzKucmfXKbpIjphqf/0uwM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s939F-00FhPN-Bj; Mon, 20 May 2024 15:33:53 +0200
Date: Mon, 20 May 2024 15:33:53 +0200
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
Message-ID: <62b19955-23b8-4cd1-b09c-68546f612b44@lunn.ch>
References: <20240520113456.21675-1-SkyLake.Huang@mediatek.com>
 <20240520113456.21675-6-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520113456.21675-6-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_063412_543868_E6D08320 
X-CRM114-Status: GOOD (  24.88  )
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
> +

https://www.kernel.org/doc/html/latest/process/coding-style.html

  6) Functions

  Functions should be short and sweet, and do just one thing. They
  should fit on one or two screenfuls of text (the ISO/ANSI screen
  size is 80x24, as we all know), and do one thing and do that well.

This is a big function, which does multiple things. Maybe pull the
downloading of firmware into a helper.

> +		ret = request_firmware(&fw, MT7988_2P5GE_PMB, dev);
> +		if (ret) {
> +			dev_err(dev, "failed to load firmware: %s, ret: %d\n",
> +				MT7988_2P5GE_PMB, ret);
> +			return ret;
> +		}
> +
> +		if (fw->size != MT7988_2P5GE_PMB_SIZE) {
> +			dev_err(dev, "Firmware size 0x%zx != 0x%x\n",
> +				fw->size, MT7988_2P5GE_PMB_SIZE);
> +			return -EINVAL;
> +		}
> +
> +		reg = readw(priv->md32_en_cfg_base);
> +		if (reg & MD32_EN) {
> +			phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
> +			usleep_range(10000, 11000);
> +		}
> +		phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
> +
> +		/* Write magic number to safely stall MCU */
> +		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800e, 0x1100);
> +		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800f, 0x00df);
> +
> +		for (i = 0; i < MT7988_2P5GE_PMB_SIZE - 1; i += 4)
> +			writel(*((uint32_t *)(fw->data + i)), priv->pmb_addr + i);
> +		release_firmware(fw);
> +
> +		writew(reg & ~MD32_EN, priv->md32_en_cfg_base);
> +		writew(reg | MD32_EN, priv->md32_en_cfg_base);
> +		phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
> +		/* We need a delay here to stabilize initialization of MCU */
> +		usleep_range(7000, 8000);
> +		dev_info(dev, "Firmware loading/trigger ok.\n");
> +
> +		priv->fw_loaded = true;

So there is no way to know if this has already happened? Maybe the
bootloader downloaded the firmware so it could TFTP boot? Linux will
download the firmware again, which is a waste of time.

> +		iounmap(priv->md32_en_cfg_base);
> +		iounmap(priv->pmb_addr);
> +	}
> +
> +	/* Setup LED */
> +	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED0_ON_CTRL,
> +			 MTK_PHY_LED_ON_POLARITY | MTK_PHY_LED_ON_LINK10 |
> +			 MTK_PHY_LED_ON_LINK100 | MTK_PHY_LED_ON_LINK1000 |
> +			 MTK_PHY_LED_ON_LINK2500);
> +	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_ON_CTRL,
> +			 MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX);
> +
> +	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "i2p5gbe-led");

Calls to devm_pinctrl_get_select() is pretty unusual in drivers:

https://elixir.bootlin.com/linux/latest/C/ident/devm_pinctrl_get_select

Why is this needed? Generally, the DT file should describe the needed
pinmux setting, without needed anything additionally.

> +static int mt798x_2p5ge_phy_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_c45_pma_read_abilities(phydev);
> +	if (ret)
> +		return ret;
> +
> +	/* We don't support HDX at MAC layer on mt7988. So mask phy's HDX capabilities here. */

So you make it clear, the MAC does not support half duplex. The MAC
should then remove it, not the PHY.

> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, phydev->supported);
> +
> +	return 0;
> +}
> +
> +static int mt798x_2p5ge_phy_read_status(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* When MDIO_STAT1_LSTATUS is raised genphy_c45_read_link(), this phy actually
> +	 * hasn't finished AN. So use CL22's link update function instead.
> +	 */
> +	ret = genphy_update_link(phydev);
> +	if (ret)
> +		return ret;
> +
> +	phydev->speed = SPEED_UNKNOWN;
> +	phydev->duplex = DUPLEX_UNKNOWN;
> +	phydev->pause = 0;
> +	phydev->asym_pause = 0;
> +
> +	/* We'll read link speed through vendor specific registers down below. So remove
> +	 * phy_resolve_aneg_linkmode (AN on) & genphy_c45_read_pma (AN off).
> +	 */
> +	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete) {
> +		ret = genphy_c45_read_lpa(phydev);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Clause 45 doesn't define 1000BaseT support. Read the link partner's 1G
> +		 * advertisement via Clause 22
> +		 */
> +		ret = phy_read(phydev, MII_STAT1000);
> +		if (ret < 0)
> +			return ret;
> +		mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising, ret);
> +	} else if (phydev->autoneg == AUTONEG_DISABLE) {
> +		return -EOPNOTSUPP;
> +	}

It is a bit late doing this now. The user requested this a long time
ago, and it will be hard to understand why it now returns EOPNOTSUPP.
You should check for AUTONEG_DISABLE in config_aneg() and return the
error there.

      Andrew

