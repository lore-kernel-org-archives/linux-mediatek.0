Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03CC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EA7Y5CBt1aFchN29cCzGJfTMQZV85uLM7nRd0aL4cw=; b=DZ9kSTW7Zfs0haFv/2yy4q3JJw
	Na1yGDt7jPAtnGpKwqUu5OkS93ipfcWeEkBqh4wNN3ov17WfH9FPgzh+TeMKQzwdT/6xsCvAxz2I4
	rqoth5JAN5AnDyZ1BrAXfAhz/ecdDYZTA7GH2557AHgN5pvJ+eFpCgIWKSgArynDCwKbs++jFHenK
	2O7eD0WYqV8r0W7HPXOG/dS0Jy1YG+c51uLDrIkaw9HReTM57NSPmj7BHyd0YtQis3/uTIpkVgdtx
	gS7TsZkCG4Gec/r/8ipKDcsQH3tm+H3aIEED5oiutXRE7Og4HlJqfEptYtfoKlplqPNVOY2gY1+F4
	wNfeIV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMXl0-00000007y2v-1bAG;
	Wed, 26 Jun 2024 18:52:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMXkr-00000007y0U-3yjV;
	Wed, 26 Jun 2024 18:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 670B8CE20EA;
	Wed, 26 Jun 2024 18:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947CAC116B1;
	Wed, 26 Jun 2024 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719427946;
	bh=arfeAdJQl0tn49AvIWCZjkwj/e3VAizf6wmeTBPu+mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lELR/PhRsylNyrKFENzI+z5+7Uy+ZtJI+JUCN5pUoA9HKpEvBbXCbRVZiPrdUFqWY
	 UnQR3vXH9MS7yCgQn4OYGkLKzyWGuH+PMc2k1l/e9CpKxFuPz4Rb8C8SzQ3T9BA4cv
	 F5XH23e+DbZFCI1XMOeHKj8wGtkNN3/qYHRTk4xHnsJ9ADz+JmVKQUyea8DJv6M1uf
	 YkhrSq5qpOLmzQgpU/fpvrOibkC9i49hMXuPSvb7jgd7xaJO3iPBUmJ/Op8vYUZU+J
	 /aw8IplnRxbEmlzz0tzh+CVOVNhLX6cPSiSv6dFu/rdvAawHXwxQa/xYUjLRR1iuB7
	 UzKF9SDaMw75A==
Date: Wed, 26 Jun 2024 19:52:21 +0100
From: Simon Horman <horms@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next v9 11/13] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <20240626185221.GC3104@kernel.org>
References: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
 <20240626104329.11426-12-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626104329.11426-12-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_115230_392769_959C3289 
X-CRM114-Status: GOOD (  20.26  )
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

On Wed, Jun 26, 2024 at 06:43:27PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Add support for internal 2.5Gphy on MT7988. This driver will load
> necessary firmware, add appropriate time delay and figure out LED.
> Also, certain control registers will be set to fix link-up issues.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

...

Hi Sky,

Sorry for not providing this review earlier in the process.

> diff --git a/drivers/net/phy/mediatek/mtk-2p5ge.c b/drivers/net/phy/mediatek/mtk-2p5ge.c

...

> +static int mt798x_2p5ge_phy_load_fw(struct phy_device *phydev)
> +{
> +	struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
> +	void __iomem *md32_en_cfg_base, *pmb_addr;
> +	struct device *dev = &phydev->mdio.dev;
> +	const struct firmware *fw;
> +	int ret, i;
> +	u16 reg;
> +
> +	if (priv->fw_loaded)
> +		return 0;
> +
> +	pmb_addr = ioremap(MT7988_2P5GE_PMB_FW_BASE, MT7988_2P5GE_PMB_FW_LEN);
> +	if (!pmb_addr)
> +		return -ENOMEM;
> +	md32_en_cfg_base = ioremap(MT7988_2P5GE_MD32_EN_CFG_BASE,
> +				   MT7988_2P5GE_MD32_EN_CFG_LEN);
> +	if (!md32_en_cfg_base) {
> +		ret = -ENOMEM;
> +		goto free_pmb;
> +	}
> +
> +	ret = request_firmware(&fw, MT7988_2P5GE_PMB_FW, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
> +			MT7988_2P5GE_PMB_FW, ret);
> +		goto free;
> +	}
> +
> +	if (fw->size != MT7988_2P5GE_PMB_FW_SIZE) {
> +		dev_err(dev, "Firmware size 0x%zx != 0x%x\n",
> +			fw->size, MT7988_2P5GE_PMB_FW_SIZE);
> +		ret = -EINVAL;
> +		goto free;

It seems that this leaks any resources allocated by request_firmware():
I think a call to release_firmware() is needed in this unwind path.

Flagged by Smatch.

> +	}
> +
> +	reg = readw(md32_en_cfg_base);
> +	if (reg & MD32_EN) {
> +		phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
> +		usleep_range(10000, 11000);
> +	}
> +	phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
> +
> +	/* Write magic number to safely stall MCU */
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800e, 0x1100);
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800f, 0x00df);
> +
> +	for (i = 0; i < MT7988_2P5GE_PMB_FW_SIZE - 1; i += 4)
> +		writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
> +	release_firmware(fw);
> +	dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
> +		 be16_to_cpu(*((__be16 *)(fw->data +
> +					  MT7988_2P5GE_PMB_FW_SIZE - 8))),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 6),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 5),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 2),
> +		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 1));
> +
> +	writew(reg & ~MD32_EN, md32_en_cfg_base);
> +	writew(reg | MD32_EN, md32_en_cfg_base);
> +	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
> +	/* We need a delay here to stabilize initialization of MCU */
> +	usleep_range(7000, 8000);
> +	dev_info(dev, "Firmware loading/trigger ok.\n");
> +
> +	priv->fw_loaded = true;
> +
> +free:
> +	iounmap(md32_en_cfg_base);
> +free_pmb:
> +	iounmap(pmb_addr);
> +
> +	return ret ? ret : 0;

I'm feeling that I'm missing something incredibly obvious,
but could this simply be:

	return ret;

> +}

...

