Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E61C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D7261C89
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D7261C89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAE1m13gpzEnJPSHobCYRCgeTshLzsewSvw2OgKVyeo=; b=LQWfaOzz4Vkbhn
	6gEKe6qtCINx0ZRmZYRtboDprRQ3zI+YiyHqvNdE8mdljUNyamV0kgWNj+r5xYHPSFei7pBmUEKo6
	7sM4kn5OZfcM0KDIFap9gYCQbTpCRRYJsnHLxtcQ2W75E03UfqM8c2djUS8D56p16xuQuTW52FrW1
	HDnG/jTLSDNNvKV1+cVygjoQxvmuXumt4BXnsemAw+R6OR9ScyORvC2x+dckEa8xZxiuKeEN5INCm
	VO3QqQsjGqb+S2TnJd7JiW1ZZlYLXd4iWbgh8gdk5POOcVsrDprqcfYW8wACzXGFtd2Nrx+PS9dx9
	Z3tXT0rT1q9EE4+NXvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10px-00DdYE-7W; Wed, 07 Jul 2021 06:15:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10pu-00DdWf-Q3; Wed, 07 Jul 2021 06:15:08 +0000
X-UUID: aebe4d6fd7f34b98a61fc9593f7c54a6-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9Tz59GwyOGAbEHKY4Po+SmUmMAMQUTdCTMlrABqkPwI=; 
 b=IQBoX+Md9RkLJp9Tg7EXyX5SqDqPZ79zJ15BzOfKKwlJpM+VNZpTa2dsUBBH3Ud918+cnsoNQQMo/I3em24FN1las0TI82NuZDrlKj3sPwj9Mj80Tkg97xaW8JLLH2vqzq0yGDvW/KkLbmYg+kgFAR7S3LpMFdwnCZ/Y/FADxyA=;
X-UUID: aebe4d6fd7f34b98a61fc9593f7c54a6-20210706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 76697396; Tue, 06 Jul 2021 23:15:03 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:15:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:14:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:14:59 +0800
Message-ID: <1625638499.7824.25.camel@mtksdaap41>
Subject: Re: [PATCH v1 13/17] drm/mediatek: Add AAL support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 14:14:59 +0800
In-Reply-To: <20210707041249.29816-14-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-14-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_231506_898235_4A817E69 
X-CRM114-Status: GOOD (  19.42  )
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
> 1. Add AAL support for MT8195.
> 2. Add AAL_OUTPUT_SIZE configuration.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 8 +++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..f154f7c0cd11 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -34,6 +34,7 @@
>  
>  #define DISP_AAL_EN				0x0000
>  #define DISP_AAL_SIZE				0x0030
> +#define DISP_AAL_OUTPUT_SIZE			0x04d8
>  
>  #define DISP_DITHER_EN				0x0000
>  #define DITHER_EN				BIT(0)
> @@ -196,7 +197,12 @@ static void mtk_aal_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> -	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h,
> +				&priv->cmdq_reg, priv->regs,
> +				DISP_AAL_SIZE);

Why do you change this?

> +	mtk_ddp_write(cmdq_pkt, w << 16 | h,
> +				&priv->cmdq_reg, priv->regs,
> +				DISP_AAL_OUTPUT_SIZE);

This seems not related to mt8195, so move this modification to another
patch.

>  }
>  
>  static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 058b50d0e64b..459bb1e53f2e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -450,6 +450,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-aal",
>  	  .data = (void *)MTK_DISP_AAL},
> +	{ .compatible = "mediatek,mt8195-disp-aal",
> +	  .data = (void *)MTK_DISP_AAL},

The same question for OVL, COLOR, CCORR.

Regards,
CK

>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = (void *)MTK_DISP_GAMMA, },
>  	{ .compatible = "mediatek,mt8183-disp-gamma",

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
