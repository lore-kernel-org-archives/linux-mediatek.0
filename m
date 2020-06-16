Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0733C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:14:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9CD20679
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tp/CpzsZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GHYeggty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D9CD20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7muhP4ZcRteWoh0+5rHKploSIdR3idvxoK3QaLfAzY=; b=Tp/CpzsZ2IPxmG
	J1jruSDNcLKS6EZtqy+FN+v3EQS5oCJuWHN2FztcGAXkcGD9e4poWwSuOwQyOUtWrsidjsMV4Zdwo
	okLHI1XH8yZIQKAimBEO0aHqo6AEa133+8OrNcSdipLNsLT6trGHYPWxNG64nb5anN5tNHkjXJBw9
	unyNXLV+zjDnOjBuU81B15sqDxALQwLU/aMR77Va5QHhzHnuamDO1tbR7K3lQwHQaU2ekIKHREdUN
	6fLV0vqlcQcte0uvG2qdJ8i+vfMD5eC/fqWth9YlLkLzc1mMyFdeL1PPaBxIKqNra+1WW0jPXD7BG
	i9S1gEZLClX81QbBfw7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl7ft-0001l6-GW; Tue, 16 Jun 2020 09:14:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl7fq-0001kE-Lv
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 09:14:32 +0000
X-UUID: b73aa473fea94ae2b40ca184834ead59-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yy2c2I/DACjQjjI52CFqNSnT2s8hYTmD36xB1qTyu+A=; 
 b=GHYeggtyXIR2QoaGVc24OjQnn9kSMMdeN58zRXwj0t67gbmQmIWKlozfie9DU457RM5IYLkPRmAS56lgTtLOme7NHn/bf9R1MzhTtBHBU1rpxUUCJOLB70ZvKmc6oZ4m5JUE+e6Lw77muDoiXuiNyYXm/fd0qxd2BaDeCMihIxY=;
X-UUID: b73aa473fea94ae2b40ca184834ead59-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1348411669; Tue, 16 Jun 2020 01:14:25 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 02:06:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 17:06:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 17:06:24 +0800
Message-ID: <1592298384.25202.1.camel@mtksdaap41>
Subject: Re: [PATCH 05/10] media: mtk-vcodec: venc: specify bitrate range
 per-chip
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 16 Jun 2020 17:06:24 +0800
In-Reply-To: <20200520082723.96136-6-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-6-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A1F73E059354B0B70941DD73A5B39900D0F9FA4C1406B6C5335F99D847CA9412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_021430_721799_60004941 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> Different chips have different supported bitrate ranges. Move the min
> and max supported bitrates to the platform data.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 4 ++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c     | 3 ++-
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index e7b155e7432e..b8f913de8d80 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -311,12 +311,16 @@ enum mtk_chip {
>   *
>   * @uses_ext: whether the encoder uses the extended firmware messaging format
>   * @has_lt_irq: whether the encoder uses the LT irq
> + * @min_birate: minimum supported encoding bitrate
> + * @max_bitrate: maximum supported encoding bitrate
>   */
>  struct mtk_vcodec_enc_pdata {
>  	enum mtk_chip chip;
>  
>  	bool uses_ext;
>  	bool has_lt_irq;
> +	unsigned long min_bitrate;
> +	unsigned long max_bitrate;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index d469ff6464b2..50ba9da59153 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -1232,7 +1232,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>  	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
>  
>  	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
> -			1, 4000000, 1, 4000000);
> +			  ctx->dev->venc_pdata->min_bitrate,
> +			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
>  	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_B_FRAMES,
>  			0, 2, 1, 0);
>  	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index c1365209263e..221fa0303075 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -380,6 +380,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
>  	.chip = MTK_MT8173,
>  	.has_lt_irq = true,
> +	.min_bitrate = 1,
> +	.max_bitrate = 4000000,
>  };
>  
>  static const struct of_device_id mtk_vcodec_enc_match[] = {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
