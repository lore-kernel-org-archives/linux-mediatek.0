Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290A7C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 06:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FE0207D5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 06:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tQ7RIdaR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I9HwEpM9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7FE0207D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWVlKh8qs8uXfSbLPF11FQOpA+wdew6MvxLcxSefs3Q=; b=tQ7RIdaRC/IhRQ
	7GzsTxtCNBsDZ9HX6H68aFJWCv4dxQH5FSaUVWvoF/2//vWae1V3gF5zSTuWv4WS6oms1oDyQmH33
	7Iskr/6WrhTGXQ3NvbPGGRhpkbFDNWWiBQuSj4EwXOW7WPHav42mo5XLAObBIKee1bls24tj4+oDs
	gFlyD5I1yIIPD8Vkwi76849X3G4xOJm7907FUnT7RPsl5UtUK8xxLWv8/RdaSmSh13yUbUV6/9S7e
	xObbt8znWBYOp+EaZG3MhPWNfNXITI/sQoNI2CLuw4+lFeS1tYPlOB/E5cSvsWxOshOodrnzHtNqB
	ZN98GGN+zdhxjjjdLR4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh64W-0008Db-9W; Fri, 05 Jun 2020 06:43:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh64T-0008CY-Bv; Fri, 05 Jun 2020 06:43:19 +0000
X-UUID: 270ed4d3972f424ba1e79fd8e99c0695-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=82/gwfumID/oDEq9itix4sSuGV1n3vqDdEBL9hhAtBc=; 
 b=I9HwEpM9lUYZOY+EBsFEW0vlf7DotszroqJKLhMSAaCr4mGgcJ5HObZGqttRx+JnyTv4TtwWj2opZKrw/2dys62pZMiNfnAQv7BI5iFoU1Eg5emTQmYmQX2sCrieZ0j+B3bVo6tWIek2heBYc/s6heeVCFIAaLM1cTKvEWPkcMk=;
X-UUID: 270ed4d3972f424ba1e79fd8e99c0695-20200604
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 630909380; Thu, 04 Jun 2020 22:43:09 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 23:43:11 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 5 Jun 2020 14:43:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 14:43:06 +0800
Message-ID: <1591339263.32607.0.camel@mhfsdcap03>
Subject: Re: [PATCH v8 07/14] media: platform: Use kernel native functions
 for improving code quality
From: Xia Jiang <xia.jiang@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 5 Jun 2020 14:41:03 +0800
In-Reply-To: <20200521154137.GG209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-8-xia.jiang@mediatek.com>
 <20200521154137.GG209565@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D73C96593E44FF63D98051F58AC859BAAECFB308B2E0EFAE3235D87A954605152000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_234317_417325_7C969520 
X-CRM114-Status: GOOD (  19.99  )
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
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-21 at 15:41 +0000, Tomasz Figa wrote:
> Hi Xia,
> 
> On Fri, Apr 03, 2020 at 05:40:26PM +0800, Xia Jiang wrote:
> 
> Thank you for the patch. Please see my comments inline.
> 
> nit: I'd remove "for improving code quality" from the subject, as it's
> obvious that we don't intend to make the code quality worse. ;)
> On the contrary, I'd make it more specific, e.g.
> 
> media: mtk-jpeg: Use generic rounding helpers
> 
> WDYT?
Done
> 
> > Use clamp() to replace mtk_jpeg_bound_align_image() and round() to
> > replace mtk_jpeg_align().
> > 
> > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > ---
> > v8: no changes
> > ---
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 41 +++++--------------
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c |  8 ++--
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h |  5 ---
> >  4 files changed, 19 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index 2fa3711fdc9b..4e64046a6854 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -157,25 +157,6 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
> >  	return NULL;
> >  }
> >  
> > -static void mtk_jpeg_bound_align_image(u32 *w, unsigned int wmin,
> > -				       unsigned int wmax, unsigned int walign,
> > -				       u32 *h, unsigned int hmin,
> > -				       unsigned int hmax, unsigned int halign)
> > -{
> > -	int width, height, w_step, h_step;
> > -
> > -	width = *w;
> > -	height = *h;
> > -	w_step = 1 << walign;
> > -	h_step = 1 << halign;
> > -
> > -	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign, 0);
> > -	if (*w < width && (*w + w_step) <= wmax)
> > -		*w += w_step;
> > -	if (*h < height && (*h + h_step) <= hmax)
> > -		*h += h_step;
> > -}
> > -
> >  static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
> >  				       struct v4l2_format *f)
> >  {
> > @@ -218,25 +199,25 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
> >  	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
> >  		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
> >  
> > -		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> > -					   MTK_JPEG_MAX_WIDTH, 0,
> > -					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> > -					   MTK_JPEG_MAX_HEIGHT, 0);
> > +		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> > +				       MTK_JPEG_MAX_HEIGHT);
> > +		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> > +				      MTK_JPEG_MAX_WIDTH);
> >  
> >  		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
> >  		pfmt->bytesperline = 0;
> >  		/* Source size must be aligned to 128 */
> > -		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
> > +		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
> >  		if (pfmt->sizeimage == 0)
> >  			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
> >  		goto end;
> >  	}
> >  
> >  	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> > -	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> > -				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
> > -				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> > -				   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
> > +	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
> > +			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
> > +	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
> > +			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
> >  
> >  	for (i = 0; i < fmt->colplanes; i++) {
> >  		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
> > @@ -751,8 +732,8 @@ static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
> >  {
> >  	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> >  	bs->end_addr = bs->str_addr +
> > -			 mtk_jpeg_align(vb2_get_plane_payload(src_buf, 0), 16);
> > -	bs->size = mtk_jpeg_align(vb2_plane_size(src_buf, 0), 128);
> > +		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
> > +	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
> >  }
> >  
> >  static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > index 999bd1427809..28e9b30ad5c3 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > @@ -21,10 +21,10 @@
> >  #define MTK_JPEG_FMT_TYPE_OUTPUT	1
> >  #define MTK_JPEG_FMT_TYPE_CAPTURE	2
> >  
> > -#define MTK_JPEG_MIN_WIDTH	32
> > -#define MTK_JPEG_MIN_HEIGHT	32
> > -#define MTK_JPEG_MAX_WIDTH	8192
> > -#define MTK_JPEG_MAX_HEIGHT	8192
> > +#define MTK_JPEG_MIN_WIDTH	32U
> > +#define MTK_JPEG_MIN_HEIGHT	32U
> > +#define MTK_JPEG_MAX_WIDTH	8192U
> > +#define MTK_JPEG_MAX_HEIGHT	8192U
> 
> This change is not mentioned in the commit message. It should go to a
> separate patch, possibly merged with other really minor stylistic changes
> like this, e.g. patch 08/14.
Done
> 
> Otherwise the patch looks good, so after addressing the above minor changes
> please feel free to add
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> 
> Best regards,
> Tomasz
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
