Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED97C07E9C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A24761C88
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A24761C88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36kyRZACAarwFl30JgLfa/vvuB+wmO16BVFC7VvKiVg=; b=NrMVxPl0D00hhD
	lo64R8aiyqZqivSN+4Ckg72MpTX0HBD6fKOAxVSIFKxteeNXK6NzW9UTs+GFEI1jOEpB7wwzb9CxL
	VDDKy6T/X9IdIOWsTrsMAW4hOTuzdo5lsBN46PtiCyHyx/KAn8bWlszW4mStZUAhWxqonZ4Coayv+
	0k1CLkU56FanXjRnbOGhOUZSUDILJT5/Z6/zhCK3W0/upb78b1skF/Kzlzvs323nmt2FVH5fGjTG4
	Rk6C4PbUAEulQUjfldr328s6hILJNI04NWE+WTAoQfXm52Wn1FwAi0dRNZi0W08msjdx9sG0eOuJ6
	4CXBUgkN+fV4OdpZMciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m128W-00DsWz-FB; Wed, 07 Jul 2021 07:38:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m125r-00DqwU-Fc; Wed, 07 Jul 2021 07:35:43 +0000
X-UUID: a65abbc7a67d472a8e8795aa5e13d3e0-20210707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LhAE8X0dJIm1E9UciuLOR3azoEkDM9KG9CUzccYh6CM=; 
 b=f1GQ6EWSZYPMELO8BHti+TwWZokamb37ve8kThtr43x7UoCXyGhBF6youxsI1WCU70aL511KzYKE9LcwleqGN5nkBsSVY1k+2FV6TY1NaEO5vURUy7BA27muZzNRaxmX7ptYQpTVnpVGSbbYF4RTaRo7HeI0DrB8gASisFRnjUw=;
X-UUID: a65abbc7a67d472a8e8795aa5e13d3e0-20210707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1121555668; Wed, 07 Jul 2021 00:35:34 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 00:35:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 15:35:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 15:35:25 +0800
Message-ID: <1625643325.7824.42.camel@mtksdaap41>
Subject: Re: [PATCH v1 17/17] drm/mediatek: add DSC support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 15:35:25 +0800
In-Reply-To: <20210707041249.29816-18-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-18-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_003539_592392_EF186441 
X-CRM114-Status: GOOD (  31.60  )
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

Hi, Jason:

On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> 1. Add DSC module file.
> 2. Add mtk_panel_ext source file to get the mtk_panel_dsc_params
>    from panel.
> 3. Add DSC related path to mtk-mmsys routing table.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_dsc.c     | 286 ++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  13 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  drivers/gpu/drm/mediatek/mtk_panel_ext.c    | 136 ++++++++
>  drivers/gpu/drm/mediatek/mtk_panel_ext.h    | 344 ++++++++++++++++++++
>  drivers/soc/mediatek/mt8195-mmsys.h         |  18 +
>  drivers/soc/mediatek/mtk-mutex.c            |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h      |   3 +
>  13 files changed, 819 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_panel_ext.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_panel_ext.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 5fd95b9d5aae..4dc0b2901a22 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -6,13 +6,15 @@ mediatek-drm-y := mtk_disp_ccorr.o \
>  		  mtk_disp_ovl.o \
>  		  mtk_disp_rdma.o \
>  		  mtk_disp_merge.o \
> +		  mtk_disp_dsc.o \
>  		  mtk_drm_crtc.o \
>  		  mtk_drm_ddp_comp.o \
>  		  mtk_drm_drv.o \
>  		  mtk_drm_gem.o \
>  		  mtk_drm_plane.o \
>  		  mtk_dsi.o \
> -		  mtk_dpi.o
> +		  mtk_dpi.o \
> +		  mtk_panel_ext.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 7fd5260e2a72..11a6c9d6cff3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -100,4 +100,12 @@ void mtk_merge_config(struct device *dev, unsigned int width,
>  void mtk_merge_start(struct device *dev);
>  void mtk_merge_stop(struct device *dev);
>  
> +int mtk_dsc_clk_enable(struct device *dev);
> +void mtk_dsc_clk_disable(struct device *dev);
> +void mtk_dsc_config(struct device *dev, unsigned int width,
> +		     unsigned int height, unsigned int vrefresh,
> +		     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_dsc_start(struct device *dev);
> +void mtk_dsc_stop(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_dsc.c b/drivers/gpu/drm/mediatek/mtk_disp_dsc.c
> new file mode 100644
> index 000000000000..5da820feead5
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_dsc.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.

2021

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_gem.h"
> +#include "mtk_disp_drv.h"
> +#ifdef CONFIG_MTK_DPTX_SUPPORT
> +#include "mtk_dp_api.h"
> +#endif
> +
> +#define DISP_REG_DSC_CON			0x0000
> +#define DSC_EN						BIT(0)
> +#define DSC_DUAL_INOUT				BIT(2)
> +#define DSC_IN_SRC_SEL				BIT(3)
> +#define DSC_BYPASS					BIT(4)
> +#define DSC_RELAY					BIT(5)
> +#define DSC_EMPTY_FLAG_SEL			0xc000
> +#define DSC_UFOE_SEL				BIT(16)
> +#define DISP_REG_DSC_OBUF			0x0070
> +
> +struct mtk_disp_dsc_data {
> +	bool support_shadow;
> +};

Now just support mt8195-dsc, so remove this.

> +
> +/**
> + * struct mtk_disp_dsc - DISP_DSC driver structure
> + * @clk - clk of dsc hardware
> + * @regs - hardware register address of dsc
> + * @ddp_comp - structure containing type enum and hardware resources
> + * @cmdq_reg - structure containing cmdq hardware resource
> + * @data - dsc driver data
> + * @enable - enable dsc hardward
> + */
> +struct mtk_disp_dsc {
> +	struct clk *clk;
> +	void __iomem *regs;
> +	struct mtk_ddp_comp	ddp_comp;

Sub driver should get rid of ddp_comp.

> +	struct cmdq_client_reg		cmdq_reg;
> +	const struct mtk_disp_dsc_data *data;
> +	int enable;

enable is always false, so remove it.

> +};
> +
> +void mtk_dsc_start(struct device *dev)
> +{
> +	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
> +	void __iomem *baddr = dsc->regs;
> +	int ret = 0;
> +
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		DRM_ERROR("Failed to enable power domain: %d\n", ret);
> +
> +	if (dsc->enable) {
> +		int high = BIT(14);
> +		int obud_sw = BIT(31);
> +		int obud_size = 706; /* unit is 6 byte */
> +
> +		/* DSC Empty flag always high */
> +		mtk_ddp_write_mask(NULL, high,
> +			&dsc->cmdq_reg, baddr,
> +			DISP_REG_DSC_CON, DSC_EMPTY_FLAG_SEL);
> +
> +		/* DSC output buffer as FHD(plus) */
> +		mtk_ddp_write_mask(NULL, (obud_sw | obud_size),
> +			&dsc->cmdq_reg, baddr,
> +			DISP_REG_DSC_OBUF, ~0);
> +	}
> +
> +	mtk_ddp_write_mask(NULL, DSC_EN,
> +		&dsc->cmdq_reg, baddr,
> +		DISP_REG_DSC_CON, DSC_EN);
> +
> +	pr_debug("dsc_start:0x%x\n", readl(baddr + DISP_REG_DSC_CON));
> +}
> +
> +void mtk_dsc_stop(struct device *dev)
> +{
> +	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
> +	void __iomem *baddr = dsc->regs;
> +	int ret = 0;
> +
> +	mtk_ddp_write_mask(NULL, 0x0, &dsc->cmdq_reg, baddr,
> +		DISP_REG_DSC_CON, DSC_EN);
> +
> +	pr_debug("dsc_stop:0x%x\n", readl(baddr + DISP_REG_DSC_CON));
> +
> +	ret = pm_runtime_put(dev);
> +	if (ret < 0)
> +		DRM_ERROR("Failed to disable power domain: %d\n", ret);
> +}
> +
> +int mtk_dsc_clk_enable(struct device *dev)
> +{
> +	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(dsc->clk);
> +}
> +
> +void mtk_dsc_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(dsc->clk);
> +}
> +
> +static struct mtk_panel_dsc_params *mtk_dsc_default_setting(void)
> +{
> +	static struct mtk_panel_dsc_params dsc_params = {
> +		.enable = 0, /* 0: bypass mode */
> +		.ver = 2,
> +		.slice_mode = 1,
> +		.rgb_swap = 0,
> +		.dsc_cfg = 0x12, /* flatness_det_thr, 8bit */
> +		.rct_on = 1, // default
> +		.bit_per_channel = 8,
> +		.dsc_line_buf_depth = 13, /* 9, 11: for 10bit */
> +		.bp_enable = 1, /* align vend */
> +		.bit_per_pixel = 128, /* 16 x bpp */
> +		.pic_height = 2160,
> +		.pic_width = 3840, /* for dp port 4k scenario */
> +		.slice_height = 8,
> +		.slice_width = 1920, /* frame_width/slice mode */
> +		.chunk_size = 1920,
> +		.xmit_delay = 512,
> +		.dec_delay = 1216,
> +		.scale_value = 32,
> +		.increment_interval = 286,
> +		.decrement_interval = 26,
> +		.line_bpg_offset = 12,
> +		.nfl_bpg_offset = 3511,
> +		.slice_bpg_offset = 916,
> +		.initial_offset = 6144,
> +		.final_offset = 4336,
> +		.flatness_minqp = 3,
> +		.flatness_maxqp = 12,
> +		.rc_model_size = 8192,
> +		.rc_edge_factor = 6,
> +		.rc_quant_incr_limit0 = 11,
> +		.rc_quant_incr_limit1 = 11,
> +		.rc_tgt_offset_hi = 3,
> +		.rc_tgt_offset_lo = 3,
> +	};
> +
> +	return &dsc_params;
> +}

Useless, so remove.

> +
> +void mtk_dsc_config(struct device *dev, unsigned int w,
> +				unsigned int h, unsigned int vrefresh,
> +				unsigned int bpc, struct cmdq_pkt *handle)
> +{
> +	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
> +	struct mtk_ddp_comp *comp = &dsc->ddp_comp;
> +	struct mtk_panel_dsc_params *dsc_params;
> +
> +	dsc_params = mtk_dsc_default_setting();
> +
> +	if (dsc_params->enable == 1) {
> +		/* dsc enable mode not support yet */
> +		pr_debug("comp_id:%d, w:%d, h:%d\n",
> +			comp->id, w, h);
> +		pr_debug("slice_mode:%d, slice(%d,%d), bpp:%d\n",
> +			dsc_params->slice_mode, dsc_params->slice_width,
> +			dsc_params->slice_height, dsc_params->bit_per_pixel);
> +	} else {
> +		/* dsc bypass mode */
> +		mtk_ddp_write_mask(handle, DSC_BYPASS,
> +			&dsc->cmdq_reg, dsc->regs,
> +			DISP_REG_DSC_CON, DSC_BYPASS);
> +		mtk_ddp_write_mask(handle, DSC_UFOE_SEL,
> +			&dsc->cmdq_reg, dsc->regs,
> +			DISP_REG_DSC_CON, DSC_UFOE_SEL);
> +		mtk_ddp_write_mask(handle, DSC_DUAL_INOUT,
> +			&dsc->cmdq_reg, dsc->regs,
> +			DISP_REG_DSC_CON, DSC_DUAL_INOUT);
> +		dsc->enable = false;
> +	}

Keep only bypass mode.

> +}
> +
> +static int mtk_disp_dsc_bind(struct device *dev, struct device *master,
> +				  void *data)
> +{
> +	return 0;
> +}
> +
> +static void mtk_disp_dsc_unbind(struct device *dev, struct device *master,
> +				 void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_dsc_component_ops = {
> +	.bind = mtk_disp_dsc_bind,
> +	.unbind = mtk_disp_dsc_unbind,
> +};
> +
> +static int mtk_disp_dsc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct mtk_disp_dsc *priv;
> +	int irq;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "failed to get dsc clk\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regs)) {
> +		dev_err(dev, "failed to ioremap dsc\n");
> +		return PTR_ERR(priv->regs);
> +	}
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> +	if (ret)
> +		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +
> +	priv->data = of_device_get_match_data(dev);
> +	platform_set_drvdata(pdev, priv);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = component_add(dev, &mtk_disp_dsc_component_ops);
> +	if (ret != 0) {
> +		dev_err(dev, "Failed to add component: %d\n", ret);
> +		pm_runtime_disable(dev);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_disp_dsc_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &mtk_disp_dsc_component_ops);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct mtk_disp_dsc_data mt8195_dsc_driver_data = {
> +	.support_shadow = false,
> +};
> +
> +static const struct of_device_id mtk_disp_dsc_driver_dt_match[] = {
> +	{
> +		.compatible = "mediatek,mt8195-disp-dsc",
> +		.data = &mt8195_dsc_driver_data
> +	},
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, mtk_disp_dsc_driver_dt_match);
> +
> +struct platform_driver mtk_disp_dsc_driver = {
> +	.probe = mtk_disp_dsc_probe,
> +	.remove = mtk_disp_dsc_remove,
> +	.driver = {
> +		.name = "mediatek-disp-dsc",
> +		.owner = THIS_MODULE,
> +		.of_match_table = mtk_disp_dsc_driver_dt_match,
> +	},
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index 7419cd0fb424..7b8f9cb96d44 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_crtc.h>
>  #include "mtk_drm_ddp_comp.h"
>  #include "mtk_drm_plane.h"
> +#include "mtk_panel_ext.h"
>  
>  #define MTK_LUT_SIZE	512
>  #define MTK_MAX_BPC	10
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 2ccf3db1950d..b68bde6eb6ed 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -347,6 +347,14 @@ static const struct mtk_ddp_comp_funcs ddp_merge = {
>  	.config = mtk_merge_config,
>  };
>  
> +static const struct mtk_ddp_comp_funcs ddp_dsc = {
> +	.config = mtk_dsc_config,
> +	.start = mtk_dsc_start,
> +	.stop = mtk_dsc_stop,
> +	.clk_enable = mtk_dsc_clk_enable,
> +	.clk_disable = mtk_dsc_clk_disable,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_ufoe = {
>  	.clk_enable = mtk_ddp_clk_enable,
>  	.clk_disable = mtk_ddp_clk_disable,
> @@ -371,6 +379,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>  	[MTK_DISP_OD] = "od",
>  	[MTK_DISP_BLS] = "bls",
>  	[MTK_DISP_MERGE] = "merge",
> +	[MTK_DISP_DSC] = "dsc",
>  };
>  
>  struct mtk_ddp_comp_match {
> @@ -412,6 +421,9 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_MERGE3]	= { MTK_DISP_MERGE,	3, &ddp_merge },
>  	[DDP_COMPONENT_MERGE4]	= { MTK_DISP_MERGE,	4, &ddp_merge },
>  	[DDP_COMPONENT_MERGE5]	= { MTK_DISP_MERGE,	5, &ddp_merge },
> +	[DDP_COMPONENT_DSC0]	= { MTK_DISP_DSC,	0, &ddp_dsc },
> +	[DDP_COMPONENT_DSC1]	= { MTK_DISP_DSC,	1, &ddp_dsc },
> +	[DDP_COMPONENT_DSC1_VIRTUAL0]	= { MTK_DISP_DSC,	-1, &ddp_dsc },
>  	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
>  	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
>  	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> @@ -531,6 +543,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>  	    type == MTK_DISP_COLOR ||
>  	    type == MTK_DISP_GAMMA ||
>  	    type == MTK_DISP_MERGE ||
> +	    type == MTK_DISP_DSC ||
>  	    type == MTK_DPI ||
>  	    type == MTK_DSI ||
>  	    type == MTK_DISP_OVL ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 038775b4531b..b4f6b52dac69 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -35,6 +35,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_OD,
>  	MTK_DISP_BLS,
>  	MTK_DISP_MERGE,
> +	MTK_DISP_DSC,
>  	MTK_DDP_COMP_TYPE_MAX,
>  };
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index f891316008aa..af3e69e0edbe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -464,6 +464,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_DITHER },
>  	{ .compatible = "mediatek,mt8195-disp-merge",
>  	  .data = (void *)MTK_DISP_MERGE },
> +	{ .compatible = "mediatek,mt8195-disp-dsc",
> +	  .data = (void *)MTK_DISP_DSC },
>  	{ .compatible = "mediatek,mt8173-disp-ufoe",
>  	  .data = (void *)MTK_DISP_UFOE },
>  	{ .compatible = "mediatek,mt2701-dsi",
> @@ -582,6 +584,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  		    comp_type == MTK_DISP_COLOR ||
>  		    comp_type == MTK_DISP_GAMMA ||
>  		    comp_type == MTK_DISP_MERGE ||
> +		    comp_type == MTK_DISP_DSC ||
>  		    comp_type == MTK_DISP_OVL ||
>  		    comp_type == MTK_DISP_OVL_2L ||
>  		    comp_type == MTK_DISP_RDMA ||
> @@ -687,6 +690,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
>  	&mtk_dpi_driver,
>  	&mtk_drm_platform_driver,
>  	&mtk_disp_merge_driver,
> +	&mtk_disp_dsc_driver,
>  	&mtk_dsi_driver,
>  };
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 18548a373626..7f821b96aac3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -52,6 +52,7 @@ extern struct platform_driver mtk_disp_gamma_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
>  extern struct platform_driver mtk_disp_merge_driver;
> +extern struct platform_driver mtk_disp_dsc_driver;
>  extern struct platform_driver mtk_dpi_driver;
>  extern struct platform_driver mtk_dsi_driver;
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_panel_ext.c b/drivers/gpu/drm/mediatek/mtk_panel_ext.c
> new file mode 100644
> index 000000000000..5887a1cd08bc
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_panel_ext.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +
> +#include <drm/drm_panel.h>
> +
> +#include "mtk_panel_ext.h"
> +
> +struct _panel_rst_ctx {
> +	struct drm_panel *panel;
> +	panel_tch_rst rst_cb;
> +};
> +
> +static DEFINE_MUTEX(panel_ext_lock);
> +static LIST_HEAD(panel_ext_list);
> +static struct _panel_rst_ctx panel_rst_ctx;
> +
> +void mtk_panel_init(struct mtk_panel_ctx *ctx)
> +{
> +	INIT_LIST_HEAD(&ctx->list);
> +}
> +
> +void mtk_panel_add(struct mtk_panel_ctx *ctx)
> +{
> +	mutex_lock(&panel_ext_lock);
> +	list_add_tail(&ctx->list, &panel_ext_list);
> +	mutex_unlock(&panel_ext_lock);
> +}
> +
> +void mtk_panel_remove(struct mtk_panel_ctx *ctx)
> +{
> +	mutex_lock(&panel_ext_lock);
> +	list_del_init(&ctx->list);
> +	mutex_unlock(&panel_ext_lock);
> +}
> +
> +int mtk_panel_attach(struct mtk_panel_ctx *ctx, struct drm_panel *panel)
> +{
> +	if (ctx->panel)
> +		return -EBUSY;
> +
> +	ctx->panel = panel;
> +
> +	return 0;
> +}
> +
> +int mtk_panel_tch_handle_reg(struct drm_panel *panel)
> +{
> +	mutex_lock(&panel_ext_lock);
> +	if (panel_rst_ctx.panel) {
> +		mutex_unlock(&panel_ext_lock);
> +		return -EEXIST;
> +	}
> +	panel_rst_ctx.panel = panel;
> +	mutex_unlock(&panel_ext_lock);
> +
> +	return 0;
> +}
> +
> +void **mtk_panel_tch_handle_init(void)
> +{
> +	return (void **)&panel_rst_ctx.rst_cb;
> +}
> +
> +int mtk_panel_tch_rst(struct drm_panel *panel)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&panel_ext_lock);
> +	if (panel_rst_ctx.rst_cb && panel_rst_ctx.panel == panel)
> +		panel_rst_ctx.rst_cb();
> +	else
> +		ret = -EEXIST;
> +	mutex_unlock(&panel_ext_lock);
> +
> +	return ret;
> +}
> +
> +int mtk_panel_detach(struct mtk_panel_ctx *ctx)
> +{
> +	ctx->panel = NULL;
> +
> +	return 0;
> +}
> +
> +int mtk_panel_ext_create(struct device *dev,
> +			 struct mtk_panel_params *ext_params,
> +			 struct mtk_panel_funcs *ext_funcs,
> +			 struct drm_panel *panel)
> +{
> +	struct mtk_panel_ctx *ext_ctx;
> +	struct mtk_panel_ext *ext;
> +
> +	ext_ctx = devm_kzalloc(dev, sizeof(struct mtk_panel_ctx), GFP_KERNEL);
> +	if (!ext_ctx)
> +		return -ENOMEM;
> +
> +	ext = devm_kzalloc(dev, sizeof(struct mtk_panel_ext), GFP_KERNEL);
> +	if (!ext)
> +		return -ENOMEM;
> +
> +	mtk_panel_init(ext_ctx);
> +	ext->params = ext_params;
> +	ext->funcs = ext_funcs;
> +	ext_ctx->ext = ext;
> +
> +	mtk_panel_add(ext_ctx);
> +	mtk_panel_attach(ext_ctx, panel);
> +
> +	return 0;
> +}
> +
> +struct mtk_panel_ext *find_panel_ext(struct drm_panel *panel)
> +{
> +	struct mtk_panel_ctx *ctx;
> +
> +	mutex_lock(&panel_ext_lock);
> +
> +	list_for_each_entry(ctx, &panel_ext_list, list) {
> +		if (ctx->panel == panel) {
> +			mutex_unlock(&panel_ext_lock);
> +			return ctx->ext;
> +		}
> +	}
> +
> +	mutex_unlock(&panel_ext_lock);
> +	return NULL;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_panel_ext.h b/drivers/gpu/drm/mediatek/mtk_panel_ext.h
> new file mode 100644
> index 000000000000..f828d468817d
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_panel_ext.h
> @@ -0,0 +1,344 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_PANEL_EXT_H__
> +#define __MTK_PANEL_EXT_H__
> +
> +#include <drm/drm_panel.h>
> +
> +#define RT_MAX_NUM 10
> +#define ESD_CHECK_NUM 3
> +#define MAX_TX_CMD_NUM 20
> +#define MAX_RX_CMD_NUM 20
> +#define READ_DDIC_SLOT_NUM 4
> +#define MAX_DYN_CMD_NUM 20
> +
> +struct mtk_dsi;
> +struct cmdq_pkt;
> +struct mtk_panel_para_table {
> +	u8 count;
> +	u8 para_list[64];
> +};
> +
> +/*
> + *	DSI data type:
> + *	DSI_DCS_WRITE_SHORT_PACKET_NO_PARAM		0x05
> + *	DSI_DCS_WRITE_SHORT_PACKET_1_PARAM		0x15
> + *	DSI_DCS_WRITE_LONG_PACKET				0x39
> + *	DSI_DCS_READ_NO_PARAM					0x06
> +
> + *	DSI_GERNERIC_WRITE_SHORT_NO_PARAM		0x03
> + *	DSI_GERNERIC_WRITE_SHORT_1_PARAM		0x13
> + *	DSI_GERNERIC_WRITE_SHORT_1_PARAM		0x23
> + *	DSI_GERNERIC_WRITE_LONG_PACKET			0x29
> + *	DSI_GERNERIC_READ_NO_PARAM				0x04
> + *	DSI_GERNERIC_READ_1_PARAM				0x14
> + *	DSI_GERNERIC_READ_2_PARAM				0x24
> + */
> +
> +/**
> + * struct mtk_ddic_dsi_msg - MTK write/read DDIC RG cmd buffer
> + * @channel: virtual channel id
> + * @flags: flags controlling this message transmission
> + * @type: payload data type array
> + * @tx_len: length of @tx_buf
> + * @tx_buf: data array to be written
> + * @tx_cmd_num: tx cmd number
> + * @rx_len: length of @rx_buf
> + * @rx_buf: data array to be read, or NULL
> + * @rx_cmd_num: rx cmd number
> + */
> +struct mtk_ddic_dsi_msg {
> +	u8 channel;
> +	u16 flags;
> +
> +	u8 type[MAX_TX_CMD_NUM];
> +	size_t tx_len[MAX_TX_CMD_NUM];
> +	const void *tx_buf[MAX_TX_CMD_NUM];
> +	size_t tx_cmd_num;
> +
> +	size_t rx_len[MAX_RX_CMD_NUM];
> +	void *rx_buf[MAX_RX_CMD_NUM];
> +	size_t rx_cmd_num;
> +};
> +
> +struct DSI_RX_DATA_REG {
> +	unsigned char byte0;
> +	unsigned char byte1;
> +	unsigned char byte2;
> +	unsigned char byte3;
> +};
> +
> +typedef void (*dcs_write_gce) (struct mtk_dsi *dsi, struct cmdq_pkt *handle,
> +				const void *data, size_t len);
> +typedef void (*dcs_grp_write_gce) (struct mtk_dsi *dsi, struct cmdq_pkt *handle,
> +				struct mtk_panel_para_table *para_table,
> +				unsigned int para_size);
> +typedef int (*panel_tch_rst) (void);
> +
> +enum MTK_PANEL_OUTPUT_MODE {
> +	MTK_PANEL_SINGLE_PORT = 0x0,
> +	MTK_PANEL_DSC_SINGLE_PORT,
> +	MTK_PANEL_DUAL_PORT,
> +};
> +
> +struct esd_check_item {
> +	unsigned char cmd;
> +	unsigned char count;
> +	unsigned char para_list[RT_MAX_NUM];
> +	unsigned char mask_list[RT_MAX_NUM];
> +};
> +
> +enum MTK_PANEL_MODE_SWITCH_STAGE {
> +	BEFORE_DSI_POWERDOWN,
> +	AFTER_DSI_POWERON,
> +};
> +
> +enum MIPITX_PHY_PORT {
> +	MIPITX_PHY_PORT_0 = 0,
> +	MIPITX_PHY_PORT_1,
> +	MIPITX_PHY_PORT_NUM
> +};
> +
> +enum MIPITX_PHY_LANE_SWAP {
> +	MIPITX_PHY_LANE_0 = 0,
> +	MIPITX_PHY_LANE_1,
> +	MIPITX_PHY_LANE_2,
> +	MIPITX_PHY_LANE_3,
> +	MIPITX_PHY_LANE_CK,
> +	MIPITX_PHY_LANE_RX,
> +	MIPITX_PHY_LANE_NUM
> +};
> +
> +enum FPS_CHANGE_INDEX {
> +	DYNFPS_NOT_DEFINED = 0,
> +	DYNFPS_DSI_VFP = 1,
> +	DYNFPS_DSI_HFP = 2,
> +	DYNFPS_DSI_MIPI_CLK = 4,
> +};
> +
> +struct mtk_panel_dsc_params {
> +	unsigned int enable;
> +	unsigned int ver; /* [7:4] major [3:0] minor */
> +	unsigned int slice_mode;
> +	unsigned int rgb_swap;
> +	unsigned int dsc_cfg;
> +	unsigned int rct_on;
> +	unsigned int bit_per_channel;
> +	unsigned int dsc_line_buf_depth;
> +	unsigned int bp_enable;
> +	unsigned int bit_per_pixel;
> +	unsigned int pic_height; /* need to check */
> +	unsigned int pic_width;  /* need to check */
> +	unsigned int slice_height;
> +	unsigned int slice_width;
> +	unsigned int chunk_size;
> +	unsigned int xmit_delay;
> +	unsigned int dec_delay;
> +	unsigned int scale_value;
> +	unsigned int increment_interval;
> +	unsigned int decrement_interval;
> +	unsigned int line_bpg_offset;
> +	unsigned int nfl_bpg_offset;
> +	unsigned int slice_bpg_offset;
> +	unsigned int initial_offset;
> +	unsigned int final_offset;
> +	unsigned int flatness_minqp;
> +	unsigned int flatness_maxqp;
> +	unsigned int rc_model_size;
> +	unsigned int rc_edge_factor;
> +	unsigned int rc_quant_incr_limit0;
> +	unsigned int rc_quant_incr_limit1;
> +	unsigned int rc_tgt_offset_hi;
> +	unsigned int rc_tgt_offset_lo;
> +};
> +
> +struct mtk_dsi_phy_timcon {
> +	unsigned int hs_trail;
> +	unsigned int hs_prpr;
> +	unsigned int hs_zero;
> +	unsigned int lpx;
> +	unsigned int ta_get;
> +	unsigned int ta_sure;
> +	unsigned int ta_go;
> +	unsigned int da_hs_exit;
> +	unsigned int clk_trail;
> +	unsigned int cont_det;
> +	unsigned int da_hs_sync;
> +	unsigned int clk_zero;
> +	unsigned int clk_hs_prpr;
> +	unsigned int clk_hs_exit;
> +	unsigned int clk_hs_post;
> +};
> +
> +struct dynamic_mipi_params {
> +	unsigned int switch_en;
> +	unsigned int pll_clk;
> +	unsigned int data_rate;
> +
> +	unsigned int vsa;
> +	unsigned int vbp;
> +	unsigned int vfp;
> +	unsigned int vfp_lp_dyn;
> +
> +	unsigned int hsa;
> +	unsigned int hbp;
> +	unsigned int hfp;
> +};
> +
> +struct dfps_switch_cmd {
> +	unsigned int src_fps;
> +	unsigned int cmd_num;
> +	unsigned char para_list[64];
> +};
> +
> +struct dynamic_fps_params {
> +	unsigned int switch_en;
> +	unsigned int vact_timing_fps;
> +	struct dfps_switch_cmd dfps_cmd_table[MAX_DYN_CMD_NUM];
> +
> +	unsigned int lfr_enable;
> +	unsigned int lfr_minimum_fps;
> +};
> +
> +struct mtk_panel_params {
> +	unsigned int pll_clk;
> +	unsigned int data_rate;
> +	struct mtk_dsi_phy_timcon phy_timcon;
> +	unsigned int vfp_low_power;
> +	struct dynamic_mipi_params dyn;
> +	struct dynamic_fps_params dyn_fps;
> +	unsigned int cust_esd_check;
> +	unsigned int esd_check_enable;
> +	struct esd_check_item lcm_esd_check_table[ESD_CHECK_NUM];
> +	unsigned int ssc_disable;
> +	unsigned int ssc_range;
> +	int lcm_color_mode;
> +	unsigned int min_luminance;
> +	unsigned int average_luminance;
> +	unsigned int max_luminance;
> +	unsigned int round_corner_en;
> +	unsigned int corner_pattern_height;
> +	unsigned int corner_pattern_height_bot;
> +	unsigned int corner_pattern_tp_size;
> +	void *corner_pattern_lt_addr;
> +	unsigned int physical_width_um;
> +	unsigned int physical_height_um;
> +	unsigned int lane_swap_en;
> +	unsigned int is_cphy;
> +	enum MIPITX_PHY_LANE_SWAP
> +		lane_swap[MIPITX_PHY_PORT_NUM][MIPITX_PHY_LANE_NUM];
> +	struct mtk_panel_dsc_params dsc_params;
> +	unsigned int output_mode;
> +	unsigned int hbm_en_time;
> +	unsigned int hbm_dis_time;
> +	unsigned int lcm_index;
> +	unsigned int wait_sof_before_dec_vfp;
> +	unsigned int doze_delay;
> +};
> +
> +struct mtk_panel_ext {
> +	struct mtk_panel_funcs *funcs;
> +	struct mtk_panel_params *params;
> +};
> +
> +struct mtk_panel_ctx {
> +	struct drm_panel *panel;
> +	struct mtk_panel_ext *ext;
> +
> +	struct list_head list;
> +};
> +
> +struct mtk_panel_funcs {
> +	int (*set_backlight_cmdq)(void *dsi_drv, dcs_write_gce cb,
> +		 void *handle, unsigned int level);
> +	int (*set_aod_light_mode)(void *dsi_drv, dcs_write_gce cb,
> +		 void *handle, unsigned int mode);
> +	int (*set_backlight_grp_cmdq)(void *dsi_drv, dcs_grp_write_gce cb,
> +		 void *handle, unsigned int level);
> +	int (*reset)(struct drm_panel *panel, int on);
> +	int (*ata_check)(struct drm_panel *panel);
> +	int (*ext_param_set)(struct drm_panel *panel, unsigned int mode);
> +	int (*ext_param_get)(struct mtk_panel_params *ext_para,
> +		 unsigned int mode);
> +	int (*mode_switch)(struct drm_panel *panel, unsigned int cur_mode,
> +		 unsigned int dst_mode, enum MTK_PANEL_MODE_SWITCH_STAGE stage);
> +	int (*get_virtual_heigh)(void);
> +	int (*get_virtual_width)(void);
> +	/**
> +	 * @doze_enable_start:
> +	 *
> +	 * Call the @doze_enable_start before starting AOD mode.
> +	 * The LCM off may add here to avoid panel show unexpected
> +	 * content when switching to specific panel low power mode.
> +	 */
> +	int (*doze_enable_start)(struct drm_panel *panel,
> +		 void *dsi_drv, dcs_write_gce cb, void *handle);
> +
> +	/**
> +	 * @doze_enable:
> +	 *
> +	 * Call the @doze_enable starts AOD mode.
> +	 */
> +	int (*doze_enable)(struct drm_panel *panel,
> +		 void *dsi_drv, dcs_write_gce cb, void *handle);
> +
> +	/**
> +	 * @doze_disable:
> +	 *
> +	 * Call the @doze_disable before ending AOD mode.
> +	 */
> +	int (*doze_disable)(struct drm_panel *panel,
> +		 void *dsi_drv, dcs_write_gce cb, void *handle);
> +
> +	/**
> +	 * @doze_post_disp_on:
> +	 *
> +	 * In some situation, the LCM off may set in @doze_enable & @disable.
> +	 * After LCM switch to the new mode stable, system call
> +	 * @doze_post_disp_on to turn on panel.
> +	 */
> +	int (*doze_post_disp_on)(struct drm_panel *panel,
> +		 void *dsi_drv, dcs_write_gce cb, void *handle);
> +
> +	/**
> +	 * @doze_area:
> +	 *
> +	 * Send the panel area in command here.
> +	 */
> +	int (*doze_area)(struct drm_panel *panel,
> +		 void *dsi_drv, dcs_write_gce cb, void *handle);
> +
> +	/**
> +	 * @doze_get_mode_flags:
> +	 *
> +	 * If CV switch is needed for doze mode, fill the mode_flags in this
> +	 * function for both CMD and VDO mode.
> +	 */
> +	unsigned long (*doze_get_mode_flags)(struct drm_panel *panel,
> +				   int aod_en);
> +
> +	int (*hbm_set_cmdq)(struct drm_panel *panel, void *dsi_drv,
> +		 dcs_write_gce cb, void *handle, bool en);
> +	void (*hbm_get_state)(struct drm_panel *panel, bool *state);
> +	void (*hbm_get_wait_state)(struct drm_panel *panel, bool *wait);
> +	bool (*hbm_set_wait_state)(struct drm_panel *panel, bool wait);
> +};
> +
> +void mtk_panel_init(struct mtk_panel_ctx *ctx);
> +void mtk_panel_add(struct mtk_panel_ctx *ctx);
> +void mtk_panel_remove(struct mtk_panel_ctx *ctx);
> +int mtk_panel_attach(struct mtk_panel_ctx *ctx, struct drm_panel *panel);
> +int mtk_panel_detach(struct mtk_panel_ctx *ctx);
> +struct mtk_panel_ext *find_panel_ext(struct drm_panel *panel);
> +int mtk_panel_ext_create(struct device *dev,
> +			 struct mtk_panel_params *ext_params,
> +			 struct mtk_panel_funcs *ext_funcs,
> +			 struct drm_panel *panel);
> +int mtk_panel_tch_handle_reg(struct drm_panel *panel);
> +void **mtk_panel_tch_handle_init(void);
> +int mtk_panel_tch_rst(struct drm_panel *panel);

All mtk_panel_ext is useless, so remove.

> +
> +#endif
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h

Move mmsys part to another patch.

Regards,
CK

> index 47f3d0ea3c6c..73e9e8286d50 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -161,12 +161,30 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>  	}, {
>  		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
>  		MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL1_TO_DISP_RDMA1
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_IN, SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_IN, SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_IN, SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
>  	}, {
>  		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
>  		MT8195_VDO0_SEL_IN, SEL_IN_DSI0_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_OUT, SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
>  	}, {
>  		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
>  		MT8195_VDO0_SEL_OUT, DDP_COMPONENT_DSI0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_DSI0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
>  	}
>  };
>  
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 84ece5486902..d74eb3f97f1d 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -285,6 +285,7 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
>  	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
>  	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
> +	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
>  	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
>  	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
>  };
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 3135ce82a7f7..89a625743737 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -45,6 +45,9 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_MERGE3,
>  	DDP_COMPONENT_MERGE4,
>  	DDP_COMPONENT_MERGE5,
> +	DDP_COMPONENT_DSC0,
> +	DDP_COMPONENT_DSC1,
> +	DDP_COMPONENT_DSC1_VIRTUAL0,
>  	DDP_COMPONENT_ID_MAX,
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
