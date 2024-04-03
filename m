Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44752CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T502LOcxZsO/OAoDZkwjSKMPzcyFFgggt5efS9A+rPU=; b=c7VVAPI2bMv/jspkC4TzOEfk8P
	Ys8Z2tYz2QUIOX2pixES/zEb3FY+Kz7LkVNX5BcGxNd8EKR1KpnMSgSVyQMtM/zmcCAsn5Tm7qPEl
	ET5aNDwqNxKT+3biBwyADSvwGH8YTsj1XM2+/N+uqof5+V9IsBDdZpobnSCYZ6fIko6ZaEhpVtQsy
	lc32Srus+FjVymWHflVVNsD6c65oa+U6nKTir9LiCfNoR7opgiCR5uJYwyvT5eA9y7iF/0Ob0XEO8
	i2IZDecIJhPLYRkA2zd9YEqEDNwljXQYTGdjOWvKfL7IF1/Zu5ZReCca0/A+pCMPAkIrKXa3dy1cT
	/EczcoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrzu0-0000000FyJ4-11bm;
	Wed, 03 Apr 2024 12:39:40 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrztw-0000000FyGX-0Qzy;
	Wed, 03 Apr 2024 12:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712147972;
	bh=56cFVVN36vdvA9j0k6U4c9Yyi7PsljXwFIP8sKfDAn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2u3Aj7JWJ8T2VlEkSysWrQyL+7YwxPLSHmUGGV4BCQp8UFuxEVhBu/+jKSjZtaER
	 vCqPQtjmwNfKZQbcMUePtxgVz+Kj6lPlMzM07fINBNnFf+6jGU+LlFRayM31Mee6jO
	 XuvzckZb1w9G7nOLmdyKUFnydK0J1mornC2SEZ+eBKyBG9MGasDoorQ1E6ijzyLNs6
	 ynJ4qR7K9G5Ho7qktbwUev0m2NHYsNYnU5F7PhHp6POrq4/5xNyXLkKGSkgt0Mib4z
	 YVajJb6UlXXb08K4lXDsHnTQ0hmKMZpZoRKAcrJ4tXGDyyYDrL77NcPxfclDI4Ercj
	 shje3a066P9Qw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C26C6378200D;
	Wed,  3 Apr 2024 12:39:31 +0000 (UTC)
Date: Wed, 3 Apr 2024 14:39:30 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] media: mediatek: vcodec: fix the error sizeimage for
 10bit bitstream
Message-ID: <20240403123930.wkzgxb6lymzb7hng@basti-XPS-13-9310>
References: <20240403093018.13168-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240403093018.13168-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_053936_468035_459A15E0 
X-CRM114-Status: GOOD (  12.22  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hey Yunfei,

On 03.04.2024 17:30, Yunfei Dong wrote:
>The sizeimage of each plane are calculated the same way for 8bit and

s/The sizeimage of each plane are/The sizeimage for each plane is/

>10bit bitstream. Need to enlarge the sizeimage with simeimage*5/4 for
>10bit bitstream when try and set fmt.

s/bitstream/bistreams/
s/Need to enlarge the sizeimage with simeimage*5/4 for 10bit bitstream when try and set fmt./
   Scale up the sizeimage by 25% for 10-bit bitstreams in try_fmt./

>
>Fixes: 9d86be9bda6c ("media: mediatek: vcodec: Add driver to support 10bit")
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 47 ++++++++++++++-----
> 1 file changed, 34 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 9107707de6c4..45209894f1fe 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -259,6 +259,7 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
> 		pix_fmt_mp->num_planes = 1;
> 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
> 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>+		unsigned int dram_y, dram_c, dram_y_10bit, dram_c_10bit;
> 		int tmp_w, tmp_h;
>
> 		/*
>@@ -280,22 +281,42 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
> 		    (pix_fmt_mp->height + 64) <= frmsize->max_height)
> 			pix_fmt_mp->height += 64;
>
>-		mtk_v4l2_vdec_dbg(0, ctx,
>-				  "before resize wxh=%dx%d, after resize wxh=%dx%d, sizeimage=%d",
>-				  tmp_w, tmp_h, pix_fmt_mp->width, pix_fmt_mp->height,
>-				  pix_fmt_mp->width * pix_fmt_mp->height);
>+		dram_y = pix_fmt_mp->width * pix_fmt_mp->height;
>+		dram_c = dram_y / 2;
>+
>+		dram_y_10bit = dram_y * 5 / 4;
>+		dram_c_10bit = dram_y_10bit / 2;

I'd skip the two 10 bit variables (dram_y_10bit & dram_c_10bit) and
instead do it like this:

```
   dram_stride = pix_fmt_mp->width;
   if (ctx->is_10bit_bitstream)
     dram_stride = dram_stride * 5 / 4;

   dram_y = dram_stride * pix_fmt_mp->height;
   dram_c = dram_y / 2;

   if (pix_fmt_mp->num_planes == 1) {
     pix_fmt_mp->plane_fmt[0].bytesperline = dram_stride;
     pix_fmt_mp->plane_fmt[0].sizeimage = dram_y + dram_c;
   } else {
     pix_fmt_mp->plane_fmt[0].bytesperline = dram_stride;
     pix_fmt_mp->plane_fmt[1].bytesperline = dram_stride;
     pix_fmt_mp->plane_fmt[0].sizeimage = dram_y;
     pix_fmt_mp->plane_fmt[1].sizeimage = dram_c;
     ...
   }
```

Also, why do you call all the variables dram?

Please this isn't tested, but shows the general direction to repeat a
lot less code.

Greetings,
Sebastian

>
> 		pix_fmt_mp->num_planes = fmt->num_planes;
>-		pix_fmt_mp->plane_fmt[0].sizeimage =
>-				pix_fmt_mp->width * pix_fmt_mp->height;
>-		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>-
>-		if (pix_fmt_mp->num_planes == 2) {
>-			pix_fmt_mp->plane_fmt[1].sizeimage =
>-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
>-			pix_fmt_mp->plane_fmt[1].bytesperline =
>-				pix_fmt_mp->width;
>+		if (pix_fmt_mp->num_planes == 1) {
>+			if (ctx->is_10bit_bitstream) {
>+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width * 5 / 4;
>+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y_10bit + dram_c_10bit;
>+			} else {
>+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y + dram_c;
>+			}
>+		} else {
>+			if (ctx->is_10bit_bitstream) {
>+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width * 5 / 4;
>+				pix_fmt_mp->plane_fmt[1].bytesperline = pix_fmt_mp->width * 5 / 4;
>+
>+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y_10bit;
>+				pix_fmt_mp->plane_fmt[1].sizeimage = dram_c_10bit;
>+			} else {
>+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>+				pix_fmt_mp->plane_fmt[1].bytesperline = pix_fmt_mp->width;
>+
>+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y;
>+				pix_fmt_mp->plane_fmt[1].sizeimage = dram_c;
>+			}
> 		}
>+
>+		mtk_v4l2_vdec_dbg(0, ctx,
>+				  "before resize:%dx%d, after resize:%dx%d, sizeimage=0x%x_0x%x",
>+				  tmp_w, tmp_h, pix_fmt_mp->width, pix_fmt_mp->height,
>+				  pix_fmt_mp->plane_fmt[0].sizeimage,
>+				  pix_fmt_mp->plane_fmt[1].sizeimage);
> 	}
>
> 	pix_fmt_mp->flags = 0;
>-- 
>2.25.1
>

