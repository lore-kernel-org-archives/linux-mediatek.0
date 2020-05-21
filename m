Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A97C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7BC20826
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tergI/KU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l1/Sb2B5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7BC20826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBForzn4Mqg1fUWurRIUyVZ/JuNAy1gzAa/ajAg+qeQ=; b=tergI/KUgMoJXQ
	DAZMUucrFjruep2WBk+0OBCgEyLFotO1RGMJ++oEgGotj8Ha01+7/9L4xq/9yAMgTt4oeI3B8+HF7
	Wx/5ArgDNWsWgo34i2m1Jad/Z9wpXYOAC6DRnGaKmREWQ30Ubzv/g6IREi4z6haDfO6MLaGUkf60b
	VoANASg1RwgDyl6qPheAzOS/vPLu93tpAltEWcDwTenE7TXJh0WrBQI+xjQLyMziz7DO85gzDZz2G
	cMmwr+5O5ecHDXfMpFbpD3pXeifFn2JKWvUkTRN+SvwlM/sUiVBJutIYYeY/ZtoPIck6HaOKkmRIx
	AyS1ATQmYGCVAv0AgssA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbnKJ-0000Rl-On; Thu, 21 May 2020 15:41:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbnKG-0000Py-Tn
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 15:41:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id w7so7045464wre.13
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t7kKQGIL/+XUIy8BYKyhP6eLPzYXGhlw9lo6TwqgMyA=;
 b=l1/Sb2B5nvypUAkBTKIFKxmseFrBYGzJgZAiEZH08EkPJG07KLikxvLrN1lrztGzEl
 2CcYvw/8C9cwD+l5f/vdnpyqsTdvzpWbpFgNjLsYwRy6Kt0M/9oy/rmy9Dmeu5Pse+3O
 IqPyAr9YObZJhacol6137kvWDN0EtPUfiVwFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t7kKQGIL/+XUIy8BYKyhP6eLPzYXGhlw9lo6TwqgMyA=;
 b=CzvkqYNpJu9ig6ZnLgBC01n0uPhI//dWend3Rcco2IweBbjTbUuDcXGxq5tf8erTeW
 3zOCK6i+rt60bisUPtYd8zia7VLmma/zmyPBs8MvY6GzHfW566eqtB0XBeGtA0Tc73/2
 kRyiS65KsPotJDAHde4eaiQcmxkg1ua+3/qAGiAnk4M79OERdzOdBKZZU/nisrW1BHYL
 kDzhBHad41mRaq6/hLFsohqo6NaZOY1+922bsVoZz8ylveWznnqS5B3qFkKDtNetc+bH
 FKjh7gIpWUYPmPDIjUkNm5yFWrUaxbdTiOkim3HnfBomOof4M1Om3ntsNA/6dtRBFH4P
 CGHw==
X-Gm-Message-State: AOAM533c/RwHcy6es469CI7WSP+03JkV01uLBxcp5Xs5QcXBcBmOlCYm
 70LPMaGOwewihheMJMK2pJRtXg==
X-Google-Smtp-Source: ABdhPJy6oE1juN6diFyNCGUfm0SoL9QOIbTs8hFQ0ct0TZDPOLo0YnuQnJY1G0k6GJgxa5xJTervjw==
X-Received: by 2002:adf:e682:: with SMTP id r2mr8576889wrm.378.1590075699420; 
 Thu, 21 May 2020 08:41:39 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id x1sm6508480wrt.86.2020.05.21.08.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 08:41:38 -0700 (PDT)
Date: Thu, 21 May 2020 15:41:37 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 07/14] media: platform: Use kernel native functions
 for improving code quality
Message-ID: <20200521154137.GG209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-8-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-8-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_084140_986292_5B63F79D 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:26PM +0800, Xia Jiang wrote:

Thank you for the patch. Please see my comments inline.

nit: I'd remove "for improving code quality" from the subject, as it's
obvious that we don't intend to make the code quality worse. ;)
On the contrary, I'd make it more specific, e.g.

media: mtk-jpeg: Use generic rounding helpers

WDYT?

> Use clamp() to replace mtk_jpeg_bound_align_image() and round() to
> replace mtk_jpeg_align().
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 41 +++++--------------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c |  8 ++--
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h |  5 ---
>  4 files changed, 19 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 2fa3711fdc9b..4e64046a6854 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -157,25 +157,6 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
>  	return NULL;
>  }
>  
> -static void mtk_jpeg_bound_align_image(u32 *w, unsigned int wmin,
> -				       unsigned int wmax, unsigned int walign,
> -				       u32 *h, unsigned int hmin,
> -				       unsigned int hmax, unsigned int halign)
> -{
> -	int width, height, w_step, h_step;
> -
> -	width = *w;
> -	height = *h;
> -	w_step = 1 << walign;
> -	h_step = 1 << halign;
> -
> -	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign, 0);
> -	if (*w < width && (*w + w_step) <= wmax)
> -		*w += w_step;
> -	if (*h < height && (*h + h_step) <= hmax)
> -		*h += h_step;
> -}
> -
>  static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
>  				       struct v4l2_format *f)
>  {
> @@ -218,25 +199,25 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
>  		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
>  
> -		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> -					   MTK_JPEG_MAX_WIDTH, 0,
> -					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> -					   MTK_JPEG_MAX_HEIGHT, 0);
> +		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> +				       MTK_JPEG_MAX_HEIGHT);
> +		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +				      MTK_JPEG_MAX_WIDTH);
>  
>  		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
>  		pfmt->bytesperline = 0;
>  		/* Source size must be aligned to 128 */
> -		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
> +		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
>  		if (pfmt->sizeimage == 0)
>  			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
>  		goto end;
>  	}
>  
>  	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> -	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> -				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
> -				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> -				   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
> +	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
> +			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
> +	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
> +			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
>  
>  	for (i = 0; i < fmt->colplanes; i++) {
>  		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
> @@ -751,8 +732,8 @@ static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
>  {
>  	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
>  	bs->end_addr = bs->str_addr +
> -			 mtk_jpeg_align(vb2_get_plane_payload(src_buf, 0), 16);
> -	bs->size = mtk_jpeg_align(vb2_plane_size(src_buf, 0), 128);
> +		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
> +	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
>  }
>  
>  static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 999bd1427809..28e9b30ad5c3 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -21,10 +21,10 @@
>  #define MTK_JPEG_FMT_TYPE_OUTPUT	1
>  #define MTK_JPEG_FMT_TYPE_CAPTURE	2
>  
> -#define MTK_JPEG_MIN_WIDTH	32
> -#define MTK_JPEG_MIN_HEIGHT	32
> -#define MTK_JPEG_MAX_WIDTH	8192
> -#define MTK_JPEG_MAX_HEIGHT	8192
> +#define MTK_JPEG_MIN_WIDTH	32U
> +#define MTK_JPEG_MIN_HEIGHT	32U
> +#define MTK_JPEG_MAX_WIDTH	8192U
> +#define MTK_JPEG_MAX_HEIGHT	8192U

This change is not mentioned in the commit message. It should go to a
separate patch, possibly merged with other really minor stylistic changes
like this, e.g. patch 08/14.

Otherwise the patch looks good, so after addressing the above minor changes
please feel free to add

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
