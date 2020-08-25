Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA8CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:46:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324A12071E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:46:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q7Pqm7la";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ipv/eRED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 324A12071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EcwW46BXOzEGXXI0YaydBbK+rkFDFBbF2TRmrQyMe1o=; b=Q7Pqm7laolG+rITF4Em6BWAEu
	X8Mo+yxQHhe99VkhoW46E2ctQT4oGgwDOgLaoXHaxuwL3QGjNFB5LCRyI7Ek563j9WmHo7tAuwZII
	KEXtl7wWroeVA006zcSeNMCFi4TzJNjtDb0q5QISWb5juXPxAefU0a/JpHSgTY48ubsTYP5Xbgl8j
	DP4COUvQTpjGE0/lBrEOEH+GVKJvuF9QtkpzxyYiKq6fuSSCi2vXi5BTte4qFSm2UcaMHVJRyWfdN
	KXk/d3qs4h2lTKCg3LxosVjWGpLDcCUd9WhH2oXvIK2fvlSqv8yivUnvJVX2NifRWuzNbSo6gmOR9
	m+QfyhZnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kARmk-00088s-G3; Tue, 25 Aug 2020 05:46:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kARmg-00088L-HD
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 05:46:15 +0000
X-UUID: 3967f694800a4abaabf584a243831ebd-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=w7FMF/Hz9dirWuwiWTAlxp0wfCB8/J/Cgf8Fjs9pGX4=; 
 b=Ipv/eREDwRgRqlDhDLnOd1VHamB5sW0+jylfMhsuFVIHQy/43eX9kJy2Ew+NMi+IScuxGUptSmrTLqg5KMLc7X4e75W7Kq+KxzdDdnnQLGU7TE2xRnn5MD6AsFvWwBXp37fP/lqrwkLzvvZ0LwpQpRp6jErI8ug9+FaHQC7aGSg=;
X-UUID: 3967f694800a4abaabf584a243831ebd-20200824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1040085587; Mon, 24 Aug 2020 21:46:09 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 22:46:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:46:06 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:46:06 +0800
Message-ID: <1598334366.1969.1.camel@mtksdaap41>
Subject: Re: [PATCH v4 15/17] media: mtk-vcodec: venc: support
 ENUM_FRAMESIZES on OUTPUT formats
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 25 Aug 2020 13:46:06 +0800
In-Reply-To: <20200821103608.2310097-16-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-16-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_014614_800718_9CF9753E 
X-CRM114-Status: GOOD (  20.68  )
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
> v4l2-compliance requires ENUM_FRAMESIZES to support OUTPUT formats.
> Reuse mtk_venc_find_format() to make sure both queues are considered
> when serving an ENUM_FRAMESIZES.
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 71 +++++++++----------
>  1 file changed, 33 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index f8d4fbe927f9..1b79185cf922 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -123,28 +123,44 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
>  	return 0;
>  }
>  
> +static const struct mtk_video_fmt *mtk_venc_find_format(u32 fourcc,
> +	const struct mtk_vcodec_enc_pdata *pdata)
> +{
> +	const struct mtk_video_fmt *fmt;
> +	unsigned int k;
> +
> +	for (k = 0; k < pdata->num_capture_formats; k++) {
> +		fmt = &pdata->capture_formats[k];
> +		if (fmt->fourcc == fourcc)
> +			return fmt;
> +	}
> +
> +	for (k = 0; k < pdata->num_output_formats; k++) {
> +		fmt = &pdata->output_formats[k];
> +		if (fmt->fourcc == fourcc)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +
>  static int vidioc_enum_framesizes(struct file *file, void *fh,
>  				  struct v4l2_frmsizeenum *fsize)
>  {
> -	const struct mtk_vcodec_enc_pdata *pdata =
> -		fh_to_ctx(fh)->dev->venc_pdata;
> -	int i = 0;
> +	const struct mtk_video_fmt *fmt;
>  
>  	if (fsize->index != 0)
>  		return -EINVAL;
>  
> -	for (i = 0; i < pdata->num_capture_formats; ++i) {
> -		const struct mtk_video_fmt *fmt = &pdata->capture_formats[i];
> +	fmt = mtk_venc_find_format(fsize->pixel_format,
> +				   fh_to_ctx(fh)->dev->venc_pdata);
> +	if (!fmt)
> +		return -EINVAL;
>  
> -		if (fsize->pixel_format != fmt->fourcc)
> -			continue;
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise = mtk_venc_framesizes;
>  
> -		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -		fsize->stepwise = mtk_venc_framesizes;
> -		return 0;
> -	}
> -
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
> @@ -222,27 +238,6 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
>  	return &ctx->q_data[MTK_Q_DATA_DST];
>  }
>  
> -static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f,
> -	const struct mtk_vcodec_enc_pdata *pdata)
> -{
> -	const struct mtk_video_fmt *fmt;
> -	unsigned int k;
> -
> -	for (k = 0; k < pdata->num_capture_formats; k++) {
> -		fmt = &pdata->capture_formats[k];
> -		if (fmt->fourcc == f->fmt.pix.pixelformat)
> -			return fmt;
> -	}
> -
> -	for (k = 0; k < pdata->num_output_formats; k++) {
> -		fmt = &pdata->output_formats[k];
> -		if (fmt->fourcc == f->fmt.pix.pixelformat)
> -			return fmt;
> -	}
> -
> -	return NULL;
> -}
> -
>  /* V4L2 specification suggests the driver corrects the format struct if any of
>   * the dimensions is unsupported
>   */
> @@ -403,7 +398,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> -	fmt = mtk_venc_find_format(f, pdata);
> +	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
>  	if (!fmt) {
>  		fmt = &ctx->dev->venc_pdata->capture_formats[0];
>  		f->fmt.pix.pixelformat = fmt->fourcc;
> @@ -467,7 +462,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> -	fmt = mtk_venc_find_format(f, pdata);
> +	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
>  	if (!fmt) {
>  		fmt = &ctx->dev->venc_pdata->output_formats[0];
>  		f->fmt.pix.pixelformat = fmt->fourcc;
> @@ -550,7 +545,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>  	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>  
> -	fmt = mtk_venc_find_format(f, pdata);
> +	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
>  	if (!fmt) {
>  		fmt = &ctx->dev->venc_pdata->capture_formats[0];
>  		f->fmt.pix.pixelformat = fmt->fourcc;
> @@ -570,7 +565,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>  	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>  
> -	fmt = mtk_venc_find_format(f, pdata);
> +	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
>  	if (!fmt) {
>  		fmt = &ctx->dev->venc_pdata->output_formats[0];
>  		f->fmt.pix.pixelformat = fmt->fourcc;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
