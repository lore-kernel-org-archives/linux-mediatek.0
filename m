Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B471C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fl4N+rKrqNf4ta4N2Ot2spO1UzWu76gXlgMximjg/JA=; b=HI1y+EEhBiANzi
	BqHN2SN5LfswiwTwi1AWS4+gxxbl8rwh7R7z4rSWi0Anxx1I+LBN18PxJu4+LnnX/rwVcYKer81Q7
	kgVDZU8gEHHS17zt5xdzqZL0wUw7vk2KTUcbjMztH7k6VRiN3GNlGv7lakMQK914AEVqmz/4lNUri
	ugthhIHORKEJn+xUpzWnSKf4Oa1B3DyuYoc6mdqfW0UJ22n8QAEouzYDhND+GSUgUvG9Tv2//LPCR
	YM87jnXu9RkhN8URmcI+va8yFT6xw+D/X2LmVgRpP5cJgOvA4RtOFa/q8ySdNHVO41mlpUiX99zCW
	tHjEPKHNREsivA4U0bIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV9PC-00144u-4J; Fri, 18 Mar 2022 10:00:22 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV9Ox-0013yO-It
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 10:00:11 +0000
Received: by mail-yb1-xb35.google.com with SMTP id o5so14980913ybe.2
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 03:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ig+KFtXlcXoYXhF3fUSMtSUp8+EPHFVIuzw6Y6shxs4=;
 b=McgDCSEgLIKY1Lz2zinh8QlCE0OOUR1PipusBBJvh3PmwZxQf1cAjl6C6MbeuzF0B7
 zBS3A9dCU7HI2ouxYq5cVNWeJbKFyBWes/JIJgdm+ptlU2cZSjl9FMOLMfiuob1iETSW
 zaOpswFydPPHBXkt5NFiWKNYRp1Why7B+gFYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ig+KFtXlcXoYXhF3fUSMtSUp8+EPHFVIuzw6Y6shxs4=;
 b=JWF6C5z3GodOml2ITUwh7lypyTOtsuRQ6llT5aj9QGz63mt6eXFldYMLPxqehHTpRq
 iQhHs7XChxyX4sdCZSRvyP0U1HbGG3kRbgEZS0+M5Zc5z+LeKc5epk0yTjwplkYIfJhj
 NDRaa61TMzXPjFNx7JrFKOHZ+WQJG/4opq4F64YdHzx2MlRrmfYxvPA0GBtl54B63wON
 +fecNBS02d1OLe4YxbjLuC+LNP48V3xQmOTcsAmZIS0eLLu4vSZbOecRB257nAnRufWf
 wOeYJYkYhK6VoIK3utM7nZ2kG4SVsTJnremNCb4O7s+82wiMSAqqw/jLMOKtqjcmLLTC
 XcZA==
X-Gm-Message-State: AOAM530GnvNmBiyUIpp486HZ2vASYLqt91KJ4MhonRdc9VqpAqALHeH+
 zQwTLKpFlTD1GayzyJt7Pr8RUrmevNuVaw5B2DGEFA==
X-Google-Smtp-Source: ABdhPJyrissg2mW9geLgWeADmpgZjxm5NRui5P6FXTIVuUuMgNTokDWnYaX6OfcIddVBAaRP82Aslt8Jo21NAmVwP+A=
X-Received: by 2002:a25:1f82:0:b0:633:6bfe:17d3 with SMTP id
 f124-20020a251f82000000b006336bfe17d3mr9686571ybf.164.1647597605384; Fri, 18
 Mar 2022 03:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-3-jianjun.wang@mediatek.com>
In-Reply-To: <20220318095417.2016-3-jianjun.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Mar 2022 17:59:54 +0800
Message-ID: <CAGXv+5GZcgNU3ayKPeKxvA4nfXmYDLG=08ihRngmOAZbBLzRBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: mediatek: Add PCIe PHY driver
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rex-bc.chen@mediatek.com, Randy.Wu@mediatek.com, jieyy.yang@mediatek.com, 
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com, jian.yang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_030007_641839_1F13E384 
X-CRM114-Status: GOOD (  33.88  )
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

On Fri, Mar 18, 2022 at 5:54 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
>
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/phy/mediatek/Kconfig        |  11 ++
>  drivers/phy/mediatek/Makefile       |   1 +
>  drivers/phy/mediatek/phy-mtk-pcie.c | 246 ++++++++++++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
>
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 55f8e6c048ab..387ed1b3f2cc 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -55,3 +55,14 @@ config PHY_MTK_MIPI_DSI
>         select GENERIC_PHY
>         help
>           Support MIPI DSI for Mediatek SoCs.
> +
> +config PHY_MTK_PCIE
> +       tristate "MediaTek PCIe-PHY Driver"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on OF
> +       select GENERIC_PHY
> +       help
> +         Say 'Y' here to add support for MediaTek PCIe PHY driver.
> +         This driver create the basic PHY instance and provides initialize
> +         callback for PCIe GEN3 port, it supports software efuse
> +         initialization.
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index ace660fbed3a..788c13147f63 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -6,6 +6,7 @@
>  obj-$(CONFIG_PHY_MTK_TPHY)             += phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)              += phy-mtk-ufs.o
>  obj-$(CONFIG_PHY_MTK_XSPHY)            += phy-mtk-xsphy.o
> +obj-$(CONFIG_PHY_MTK_PCIE)             += phy-mtk-pcie.o
>
>  phy-mtk-hdmi-drv-y                     := phy-mtk-hdmi.o
>  phy-mtk-hdmi-drv-y                     += phy-mtk-hdmi-mt2701.o
> diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c b/drivers/phy/mediatek/phy-mtk-pcie.c
> new file mode 100644
> index 000000000000..0f5d7c7e2b7e
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-pcie.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Jianjun Wang <jianjun.wang@mediatek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/compiler_types.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "phy-mtk-io.h"
> +
> +#define PEXTP_ANA_GLB_00_REG           0x9000
> +#define PEXTP_ANA_LN0_TRX_REG          0xa000
> +#define PEXTP_ANA_TX_OFFSET            0x04
> +#define PEXTP_ANA_RX_OFFSET            0x3c
> +#define PEXTP_ANA_LANE_OFFSET          0x100
> +
> +/* PEXTP_GLB_00_REG[28:24] Internal Resistor Selection of TX Bias Current */
> +#define EFUSE_GLB_INTR_SEL             GENMASK(28, 24)
> +#define EFUSE_GLB_INTR_VAL(x)          ((0x1f & (x)) << 24)
> +
> +/* PEXTP_ANA_LN_RX_REG[3:0] RX impedance selection */
> +#define EFUSE_LN_RX_SEL                        GENMASK(3, 0)
> +#define EFUSE_LN_RX_VAL(x)             (0xf & (x))
> +
> +/* PEXTP_ANA_LN_TX_REG[5:2] TX PMOS impedance selection */
> +#define EFUSE_LN_TX_PMOS_SEL           GENMASK(5, 2)
> +#define EFUSE_LN_TX_PMOS_VAL(x)                ((0xf & (x)) << 2)
> +
> +/* PEXTP_ANA_LN_TX_REG[11:8] TX NMOS impedance selection */
> +#define EFUSE_LN_TX_NMOS_SEL           GENMASK(11, 8)
> +#define EFUSE_LN_TX_NMOS_VAL(x)                ((0xf & (x)) << 8)
> +
> +/* Efuse data for each lane */
> +struct mtk_pcie_lane_efuse {
> +       u32 tx_pmos;
> +       u32 tx_nmos;
> +       u32 rx_data;
> +       bool lane_efuse_supported;
> +};
> +
> +struct mtk_pcie_phy {
> +       struct device *dev;
> +       struct phy *phy;
> +       void __iomem *sif_base;
> +
> +       /*
> +        * Support software efuse initialization,
> +        * currently we only support 2 lane in maximum.
> +        */
> +       bool sw_efuse_supported;
> +       u32 efuse_glb_intr;
> +       struct mtk_pcie_lane_efuse efuse[2];
> +};
> +
> +static void mtk_pcie_efuse_set_lane(struct mtk_pcie_phy *pcie_phy,
> +                                   unsigned int lane)
> +{
> +       struct mtk_pcie_lane_efuse *data;
> +       void __iomem *addr;
> +
> +       if (lane >= ARRAY_SIZE(pcie_phy->efuse)) {
> +               dev_err(pcie_phy->dev,
> +                       "Requested lane number %d exceeds maximum %ld\n",
> +                       lane, ARRAY_SIZE(pcie_phy->efuse) - 1);
> +               return;
> +       }
> +
> +       data = &pcie_phy->efuse[lane];
> +       if (!data->lane_efuse_supported)
> +               return;
> +
> +       addr = pcie_phy->sif_base + PEXTP_ANA_LN0_TRX_REG +
> +              lane * PEXTP_ANA_LANE_OFFSET;
> +
> +       mtk_phy_update_bits(addr + PEXTP_ANA_TX_OFFSET, EFUSE_LN_TX_PMOS_SEL,
> +                           EFUSE_LN_TX_PMOS_VAL(data->tx_pmos));
> +
> +       mtk_phy_update_bits(addr + PEXTP_ANA_TX_OFFSET, EFUSE_LN_TX_NMOS_SEL,
> +                           EFUSE_LN_TX_NMOS_VAL(data->tx_nmos));
> +
> +       mtk_phy_update_bits(addr + PEXTP_ANA_RX_OFFSET, EFUSE_LN_RX_SEL,
> +                           EFUSE_LN_RX_VAL(data->rx_data));
> +}
> +
> +/**
> + * mtk_pcie_phy_init() - Initialize the phy
> + * @phy: the phy to be initialized
> + *
> + * Initialize the phy by setting the efuse data.
> + * The hardware settings will be reset during suspend, it should be
> + * reinitialized when the consumer calls phy_init() again on resume.
> + */
> +static int mtk_pcie_phy_init(struct phy *phy)
> +{
> +       struct mtk_pcie_phy *pcie_phy = phy_get_drvdata(phy);
> +
> +       if (!pcie_phy->sw_efuse_supported)
> +               return 0;
> +
> +       /* Set global data */
> +       mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_GLB_00_REG,
> +                           EFUSE_GLB_INTR_SEL,
> +                           EFUSE_GLB_INTR_VAL(pcie_phy->efuse_glb_intr));
> +
> +       mtk_pcie_efuse_set_lane(pcie_phy, 0);
> +
> +       mtk_pcie_efuse_set_lane(pcie_phy, 1);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops mtk_pcie_phy_ops = {
> +       .init   = mtk_pcie_phy_init,
> +       .owner  = THIS_MODULE,
> +};
> +
> +static int mtk_pcie_efuse_read_for_lane(struct mtk_pcie_phy *pcie_phy,
> +                                       unsigned int lane)
> +{
> +       struct device *dev = pcie_phy->dev;
> +       struct mtk_pcie_lane_efuse *data;
> +       char efuse_id[15];
> +       int ret;
> +
> +       if (lane >= ARRAY_SIZE(pcie_phy->efuse))
> +               return dev_err_probe(pcie_phy->dev, -EINVAL,
> +                                    "Requested lane number %d exceeds maximum %ld\n",
> +                                    lane, ARRAY_SIZE(pcie_phy->efuse) - 1);
> +
> +       data = &pcie_phy->efuse[lane];
> +
> +       snprintf(efuse_id, sizeof(efuse_id), "tx_ln%d_pmos", lane);
> +       ret = nvmem_cell_read_variable_le_u32(dev, efuse_id, &data->tx_pmos);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read %s\n", efuse_id);
> +
> +       snprintf(efuse_id, sizeof(efuse_id), "tx_ln%d_nmos", lane);
> +       ret = nvmem_cell_read_variable_le_u32(dev, efuse_id, &data->tx_nmos);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read %s\n", efuse_id);
> +
> +       snprintf(efuse_id, sizeof(efuse_id), "rx_ln%d", lane);
> +       ret = nvmem_cell_read_variable_le_u32(dev, efuse_id, &data->rx_data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read %s\n", efuse_id);
> +
> +       if (!(data->tx_pmos || data->tx_nmos || data->rx_data))
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "No efuse data found for lane%d, but dts enable it\n",
> +                                    lane);
> +
> +       data->lane_efuse_supported = true;
> +
> +       return 0;
> +}
> +
> +static int mtk_pcie_read_efuse(struct mtk_pcie_phy *pcie_phy)
> +{
> +       struct device *dev = pcie_phy->dev;
> +       bool nvmem_enabled;
> +       int ret;
> +
> +       nvmem_enabled = device_property_read_bool(dev, "nvmem-cells");
> +       if (!nvmem_enabled)
> +               return -ENODEV;
> +
> +       ret = nvmem_cell_read_variable_le_u32(dev, "glb_intr",
> +                                             &pcie_phy->efuse_glb_intr);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read glb_intr\n");
> +
> +       pcie_phy->sw_efuse_supported = true;
> +
> +       ret = mtk_pcie_efuse_read_for_lane(pcie_phy, 0);
> +       if (ret)
> +               return ret;
> +
> +       ret = mtk_pcie_efuse_read_for_lane(pcie_phy, 1);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int mtk_pcie_phy_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct phy_provider *provider;
> +       struct mtk_pcie_phy *pcie_phy;
> +
> +       pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
> +       if (!pcie_phy)
> +               return -ENOMEM;
> +
> +       pcie_phy->dev = dev;
> +
> +       pcie_phy->sif_base = devm_platform_ioremap_resource_byname(pdev, "sif");
> +       if (IS_ERR(pcie_phy->sif_base))
> +               return dev_err_probe(dev, PTR_ERR(pcie_phy->sif_base),
> +                                    "Failed to map phy-sif base\n");
> +
> +       pcie_phy->phy = devm_phy_create(dev, dev->of_node, &mtk_pcie_phy_ops);
> +       if (IS_ERR(pcie_phy->phy))
> +               return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
> +                                    "Failed to create PCIe phy\n");
> +
> +       /*
> +        * Failed to read the efuse data is not a fatal problem,
> +        * ignore the failure and keep going.
> +        */
> +       mtk_pcie_read_efuse(pcie_phy);

You need to check the return value for -EPROBE_DEFER to defer probing.

> +
> +       phy_set_drvdata(pcie_phy->phy, pcie_phy);
> +
> +       provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +       if (IS_ERR(provider))
> +               return dev_err_probe(dev, PTR_ERR(provider),
> +                                    "PCIe phy probe failed\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_pcie_phy_of_match[] = {
> +       { .compatible = "mediatek,mt8195-pcie-phy" },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_pcie_phy_of_match);
> +
> +static struct platform_driver mtk_pcie_phy_driver = {
> +       .probe  = mtk_pcie_phy_probe,
> +       .driver = {
> +               .name = "mtk-pcie-phy",
> +               .of_match_table = mtk_pcie_phy_of_match,
> +       },
> +};
> +module_platform_driver(mtk_pcie_phy_driver);
> +
> +MODULE_DESCRIPTION("MediaTek PCIe PHY driver");
> +MODULE_AUTHOR("Jianjun Wang <jianjun.wang@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
