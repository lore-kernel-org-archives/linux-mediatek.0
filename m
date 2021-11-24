Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9296DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVKGb/MAUEiVys5Q/LIfrUVxZ35jLD+YZjKvN09Sklg=; b=n7gdaXd+tCnL7T
	qm/BY4QOtuKmgrD/EkPvKxfhQV0mumORillYTsXYdDuiSwtPU2lc13elYw4Kg6sT6CP9Xe8rYgo0q
	8f1i2YDMAS9C50Sl+BF6UM3UH6SqKp7x3qcwsmjrbmYnDOwwKO8dY8ocNKDx0PSetba5wVIVrdwc0
	IE37zpXC+vEvYEOHHE4pNLu7yvoMWMgcC3qCbAvWzSviK8Q7IGK8nOkVz4huiT4YuOqciwp6hTZLy
	KIoTmqrT/+gojwzXvAiVvOc9CEL2r1CDkQqaX9WeF1PnudZLjvQetquuIkl2V9qmyi4m4TOkFQfjP
	1YZFo0ROW0zjo4w/1CQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mptOc-0050Ou-RQ; Wed, 24 Nov 2021 14:37:14 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mptOZ-0050Np-6l
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 14:37:14 +0000
Received: by mail-oi1-x233.google.com with SMTP id u74so5729062oie.8
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Q2uRSbObrkePrc/zqU3Ngfzhg//kzaNeGN8p2tOermY=;
 b=Wpox2BiFdw5LB7Mri2X9dtiqzggWUQ3ce3fZP7mGvLN2qWIr6R+qb7739+z+UBjH5Y
 OS+LZM7gbxWGZpx6sL0FuwcPnAJrceL277Xm0OZw0Cdzh48Qyo7n/KxiyjmgRBVcwI7w
 55ScnUVXV+7X6tEuenAlNjJYETvgv46xXhEpjVV6n16XzUJoVnLXYppv28YM4oEpXL1e
 a1eVfJrzmnWgKSX5TalRIpd6kQ+Ranj4PKYa/ADCd+1iwtWgVf6uSrXsLNztVFZm0wxY
 4nfgw4iSkpctL59G9mvP8cxWZax6OQjSv35bcfWMfBjWQ8jvUoa8CeY4kO2Ks9ZwL2nB
 weBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Q2uRSbObrkePrc/zqU3Ngfzhg//kzaNeGN8p2tOermY=;
 b=CPFSqG6nMv/girHuZ+LX0lF8Zjih9FRebzaoB2gr5+7ABHslTqnmf9mJfaQL9j9zFT
 egQkBGx8UpNxqA4h6Q/XJp2G71Ly2bEPI4KE2CwYMQ8hPTB57Nm6UriDznLEgr9G7wH1
 NLutfSgWEC6l2a+yTKj7LfcxHGFC2g7g8Xz+zREVLk0HBdecHx7j9mM+KCKT4EmGp7cP
 TzuoC8GAiJKFDW+zI6Ta8WUTgzaFAMhMsX2tXgJRimD2geBHTThtyhzkeDPyxg1K2F5y
 q/0gcN/K3kxfPjbmvhxP+2DmhXyfLAEUqCP4z+atCl8SBApe/6mQPrD0iylaK0c5z4IK
 KH6g==
X-Gm-Message-State: AOAM533w1RtoPjqD0y/RYZZr0dO/m8A95HiaCB3mrK3oIBcBN69e8rXA
 YNmhrdvapW4fFghXM1/eHF6CXtbS+ii13NVKYWTBJw==
X-Google-Smtp-Source: ABdhPJyoBHUu71mzUSytuaBHiGkmNvNWsL+cSNLvnOPaoc3aXwyog/l3opaP3KACCnJdmgbG+DjUrao2zYz9PhEs5To=
X-Received: by 2002:aca:1708:: with SMTP id j8mr6452479oii.62.1637764629846;
 Wed, 24 Nov 2021 06:37:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Nov 2021 14:37:08 +0000
MIME-Version: 1.0
In-Reply-To: <fb09289440d16a0a441cd31a5542d4a6850fabe9.camel@mediatek.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-7-granquet@baylibre.com>
 <fb09289440d16a0a441cd31a5542d4a6850fabe9.camel@mediatek.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 24 Nov 2021 14:37:08 +0000
Message-ID: <CABnWg9s3rR1S5QqUyyUkKtsUqq3GSSLbMFvfoLQUs=4ZGzGqWw@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] phy: phy-mtk-dp: Add driver for DP phy
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_063711_314628_EB7D5427 
X-CRM114-Status: GOOD (  36.46  )
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

Hi Chunfeng,

Quoting Chunfeng Yun (2021-11-13 08:48:37)
> On Wed, 2021-11-10 at 14:06 +0100, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This is a new driver that supports the integrated DisplayPort phy for
> > mediatek SoCs, especially the mt8195. The phy is integrated into the
> > DisplayPort controller and will be created by the mtk-dp driver. This
> > driver expects a struct regmap to be able to work on the same
> > registers
> > as the DisplayPort controller. It sets the device data to be the
> > struct
> > phy so that the DisplayPort controller can easily work with it.
> >
> > The driver does not have any devicetree bindings because the
> > datasheet
> > does not list the controller and the phy as distinct units.
> >
> > The interaction with the controller can be covered by the configure
> > callback of the phy framework and its displayport parameters.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/phy/mediatek/Kconfig      |   8 ++
> >  drivers/phy/mediatek/Makefile     |   1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c | 219
> > ++++++++++++++++++++++++++++++
> >  4 files changed, 229 insertions(+)
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 170bbbeefc3f4..f9a71b6d2a4a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6367,6 +6367,7 @@ L:      linux-mediatek@lists.infradead.org
> > (moderated for non-subscribers)
> >  S:   Supported
> >  F:   Documentation/devicetree/bindings/display/mediatek/
> >  F:   drivers/gpu/drm/mediatek/
> > +F:   drivers/phy/mediatek/phy-mtk-dp.c
> >  F:   drivers/phy/mediatek/phy-mtk-hdmi*
> >  F:   drivers/phy/mediatek/phy-mtk-mipi*
> >
> > diff --git a/drivers/phy/mediatek/Kconfig
> > b/drivers/phy/mediatek/Kconfig
> > index 55f8e6c048ab3..f7ec860590492 100644
> > --- a/drivers/phy/mediatek/Kconfig
> > +++ b/drivers/phy/mediatek/Kconfig
> > @@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
> >       select GENERIC_PHY
> >       help
> >         Support MIPI DSI for Mediatek SoCs.
> > +
> > +config PHY_MTK_DP
> > +     tristate "MediaTek DP-PHY Driver"
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on OF
> > +     select GENERIC_PHY
> > +     help
> > +       Support DisplayPort PHY for Mediatek SoCs.
> > diff --git a/drivers/phy/mediatek/Makefile
> > b/drivers/phy/mediatek/Makefile
> > index ace660fbed3a1..4ba1e06504346 100644
> > --- a/drivers/phy/mediatek/Makefile
> > +++ b/drivers/phy/mediatek/Makefile
> > @@ -3,6 +3,7 @@
> >  # Makefile for the phy drivers.
> >  #
> >
> > +obj-$(CONFIG_PHY_MTK_DP)             += phy-mtk-dp.o
> >  obj-$(CONFIG_PHY_MTK_TPHY)           += phy-mtk-tphy.o
> >  obj-$(CONFIG_PHY_MTK_UFS)            += phy-mtk-ufs.o
> >  obj-$(CONFIG_PHY_MTK_XSPHY)          += phy-mtk-xsphy.o
> > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c
> > b/drivers/phy/mediatek/phy-mtk-dp.c
> > new file mode 100644
> > index 0000000000000..4f8d26ec0346b
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 BayLibre
> > + * Author: Markus Schneider-Pargmann <msp@baylibre.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define PHY_OFFSET 0x1000
> Why not provide register base address in DTS?
> I find that phy's platform device is registered by dp driver but the
> one automatically created when parse dts?
>
This phy driver has no dt binding whatsoever, as it shares basically
the same hardware as the DP driver,
so everything has to be either hardcoded or passed through from the DP driver.

> > +
> > +#define MTK_DP_PHY_DIG_PLL_CTL_1             (PHY_OFFSET + 0x014)
> > +# define TPLL_SSC_EN                         BIT(3)
> > +
> > +#define MTK_DP_PHY_DIG_BIT_RATE                      (PHY_OFFSET +
> > 0x03C)
> > +# define BIT_RATE_RBR                                0
> > +# define BIT_RATE_HBR                                1
> > +# define BIT_RATE_HBR2                               2
> > +# define BIT_RATE_HBR3                               3
> > +
> > +#define MTK_DP_PHY_DIG_SW_RST                        (PHY_OFFSET +
> > 0x038)
> > +# define DP_GLB_SW_RST_PHYD                  BIT(0)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_3         (PHY_OFFSET + 0x138)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_3         (PHY_OFFSET + 0x238)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_3         (PHY_OFFSET + 0x338)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_3         (PHY_OFFSET + 0x438)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT   0x10
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT   (0x14 << 8)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT   (0x18 << 16)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT   (0x20 << 24)
> > +# define DRIVING_PARAM_3_DEFAULT             (XTP_LN_TX_LCTXC0_SW0_P
> > RE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_P
> > RE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_P
> > RE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_P
> > RE3_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_4         (PHY_OFFSET + 0x13C)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_4         (PHY_OFFSET + 0x23C)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_4         (PHY_OFFSET + 0x33C)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_4         (PHY_OFFSET + 0x43C)
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT   0x18
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT   (0x1e << 8)
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT   (0x24 << 16)
> > +# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT   (0x20 << 24)
> > +# define DRIVING_PARAM_4_DEFAULT             (XTP_LN_TX_LCTXC0_SW1_P
> > RE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW1_P
> > RE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW1_P
> > RE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW2_P
> > RE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_5         (PHY_OFFSET + 0x140)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_5         (PHY_OFFSET + 0x240)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_5         (PHY_OFFSET + 0x340)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_5         (PHY_OFFSET + 0x440)
> > +# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT   0x28
> > +# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT   (0x30 << 8)
> > +# define DRIVING_PARAM_5_DEFAULT             (XTP_LN_TX_LCTXC0_SW2_P
> > RE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW3_P
> > RE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_6         (PHY_OFFSET + 0x144)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_6         (PHY_OFFSET + 0x244)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_6         (PHY_OFFSET + 0x344)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_6         (PHY_OFFSET + 0x444)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT  0x00
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT  (0x04 << 8)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT  (0x08 << 16)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT  (0x10 << 24)
> > +# define DRIVING_PARAM_6_DEFAULT             (XTP_LN_TX_LCTXCP1_SW0_
> > PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_
> > PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_
> > PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_
> > PRE3_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_7         (PHY_OFFSET + 0x148)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_7         (PHY_OFFSET + 0x248)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_7         (PHY_OFFSET + 0x348)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_7         (PHY_OFFSET + 0x448)
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT  0x00
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT  (0x06 << 8)
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT  (0x0c << 16)
> > +# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT  (0x00 << 24)
> > +# define DRIVING_PARAM_7_DEFAULT             (XTP_LN_TX_LCTXCP1_SW1_
> > PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW1_
> > PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW1_
> > PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW2_
> > PRE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_8         (PHY_OFFSET + 0x14C)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_8         (PHY_OFFSET + 0x24C)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_8         (PHY_OFFSET + 0x34C)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_8         (PHY_OFFSET + 0x44C)
> > +# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT  0x08
> > +# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT  (0x00 << 8)
> > +# define DRIVING_PARAM_8_DEFAULT             (XTP_LN_TX_LCTXCP1_SW2_
> > PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW3_
> > PRE0_DEFAULT)
> > +
> > +struct mtk_dp_phy {
> > +     struct regmap *regs;
> > +};
> > +
> > +static int mtk_dp_phy_init(struct phy *phy)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +     u32 driving_params[] = {
> > +             DRIVING_PARAM_3_DEFAULT,
> > +             DRIVING_PARAM_4_DEFAULT,
> > +             DRIVING_PARAM_5_DEFAULT,
> > +             DRIVING_PARAM_6_DEFAULT,
> > +             DRIVING_PARAM_7_DEFAULT,
> > +             DRIVING_PARAM_8_DEFAULT
> > +     };
> > +
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +
> > +     return 0;
> > +}
> > +
> > +static int mtk_dp_phy_configure(struct phy *phy, union
> > phy_configure_opts *opts)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +     u32 val;
> > +
> > +     if (opts->dp.set_rate) {
> > +             switch (opts->dp.link_rate) {
> > +             default:
> > +                     dev_err(&phy->dev,
> > +                             "Implementation error, unknown linkrate
> > %x\n",
> > +                             opts->dp.link_rate);
> > +                     return -EINVAL;
> > +             case 1620:
> > +                     val = BIT_RATE_RBR;
> > +                     break;
> > +             case 2700:
> > +                     val = BIT_RATE_HBR;
> > +                     break;
> > +             case 5400:
> > +                     val = BIT_RATE_HBR2;
> > +                     break;
> > +             case 8100:
> > +                     val = BIT_RATE_HBR3;
> > +                     break;
> > +             }
> > +             regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE,
> > val);
> > +     }
> > +
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
> > +                        TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN :
> > 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mtk_dp_phy_reset(struct phy *phy)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> > +                        DP_GLB_SW_RST_PHYD, 0);
> > +     usleep_range(50, 200);
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> > +                        DP_GLB_SW_RST_PHYD, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct phy_ops mtk_dp_phy_dev_ops = {
> > +     .init = mtk_dp_phy_init,
> > +     .configure = mtk_dp_phy_configure,
> > +     .reset = mtk_dp_phy_reset,
> > +     .owner = THIS_MODULE,
> > +};
> > +
> > +static int mtk_dp_phy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct mtk_dp_phy *dp_phy;
> > +     struct phy *phy;
> > +
> > +     dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> > +     if (!dp_phy)
> > +             return -ENOMEM;
> > +
> > +     dp_phy->regs = *(struct regmap **)dev->platform_data;
> > +     if (!dp_phy->regs) {
> > +             dev_err(dev, "No data passed, requires struct
> > regmap**\n");
> > +             return -EINVAL;
> > +     }
> Why not get it from dts?
>
No dt bindings, this is passed from the dp driver (which triggers the
probe of the phy btw).

> > +
> > +     phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> > +     if (IS_ERR(phy)) {
> > +             dev_err(dev, "Failed to create DP PHY: %ld\n",
> > PTR_ERR(phy));
> > +             return PTR_ERR(phy);
> > +     }
> > +     phy_set_drvdata(phy, dp_phy);
> > +
> > +     // Set device data to the phy so that mtk-dp can get it easily
> use /* */
> > +     dev_set_drvdata(dev, phy);
> > +
> > +     return 0;
> > +}
> > +
> > +struct platform_driver mtk_dp_phy_driver = {
> > +     .probe = mtk_dp_phy_probe,
> > +     .driver = {
> > +             .name = "mediatek-dp-phy",
> > +     },
> > +};
> > +module_platform_driver(mtk_dp_phy_driver);
> > +
> > +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> > +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> > +MODULE_LICENSE("GPL v2");

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
