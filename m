Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4AAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 06:01:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC0164DE0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 06:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC0164DE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVurdRy212Xml0FdRBnEdww3lngFCmmWVKyTgMiQmMY=; b=Q9zRAwD9JBqfjz5HzZc/hbX1z
	fcdk/rmy0gVOSMUsMBUuum/4hISeZvN8rgGanSiaHROl9CpO7VB0I4eYd2bsz/6Gwy5XhzRyVKreA
	t5TdDwjLj6VyG9CbnxsWTV6Zq/sVrl0SJkswny1YvD4n7cWzCQu0MrbNdbzmG9p5wLhpjSU2C/omb
	Q2wR/g26rbjkJBVG9cZ8YJ9P2t03wsYlmTAy7D43jImt7PPgI3fRNMSS0Nlm+bvVcE2Abacek5YGD
	j3ce7XXpXXtSOhVxg+rQozhNEwuv3+4WlVHSsyboyT/9rhH/d+9rH4QFVZVUDRFITDmTFo8VVJkfA
	ggzdDnVRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l50NE-0000S9-1W; Thu, 28 Jan 2021 06:01:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l50NA-0000RM-Rf; Thu, 28 Jan 2021 06:01:42 +0000
X-UUID: eccc3efa0ba145b4b93915f4e376fd17-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7QDImCt5+7DsXFqewuf7SP758fb7EaUZc14iGwpvOW4=; 
 b=MPG6B6AmYAq6XixUwzjw/cE2w/HImb3AY7X5dZfzsGyE5G3OaOGoT9jq17NRjefSoht0NkU3FGvsfdoaaOVO7i/B8C7wQzQronQu7ZzPdsR92lMSW+ZehxhUIJcwNB9kXOtSf0qkgpB3ciyAmJhyuPWew9mBwE22i8Ngq1xFwp8=;
X-UUID: eccc3efa0ba145b4b93915f4e376fd17-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1256341900; Wed, 27 Jan 2021 22:01:37 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 22:01:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 14:01:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 14:01:09 +0800
Message-ID: <1611813669.28312.5.camel@mtksdaap41>
Subject: Re: [PATCH v10 7/9] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 14:01:09 +0800
In-Reply-To: <20210127045422.2418917-8-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9AC874471A0D8550FCAE5680D29E0B57033CD9A5CB477339768C90370D8C92B12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_010141_407328_02995EB4 
X-CRM114-Status: GOOD (  21.43  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> for 5 or 6 bpc panel, we need enable dither function
> to improve the display quality
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 37 ++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 8173f709272be..ee54505412dcd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -53,7 +53,9 @@
>  #define DITHER_EN				BIT(0)
>  #define DISP_DITHER_CFG				0x0020
>  #define DITHER_RELAY_MODE			BIT(0)
> +#define DITHER_ENGINE_EN			BIT(1)
>  #define DISP_DITHER_SIZE			0x0030
> +#define DITHER_REG(idx)				(0x100 + (idx) * 4)
>  
>  #define LUT_10BIT_MASK				0x03ff
>  
> @@ -313,8 +315,41 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> +	bool enable = true;
> +
> +	const u32 dither_setting[] = {
> +		0x00000000, /* 5 */
> +		0x00003002, /* 6 */
> +		0x00000000, /* 7 */
> +		0x00000000, /* 8 */
> +		0x00000000, /* 9 */
> +		0x00000000, /* 10 */
> +		0x00000000, /* 11 */
> +		0x00000011, /* 12 */
> +		0x00000000, /* 13 */
> +		0x00000000, /* 14 */

Could you explain what is this?

> +	};
> +
> +	if (bpc == 6) {
> +		mtk_ddp_write(cmdq_pkt, 0x40400001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> +		mtk_ddp_write(cmdq_pkt, 0x40404040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> +	} else if (bpc == 5) {
> +		mtk_ddp_write(cmdq_pkt, 0x50500001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> +		mtk_ddp_write(cmdq_pkt, 0x50504040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));

This looks very similar to the code in mtk_dither_set(), could you
symbolize this magic number like mtk_dither_set()?

Regards,
CK

> +	} else {
> +		enable = false;
> +	}
> +
> +	if (enable) {
> +		u32 idx;
> +
> +		for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> +			mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> +				      DITHER_REG(idx + 5));
> +	}
> +
>  	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> -	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
>  }
>  
>  static void mtk_dither_start(struct device *dev)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
