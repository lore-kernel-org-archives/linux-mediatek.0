Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC2ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 04:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LvWbVKkO4DNyJDo3/FwofaOgHFXLKFB9f/u7HZepzo=; b=jqaT54g9L5VcJg33Zd/6fNH3bZ
	lGI/UANmTKR96Ag1tXhZ1FgBCDQ5bAuAFV6keKwClkVLzRRjy/hodcF0bVZ+wPtPOENYvsRWJ174o
	z6z5SxzWbz30syJZo1tDMqsP9NNf9Q0xL8KxLe+zrpimrIhI2gk7VGSAX73Z0rqF0UgY3tRn7Osk4
	4YTnqB04SAsWpR4vG7vQTiOkJk8w93Be4oI0E8mjmMqziyXAyKqUhrhOm98FpQdM86l+wsoBkNuDf
	P4V5LG1wt90+d02g/tHJzZmhJ0JDUazYJ1lA0Z3Gl9u079GZM3GlG8V4o3wqL8L7thVl5oCXa0RBb
	VmQyjvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXatN-006o2h-RG; Mon, 12 Sep 2022 04:17:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXatB-006o0L-Fx; Mon, 12 Sep 2022 04:17:43 +0000
X-UUID: c3dad75fb9e945fa9d84408cdcb3fe01-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1LvWbVKkO4DNyJDo3/FwofaOgHFXLKFB9f/u7HZepzo=;
	b=oRZhf9cqpqDJbSBYATYgeOEnwKg3f70JZb2n51KbcvNabsfTW8rh5ccVYfFHTTD2AeLOxb6lvrIuq9OyBIMPP5wco4KRK0HfG+aYfE+aMRMprXqHpyDmAjNybk243PlNsfhfrmeJJE9pOXUawGjjFKjn5hRMRitKcpc7s/vJel0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0a1ed6b4-a9ca-4910-a2f5-e644ba2453f6,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:6e340cf6-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c3dad75fb9e945fa9d84408cdcb3fe01-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 823532175; Sun, 11 Sep 2022 21:14:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 11:14:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 11:14:13 +0800
Message-ID: <e1945785da7c56bbb7fe94926c39fc6c3593cdb0.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 4/9] drm/mediatek: Add gamma support different
 lut_size for other SoC
From: CK Hu <ck.hu@mediatek.com>
To: Jason-JH.Lin <jason-jh.lin@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Sep 2022 11:14:13 +0800
In-Reply-To: <20220912013006.27541-5-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_211741_622293_B85912FD 
X-CRM114-Status: GOOD (  27.30  )
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

Hi, Jason:

On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> 1. Add mtk_drm_gamma_get_lut_size() and remove MTK_LUT_SIZE macro.
> 2. Add lut_size to gamma driver data for different SoC.

Separate these two modification to two patches. In the patch of
mtk_drm_gamma_get_lut_size(), consider the aal driver.

Regards,
CK

> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 22
> +++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
>  5 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index a83e5fbc8724..6a05bb56e693 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -51,6 +51,7 @@ void mtk_gamma_clk_disable(struct device *dev);
>  void mtk_gamma_config(struct device *dev, unsigned int w,
>  		      unsigned int h, unsigned int vrefresh,
>  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +unsigned int mtk_gamma_get_lut_size(struct device *dev);
>  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> *state);
>  void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> struct drm_crtc_state *state);
>  void mtk_gamma_start(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index f54a6a618348..0a1022032b71 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -24,10 +24,12 @@
>  #define DISP_GAMMA_LUT				0x0700
>  
>  #define LUT_10BIT_MASK				0x03ff
> +#define LUT_SIZE_DEFAULT			512 /* for setting
> gamma lut from AAL */
>  
>  struct mtk_disp_gamma_data {
>  	bool has_dither;
>  	bool lut_diff;
> +	u16 lut_size;
>  };
>  
>  /*
> @@ -54,18 +56,32 @@ void mtk_gamma_clk_disable(struct device *dev)
>  	clk_disable_unprepare(gamma->clk);
>  }
>  
> +unsigned int mtk_gamma_get_lut_size(struct device *dev)
> +{
> +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> +	unsigned int lut_size = LUT_SIZE_DEFAULT;
> +
> +	if (gamma && gamma->data)
> +		lut_size = gamma->data->lut_size;
> +
> +	return lut_size;
> +}
> +
>  void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> struct drm_crtc_state *state)
>  {
>  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>  	bool lut_diff = false;
> +	u16 lut_size = LUT_SIZE_DEFAULT;
>  	unsigned int i, reg;
>  	struct drm_color_lut *lut;
>  	void __iomem *lut_base;
>  	u32 word;
>  	u32 diff[3] = {0};
>  
> -	if (gamma && gamma->data)
> +	if (gamma && gamma->data) {
>  		lut_diff = gamma->data->lut_diff;
> +		lut_size = gamma->data->lut_size;
> +	}
>  
>  	if (state->gamma_lut) {
>  		reg = readl(regs + DISP_GAMMA_CFG);
> @@ -73,7 +89,7 @@ void mtk_gamma_set_common(struct device *dev, void
> __iomem *regs, struct drm_crt
>  		writel(reg, regs + DISP_GAMMA_CFG);
>  		lut_base = regs + DISP_GAMMA_LUT;
>  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> -		for (i = 0; i < MTK_LUT_SIZE; i++) {
> +		for (i = 0; i < lut_size; i++) {
>  
>  			if (!lut_diff || (i % 2 == 0)) {
>  				word = (((lut[i].red >> 6) &
> LUT_10BIT_MASK) << 20) +
> @@ -192,10 +208,12 @@ static int mtk_disp_gamma_remove(struct
> platform_device *pdev)
>  
>  static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
>  	.has_dither = true,
> +	.lut_size = 512,
>  };
>  
>  static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
>  	.lut_diff = true,
> +	.lut_size = 512,
>  };
>  
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] =
> {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 112615817dcb..fc845490fbb4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -929,8 +929,8 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  		mtk_crtc->ddp_comp[i] = comp;
>  
>  		if (comp->funcs) {
> -			if (comp->funcs->gamma_set)
> -				gamma_lut_size = MTK_LUT_SIZE;
> +			if (comp->funcs->gamma_set && comp->funcs-
> >gamma_get_lut_size)
> +				gamma_lut_size =
> mtk_ddp_gamma_get_lut_size(comp);
>  
>  			if (comp->funcs->ctm_set)
>  				has_ctm = true;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index cb9a36c48d4f..1799853ef89a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -10,7 +10,6 @@
>  #include "mtk_drm_ddp_comp.h"
>  #include "mtk_drm_plane.h"
>  
> -#define MTK_LUT_SIZE	512
>  #define MTK_MAX_BPC	10
>  #define MTK_MIN_BPC	3
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 2d0052c23dcb..ab589ea11ba7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -65,6 +65,7 @@ struct mtk_ddp_comp_funcs {
>  	void (*layer_config)(struct device *dev, unsigned int idx,
>  			     struct mtk_plane_state *state,
>  			     struct cmdq_pkt *cmdq_pkt);
> +	unsigned int (*gamma_get_lut_size)(struct device *dev);
>  	void (*gamma_set)(struct device *dev,
>  			  struct drm_crtc_state *state);
>  	void (*bgclr_in_on)(struct device *dev);
> @@ -177,6 +178,14 @@ static inline void
> mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
>  		comp->funcs->layer_config(comp->dev, idx, state,
> cmdq_pkt);
>  }
>  
> +static inline unsigned int mtk_ddp_gamma_get_lut_size(struct
> mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->gamma_get_lut_size)
> +		return comp->funcs->gamma_get_lut_size(comp->dev);
> +
> +	return 0;
> +}
> +
>  static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
>  				     struct drm_crtc_state *state)
>  {


