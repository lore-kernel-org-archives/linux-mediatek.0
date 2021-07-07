Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B129BC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7197061C7B
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7197061C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGBpgVpUv5PYQfW6xn3ZCHB1T1B3oESd2+fwexL2nSs=; b=CDOPp35GkGMtEl
	wFZC/GgRWf/RD5g5aQNLa4qI9ylFuhNbddByrN3NkSbA+X0DEmm6CMJG5dNjjvzTMw/WJExYvjiQd
	GMUwn6qo2b6njclPezZe2tEaSk6USo2nbWCGs2A21r70habSHBvpnaELCmN/lzJNkAjwCKNAWnaXt
	kUeAlPRza/5/T8A1CRLNF0A78Ze0YAb8e+cOzF8QvK8lo4J6TCBaUhT2ittzMHMOfj8EMD95FkgDW
	zRSYskhUY+erZ0YJj/Kji0arrTDpQOIfnF0oi7nU71v9FCtMMtwYRcqlccr2WHEC+QN3v310kSQxM
	PdwD1RHoA9aMej7GnKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10dF-00Dayh-QY; Wed, 07 Jul 2021 06:02:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10dC-00Daxe-T7; Wed, 07 Jul 2021 06:02:00 +0000
X-UUID: d977cf7cbc3c48e3af24e185756e8a35-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9I2Kcz2rp+nZEtxKOkmrV9ItSAW0bJU1vivWvYCqi2Q=; 
 b=C9Ff9u5+Lo11mdSgvQ6HsqTSnoUJhZiuW33EjkRi8ptrxAq7fD8hYc9nA1SFKML3BDFGZfduXxKR3P9zZSvo8CWZHImsKd7/uW2lY1v80WNk1ILD3owv1A/Pn7+JIvSAMo8rit+d8iaAInT+pNxKoSGofeXbSZ1posqQ7wZrHNk=;
X-UUID: d977cf7cbc3c48e3af24e185756e8a35-20210706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 7075547; Tue, 06 Jul 2021 23:01:53 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:01:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:01:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:01:37 +0800
Message-ID: <1625637697.7824.22.camel@mtksdaap41>
Subject: Re: [PATCH v1 11/17] drm/mediatek: add COLOR support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 14:01:37 +0800
In-Reply-To: <20210707041249.29816-12-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-12-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_230158_986530_CA38E6B5 
X-CRM114-Status: GOOD (  16.13  )
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
> Add COLOR support for MT8195.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_color.c | 6 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> index 63f411ab393b..ce2cf9f504cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -149,6 +149,10 @@ static const struct mtk_disp_color_data mt8173_color_driver_data = {
>  	.color_offset = DISP_COLOR_START_MT8173,
>  };
>  
> +static const struct mtk_disp_color_data mt8195_color_driver_data = {
> +	.color_offset = DISP_COLOR_START_MT8173,
> +};

mt8195_color_driver_data is identical to mt8173_color_driver_data, so
use mt8173_color_driver_data and remove mt8195_color_driver_data.

> +
>  static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-color",
>  	  .data = &mt2701_color_driver_data},
> @@ -156,6 +160,8 @@ static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
>  	  .data = &mt8167_color_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-color",
>  	  .data = &mt8173_color_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-color",
> +	  .data = &mt8195_color_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 8b24623dcd91..28bf4a11efb0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -444,6 +444,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
> +	{ .compatible = "mediatek,mt8195-disp-color",
> +	  .data = (void *)MTK_DISP_COLOR },

Is mediatek,mt8195-disp-color identical to
mediatek,mt8173-disp-color in hardware function? If so, use the
compatible
as

compatible = "mediatek,mt8195-disp-color", "mediatek,mt8173-disp-color";

And driver just keep "mediatek,mt8173-disp-color" and remove
"mediatek,mt8195-disp-color".

If the hardware function has some different, just forget this.

Regards,
CK

>  	{ .compatible = "mediatek,mt8173-disp-aal",
>  	  .data = (void *)MTK_DISP_AAL},
>  	{ .compatible = "mediatek,mt8173-disp-gamma",

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
