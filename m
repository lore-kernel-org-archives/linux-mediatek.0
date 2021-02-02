Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3D5C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 05:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F90E64ED4
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 05:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F90E64ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j3GRSwQkd723ZwsIJqRthLfgzLOEmUIxKcxf08scR/U=; b=WsfOLxfbgab0VHISsVph9+pj9
	v7KouZs4zbsNIfkkfEnoUxRq8BXOs+YKjQYEylDx4QNoRDE5cADqloAkPdTN5VWF3BI6DIW0qTZpS
	2g1RKDi0f+BvgLU0sMnCP11Dczj+APhM9Yjr2luu/E05/rM4SbkYTqsoADqSKzcHAHddHAU3BTDiN
	La2E9nC+374MxzOGZfbDGaGBQ6PxD/9ukTgdavqTWddnB6axbP0XAGn6UvKrIHQ+hWC+209jwQhdm
	NWw+XDvH1whk7E0IgWoxCq80gkNZrQkL4buJ8+IoNszVCKSlTSk4ldVPUfVV9OSsj0G/O4oOFwswT
	VxP6/IMkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6oUK-0006mF-OF; Tue, 02 Feb 2021 05:44:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6oUG-0006lj-Ls; Tue, 02 Feb 2021 05:44:30 +0000
X-UUID: ca3e1e93333946408ffc68029fc397af-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a/XbKNWHZrzGHmkllglJ5U3wFGb3n7mDtJTAzF3Eq3w=; 
 b=jxSFo4t/bREHFSuvYZmzUNojtjhMNHhpUtpzMw9fu/B/tjd/pkfWau7nRzL2ORbrmSp75LlkdKP0icBzFMgdyCjf/OKo9L55i3DpaXzc+uaBjJAajH5ZfbncHo2zonWz2e5GJxgl/WBvoLcQd3aWiLmih4jjhKm0p1v/yNTZazE=;
X-UUID: ca3e1e93333946408ffc68029fc397af-20210201
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 56387121; Mon, 01 Feb 2021 21:44:27 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 21:44:25 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 13:44:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 13:44:18 +0800
Message-ID: <1612244658.5495.2.camel@mtksdaap41>
Subject: Re: [PATCH v5 4/8] drm/mediatek: separate ccorr module
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Feb 2021 13:44:18 +0800
In-Reply-To: <20210201103727.376721-5-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
 <20210201103727.376721-5-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3B4EDF650D9376DA38E614DC23D5CDAC244606E571EB1A9E0DF85DFCA0AA314D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_004429_258989_84F0F84D 
X-CRM114-Status: GOOD (  29.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Mon, 2021-02-01 at 18:37 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> ccorr ctm matrix bits will be different in mt8192

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 216 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  95 +--------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  6 files changed, 236 insertions(+), 96 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 13a0eafabf9c0..f119bef6d6e66 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -mediatek-drm-y := mtk_disp_color.o \
> +mediatek-drm-y := mtk_disp_ccorr.o \
> +		  mtk_disp_color.o \
>  		  mtk_disp_gamma.o \
>  		  mtk_disp_ovl.o \
>  		  mtk_disp_postmask.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> new file mode 100644
> index 0000000000000..6ee2431e6b843
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_disp_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_CCORR_EN				0x0000
> +#define CCORR_EN					BIT(0)
> +#define DISP_CCORR_CFG				0x0020
> +#define CCORR_RELAY_MODE				BIT(0)
> +#define CCORR_ENGINE_EN					BIT(1)
> +#define CCORR_GAMMA_OFF					BIT(2)
> +#define CCORR_WGAMUT_SRC_CLIP				BIT(3)
> +#define DISP_CCORR_SIZE				0x0030
> +#define DISP_CCORR_COEF_0			0x0080
> +#define DISP_CCORR_COEF_1			0x0084
> +#define DISP_CCORR_COEF_2			0x0088
> +#define DISP_CCORR_COEF_3			0x008C
> +#define DISP_CCORR_COEF_4			0x0090
> +
> +struct mtk_disp_ccorr_data {
> +	u32 reserved;
> +};
> +
> +/**
> + * struct mtk_disp_ccorr - DISP_CCORR driver structure
> + * @ddp_comp - structure containing type enum and hardware resources
> + * @crtc - associated crtc to report irq events to
> + */
> +struct mtk_disp_ccorr {
> +	struct clk *clk;
> +	void __iomem *regs;
> +	struct cmdq_client_reg cmdq_reg;
> +	const struct mtk_disp_ccorr_data	*data;
> +};
> +
> +int mtk_ccorr_clk_enable(struct device *dev)
> +{
> +	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(ccorr->clk);
> +}
> +
> +void mtk_ccorr_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(ccorr->clk);
> +}
> +
> +void mtk_ccorr_config(struct device *dev, unsigned int w,
> +			     unsigned int h, unsigned int vrefresh,
> +			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
> +		      DISP_CCORR_SIZE);
> +	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
> +		      DISP_CCORR_CFG);
> +}
> +
> +void mtk_ccorr_start(struct device *dev)
> +{
> +	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
> +
> +	writel(CCORR_EN, ccorr->regs + DISP_CCORR_EN);
> +}
> +
> +void mtk_ccorr_stop(struct device *dev)
> +{
> +	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
> +
> +	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
> +}
> +
> +/* Converts a DRM S31.32 value to the HW S1.10 format. */
> +static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
> +{
> +	u16 r;
> +
> +	/* Sign bit. */
> +	r = in & BIT_ULL(63) ? BIT(11) : 0;
> +
> +	if ((in & GENMASK_ULL(62, 33)) > 0) {
> +		/* identity value 0x100000000 -> 0x400, */
> +		/* if bigger this, set it to max 0x7ff. */
> +		r |= GENMASK(10, 0);
> +	} else {
> +		/* take the 11 most important bits. */
> +		r |= (in >> 22) & GENMASK(10, 0);
> +	}
> +
> +	return r;
> +}
> +
> +void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> +{
> +	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
> +	struct drm_property_blob *blob = state->ctm;
> +	struct drm_color_ctm *ctm;
> +	const u64 *input;
> +	uint16_t coeffs[9] = { 0 };
> +	int i;
> +	struct cmdq_pkt *cmdq_pkt = NULL;
> +
> +	if (!blob)
> +		return;
> +
> +	ctm = (struct drm_color_ctm *)blob->data;
> +	input = ctm->matrix;
> +
> +	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> +		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> +
> +	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
> +		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> +	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
> +		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_1);
> +	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
> +		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_2);
> +	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
> +		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_3);
> +	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
> +		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_4);
> +}
> +
> +static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
> +			       void *data)
> +{
> +	return 0;
> +}
> +
> +static void mtk_disp_ccorr_unbind(struct device *dev, struct device *master,
> +				  void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_ccorr_component_ops = {
> +	.bind	= mtk_disp_ccorr_bind,
> +	.unbind	= mtk_disp_ccorr_unbind,
> +};
> +
> +static int mtk_disp_ccorr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_disp_ccorr *priv;
> +	struct resource *res;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "failed to get ccorr clk\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regs)) {
> +		dev_err(dev, "failed to ioremap ccorr\n");
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
> +	ret = component_add(dev, &mtk_disp_ccorr_component_ops);
> +	if (ret)
> +		dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int mtk_disp_ccorr_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &mtk_disp_ccorr_component_ops);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt8183-disp-ccorr"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
> +
> +struct platform_driver mtk_disp_ccorr_driver = {
> +	.probe		= mtk_disp_ccorr_probe,
> +	.remove		= mtk_disp_ccorr_remove,
> +	.driver		= {
> +		.name	= "mediatek-disp-ccorr",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = mtk_disp_ccorr_driver_dt_match,
> +	},
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 06d4d4e1c0d05..469d4e12b2003 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -9,6 +9,15 @@
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include "mtk_drm_plane.h"
>  
> +void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
> +int mtk_ccorr_clk_enable(struct device *dev);
> +void mtk_ccorr_clk_disable(struct device *dev);
> +void mtk_ccorr_config(struct device *dev, unsigned int w,
> +		      unsigned int h, unsigned int vrefresh,
> +		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_ccorr_start(struct device *dev);
> +void mtk_ccorr_stop(struct device *dev);
> +
>  void mtk_color_bypass_shadow(struct device *dev);
>  int mtk_color_clk_enable(struct device *dev);
>  void mtk_color_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index d884807809635..4a8015d247ec7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -35,20 +35,6 @@
>  #define DISP_AAL_EN				0x0000
>  #define DISP_AAL_SIZE				0x0030
>  
> -#define DISP_CCORR_EN				0x0000
> -#define CCORR_EN				BIT(0)
> -#define DISP_CCORR_CFG				0x0020
> -#define CCORR_RELAY_MODE			BIT(0)
> -#define CCORR_ENGINE_EN				BIT(1)
> -#define CCORR_GAMMA_OFF				BIT(2)
> -#define CCORR_WGAMUT_SRC_CLIP			BIT(3)
> -#define DISP_CCORR_SIZE				0x0030
> -#define DISP_CCORR_COEF_0			0x0080
> -#define DISP_CCORR_COEF_1			0x0084
> -#define DISP_CCORR_COEF_2			0x0088
> -#define DISP_CCORR_COEF_3			0x008C
> -#define DISP_CCORR_COEF_4			0x0090
> -
>  #define DISP_DITHER_EN				0x0000
>  #define DITHER_EN				BIT(0)
>  #define DISP_DITHER_CFG				0x0020
> @@ -234,82 +220,6 @@ static void mtk_aal_stop(struct device *dev)
>  	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
>  }
>  
> -static void mtk_ccorr_config(struct device *dev, unsigned int w,
> -			     unsigned int h, unsigned int vrefresh,
> -			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> -{
> -	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> -
> -	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_CCORR_SIZE);
> -	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &priv->cmdq_reg, priv->regs, DISP_CCORR_CFG);
> -}
> -
> -static void mtk_ccorr_start(struct device *dev)
> -{
> -	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> -
> -	writel(CCORR_EN, priv->regs + DISP_CCORR_EN);
> -}
> -
> -static void mtk_ccorr_stop(struct device *dev)
> -{
> -	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> -
> -	writel_relaxed(0x0, priv->regs + DISP_CCORR_EN);
> -}
> -
> -/* Converts a DRM S31.32 value to the HW S1.10 format. */
> -static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
> -{
> -	u16 r;
> -
> -	/* Sign bit. */
> -	r = in & BIT_ULL(63) ? BIT(11) : 0;
> -
> -	if ((in & GENMASK_ULL(62, 33)) > 0) {
> -		/* identity value 0x100000000 -> 0x400, */
> -		/* if bigger this, set it to max 0x7ff. */
> -		r |= GENMASK(10, 0);
> -	} else {
> -		/* take the 11 most important bits. */
> -		r |= (in >> 22) & GENMASK(10, 0);
> -	}
> -
> -	return r;
> -}
> -
> -static void mtk_ccorr_ctm_set(struct device *dev,
> -			      struct drm_crtc_state *state)
> -{
> -	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> -	struct drm_property_blob *blob = state->ctm;
> -	struct drm_color_ctm *ctm;
> -	const u64 *input;
> -	uint16_t coeffs[9] = { 0 };
> -	int i;
> -	struct cmdq_pkt *cmdq_pkt = NULL;
> -
> -	if (!blob)
> -		return;
> -
> -	ctm = (struct drm_color_ctm *)blob->data;
> -	input = ctm->matrix;
> -
> -	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> -		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> -
> -	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
> -		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_0);
> -	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
> -		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_1);
> -	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
> -		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_2);
> -	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
> -		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_3);
> -	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
> -		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_4);
> -}
> -
>  static void mtk_dither_config(struct device *dev, unsigned int w,
>  			      unsigned int h, unsigned int vrefresh,
>  			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -348,8 +258,8 @@ static const struct mtk_ddp_comp_funcs ddp_aal = {
>  };
>  
>  static const struct mtk_ddp_comp_funcs ddp_ccorr = {
> -	.clk_enable = mtk_ddp_clk_enable,
> -	.clk_disable = mtk_ddp_clk_disable,
> +	.clk_enable = mtk_ccorr_clk_enable,
> +	.clk_disable = mtk_ccorr_clk_disable,
>  	.config = mtk_ccorr_config,
>  	.start = mtk_ccorr_start,
>  	.stop = mtk_ccorr_stop,
> @@ -610,6 +520,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>  	}
>  
>  	if (type == MTK_DISP_BLS ||
> +	    type == MTK_DISP_CCORR ||
>  	    type == MTK_DISP_COLOR ||
>  	    type == MTK_DISP_GAMMA ||
>  	    type == MTK_DISP_POSTMASK ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index d99afc8528684..3da8996438dbc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -531,11 +531,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  		private->comp_node[comp_id] = of_node_get(node);
>  
>  		/*
> -		 * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
> -		 * separate component platform drivers and initialize their own
> +		 * Currently only the CCORR, COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI
> +		 * blocks have separate component platform drivers and initialize their own
>  		 * DDP component structure. The others are initialized here.
>  		 */
> -		if (comp_type == MTK_DISP_COLOR ||
> +		if (comp_type == MTK_DISP_CCORR ||
> +		    comp_type == MTK_DISP_COLOR ||
>  		    comp_type == MTK_DISP_GAMMA ||
>  		    comp_type == MTK_DISP_OVL ||
>  		    comp_type == MTK_DISP_OVL_2L ||
> @@ -635,6 +636,7 @@ static struct platform_driver mtk_drm_platform_driver = {
>  };
>  
>  static struct platform_driver * const mtk_drm_drivers[] = {
> +	&mtk_disp_ccorr_driver,
>  	&mtk_disp_color_driver,
>  	&mtk_disp_gamma_driver,
>  	&mtk_disp_ovl_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 7e7b28e32aa2f..b49062364c3d2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,6 +46,7 @@ struct mtk_drm_private {
>  	struct drm_atomic_state *suspend_state;
>  };
>  
> +extern struct platform_driver mtk_disp_ccorr_driver;
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
