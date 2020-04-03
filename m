Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94468C43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 09:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637DD20737
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 09:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JLqlglcL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uEav5dOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 637DD20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqJZw68MAQBygxHZBEya9kMUl63vyPF5vT/Ha/VECgY=; b=JLqlglcLOzCxRy
	Nw7rgtFzat0d0QAPW4d7exBk1C68CSpMxE+DDAqvZGiFK6j4Hd82zrc4u9p2LdGPoPeji5XdS3dr4
	do263E+L9z8YIY7cu1ZoigiBv9f2syGgSMLMSQV2D88f/rk8KwLd0PZtmcow1Pd8kOjsnqOihUeXD
	V6clbjINoxNFoYkYf3OQVofUOQ1Z/9tx2LCvzeGMj/kEiiT/YH8DsgcGyALYJEn5aygAemJmyOU7K
	w0zIDkK0K1f+MZul9MPW89uMMIf6ED9yVnHlF9jfcDi/uBInVbOP1Ojz+16awCy5BmDLJHplVg5KD
	PmaDKahg22NAldsfdkWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKJ1K-0002zq-39; Fri, 03 Apr 2020 09:53:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKIya-0000Uk-39; Fri, 03 Apr 2020 09:51:01 +0000
X-UUID: 6b7f855cb9c8450eb887aade4efabeed-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Lprj+ufCYbzLwTfc1XoNnGUMFca4BTukbE1k5gVfSdE=; 
 b=uEav5dOtyWLt1KR0e0l2J+ZeHZAPj1xviuawl415pp0I2bucwoF4NGLPEAQcIn9KT4i6RPNmEORK+UZDdoun6Gz2tmomuzIR3rjX6U/P33wwiw1zuY/7UeMJn06o4HD0hTA+LIx4EnG1gkQmDr5wWRzHddIS9KMSzUiRyPgArC8=;
X-UUID: 6b7f855cb9c8450eb887aade4efabeed-20200403
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 198267025; Fri, 03 Apr 2020 01:50:42 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Apr 2020 02:40:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:43 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v8 10/14] media: platform: Delete redundant code for improving
 code quality
Date: Fri, 3 Apr 2020 17:40:29 +0800
Message-ID: <20200403094033.8288-11-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200403094033.8288-1-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_025100_270979_7E9C9F7B 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Delete unused member variables annotation.
Delete unused variable definition.
Delete redundant log print, because V4L2 debug logs already print it.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v8: no changes
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 16 ++--------------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  5 +++--
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 4e64046a6854..9e59b9a51ef0 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -182,7 +182,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 				   struct mtk_jpeg_ctx *ctx, int q_type)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
 	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
@@ -190,7 +189,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 
 	if (ctx->state != MTK_JPEG_INIT) {
 		mtk_jpeg_adjust_fmt_mplane(ctx, f);
-		goto end;
+		return 0;
 	}
 
 	pix_mp->num_planes = fmt->colplanes;
@@ -210,7 +209,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
 		if (pfmt->sizeimage == 0)
 			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
-		goto end;
+		return 0;
 	}
 
 	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
@@ -224,20 +223,9 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
 		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
 
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = stride;
 		pfmt->sizeimage = stride * h;
 	}
-end:
-	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
-		 pix_mp->width, pix_mp->height);
-	for (i = 0; i < pix_mp->num_planes; i++) {
-		v4l2_dbg(2, debug, &jpeg->v4l2_dev,
-			 "plane[%d] bpl=%u, size=%u\n",
-			 i,
-			 pix_mp->plane_fmt[i].bytesperline,
-			 pix_mp->plane_fmt[i].sizeimage);
-	}
 	return 0;
 }
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 64a731261214..9bbd615b1067 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -30,6 +30,9 @@
 
 #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
 
+/**
+ * enum mtk_jpeg_ctx_state - contex state of jpeg
+ */
 enum mtk_jpeg_ctx_state {
 	MTK_JPEG_INIT = 0,
 	MTK_JPEG_RUNNING,
@@ -109,9 +112,7 @@ struct mtk_jpeg_q_data {
  * @out_q:		source (output) queue information
  * @cap_q:		destination (capture) queue queue information
  * @fh:			V4L2 file handle
- * @dec_param		parameters for HW decoding
  * @state:		state of the context
- * @header_valid:	set if header has been parsed and valid
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
  * @quantization: enum v4l2_quantization, colorspace quantization
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
