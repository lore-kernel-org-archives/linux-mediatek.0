Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A184CC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:18:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C7D207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rwk3Kkn8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UPUNYamW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C7D207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d18bCtIRfU3ynbgH9sQmNFAIbSrfr9PN0vgSXpVHO84=; b=Rwk3Kkn8yCd5Qi/fsYstkVqIc
	7Vc8DVorMqGPC0nc7CBbm7QdKsC//4uk0vaqpROIFU04LaQNUKItZeDqNQmHQfcZHJy2L3JkQ+8XE
	nBB/LDfQuqBn+Mn+kHSoe7cunxgP+cpLHSke6ASS186dhyeaaBTP2JuTV65fRWvxwaIiODhtdXXRn
	kh5m/YKCif7qT1wQEm5lmnRoSgLmvxUKhPXRJ4aAblKOF39WWM3SD+nh8vrsuLeqZI1THfI6W+dr+
	mGblOK+lBskdq5I/HjUoCOS6x1dulCIW8bXOGDFhw1GHFw68qD6BmIoZM0dM9PItTlMdmtLi7lflb
	rPQTvVX/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRk4-0005bi-W0; Thu, 23 Jul 2020 03:17:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRii-0004yz-MS; Thu, 23 Jul 2020 03:16:34 +0000
X-UUID: 7b443ce3cb9b421ba51a0a420a1d0ac4-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=di5oEQziJFSrioHOTO1osgdCck1UjjATZjOswSWUO3E=; 
 b=UPUNYamWHU+Pvdx9B3PXkg1SFgfknsO1HqicH3U6DYImhjik+1L6nyS7+vANR19m+MeW580XBS9kJ9OoWbjqOwWDGJ5f1dybXJwM23WIYPATyWs9L1v+vwfvhc+0d4MfK5Hg+KLJP87Yq/XQimsqcLegWeLM4/CnKPdvyf5vR9E=;
X-UUID: 7b443ce3cb9b421ba51a0a420a1d0ac4-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 306663079; Wed, 22 Jul 2020 19:16:26 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:26 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 17/28] media: platform: Refactor mtk_jpeg_try_fmt_mplane()
Date: Thu, 23 Jul 2020 11:04:40 +0800
Message-ID: <20200723030451.5616-18-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231632_943068_0307FFA9 
X-CRM114-Status: GOOD (  14.90  )
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
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The function of mtk_jpeg_adjust_fmt_mplane() equals
mtk_jpeg_g_fmt_vid_mplane(), so use mtk_jpeg_g_fmt_vid_mplane() to
replace it .
Delete the unused ctx parameter.
Using fourcc to distinguish between different formats is more generic,
because that jpeg enc will also use it.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: new add patch
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 49 ++++++-------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 9d1935d0782b..aba583f03ef1 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -151,44 +151,17 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
 	return NULL;
 }
 
-static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
-				       struct v4l2_format *f)
+static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
+				   struct mtk_jpeg_fmt *fmt)
 {
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct mtk_jpeg_q_data *q_data;
-	int i;
-
-	q_data = mtk_jpeg_get_q_data(ctx, f->type);
-
-	pix_mp->width = q_data->w;
-	pix_mp->height = q_data->h;
-	pix_mp->pixelformat = q_data->fmt->fourcc;
-	pix_mp->num_planes = q_data->fmt->colplanes;
-
-	for (i = 0; i < pix_mp->num_planes; i++) {
-		pix_mp->plane_fmt[i].bytesperline = q_data->bytesperline[i];
-		pix_mp->plane_fmt[i].sizeimage = q_data->sizeimage[i];
-	}
-}
-
-static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
-				   struct mtk_jpeg_fmt *fmt,
-				   struct mtk_jpeg_ctx *ctx, int q_type)
-{
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	int i;
 
 	pix_mp->field = V4L2_FIELD_NONE;
 
-	if (ctx->state != MTK_JPEG_INIT) {
-		mtk_jpeg_adjust_fmt_mplane(ctx, f);
-		return 0;
-	}
-
 	pix_mp->num_planes = fmt->colplanes;
 	pix_mp->pixelformat = fmt->fourcc;
 
-	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
+	if (fmt->fourcc == V4L2_PIX_FMT_JPEG) {
 		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
 
 		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
@@ -204,7 +177,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 		return 0;
 	}
 
-	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
+	/* other fourcc */
 	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
 			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
 	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
@@ -288,7 +261,12 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 		 (fmt->fourcc >> 16 & 0xff),
 		 (fmt->fourcc >> 24 & 0xff));
 
-	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_CAPTURE);
+	if (ctx->state != MTK_JPEG_INIT) {
+		mtk_jpeg_g_fmt_vid_mplane(file, priv, f);
+		return 0;
+	}
+
+	return mtk_jpeg_try_fmt_mplane(&f->fmt.pix_mp, fmt);
 }
 
 static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -309,7 +287,12 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		 (fmt->fourcc >> 16 & 0xff),
 		 (fmt->fourcc >> 24 & 0xff));
 
-	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_OUTPUT);
+	if (ctx->state != MTK_JPEG_INIT) {
+		mtk_jpeg_g_fmt_vid_mplane(file, priv, f);
+		return 0;
+	}
+
+	return mtk_jpeg_try_fmt_mplane(&f->fmt.pix_mp, fmt);
 }
 
 static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
