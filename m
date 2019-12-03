Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37656C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 05:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D2420684
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 05:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzP3ps8V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LnApxK2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D2420684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHIbi6x/UzprrIty+YfONXoxNpJpewfFlTv9ZDCWlik=; b=gzP3ps8VUQQwes
	g9PtFj7uI6mRDXU3eLQxuXRtygSkE1FFm0SfSkvO2iY+pGk2ut8/L5wDEHIDwQYkFVaeS9z0x2fsJ
	cILrvxkxiM6RgcB5Rbw3fB8YEX9R559QdhWCDypIxChIBM6N6e9spTRU8Pi9d1j0vc5QPpzYWTlZv
	4wPfO+3CCRQ92qM/HYWQJZHl66Rn76l7ISv0DtmIKsTvN0KOo9nRSelG8cKSCSXUQnp1b0O+1ADyO
	QQNgmZBbASeqClLGyyxFX3dQgJsJzC5sJFj3unYsbOmU5oluGj7BpgsqyIPMNsjUFvrQs7ZmCtyAI
	h+aA7gyUaO6iB84oR+rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic0cA-0003uu-RT; Tue, 03 Dec 2019 05:20:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic0bl-0003Pb-PE; Tue, 03 Dec 2019 05:20:23 +0000
X-UUID: fb7964764351465bbb1b4289d50576fd-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NgsysKXbS5nlDOD3N4g0hN4iMinhHgqdb3oRzZLJHmA=; 
 b=LnApxK2ZNDZdG0RU7npCaFrBisXrUbPhSb6Npf/hRTDIDjcuhjthLEhRMZarOBeUMCmRNz28qiE20zM9p0JRn4UHRKZeFNZZ4Cqe3YMHX3RbwauAotmcuSJh1eI3OH5jGURQ9noK7RqhpUZVHtJV2f3pYoO1cUcwgfT6H4sqp/4=;
X-UUID: fb7964764351465bbb1b4289d50576fd-20191202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1558830226; Mon, 02 Dec 2019 21:20:15 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 21:20:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 13:19:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 13:19:52 +0800
Message-ID: <1575350410.31483.5.camel@mtksdaap41>
Subject: Re: [PATCH v2] drm/mediatek: add ctm property support
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Tue, 3 Dec 2019 13:20:10 +0800
In-Reply-To: <1575277423-31182-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1575277423-31182-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 91EF239877E5336093CDE7FE8F20BECC4E7AD49A185B12DDB0DBD8016543D4DC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_212021_865336_3E450BF4 
X-CRM114-Status: GOOD (  20.88  )
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

On Mon, 2019-12-02 at 17:03 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> add ctm property support
> 
> Change-Id: I8111da7b309b1809c6302e7748dd9fd06dc97bde

Remove this Change-Id.

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 ++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 61 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 11 ++++++
>  3 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 4fb346c..12dc684 100644
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

Sorry, I'm not noticed that the code here would not write register in
vblank period. If ctm could be set out of vblank period, place the code
here and do not need to support cmdq. If ctm should be set inside vblank
period, move the code to mtk_crtc_ddp_config() and support cmdq
interface.

> +		}
> +
>  #ifdef CONFIG_MTK_CMDQ
>  	if (mtk_crtc->cmdq_client) {
>  		drm_atomic_state_get(old_atomic_state);
> @@ -819,6 +822,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	int pipe = priv->num_pipes;
>  	int ret;
>  	int i;
> +	bool has_ctm = false;
> +	uint gamma_lut_size = 0;
>  
>  	if (!path)
>  		return 0;
> @@ -870,6 +875,12 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		}
>  
>  		mtk_crtc->ddp_comp[i] = comp;
> +
> +		if (comp_id == DDP_COMPONENT_CCORR)
> +			has_ctm = true;
> +
> +		if (comp_id == DDP_COMPONENT_GAMMA)
> +			gamma_lut_size = MTK_LUT_SIZE;
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> @@ -891,7 +902,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	if (ret < 0)
>  		return ret;
>  	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
>  	priv->num_pipes++;
>  #ifdef CONFIG_MTK_CMDQ
>  	mtk_crtc->cmdq_client =
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 9cc12af..2fd52ba 100644
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
> @@ -200,6 +208,56 @@ static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
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
> +			      struct drm_crtc_state *state
> +			      struct cmdq_pkt *cmdq_pkt)
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
> +	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
> +		      comp, DISP_CCORR_COEF_0);
> +	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
> +		      comp, DISP_CCORR_COEF_1);
> +	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
> +		      comp, DISP_CCORR_COEF_2);
> +	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
> +		      comp, DISP_CCORR_COEF_3);
> +	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
> +		      comp, DISP_CCORR_COEF_4);
> +}
> +
>  static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
>  			      unsigned int h, unsigned int vrefresh,
>  			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -269,6 +327,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
>  	.config = mtk_ccorr_config,
>  	.start = mtk_ccorr_start,
>  	.stop = mtk_ccorr_stop,
> +	.ctm_set = mtk_ccorr_ctm_set,
>  };
>  
>  static const struct mtk_ddp_comp_funcs ddp_dither = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 5b0a3d4..4e3e5aa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -95,6 +95,9 @@ struct mtk_ddp_comp_funcs {
>  			  struct cmdq_pkt *cmdq_pkt);
>  	void (*bgclr_in_on)(struct mtk_ddp_comp *comp);
>  	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
> +	void (*ctm_set)(struct mtk_ddp_comp *comp,
> +			struct drm_crtc_state *state
> +			struct cmdq_pkt *cmdq_pkt);
>  };
>  
>  struct mtk_ddp_comp {
> @@ -213,6 +216,14 @@ static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
>  		comp->funcs->bgclr_in_off(comp);
>  }
>  
> +static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
> +				   struct drm_crtc_state *state
> +				   struct cmdq_pkt *cmdq_pkt)
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
