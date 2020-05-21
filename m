Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BA3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B7C2206F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gaqwuBkv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ID1dvrYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B7C2206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cetBr5EMn5sMOytHq9Doq/ekxJKA23aMLr90BiGhAk=; b=gaqwuBkv8xkc7R
	4TMNUjAZtXPPfKW7L+f73XJSyXBaRH8HvaNqTvPRd26mTYxRfukqecp81E/l6yI0iokL/pkguHH2x
	3siXpkbj1Ks21oqmq+wQuv3zK/zy1BLsRBu4goVTknXssWv+tklxPZSS3F+KCSwO5NTNzB19ghCKQ
	yjE7DMaiWDn/SDcPEn8NYU+vuP7ZrtxCTuQ45flwBXn+Q9Tq0LxC61Pct3etRHs+5FTAZQEHTD5Co
	wPkQWTwDBwO6IIUtel9fMCN+YtvRZ0U8+pk+YfoUCgq7Ns/ju3OypgMrhbxj6Emnd3HTHF0gIY23w
	aGSB5uHQ04p7RP3rHu7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbnSc-0007GG-MG; Thu, 21 May 2020 15:50:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbnSM-0004k0-Ee
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 15:50:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id i15so7087719wrx.10
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I5QXaX52IPaG+95gPfmlZ0rD63JTAUJslTJmrnwNjQc=;
 b=ID1dvrYmYK5R1R7a0Cw6H9ckAbwIgzD1jEh8cLijWGS6z4cOVQD8npfgacuW3YzbTR
 6p53ASb2F8xqyBMI8KhptHeaQt1pyG6j16NzI19RwIF22j7IKpB1vdhv2vKICxvPmIGS
 L9IwRDjpD8PgKAcggZu7EgMhLsHQK5hYnPirU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I5QXaX52IPaG+95gPfmlZ0rD63JTAUJslTJmrnwNjQc=;
 b=J2c9B6M4HDe3Ljt6vGiGHvbzQOq/AI42dE1yM+S+OlEVnBQqT5w7QTmHTEgxWvHGV5
 WcXVyQLEobozuqP8ao5o0hdOfEwlDTD4u2yJKP60zxYn3YiywKGklSEzlmd8HIZAVg13
 avUcFYD8Ad3bClP4sKFC6s8i1sPO1zcM/nAzW464PSvCmISK61YjSbaSGF1DdP5xChg8
 ugmLcaq8wmsvN7UlFuhECp4R+IQO1DLU9SXbBmImeosIyV5iIV43RdZNOinP7zgsLlbu
 YgR5uqPi+u0n1OXdri46zOSwEUHEq+fL9EugoEYwaAuOqXP699L49prT0/dlrUt4NVf0
 ylhw==
X-Gm-Message-State: AOAM533W/gAHkDmkD5zWWRm9SZ9Eabf7wX1+n82t5OAaRl8pitYVkMH5
 KlXUJ8F5qI7cs2tWDP9NsXxOgQ==
X-Google-Smtp-Source: ABdhPJw5KfY6ZCQuAckjsE5E7cfiDb7ScpWMpUV7bgUyKbpKFR20CCu1lyQfVtv8YMw85K8xToqg9w==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr9942589wrn.149.1590076200716; 
 Thu, 21 May 2020 08:50:00 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id r3sm6663037wmh.48.2020.05.21.08.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 08:50:00 -0700 (PDT)
Date: Thu, 21 May 2020 15:49:58 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 10/14] media: platform: Delete redundant code for
 improving code quality
Message-ID: <20200521154958.GI209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-11-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-11-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_085002_523428_1F368E49 
X-CRM114-Status: GOOD (  17.54  )
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

On Fri, Apr 03, 2020 at 05:40:29PM +0800, Xia Jiang wrote:
> Delete unused member variables annotation.
> Delete unused variable definition.
> Delete redundant log print, because V4L2 debug logs already print it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 16 ++--------------
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  5 +++--
>  2 files changed, 5 insertions(+), 16 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 4e64046a6854..9e59b9a51ef0 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -182,7 +182,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  				   struct mtk_jpeg_ctx *ctx, int q_type)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> -	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  	int i;
>  
>  	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> @@ -190,7 +189,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  
>  	if (ctx->state != MTK_JPEG_INIT) {
>  		mtk_jpeg_adjust_fmt_mplane(ctx, f);
> -		goto end;
> +		return 0;
>  	}
>  
>  	pix_mp->num_planes = fmt->colplanes;
> @@ -210,7 +209,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
>  		if (pfmt->sizeimage == 0)
>  			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
> -		goto end;
> +		return 0;
>  	}
>  
>  	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> @@ -224,20 +223,9 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
>  		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
>  
> -		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));

This change is not mentioned in the description. I'd suggest moving it
to a separate patch, because it's a functional change.

>  		pfmt->bytesperline = stride;
>  		pfmt->sizeimage = stride * h;
>  	}
> -end:
> -	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
> -		 pix_mp->width, pix_mp->height);
> -	for (i = 0; i < pix_mp->num_planes; i++) {
> -		v4l2_dbg(2, debug, &jpeg->v4l2_dev,
> -			 "plane[%d] bpl=%u, size=%u\n",
> -			 i,
> -			 pix_mp->plane_fmt[i].bytesperline,
> -			 pix_mp->plane_fmt[i].sizeimage);
> -	}
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 64a731261214..9bbd615b1067 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -30,6 +30,9 @@
>  
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
>  
> +/**
> + * enum mtk_jpeg_ctx_state - contex state of jpeg

typo: s/contex/context/

But I'd rephrase it to "states of the context state machine".

> + */

Not mentioned in the description. Also, the documentation of an enum
should have descriptions for the values.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
