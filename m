Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C13CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 05:13:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D21B260D07
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 05:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D21B260D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uY7yz0FpeNgf+L1fOrBcw7bw/qv2BgHKhSeL31TxCrY=; b=3IsGMe4v83qH82
	uIbnSBHQAMFVVvuIA3OmQbGXEBZeaJ/RmxEj8wwLkvL9oaIBWpxD50KlvLMlOE3VQPZMIhptnge7z
	W9wZ5LcCOcQRBBvNGtfK8wRlsyBqJsAsF0PnFSFLFqmhEpAG5rFdrYmtF08ZXK/iTUK8qpcYGAGyq
	Z/fuInJ1QkA+S8e3irnPbvo+16U6xz2IUgmdn/8onq3guKJy9C7uVRIxiMWsnTgmjk1XCGA3ftUPB
	SmPU/EAsRm/9Km1QnqsXRfwLCuBvVwu1lviNhv+iTDtcUf9WXuEBeen4EGLVcFO0+OiVzmB9WgtFS
	98zPZV+IY7cUwKORwWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdmrI-009kVr-Tw; Fri, 22 Oct 2021 05:12:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdmr5-009kUC-NY; Fri, 22 Oct 2021 05:12:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CA4060C4D;
 Fri, 22 Oct 2021 05:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634879555;
 bh=A4XMXdJXU431FcRhTg+8J9VGDqcp5o/dgGMfstLrLpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T+5Tk3CL0BdkssypH7sdPnZ6pAuRZY1mRpu4++XDhpJxNVKazWIPx+MGgDKhGsViL
 pO1+zJSixQ6r6llRUQ37mSa1mzaWflWs5e2Pb2oWluWPcdP4z2e4uXYTprWdUph6rr
 YMtVtRZO668AMbN2Unr+XufbRH/3ntUoLVRimRaIgwaX6aDqs0168EqXbOxQndI0L3
 2pMw/4LoD4v17C1TcdpEHorYYLUsO/qDu2fjJk/1YmfpGpz/cEPk/a+PI5PCHfOSBf
 SRrkiRHLffVL/cwYuyD/ToJPkabzl1E7D6cTj3ZGWhdi4tpHmb1JJQ921q7eYW6hzQ
 LTMICzymMZKoA==
Date: Fri, 22 Oct 2021 10:42:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <YXJIPu/Ax6qeft03@matsya>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-7-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021092707.3562523-7-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_221235_845908_50D8007E 
X-CRM114-Status: GOOD (  36.84  )
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

On 21-10-21, 11:27, Markus Schneider-Pargmann wrote:
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
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v3 -> v4:
>     - Split DP controller driver and phy driver into separate patches.
>     - Add entry to MAINTAINERS for this phy driver
> 
>  MAINTAINERS                       |   1 +
>  drivers/phy/mediatek/Kconfig      |   8 ++
>  drivers/phy/mediatek/Makefile     |   1 +
>  drivers/phy/mediatek/phy-mtk-dp.c | 219 ++++++++++++++++++++++++++++++
>  4 files changed, 229 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..8a47eb628734 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6276,6 +6276,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
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
> index 000000000000..296203e319ac
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 BayLibre
> + * Author: Markus Schneider-Pargmann <msp@baylibre.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define PHY_OFFSET 0x1000
> +
> +#define MTK_DP_PHY_DIG_PLL_CTL_1		(PHY_OFFSET + 0x014)
> +# define TPLL_SSC_EN				BIT(3)
> +
> +#define MTK_DP_PHY_DIG_BIT_RATE			(PHY_OFFSET + 0x03C)
> +# define BIT_RATE_RBR				0
> +# define BIT_RATE_HBR				1
> +# define BIT_RATE_HBR2				2
> +# define BIT_RATE_HBR3				3
> +
> +#define MTK_DP_PHY_DIG_SW_RST			(PHY_OFFSET + 0x038)
> +# define DP_GLB_SW_RST_PHYD			BIT(0)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
> +#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
> +#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
> +#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
> +# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	0x10
> +# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(0x14 << 8)
> +# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	(0x18 << 16)
> +# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	(0x20 << 24)

Pls use GENMASK() for this?

> +# define DRIVING_PARAM_3_DEFAULT		(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_4		(PHY_OFFSET + 0x13C)
> +#define MTK_DP_LANE1_DRIVING_PARAM_4		(PHY_OFFSET + 0x23C)
> +#define MTK_DP_LANE2_DRIVING_PARAM_4		(PHY_OFFSET + 0x33C)
> +#define MTK_DP_LANE3_DRIVING_PARAM_4		(PHY_OFFSET + 0x43C)
> +# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	0x18
> +# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	(0x1e << 8)
> +# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	(0x24 << 16)
> +# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	(0x20 << 24)
> +# define DRIVING_PARAM_4_DEFAULT		(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_5		(PHY_OFFSET + 0x140)
> +#define MTK_DP_LANE1_DRIVING_PARAM_5		(PHY_OFFSET + 0x240)
> +#define MTK_DP_LANE2_DRIVING_PARAM_5		(PHY_OFFSET + 0x340)
> +#define MTK_DP_LANE3_DRIVING_PARAM_5		(PHY_OFFSET + 0x440)
> +# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	0x28
> +# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	(0x30 << 8)
> +# define DRIVING_PARAM_5_DEFAULT		(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_6		(PHY_OFFSET + 0x144)
> +#define MTK_DP_LANE1_DRIVING_PARAM_6		(PHY_OFFSET + 0x244)
> +#define MTK_DP_LANE2_DRIVING_PARAM_6		(PHY_OFFSET + 0x344)
> +#define MTK_DP_LANE3_DRIVING_PARAM_6		(PHY_OFFSET + 0x444)
> +# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0x00
> +# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	(0x04 << 8)
> +# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	(0x08 << 16)
> +# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	(0x10 << 24)
> +# define DRIVING_PARAM_6_DEFAULT		(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_7		(PHY_OFFSET + 0x148)
> +#define MTK_DP_LANE1_DRIVING_PARAM_7		(PHY_OFFSET + 0x248)
> +#define MTK_DP_LANE2_DRIVING_PARAM_7		(PHY_OFFSET + 0x348)
> +#define MTK_DP_LANE3_DRIVING_PARAM_7		(PHY_OFFSET + 0x448)
> +# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0x00
> +# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	(0x06 << 8)
> +# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	(0x0c << 16)
> +# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	(0x00 << 24)
> +# define DRIVING_PARAM_7_DEFAULT		(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_8		(PHY_OFFSET + 0x14C)
> +#define MTK_DP_LANE1_DRIVING_PARAM_8		(PHY_OFFSET + 0x24C)
> +#define MTK_DP_LANE2_DRIVING_PARAM_8		(PHY_OFFSET + 0x34C)
> +#define MTK_DP_LANE3_DRIVING_PARAM_8		(PHY_OFFSET + 0x44C)
> +# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	0x08
> +# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	(0x00 << 8)
> +# define DRIVING_PARAM_8_DEFAULT		(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
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
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE,
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
> +
> +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> +	if (!dp_phy)
> +		return -ENOMEM;
> +
> +	dp_phy->regs = *(struct regmap **)dev->platform_data;
> +	if (!dp_phy->regs) {
> +		dev_err(dev, "No data passed, requires struct regmap**\n");
> +		return -EINVAL;
> +	}

is there a reason to do it this way? Why not set the IORESOURCE_MEM for
this device and let the driver map here?

NO clocks?

> +
> +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> +	if (IS_ERR(phy)) {
> +		dev_err(dev, "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
> +		return PTR_ERR(phy);
> +	}
> +	phy_set_drvdata(phy, dp_phy);
> +
> +	// Set device data to the phy so that mtk-dp can get it easily

pls change comment style

also why should mtk-dp do it this way, there is very nice API phy_get()
to do that, pls use that..


> +	dev_set_drvdata(dev, phy);
> +
> +	return 0;
> +}
> +
> +struct platform_driver mtk_dp_phy_driver = {

who creates this platform device?

> +	.probe = mtk_dp_phy_probe,
> +	.driver = {
> +		.name = "mediatek-dp-phy",
> +	},
> +};
> +module_platform_driver(mtk_dp_phy_driver);
> +
> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.0

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
