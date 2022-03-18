Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8y3YUxTb2kM6XMkPJiX0jc7flghUwSmrTmIgJ69BO4=; b=IfWGeEaYLAIFun
	OawTJFzm+jndHgQoPZse1DK2trrHJ3XwqyMR7H4e0YntrmjIRx/hEM18HNUtwaCVUY/Xb2jyx7PGl
	cFvX+4izJ/4vqSRkWOq3d9jsfljaYdQPDtgBmEJ5/PBmOClYJIfNU66hR+TdqaYO1skgUD1JZKQ+V
	7HGjW23ObMNe0G3+ijr0JbAehRB5u5wKFliI+hm/h7xvUeBMbsS9GhXSZRWpfanOkM+hrD4hwfaNr
	RWAVDAWncUDcSoQ12q8SUOFG9k4DJeSr6Npz9y4IVLghXKqEkrtcGEWeqlqHjelElyBSWnTh9253Y
	lWanwA7GEJT3I5+SB1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVB6I-001UZX-Kk; Fri, 18 Mar 2022 11:48:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVB66-001UWw-J8; Fri, 18 Mar 2022 11:48:48 +0000
X-UUID: a93254e41cb04d68a616da02007853d7-20220318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oKP4LaumP6c08b8wyBjmy5hIBrEpqz2gF93zMn9k7ro=; 
 b=uTOKPmipRWSZtAbc93MDFs0pmJVD9u8AeeGIw4uIbzfananhl4k9304fwTgCmQnqGOcyrbfKnFYKoEgdcu4H8fTfjN/Qc4Pat3Ed0OQsKvZm2oIWND3hVb6qa+G/tN7Bc02JWmXc9CiVqKRnGfAwvr1uMRPe9i3sGGWZjBmstZU=;
X-UUID: a93254e41cb04d68a616da02007853d7-20220318
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2014894067; Fri, 18 Mar 2022 04:48:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 04:48:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 19:48:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 19:48:39 +0800
Message-ID: <8b74600a0f9963328cfb278b0ea1131b5900df3b.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <randy.wu@mediatek.com>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Fri, 18 Mar 2022 19:48:39 +0800
In-Reply-To: <a3ccba54-9076-0966-f282-1943f10a0346@collabora.com>
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-3-jianjun.wang@mediatek.com>
 <a3ccba54-9076-0966-f282-1943f10a0346@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_044846_676378_421931CA 
X-CRM114-Status: GOOD (  48.62  )
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

Hi Angelo,

Thanks for all these suggestions, I'll fix them in the next version.

Thanks.

On Fri, 2022-03-18 at 11:57 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/22 10:54, Jianjun Wang ha scritto:
> > Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >   drivers/phy/mediatek/Kconfig        |  11 ++
> >   drivers/phy/mediatek/Makefile       |   1 +
> >   drivers/phy/mediatek/phy-mtk-pcie.c | 246
> > ++++++++++++++++++++++++++++
> >   3 files changed, 258 insertions(+)
> >   create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
> > 
> > diff --git a/drivers/phy/mediatek/Kconfig
> > b/drivers/phy/mediatek/Kconfig
> > index 55f8e6c048ab..387ed1b3f2cc 100644
> > --- a/drivers/phy/mediatek/Kconfig
> > +++ b/drivers/phy/mediatek/Kconfig
> > @@ -55,3 +55,14 @@ config PHY_MTK_MIPI_DSI
> >   	select GENERIC_PHY
> >   	help
> >   	  Support MIPI DSI for Mediatek SoCs.
> > +
> > +config PHY_MTK_PCIE
> > +	tristate "MediaTek PCIe-PHY Driver"
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on OF
> > +	select GENERIC_PHY
> > +	help
> > +	  Say 'Y' here to add support for MediaTek PCIe PHY driver.
> > +	  This driver create the basic PHY instance and provides
> > initialize
> > +	  callback for PCIe GEN3 port, it supports software efuse
> > +	  initialization.
> > diff --git a/drivers/phy/mediatek/Makefile
> > b/drivers/phy/mediatek/Makefile
> > index ace660fbed3a..788c13147f63 100644
> > --- a/drivers/phy/mediatek/Makefile
> > +++ b/drivers/phy/mediatek/Makefile
> > @@ -6,6 +6,7 @@
> >   obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
> >   obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
> >   obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> > +obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
> >   
> >   phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
> >   phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
> > mt2701.o
> > diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c
> > b/drivers/phy/mediatek/phy-mtk-pcie.c
> > new file mode 100644
> > index 000000000000..0f5d7c7e2b7e
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-pcie.c
> > @@ -0,0 +1,246 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Jianjun Wang <jianjun.wang@mediatek.com>
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/module.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#include "phy-mtk-io.h"
> > +
> > +#define PEXTP_ANA_GLB_00_REG		0x9000
> > +#define PEXTP_ANA_LN0_TRX_REG		0xa000
> > +#define PEXTP_ANA_TX_OFFSET		0x04
> > +#define PEXTP_ANA_RX_OFFSET		0x3c
> > +#define PEXTP_ANA_LANE_OFFSET		0x100
> > +
> > +/* PEXTP_GLB_00_REG[28:24] Internal Resistor Selection of TX Bias
> > Current */
> > +#define EFUSE_GLB_INTR_SEL		GENMASK(28, 24)
> > +#define EFUSE_GLB_INTR_VAL(x)		((0x1f & (x)) << 24)
> > +
> > +/* PEXTP_ANA_LN_RX_REG[3:0] RX impedance selection */
> > +#define EFUSE_LN_RX_SEL			GENMASK(3, 0)
> > +#define EFUSE_LN_RX_VAL(x)		(0xf & (x))
> > +
> > +/* PEXTP_ANA_LN_TX_REG[5:2] TX PMOS impedance selection */
> > +#define EFUSE_LN_TX_PMOS_SEL		GENMASK(5, 2)
> > +#define EFUSE_LN_TX_PMOS_VAL(x)		((0xf & (x)) << 2)
> > +
> > +/* PEXTP_ANA_LN_TX_REG[11:8] TX NMOS impedance selection */
> > +#define EFUSE_LN_TX_NMOS_SEL		GENMASK(11, 8)
> > +#define EFUSE_LN_TX_NMOS_VAL(x)		((0xf & (x)) << 8)
> > +
> > +/* Efuse data for each lane */
> 
> What about some kerneldoc?
> 
> /**
>   * struct mtk_pcie_lane_efuse - eFuse data for each lane
>   * @tx_pmos:
>   ......etc :))
> 
> > +struct mtk_pcie_lane_efuse {
> > +	u32 tx_pmos;
> > +	u32 tx_nmos;
> > +	u32 rx_data;
> > +	bool lane_efuse_supported;
> > +};
> > +
> 
> Same here
> 
> /**
>   * struct mtk_pcie_phy - PCIe phy driver main structure
>   * @dev: ......
> 
> > +struct mtk_pcie_phy {
> > +	struct device *dev;
> > +	struct phy *phy;
> > +	void __iomem *sif_base;
> > +
> > +	/*
> > +	 * Support software efuse initialization,
> > +	 * currently we only support 2 lane in maximum.
> > +	 */
> 
> Obviously, if you add kerneldoc, this comment would get moved to that
> kerneldoc.
> 
> > +	bool sw_efuse_supported;
> > +	u32 efuse_glb_intr;
> 
> 
> > +	struct mtk_pcie_lane_efuse efuse[2];
> 
> If you dynamically allocate this one, you will be able to support any
> number
> of lanes, futureproofing this driver and giving it more flexibility.
> 
> > +};
> > +
> 
> ..snip..
> 
> > +
> > +static int mtk_pcie_efuse_read_for_lane(struct mtk_pcie_phy
> > *pcie_phy,
> > +					unsigned int lane)
> > +{
> > +	struct device *dev = pcie_phy->dev;
> > +	struct mtk_pcie_lane_efuse *data;
> > +	char efuse_id[15];
> > +	int ret;
> > +
> > +	if (lane >= ARRAY_SIZE(pcie_phy->efuse))
> > +		return dev_err_probe(pcie_phy->dev, -EINVAL,
> > +				     "Requested lane number %d exceeds
> > maximum %ld\n",
> > +				     lane, ARRAY_SIZE(pcie_phy->efuse)
> > - 1);
> 
> I don't like seeing dev_err_probe() outside of a probe function, but
> I acknowledge
> that the Linux documentation doesn't seem to give any direction about
> that, so
> this is a personal preference, at this point.
> 
> > +
> > +	data = &pcie_phy->efuse[lane];
> > +
> > +	snprintf(efuse_id, sizeof(efuse_id), "tx_ln%d_pmos", lane);
> > +	ret = nvmem_cell_read_variable_le_u32(dev, efuse_id, &data-
> > >tx_pmos);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to read %s\n",
> > efuse_id);
> > +
> > +	snprintf(efuse_id, sizeof(efuse_id), "tx_ln%d_nmos", lane);
> > +	ret = nvmem_cell_read_variable_le_u32(dev, efuse_id, &data-
> > >tx_nmos);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to read %s\n",
> > efuse_id);
> > +
> > +	snprintf(efuse_id, sizeof(efuse_id), "rx_ln%d", lane);
> > +	ret = nvmem_cell_read_variable_le_u32(dev, efuse_id, &data-
> > >rx_data);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to read %s\n",
> > efuse_id);
> > +
> > +	if (!(data->tx_pmos || data->tx_nmos || data->rx_data))
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "No efuse data found for lane%d,
> > but dts enable it\n",
> > +				     lane);
> > +
> > +	data->lane_efuse_supported = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_pcie_read_efuse(struct mtk_pcie_phy *pcie_phy)
> > +{
> > +	struct device *dev = pcie_phy->dev;
> > +	bool nvmem_enabled;
> > +	int ret;
> > +
> > +	nvmem_enabled = device_property_read_bool(dev, "nvmem-cells");
> > +	if (!nvmem_enabled)
> > +		return -ENODEV;
> > +
> > +	ret = nvmem_cell_read_variable_le_u32(dev, "glb_intr",
> > +					      &pcie_phy-
> > >efuse_glb_intr);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to read
> > glb_intr\n");
> > +
> > +	pcie_phy->sw_efuse_supported = true;
> > +
> > +	ret = mtk_pcie_efuse_read_for_lane(pcie_phy, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = mtk_pcie_efuse_read_for_lane(pcie_phy, 1);
> > +	if (ret)
> > +		return ret;
> 
> To give some more future-proofing to this driver, I would instead
> either add a
> u32 devicetree property "num-lanes" or, if the same SoC may not have
> a different
> number of lanes across controller instances, I would add a number of
> lanes
> parameter as data for each of_match.
> 
> You'd be at that point using a for loop here like:
> 
> for (i = 0; i < pcie_phy->num_lanes, i++) {
> 	ret = mtk_pcie_efuse_read_for_lane(pcie_phy, i);
> 	if (ret)
> 		return ret;
> }
> 
> Of course, the same logic would apply to mtk_pcie_phy_init(), where
> you are
> instead calling mtk_pcie_efuse_set_lane().
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_pcie_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct phy_provider *provider;
> > +	struct mtk_pcie_phy *pcie_phy;
> > +
> > +	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
> > +	if (!pcie_phy)
> > +		return -ENOMEM;
> > +
> > +	pcie_phy->dev = dev;
> > +
> > +	pcie_phy->sif_base =
> > devm_platform_ioremap_resource_byname(pdev, "sif");
> > +	if (IS_ERR(pcie_phy->sif_base))
> > +		return dev_err_probe(dev, PTR_ERR(pcie_phy->sif_base),
> > +				     "Failed to map phy-sif base\n");
> > +
> > +	pcie_phy->phy = devm_phy_create(dev, dev->of_node,
> > &mtk_pcie_phy_ops);
> > +	if (IS_ERR(pcie_phy->phy))
> > +		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
> > +				     "Failed to create PCIe phy\n");
> > +
> > +	/*
> > +	 * Failed to read the efuse data is not a fatal problem,
> > +	 * ignore the failure and keep going.
> > +	 */
> > +	mtk_pcie_read_efuse(pcie_phy);
> 
> If you get an -EPROBE_DEFER here, you surely want to defer probing
> this driver,
> so, yes you're free to ignore the other failures, but you should fix
> that corner
> case.
> 
> Everything else looks good, so, please make sure to add me to the
> Cc's for the
> next version of this series for me to give you a faster review.
> 
> Regards,
> Angelo
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
