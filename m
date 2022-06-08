Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmDud+sb+oUZkV0HrhxDRb933T2XQgYzDb77K7UIqxM=; b=oJryloIeajxZbx
	dLQzwORMpoXNjK7DjsOTy9mtRghKUUyfpdmejdTWtq+E3aiIKKix7O1iHjVULmDQ4ASAnUZIk/duS
	N2Ia4Jk1jjmYwn62o6WLf77yJCQhSjfUnpRHP19zlu8ImKs8KgKtgWsxdI5w73zlxZoJvmh1wopP6
	bUwh148YCV67jTeorb+HVHBuzd0iafxQwd0xgOScf+VLbIVSwt4Jd+PPgx3YeXGscoXdqPvRNiTs7
	tHGLsQUqYybV9Qct0IfxWtII5Lmg4tZst0xiP/3Ics6XJjdlCPlPIgT+MrM8aSrIFXZ+2fSYNLa0q
	Ebwhnpnv8UJjIKOSh5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyyfA-00ENcp-Ht; Wed, 08 Jun 2022 16:36:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyybA-00ELNQ-8D; Wed, 08 Jun 2022 16:32:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90380B828AB;
	Wed,  8 Jun 2022 16:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D341C34116;
	Wed,  8 Jun 2022 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654705917;
	bh=/kfa6jnrLc0ZYkMg1Y34YWaHwRjcEiKMH4mCqAew29g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nx2Ee6Plnp+VLiPTXc3ysBIPSLybMOKAozHzZ3Fk0i0fNMelIAelD4Vd6jx4guEHV
	 FCJ0EVKzV8GYW7jJxHeqHm9tQtcX8716hmpZBmfUXlQpTN8u6CloHrKr+XYvM5qrbu
	 XKVWRb5g916eEhc9XEOUbn+gCcoWWbxrCcOFB7A0f/8cfYj8s03T75j4aetpDgYQd3
	 mKZ/UtgnEL9ROkryo5g7QFUqWN32bVjTabReYKLFTEy2R29l6++E7zH0q1Df+xcRgc
	 ubQKXb0FzeKJbK170g+LEGNaSPpZlV/XXYwhmIhTxIDPWUYxnf9Odd16C0S+GgWdo3
	 DWjC54a/g1QLQ==
Date: Wed, 8 Jun 2022 22:01:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v10 17/21] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <YqDO+CSQXKlF7Rm3@matsya>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-18-granquet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523104758.29531-18-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_093200_648010_DA642F24 
X-CRM114-Status: GOOD (  37.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23-05-22, 12:47, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This is a new driver that supports the integrated DisplayPort phy for
> mediatek SoCs, especially the mt8195. The phy is integrated into the
> DisplayPort controller and will be created by the mtk-dp driver. This
> driver expects a struct regmap to be able to work on the same registers
> as the DisplayPort controller. It sets the device data to be the struct
> phy so that the DisplayPort controller can easily work with it.
> 
> The driver does not have any devicetree bindings because the datasheet
> does not list the controller and the phy as distinct units.
> 
> The interaction with the controller can be covered by the configure
> callback of the phy framework and its displayport parameters.

I must admit that I have missed previous iteration of this driver. This
is a standalone phy driver, pls split and submit this and we can get
this merged...

> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/phy/mediatek/Kconfig      |   8 ++
>  drivers/phy/mediatek/Makefile     |   1 +
>  drivers/phy/mediatek/phy-mtk-dp.c | 200 ++++++++++++++++++++++++++++++
>  4 files changed, 210 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cc47b2dbdc9..bfca96469d80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6604,6 +6604,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/mediatek/
>  F:	drivers/gpu/drm/mediatek/
> +F:	drivers/phy/mediatek/phy-mtk-dp.c
>  F:	drivers/phy/mediatek/phy-mtk-hdmi*
>  F:	drivers/phy/mediatek/phy-mtk-mipi*
>  
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 55f8e6c048ab..f7ec86059049 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
>  	select GENERIC_PHY
>  	help
>  	  Support MIPI DSI for Mediatek SoCs.
> +
> +config PHY_MTK_DP
> +	tristate "MediaTek DP-PHY Driver"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Support DisplayPort PHY for Mediatek SoCs.
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index ace660fbed3a..4ba1e0650434 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -3,6 +3,7 @@
>  # Makefile for the phy drivers.
>  #
>  
> +obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
>  obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> new file mode 100644
> index 000000000000..6f29854f0c2f
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MediaTek DisplayPort PHY driver
> + *
> + * Copyright (c) 2021 BayLibre

2022 now

> + * Author: Markus Schneider-Pargmann <msp@baylibre.com>

use MODULE_AUTHOR()

> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define PHY_OFFSET 0x1000
> +
> +#define MTK_DP_PHY_DIG_PLL_CTL_1		(PHY_OFFSET + 0x14)
> +#define TPLL_SSC_EN					BIT(3)
> +
> +#define MTK_DP_PHY_DIG_BIT_RATE		(PHY_OFFSET + 0x3C)
> +#define BIT_RATE_RBR				0
> +#define BIT_RATE_HBR				1
> +#define BIT_RATE_HBR2				2
> +#define BIT_RATE_HBR3				3
> +
> +#define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
> +#define DP_GLB_SW_RST_PHYD			BIT(0)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
> +#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
> +#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
> +#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
> +#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
> +#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	((BIT(2) | BIT(4)) << 8)

Sound like BIT(10) and BIT (12), no?

> +#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
> +#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	GENMASK(29, 29)
> +#define DRIVING_PARAM_3_DEFAULT		(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	GENMASK(4, 3)
> +#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	GENMASK(12, 9)
> +#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	((BIT(2) | BIT(5)) << 16)

Here too

> +#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	GENMASK(29, 29)
> +#define DRIVING_PARAM_4_DEFAULT		(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	(BIT(3) | BIT(5))
> +#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	GENMASK(13, 12)
> +#define DRIVING_PARAM_5_DEFAULT		(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	GENMASK(10, 10)
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	GENMASK(19, 19)
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	GENMASK(28, 28)
> +#define DRIVING_PARAM_6_DEFAULT		(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0
> +#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	GENMASK(10, 9)
> +#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	GENMASK(19, 18)
> +#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	0
> +#define DRIVING_PARAM_7_DEFAULT		(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	GENMASK(3, 3)
> +#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	0
> +#define DRIVING_PARAM_8_DEFAULT		(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
> +
> +struct mtk_dp_phy {
> +	struct regmap *regs;
> +};
> +
> +static int mtk_dp_phy_init(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +	u32 driving_params[] = {
> +		DRIVING_PARAM_3_DEFAULT,
> +		DRIVING_PARAM_4_DEFAULT,
> +		DRIVING_PARAM_5_DEFAULT,
> +		DRIVING_PARAM_6_DEFAULT,
> +		DRIVING_PARAM_7_DEFAULT,
> +		DRIVING_PARAM_8_DEFAULT
> +	};
> +
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +	u32 val;
> +
> +	if (opts->dp.set_rate) {
> +		switch (opts->dp.link_rate) {
> +		default:
> +			dev_err(&phy->dev,
> +				"Implementation error, unknown linkrate %x\n",
> +				opts->dp.link_rate);
> +			return -EINVAL;
> +		case 1620:
> +			val = BIT_RATE_RBR;
> +			break;
> +		case 2700:
> +			val = BIT_RATE_HBR;
> +			break;
> +		case 5400:
> +			val = BIT_RATE_HBR2;
> +			break;
> +		case 8100:
> +			val = BIT_RATE_HBR3;
> +			break;
> +		}
> +		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
> +	}
> +
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
> +			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_phy_reset(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> +			   DP_GLB_SW_RST_PHYD, 0);
> +	usleep_range(50, 200);
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> +			   DP_GLB_SW_RST_PHYD, 1);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops mtk_dp_phy_dev_ops = {
> +	.init = mtk_dp_phy_init,
> +	.configure = mtk_dp_phy_configure,
> +	.reset = mtk_dp_phy_reset,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int mtk_dp_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_dp_phy *dp_phy;
> +	struct phy *phy;
> +	struct regmap *regs;
> +
> +	regs = *(struct regmap **)dev->platform_data;
> +	if (!regs)
> +		return dev_err_probe(dev, EINVAL, "No data passed, requires struct regmap**\n");
> +
> +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> +	if (!dp_phy)
> +		return -ENOMEM;
> +
> +	dp_phy->regs = regs;
> +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY\n");
> +
> +	phy_set_drvdata(phy, dp_phy);
> +	if (!dev->of_node)
> +		phy_create_lookup(phy, "dp", dev_name(dev));
> +
> +	return 0;
> +}
> +
> +struct platform_driver mtk_dp_phy_driver = {
> +	.probe = mtk_dp_phy_probe,
> +	.driver = {
> +		.name = "mediatek-dp-phy",
> +	},
> +};
> +module_platform_driver(mtk_dp_phy_driver);
> +
> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.35.1

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
