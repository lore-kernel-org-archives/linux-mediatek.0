Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8CDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 06:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNYAIKPlNyricz/QFy99tju8ecBkBsCtqSW3/3v8pAc=; b=c5NjuAT+y5Ixrp
	doQbegEFXA3gPFNCm3pLaK0Ykg6h+aBxvze1uJIiAaap4hlE00mb1Pwh40ZtfwmKY0b8OD2tg/5Hn
	kg2oKOqDl9syfoDAht074p3vt6yjxzLsMx1w/mtw/yHuK0SsL2EVB4jnN1tubDUzKdiSbwB/Xv7B0
	5k3Al65zuUqbUi8HfQDNgwhlGmYnJEUqo4Me0vWX37D1lbAqHenWKVouSPs232DjCSc/ShlvybaxX
	SJHX3rUru6jzrzppyhTbo/2oU6i6wnBZhOpvTiUz5GyGDGoWAp8yEWZWf+M3oD0RWWRW2BobyFN6c
	lFlS/pvE1HpHdKzxJzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2S19-002JhC-9W; Wed, 29 Dec 2021 06:00:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2S0w-002Jeb-6Z; Wed, 29 Dec 2021 06:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA4A961426;
 Wed, 29 Dec 2021 06:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66625C36AE7;
 Wed, 29 Dec 2021 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640757639;
 bh=OrbrodgAYSjiQzNjHIQlniQevCVLb6lJHzjWobUG6zQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sg8B51SpKPJDdqa1AVldira9Nh6lciLITTvy60O9L3ouVHB/CTU9BxlOtkwKQCoYH
 rjEFUUxo35dXqTwlXnPqZeZC89oRJt1G+uKK15tHovWH7nwAqJMxrhcsnOgJ+hv71S
 ME5z+F5WRY/ZAJf1GDzOGu4vuEWjDDG+5LcLhEiPjooDGWQF54csAmnC9VNtBY0b0F
 gWsTTZ7YBUCpPDJGym/Pdl4QkNRYEpWz1iJz3/2k1/yKLoBeXUIpg9uiA3iRJuwUIR
 83kZKTKTXMF66TeiGq2bvy/EvmfQsEUDBXRL+LVCpv0ctXjUAA/dKwNmvoqsKaUZAP
 756kH05sJkW5A==
Date: Wed, 29 Dec 2021 11:30:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 6/8] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <Ycv5gnWDtosJhwjc@matsya>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-7-granquet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217150854.2081-7-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_220042_350559_151F56F8 
X-CRM114-Status: GOOD (  32.98  )
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


On 17-12-21, 16:08, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>

Pls cc relevant folks on cover so that they know what is going on in the
series... Is this dependent on rest? It should not and can be sent and
reviewed separately!

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
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/phy/mediatek/Kconfig      |   8 ++
>  drivers/phy/mediatek/Makefile     |   1 +
>  drivers/phy/mediatek/phy-mtk-dp.c | 219 ++++++++++++++++++++++++++++++
>  4 files changed, 229 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8b7a98daf8e05..c44829d8a74df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6394,6 +6394,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/mediatek/
>  F:	drivers/gpu/drm/mediatek/
> +F:	drivers/phy/mediatek/phy-mtk-dp.c
>  F:	drivers/phy/mediatek/phy-mtk-hdmi*
>  F:	drivers/phy/mediatek/phy-mtk-mipi*
>  
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 55f8e6c048ab3..f7ec860590492 100644
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
> index ace660fbed3a1..4ba1e06504346 100644
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
> index 0000000000000..e0de2a367e788
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

how about defining constants and using FEILD_PREP() to set the value.
Here and few other places!

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

interesting use of default :) which is correct!

But why keep the regmap_write inside switch, you are anyway returning in
default, so this write could be outside as well
-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
