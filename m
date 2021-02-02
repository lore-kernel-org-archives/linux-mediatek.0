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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52156C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 05:55:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E49D764EDA
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 05:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E49D764EDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N239uJe5qQFbl+8aSU1GmE+7taJ6uVLifvEnUErUvF0=; b=qgXpfCLUFbeTfBcJZe0obNzMz
	BsBeQfpuZ1Gb6FBOMvMtCUsC+JBEBLIiPQtsw5v/xx93yFoX7B1sY/loEji5XzlbAwbrl1SWIg7L5
	u3YOUJVryM5Nj7m18sguJXqDs14gIcTf6gdl3SM1htwXlpeQth0EwXBb5zEnjrcT2rIBOUzNJP5CO
	ldxMWM86QfZM0f5zuyeijKtGvDMV208rf26KoXxqKkrDnZvmYa6ons8fjnN4ufZE+VDsaOB62B/bZ
	O7zP+hS7rrN9kb9csPdeCdHxzVfwJjrqeS7K/WfA5h+/XZEIOOUxWVlmGBVP7r+cciwwUVkOe9jaE
	6KcG6aW/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6oeS-0008FP-4q; Tue, 02 Feb 2021 05:55:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6oeP-0008EF-Jx; Tue, 02 Feb 2021 05:54:59 +0000
X-UUID: b41172c38f494e258a12ecc1e5201f3e-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+z6sGY3stDidbHZO1wGRqes+rRr8z1LIfXjlelWJf6Y=; 
 b=ZhOCXOzZFhotfhcD4nDZ3HA/7Guij8RUK0ZVOQwO5r+PvZVz6P7FkxKQHmbH/EdmuwRmhsjhqyKEdbNFLW8K3xU1hcSKnRBeGt9g08rNFP+ld7UhrKVsdcC6ixVRtgLLEgTkhLh5MkXMunSVPbgZO6obr628IEVsvmUVetd+mMU=;
X-UUID: b41172c38f494e258a12ecc1e5201f3e-20210201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1954216426; Mon, 01 Feb 2021 21:54:53 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 21:47:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 13:47:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 13:47:09 +0800
Message-ID: <1612244829.5495.5.camel@mtksdaap41>
Subject: Re: [PATCH v5 6/8] drm/mediatek: add matrix_bits private data for
 ccorr
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Feb 2021 13:47:09 +0800
In-Reply-To: <20210201103727.376721-7-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
 <20210201103727.376721-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2B1541456084131A4B3C3B272388F1487FBE970D39AE745FD1A1D5124297493C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_005457_920829_6016DD71 
X-CRM114-Status: GOOD (  22.97  )
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
> Add matrix_bits and coeffs_precision to ccorr private data:
> - matrix bits of mt8183 is 10
> - matrix bits of mt8192 is 11
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 34 ++++++++++++++++-------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 6c86673a835c3..fb86f3a8b3a18 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -29,8 +29,10 @@
>  #define DISP_CCORR_COEF_3			0x008C
>  #define DISP_CCORR_COEF_4			0x0090
>  
> +#define CCORR_MATRIX_BITS			10
> +
>  struct mtk_disp_ccorr_data {
> -	u32 reserved;
> +	u32 matrix_bits;
>  };
>  
>  /**
> @@ -85,21 +87,22 @@ void mtk_ccorr_stop(struct device *dev)
>  	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
>  }
>  
> -/* Converts a DRM S31.32 value to the HW S1.10 format. */
> -static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
> +/* Converts a DRM S31.32 value to the HW S1.n format. */
> +static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
>  {
>  	u16 r;
>  
>  	/* Sign bit. */
> -	r = in & BIT_ULL(63) ? BIT(11) : 0;
> +	r = in & BIT_ULL(63) ? BIT(n + 1) : 0;
>  
>  	if ((in & GENMASK_ULL(62, 33)) > 0) {
> -		/* identity value 0x100000000 -> 0x400, */
> +		/* identity value 0x100000000 -> 0x400(mt8183), */
> +		/* identity value 0x100000000 -> 0x800(mt8192), */
>  		/* if bigger this, set it to max 0x7ff. */
> -		r |= GENMASK(10, 0);
> +		r |= GENMASK(n, 0);
>  	} else {
> -		/* take the 11 most important bits. */
> -		r |= (in >> 22) & GENMASK(10, 0);
> +		/* take the n+1 most important bits. */
> +		r |= (in >> (32 - n)) & GENMASK(n, 0);
>  	}
>  
>  	return r;
> @@ -114,6 +117,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	uint16_t coeffs[9] = { 0 };
>  	int i;
>  	struct cmdq_pkt *cmdq_pkt = NULL;
> +	u32 matrix_bits;
>  
>  	if (!blob)
>  		return;
> @@ -121,8 +125,13 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	ctm = (struct drm_color_ctm *)blob->data;
>  	input = ctm->matrix;
>  
> +	if (ccorr->data)

ccorr->data is always true, isn't it?

> +		matrix_bits = ccorr->data->matrix_bits;
> +	else
> +		matrix_bits = CCORR_MATRIX_BITS;
> +
>  	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> -		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> +		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
>  
>  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> @@ -199,8 +208,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> +	.matrix_bits = CCORR_MATRIX_BITS,

Drop CCORR_MATRIX_BITS and use 10 here.

> +};
> +
>  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
> -	{ .compatible = "mediatek,mt8183-disp-ccorr"},
> +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> +	  .data = &mt8183_ccorr_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
