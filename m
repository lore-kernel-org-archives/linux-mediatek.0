Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D12C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA992078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFduow0z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rJanF4yE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA992078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzcHOdIbg1jByfW4CpiUN7gTpaKcGOKmf1hyCv+wqbQ=; b=cFduow0zPLrrv5
	pZ0xzlnB2DuiXojY9WgElGOzMvS+mogysHV1v1X8qQkZjZ1NOuWroPqjQyqzinX/eKIavQUB8ixb3
	o2QEwDE7RH7rIF2FY4/FANABC+JJ0dvmFKcvWMpsoxzcd14StgKD4MHmNtT+wOkJ81DPr0fPwGh3q
	Ztq9Zeq/F+nblad0UZIR7D+b7y/lIryKsnnUD2a/4+EAh9uTuJ9lAndRBm3Jrz1QFkDWC8vwi61Ir
	+EvaCr3p21DL5rdcTG6vfVoJ+LQijZbWnPgE3IMyZet9Z/AbPN9eRSHdvQeGKao1yquQ7kWmTyN6K
	Zvi7I9OMSev+UEuPXuEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmBCb-0004cX-M5; Fri, 19 Jun 2020 07:12:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmBCZ-0004c3-AJ
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 07:12:40 +0000
X-UUID: fdd3b6b0d57f4485a0118f53712f52fb-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sU2yodu52kHAngph3lY1etIFjGoRAmnTFcEZex/XlNw=; 
 b=rJanF4yEjLeVa/C488ipGMWhq74NWKx7ZOgfTwXvvx4C/wS7EMo/kvDpaHrW3P278ZM018nCxuf69QdYJnWh7+2kWMgmz5MzNIHazlu4IjE6GqeAbh3uBmzX55zZOwyvL9t+f1JusihGNIR6aYO1hNdxX+To07zuZBcHlFrgpLQ=;
X-UUID: fdd3b6b0d57f4485a0118f53712f52fb-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 17747593; Thu, 18 Jun 2020 23:12:50 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 00:12:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:12:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 15:12:35 +0800
Message-ID: <1592550754.23952.4.camel@mtksdaap41>
Subject: Re: [PATCH 08/10] media: mtk-vcodec: add support for MT8183 encoder
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 19 Jun 2020 15:12:34 +0800
In-Reply-To: <20200520082723.96136-9-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-9-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_001239_363736_3D03EF91 
X-CRM114-Status: GOOD (  13.14  )
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
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Now that all the supporting blocks are present, enable encoder for
> MT8183.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>


> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 22 +++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 59b4b750666b..a271611750ad 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
>  
>  enum mtk_chip {
>  	MTK_MT8173,
> +	MTK_MT8183,
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index c8a4b85a81c4..b8fe408dd6c7 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -62,6 +62,14 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
>  	},
>  };
>  
> +static const struct mtk_video_fmt mtk_video_formats_capture_mt8183[] =  {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264,
> +		.type = MTK_FMT_ENC,
> +		.num_planes = 1,
> +	},
> +};
> +
>  /* Wake up context wait_queue */
>  static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
>  {
> @@ -424,8 +432,22 @@ static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
>  	.max_bitrate = 4000000,
>  };
>  
> +static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
> +	.chip = MTK_MT8183,
> +	.has_lt_irq = false,
> +	.uses_ext = true,
> +	.capture_formats = mtk_video_formats_capture_mt8183,
> +	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
> +	/* MT8183 supports the same output formats as MT8173 */
> +	.output_formats = mtk_video_formats_output_mt8173,
> +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> +	.min_bitrate = 64,
> +	.max_bitrate = 40000000,
> +};
> +
>  static const struct of_device_id mtk_vcodec_enc_match[] = {
>  	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
> +	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
