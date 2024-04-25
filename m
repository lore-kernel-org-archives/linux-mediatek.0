Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C469C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nXxaAUOW4lfzHbDCaI6nz0stAky/8ykgKzIVjuNI0U=; b=SQQTpqJ425wGQ/cVVaPGyVYqjD
	PWZu1fHMXYR5QsBerQL9WLYWqkgD1YT2DZtjqc6V3lGOZaPcAYSuL+E4b4TiUOeTiKwbgiTUbiF5M
	u65xp7cIOIy5d81/RuBYuESmpp13bCRYJNNRf+YOd0aSkjK9h8C5vvBJuV7rs06gz/OT3T7cvresH
	l8gVuD80yuPkMVQHlE3SJBQWHcvm5AcgI66EC2WpkQaxYkBiErZ0VC8onTPoA0lM1TJii7szzBv8i
	5REW7+lsw1SGDHFQH5O49Qpzc3LSwuFRl1C4aKmXAv84fZkohzPGUhx/1G5GlztqCkSPQyoHZom8o
	0XdvCOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Af-00000009Bbs-08uG;
	Thu, 25 Apr 2024 15:38:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Ab-00000009Bab-44Ry;
	Thu, 25 Apr 2024 15:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+nXxaAUOW4lfzHbDCaI6nz0stAky/8ykgKzIVjuNI0U=; b=B/tLuWPlOLDKNO1iW2Ezj29OUk
	WTMG4duEi+g4B0typzSnuggrUlh9x2pZTGhPfKXGUUvCXYLFgH5IMK3cqlerAJgQfMVh3iKFJFkr0
	KDEF6viTCHIuWiU3GplSzav2mpfHD229evx7m2eAWN6lKdeCEvHS/Q0NGqqEuJDCut40=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s01AM-00Dzys-Pb; Thu, 25 Apr 2024 17:37:42 +0200
Date: Thu, 25 Apr 2024 17:37:42 +0200
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
Subject: Re: [PATCH 3/3] net: phy: mediatek: add support for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <9241a551-1547-41c6-aae2-54dd45e49c2f@lunn.ch>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_083758_034356_D74E04FF 
X-CRM114-Status: GOOD (  19.67  )
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

> +static int mt7988_2p5ge_phy_config_init(struct phy_device *phydev)
> +{
> +	int ret, i;
> +	const struct firmware *fw;
> +	struct device *dev = &phydev->mdio.dev;
> +	struct device_node *np;
> +	void __iomem *pmb_addr;
> +	void __iomem *md32_en_cfg_base;
> +	struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
> +	u16 reg;
> +	struct pinctrl *pinctrl;

Reverse Christmas Tree please.

> +static int mt7988_2p5ge_phy_config_aneg(struct phy_device *phydev)
> +{
> +	bool changed = false;
> +	u32 adv;
> +	int ret;
> +
> +	if (phydev->autoneg == AUTONEG_DISABLE) {
> +		/* Configure half duplex with genphy_setup_forced,
> +		 * because genphy_c45_pma_setup_forced does not support.
> +		 */

The English in that comment is wrong.

Ah, it appears to be a copy/paste, e.g. from mxl-gpy.c. In fact, a lot
of this function is identical to gpy_config_aneg(). Maybe it should be
pulled out into a helper.

> +static int mt7988_2p5ge_phy_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_read_abilities(phydev);
> +	if (ret)
> +		return ret;
> +
> +	/* We don't support HDX at MAC layer on mt7988.
> +	 * So mask phy's HDX capabilities, too.
> +	 */

This comment seems to contradict the comment above? 

Also, this code does not mask anything, it sets bits.  What does
genphy_read_abilities() find out about the device? If the hardware
confirms to the standard, it should not indicate is supports 1/2
duplex, genphy_read_abilities() should then not return those link
modes, but it should return 10, 100 and 1000 full duplex.

> +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> +			 phydev->supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> +			 phydev->supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> +			 phydev->supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> +			 phydev->supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, phydev->supported);

What does genphy_c45_pma_read_abilities() report about the device?

> +static int mt7988_2p5ge_phy_read_status(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_update_link(phydev);
> +	if (ret)
> +		return ret;
> +
> +	phydev->speed = SPEED_UNKNOWN;
> +	phydev->duplex = DUPLEX_UNKNOWN;
> +	phydev->pause = 0;
> +	phydev->asym_pause = 0;
> +
> +	if (phydev->autoneg == AUTONEG_ENABLE) {
> +		if (phydev->autoneg_complete) {
> +			ret = genphy_c45_read_lpa(phydev);
> +			if (ret < 0)
> +				return ret;
> +
> +			/* Read the link partner's 1G advertisement */
> +			ret = phy_read(phydev, MII_STAT1000);
> +			if (ret < 0)
> +				return ret;
> +			mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising, ret);

> +		} else if (!linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> +					      phydev->advertising) &&
> +			   linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> +					     phydev->advertising)) {
> +			extend_an_new_lp_cnt_limit(phydev);
> +		}

A comment about what is happening here would be good.

> +	} else if (phydev->autoneg == AUTONEG_DISABLE) {
> +		linkmode_zero(phydev->lp_advertising);
> +	}

This if does not make much sense.

> +	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_MISC);
> +	if (ret < 0)
> +		return ret;
> +	phydev->duplex = (ret & MTK_PHY_FDX_ENABLE) ? DUPLEX_FULL : DUPLEX_HALF;

Do does it support half duplex or not?

   Andrew

