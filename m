Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FFCC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:54:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA002076C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qj/53vY+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q/11vG58"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA002076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sQdJ/2zSzJUWMdDBFgor4eeH4Op6S+7nixA16PsdELU=; b=Qj/53vY+JYXedIBL/RBSVVEU7
	GmeJ1b1jg/QaRmTuvPjkqYLk45lPHgt9I2Hhh60OVLr5EfGd2SujkR8vr3teGxbPjNGKH0x2Fwl4f
	n+n1qO9ZgZLijF+1BlXWh/4fg3ccl6kzaZhxsXbabdHCmzt/OxBwDfcq9mxyQWUXSuTFw89SFGOIx
	/6K5l5SYHYzIE9N/+RckCm3GPnxrHBalUSqLuAY4JKP0U6JjERBnwkBj4sUXjBsCQQILzwXie6dEw
	RPA7VR+riYjlBFyITTU2NhekgCqgGcqPoFLpbMjKkB8kbxkYwciHdL3P4nKSFF0wEZWZ+PQcI6dXy
	cAbc6NkpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2o1c-0002T8-OJ; Tue, 04 Aug 2020 03:54:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nzk-0001Br-0P; Tue, 04 Aug 2020 03:52:11 +0000
X-UUID: 6eb68f6ea8a24238aab9dd9919b2634f-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wo6NKcvH+7ZcVrIKfcQXeXuRZa5CHYz68aeOvk2sonk=; 
 b=q/11vG58D9FY27fKzEb3ntuhejI4/PcFFwq76SciTm2JT8sujbBgyMIf8eoMmXvGAqmLsivWEqbvk3M5B4fTveNuuiwCurMkXSC+fMqp++kv3fbBH8V/5tAZl+sabFPco+5ZwiwtldWe5wd6Er3SkUvcTYafBMX8fmr2LYvrJzU=;
X-UUID: 6eb68f6ea8a24238aab9dd9919b2634f-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1489319023; Mon, 03 Aug 2020 19:51:54 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:42:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:01 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v11 17/28] media: platform: Refactor mtk_jpeg_try_fmt_mplane()
Date: Tue, 4 Aug 2020 11:40:51 +0800
Message-ID: <20200804034102.22983-18-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_235208_255764_6420D804 
X-CRM114-Status: GOOD (  17.62  )
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

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v11: no changes
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
