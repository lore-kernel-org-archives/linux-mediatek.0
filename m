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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4ACC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 09:12:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF80D64E34
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 09:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF80D64E34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SEyGxnopMluLgB4KlL4O2TYEslLpL/MROF5PZ8idmII=; b=AI7cjHByXVDnOpnpUtS1zZeZV
	axzSOMtL0C+eaNUcFiVkNp1oYE4mMmfdZznnwTbPrWAQGDHB5oxMC+ImOKIoVchK2EK3TIuCQ3uTc
	+6KsBjDrOPqTaocM6ZyjNZUzUcSapRmv2jbWqrIVWatfOvhA3doCmRnsDmpdUq6iu4C0gWZvi6Q6w
	NFFsM32AmwUNqRJpYCMP54JCPJN8kPEbQGydtkjCzzPctgXUGw7ory/H2wKAQzmeeBlyuTJxpN4FY
	QNGeXzGMG7gmrfGl8PnEOmbA9MAqJdCw3S4xKQX3kENdlzNVAGI3R5/mz9e+E6PSGCmPyJvYqtApN
	UoByyuEpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6rjj-0007p4-G2; Tue, 02 Feb 2021 09:12:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6rjg-0007oW-Px; Tue, 02 Feb 2021 09:12:37 +0000
X-UUID: e2f9601489904d7293d3bc0fda943f32-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wRjR23K75RHA6M/pTcEC8v+EkXEFCsftGJj/hWO0sw0=; 
 b=c3qf5KzoUI+f+Qv2Amr9tJS46m5OKSfal4qmCwiQXBuqDCNjKURAhSEauZTn2fMV1bOBO0nzE8SOi1dukh50g7vLG+esO9HZvdJqQkiOZHojKHPE50pK5SjLQQ/+MW1svwUSnEWROCsNGGHhihxXLU8d9Qu/C6guRyDw972kfXc=;
X-UUID: e2f9601489904d7293d3bc0fda943f32-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 829163404; Tue, 02 Feb 2021 01:12:32 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 01:11:16 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 17:11:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 17:11:08 +0800
Message-ID: <1612257068.30872.1.camel@mtksdaap41>
Subject: Re: [PATCH v6 6/8] drm/mediatek: add matrix_bits private data for
 ccorr
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Feb 2021 17:11:08 +0800
In-Reply-To: <20210202081237.774442-7-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1E5761D9C1C19A1F7E42032CD881AABB413824A99811F9EA1FCE8AA218FF0E592000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_041236_998517_A3D381E7 
X-CRM114-Status: GOOD (  22.66  )
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

On Tue, 2021-02-02 at 16:12 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add matrix_bits and coeffs_precision to ccorr private data:
> - matrix bits of mt8183 is 10
> - matrix bits of mt8192 is 11
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 27 ++++++++++++++---------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 6c86673a835c3..141cb36b9c07b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -30,7 +30,7 @@
>  #define DISP_CCORR_COEF_4			0x0090
>  
>  struct mtk_disp_ccorr_data {
> -	u32 reserved;
> +	u32 matrix_bits;
>  };
>  
>  /**
> @@ -85,21 +85,22 @@ void mtk_ccorr_stop(struct device *dev)
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
> @@ -114,6 +115,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	uint16_t coeffs[9] = { 0 };
>  	int i;
>  	struct cmdq_pkt *cmdq_pkt = NULL;
> +	u32 matrix_bits = ccorr->data->matrix_bits;
>  
>  	if (!blob)
>  		return;
> @@ -122,7 +124,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	input = ctm->matrix;
>  
>  	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> -		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> +		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
>  
>  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> @@ -199,8 +201,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> +	.matrix_bits = 10,
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
