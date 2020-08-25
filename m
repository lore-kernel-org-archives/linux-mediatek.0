Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B90C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18DAC20737
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LRBDtxKE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QGMsRXwQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18DAC20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HXekB6yB7dmpqGql3vk524zhIe0zYLrdwAjV79D1MJs=; b=LRBDtxKEb3PPJG7bCCxZ/c7j1
	+IpuGPb/TCCpIkPAf5IGersTDjZ7/ZTVYNvTz3I0xi0yEBphR/dapzQ5VagN0LEHYsdH67+7eGcUm
	cDz0uUnbf9M/m4ERCz3Jzk+ILiFDt6XRvR3/tTmRkxtk+2JMoE0VM3NkPmU6BfJPtdAgdIeaaCieB
	wIy0I+hfMKhUVbtYIG12fzPmp4lrQOCaYp6SUyRfnqCuLM2LPvgGgz1KvFvUEKO++6BYyygNlyDW1
	Ot0BAjOMAMQSEmVcFxjwnt84wd0t61g9r1OhCroDvVvrqyduGduNDAo9QGX6sOo9RiLsEfyD+SkL9
	9oIq1nDnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kARjf-0007w6-Iq; Tue, 25 Aug 2020 05:43:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kARjc-0007vD-Bt
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 05:43:05 +0000
X-UUID: 6742e360b0e14d9abcb7a7ef41b07400-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VRegGJ4jV43Hdy8Pytxo0IKxzzf+VLe4lBHE+Uv90dM=; 
 b=QGMsRXwQDoDyxVBxnLBOEcenSo1NIALTu31QjQ1q90xhlg9Is20iGFFXukXIkR1hcTC/sZ9e5NAPfGl5z9vlj+SQHXg4Kw2UxDlyhe/GLxhFqH9i+PiMY8sNpo9/2TECNjf3Dd6ZA16fIs+1D6R+qlWonTrGB08KRksucXrz5bc=;
X-UUID: 6742e360b0e14d9abcb7a7ef41b07400-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1500538200; Mon, 24 Aug 2020 21:42:51 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 22:39:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:39:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:39:05 +0800
Message-ID: <1598333944.1969.0.camel@mtksdaap41>
Subject: Re: [PATCH v4 14/17] media: mtk-vcodec: venc: use platform data for
 ENUM_FRAMESIZES
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 25 Aug 2020 13:39:04 +0800
In-Reply-To: <20200821103608.2310097-15-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-15-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_014304_554358_9243D1BA 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Maoguang
 Meng <maoguang.meng@mediatek.com>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-21 at 19:36 +0900, Alexandre Courbot wrote:
> vidioc_enum_framesizes() assumes that all encoders support H.264 and VP8,
> which is not necessarily true and requires to duplicate information about
> the supported codecs which is already stored in the platform data.
> 
> Fix this by referring to the platform data to find out whether a given
> format is supported. Since the supported sizes are all the same
> regardless of the format, we can then return a copy of a static value if
> the format is supported.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 24 ++++++++-----------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 1a981d842c19..f8d4fbe927f9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -26,17 +26,9 @@
>  
>  static void mtk_venc_worker(struct work_struct *work);
>  
> -static const struct mtk_codec_framesizes mtk_venc_framesizes[] = {
> -	{
> -		.fourcc	= V4L2_PIX_FMT_H264,
> -		.stepwise = { MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
> -			      MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16 },
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_VP8,
> -		.stepwise = { MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
> -			      MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16 },
> -	},
> +static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
> +	MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
> +	MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16,
>  };
>  
>  #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_framesizes)
> @@ -134,17 +126,21 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
>  static int vidioc_enum_framesizes(struct file *file, void *fh,
>  				  struct v4l2_frmsizeenum *fsize)
>  {
> +	const struct mtk_vcodec_enc_pdata *pdata =
> +		fh_to_ctx(fh)->dev->venc_pdata;
>  	int i = 0;
>  
>  	if (fsize->index != 0)
>  		return -EINVAL;
>  
> -	for (i = 0; i < NUM_SUPPORTED_FRAMESIZE; ++i) {
> -		if (fsize->pixel_format != mtk_venc_framesizes[i].fourcc)
> +	for (i = 0; i < pdata->num_capture_formats; ++i) {
> +		const struct mtk_video_fmt *fmt = &pdata->capture_formats[i];
> +
> +		if (fsize->pixel_format != fmt->fourcc)
>  			continue;
>  
>  		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -		fsize->stepwise = mtk_venc_framesizes[i].stepwise;
> +		fsize->stepwise = mtk_venc_framesizes;
>  		return 0;
>  	}
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
