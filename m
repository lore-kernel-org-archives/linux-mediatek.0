Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E39C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 08:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7095F215F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 08:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuGE5vip";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ns15sqo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7095F215F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2z7mrmuopjvfNnWQnOFIFEdFx6RA5DJOp6Np3ZxGcbE=; b=nuGE5vipPt1kRq
	5gOLDAIJQcR/jzPXv52I/tuEaMmsjJV3IoAn4SDMMmZX8kqwa+hknSCt0NKC/v3uO4Wu03txsAiu4
	Q59I4gIS74Shgab2LBlot90++UlSVZ/o4OZgVRUKBJ+SE1cSjnDxL9nk3im7QCVyjYOMZ7ACZPcsu
	skHse9l/VHR5HodYIrmmezd11kOyMoxK/AEQ6+o3ZFHQXQGM46ifCiI2JtV3Kq51sWLVUtj2Z34v1
	DrreWHkjPkVeK+EO6T0Idf3uB9TtwuyBpdXgtRGiOhc7a3NZiJoQnc1DT5hlIz0bVlJVz+cI9LUJt
	ld2jgs4EJY/NMxVwvjOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibh0D-0006go-Hr; Mon, 02 Dec 2019 08:24:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibh05-0006Z4-Sf; Mon, 02 Dec 2019 08:24:11 +0000
X-UUID: 43dfc8f564624017b7abf689ab734e77-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o5kMsHwU3u3vpUlfVv1mkkdd3HG17OkXBDB3NzDn5no=; 
 b=ns15sqo+I5cItdxWReSR31BC+Lw9bcL6slzIl2jBjq8wsauJhm/OraD9iHMgtDjTn9QOPG0epUz6HTKFbchZgZ/1jwZLYwrPrGkaz4uNsm5iNwoGJAOeD4Mp56Yp1fzsjDrayqFoELFr9wWza/0/+dtdlzGaabFoTL1XZKXrbew=;
X-UUID: 43dfc8f564624017b7abf689ab734e77-20191202
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 484138036; Mon, 02 Dec 2019 00:24:05 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 00:24:49 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 16:23:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Dec 2019 16:23:15 +0800
Message-ID: <1575275040.31913.1.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: add ctm property support
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Mon, 2 Dec 2019 16:24:00 +0800
In-Reply-To: <1575271892-25117-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1575271892-25117-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6AA511DC88AEAB659A9882B246DC1AC3ACBFE494F598993035A24C878F9B258A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_002409_937147_2FA4B10C 
X-CRM114-Status: GOOD (  19.33  )
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
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi, Yongqiang:

On Mon, 2019-12-02 at 15:31 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> add ctm property support
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  7 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 59 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++
>  3 files changed, 72 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 4fb346c..e7e3aa9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -666,10 +666,13 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  	int i;
>  
>  	if (crtc->state->color_mgmt_changed)
> -		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i],
>  					  crtc->state,
>  					  mtk_crtc_state->cmdq_handle);
> +			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);

This patch is based on another patch which support cmdq. So I think this
patch would also support cmdq.

> +		}
> +
>  #ifdef CONFIG_MTK_CMDQ
>  	if (mtk_crtc->cmdq_client) {
>  		drm_atomic_state_get(old_atomic_state);
> @@ -891,7 +894,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	if (ret < 0)
>  		return ret;
>  	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, true, MTK_LUT_SIZE);

Only MT8183 has CCORR, I think you should enable ctm by SoC. (gamma has
the same problem)

>  	priv->num_pipes++;
>  #ifdef CONFIG_MTK_CMDQ
>  	mtk_crtc->cmdq_client =
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 9cc12af..4bbbac7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -38,7 +38,15 @@
>  #define CCORR_EN				BIT(0)
>  #define DISP_CCORR_CFG				0x0020
>  #define CCORR_RELAY_MODE			BIT(0)
> +#define CCORR_ENGINE_EN				BIT(1)
> +#define CCORR_GAMMA_OFF				BIT(2)
> +#define CCORR_WGAMUT_SRC_CLIP			BIT(3)
>  #define DISP_CCORR_SIZE				0x0030
> +#define DISP_CCORR_COEF_0			0x0080
> +#define DISP_CCORR_COEF_1			0x0084
> +#define DISP_CCORR_COEF_2			0x0088
> +#define DISP_CCORR_COEF_3			0x008C
> +#define DISP_CCORR_COEF_4			0x0090
>  
>  #define DISP_DITHER_EN				0x0000
>  #define DITHER_EN				BIT(0)
> @@ -187,7 +195,7 @@ static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
>  			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>  {
>  	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_CCORR_SIZE);
> -	mtk_ddp_write(cmdq_pkt, CCORR_RELAY_MODE, comp, DISP_CCORR_CFG);
> +	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
>  }
>  
>  static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
> @@ -200,6 +208,54 @@ static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
>  	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
>  }
>  
> +/* Converts a DRM S31.32 value to the HW S0.11 format. */
> +static u16 mtk_ctm_s31_32_to_s0_11(u64 in)
> +{
> +	u16 r;
> +
> +	/* Sign bit. */
> +	r = in & BIT_ULL(63) ? BIT(11) : 0;
> +
> +	if ((in & GENMASK_ULL(62, 33)) > 0) {

if ((in & GENMASK_ULL(62, 32)) > 0) {

> +		/* We have zero integer bits so we can only saturate here. */
> +		r |= GENMASK(10, 0);
> +	} else {
> +		/* Otherwise take the 9 most important fractional bits. */
> +		r |= (in >> 22) & GENMASK(10, 0);

r |= (in >> 21) & GENMASK(10, 0);

Regards,
CK

> +	}
> +
> +	return r;
> +}
> +
> +static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
> +			      struct drm_crtc_state *state)
> +{
> +	struct drm_property_blob *blob = state->ctm;
> +	struct drm_color_ctm *ctm;
> +	const u64 *input;
> +	uint16_t coeffs[9] = { 0 };
> +	int i;
> +
> +	if (!blob)
> +		return;
> +
> +	ctm = (struct drm_color_ctm *)blob->data;
> +	input = ctm->matrix;
> +
> +	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> +		coeffs[i] = mtk_ctm_s31_32_to_s0_11(input[i]);
> +
> +	writel_relaxed(coeffs[0] << 16 | coeffs[1],
> +		       comp->regs + DISP_CCORR_COEF_0);
> +	writel_relaxed(coeffs[2] << 16 | coeffs[3],
> +		       comp->regs + DISP_CCORR_COEF_1);
> +	writel_relaxed(coeffs[4] << 16 | coeffs[5],
> +		       comp->regs + DISP_CCORR_COEF_2);
> +	writel_relaxed(coeffs[6] << 16 | coeffs[7],
> +		       comp->regs + DISP_CCORR_COEF_3);
> +	writel_relaxed(coeffs[8] << 16, comp->regs + DISP_CCORR_COEF_4);
> +}
> +
>  static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
>  			      unsigned int h, unsigned int vrefresh,
>  			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -269,6 +325,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
>  	.config = mtk_ccorr_config,
>  	.start = mtk_ccorr_start,
>  	.stop = mtk_ccorr_stop,
> +	.ctm_set = mtk_ccorr_ctm_set,
>  };
>  
>  static const struct mtk_ddp_comp_funcs ddp_dither = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 5b0a3d4..5100c3d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -95,6 +95,8 @@ struct mtk_ddp_comp_funcs {
>  			  struct cmdq_pkt *cmdq_pkt);
>  	void (*bgclr_in_on)(struct mtk_ddp_comp *comp);
>  	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
> +	void (*ctm_set)(struct mtk_ddp_comp *comp,
> +			struct drm_crtc_state *state);
>  };
>  
>  struct mtk_ddp_comp {
> @@ -213,6 +215,13 @@ static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
>  		comp->funcs->bgclr_in_off(comp);
>  }
>  
> +static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
> +				   struct drm_crtc_state *state)
> +{
> +	if (comp->funcs && comp->funcs->ctm_set)
> +		comp->funcs->ctm_set(comp, state);
> +}
> +
>  int mtk_ddp_comp_get_id(struct device_node *node,
>  			enum mtk_ddp_comp_type comp_type);
>  int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
