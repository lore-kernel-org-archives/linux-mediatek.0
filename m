Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBA6C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:50:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0758764E12
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0758764E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0YqVqmvWD8O3SKpjNp/SdX4B16zVT2eGni9jHeQ8JF4=; b=Uxr4sk5EuK3/R+ebMHrVkA6Lu
	cA/9omnFVBFDGql4RIvh2mpJiiLxk0NrITwcBd8YHOpJhWgpKstjbcz/OCSYuga5Wgp50DOO7L6yM
	oGhG4yagsRnQGeb3dTeOpcXtjFkL9xoBnzMfARAp8xbjdXti6OWZfro1lP3ji6coeWq3mJfGVgpbm
	MD0VkJpuQYG1JnFKTGahcHem1a+mbmWe5apL/Mof9vlDK1bFUEpCUr5LeVzoQC42lnLPp0iefZA67
	7b+9D6cxKcusDCMMi2f2x4/FL7ok1zTQKnvtY7gblyaDFjQoN7l9pDWYkzLvuXbpQeCPdNWE86aKE
	HtGIXsfjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PTR-0007wc-WC; Fri, 29 Jan 2021 08:49:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PTL-0007tN-U1; Fri, 29 Jan 2021 08:49:48 +0000
X-UUID: 563f580406ee4eb69ceacb6d29e8e2d1-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8LYed4Zwn/R7cvhFdVGZBG69vf/8TYNuvrg1e6/NGJE=; 
 b=H0w+TWDOLlnmcXQSWA/mRNVYrDNSlHttXLmT1oql1kljcW1+p+nn1GE355XvEyhaqdOZ4KxhGQ4znCpQQkD/wRVXWTI5G12T8exLLyY8Uge8h35Tuuy/KO8TL8jvkgKze9l+L3UpyMQ+y0U7XXvxg087y4a5p5jzwOLYQULxfiE=;
X-UUID: 563f580406ee4eb69ceacb6d29e8e2d1-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 259093050; Fri, 29 Jan 2021 00:49:41 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 00:40:46 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 16:40:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:40:42 +0800
Message-ID: <1611909641.31184.11.camel@mtksdaap41>
Subject: Re: [PATCH v4 6/8] drm/mediatek: add matrix bits private data for
 ccorr
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 16:40:41 +0800
In-Reply-To: <20210129073436.2429834-7-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 07838E2DF8FE698C3E994C67D0C67BE09B3C9FAC28E56910A68D922798B518752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_034945_015621_4DC701F6 
X-CRM114-Status: GOOD (  19.53  )
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

On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> matrix bits of mt8183 is 12
> matrix bits of mt8192 is 13
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 0c68090eb1e92..1c7163a12f3b1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -31,8 +31,10 @@
>  #define DISP_CCORR_COEF_3			0x008C
>  #define DISP_CCORR_COEF_4			0x0090
>  
> +#define CCORR_MATRIX_BITS			12
> +
>  struct mtk_disp_ccorr_data {
> -	u32 reserved;
> +	u32 matrix_bits;
>  };
>  
>  /**
> @@ -116,6 +118,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	uint16_t coeffs[9] = { 0 };
>  	int i;
>  	struct cmdq_pkt *cmdq_pkt = NULL;
> +	u32 matrix_bits;
>  
>  	if (!blob)
>  		return;
> @@ -123,8 +126,16 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	ctm = (struct drm_color_ctm *)blob->data;
>  	input = ctm->matrix;
>  
> -	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> +	if (ccorr->data)
> +		matrix_bits = ccorr->data->matrix_bits;
> +	else
> +		matrix_bits = CCORR_MATRIX_BITS;
> +
> +	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
>  		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> +		if (matrix_bits > CCORR_MATRIX_BITS)
> +			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);

I think format of MT8192 ccorr coeffs is s1.11, after
mtk_ctm_s31_32_to_s1_10(), you lose one bit precision. So modify
mtk_ctm_s31_32_to_s1_10() to get maximum precision.

Regards,
CK

> +	}
>  
>  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> @@ -205,8 +216,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> +	.matrix_bits = CCORR_MATRIX_BITS,
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
