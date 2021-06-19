Return-Path: <SRS0=YaGT=LN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAC7C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 09:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 484FC611B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 09:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 484FC611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZaX7MlwUuxDDg3ZX9pu/zXqRkhxHZJCAXiYzq24JeKQ=; b=4mTjiJzH2Soaav
	PNCsEAx5ch5mfYx7eAuNIApQdITmAS7/47c37JpApFcowClndO6/Pof0XFX4E19F0au2yMdJpHQ6P
	//9xPE9jzBVhTC7n8XX12C3j30fMDA+QFJ+yEyYk3Igk4sdrvfml6YqkAXReCQiXRBzY9tNQ+bwet
	wi69P8/Q318e4LxZgHBkXMMTJ08IO0jVE8JGfznbjsjQ6JhLSjpd4er7fIH1OQjJeRtGR4MhzP6E7
	i6SBYU4dZ16yTyi42ORDBRQBIPQfUCQMEVGPrFKV1G/UMsnw4c6dYqfCZV3IxotElgfM+Y2gs8PS5
	fXZr+fg/PTw+mumvIFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luXZH-00GmF5-7t; Sat, 19 Jun 2021 09:47:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luXZE-00GmDY-8J
 for linux-mediatek@lists.infradead.org; Sat, 19 Jun 2021 09:47:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id D2E9E1F448EC
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, bin.liu@mediatek.com, rick.chang@mediatek.com
Cc: dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
 dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
 matthias.bgg@gmail.com, enric.balletbo@collabora.com
Subject: [PATCH] media: mtk-jpeg: fix setting plane paylod
Date: Sat, 19 Jun 2021 12:46:42 +0300
Message-Id: <20210619094642.17779-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_024708_452558_3863B6F3 
X-CRM114-Status: GOOD (  13.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_jpeg_buf_prepare, in case the format is V4L2_PIX_FMT_JPEG,
then the payload of the vb2_buffer planes can be overwritten
only if 'ctx->enable_exif' is true, in that case, the driver is
a jpeg encoder and the payload is determined by the driver.

If 'ctx->enable_exif' is not set and the format is V4L2_PIX_FMT_JPEG
then the payload might came from userspace (in case of a decoder)
and should not be overwritten by the driver.

In addition, the cb 'queue_setup' should add the MTK_JPEG_MAX_EXIF_SIZE
to the plane sizes in case the format is V4L2_PIX_FMT_JPEG
and ctx->enable_exif is set.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bce569d..397a27888a84 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -651,6 +651,7 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	unsigned int exif_extra;
 	int i;
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev, "(%d) buf_req count=%u\n",
@@ -660,18 +661,20 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 	if (!q_data)
 		return -EINVAL;
 
+	exif_extra = ctx->enable_exif && V4L2_TYPE_IS_CAPTURE(q->type) ?
+		     MTK_JPEG_MAX_EXIF_SIZE : 0;
+
 	if (*num_planes) {
 		for (i = 0; i < *num_planes; i++)
-			if (sizes[i] < q_data->pix_mp.plane_fmt[i].sizeimage)
+			if (sizes[i] < q_data->pix_mp.plane_fmt[i].sizeimage + exif_extra)
 				return -EINVAL;
 		return 0;
 	}
 
 	*num_planes = q_data->fmt->colplanes;
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
-		sizes[i] =  q_data->pix_mp.plane_fmt[i].sizeimage;
-		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "sizeimage[%d]=%u\n",
-			 i, sizes[i]);
+		sizes[i] =  q_data->pix_mp.plane_fmt[i].sizeimage + exif_extra;
+		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "sizes[%d]=%u\n", i, sizes[i]);
 	}
 
 	return 0;
@@ -690,12 +693,11 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
-		if (ctx->enable_exif &&
-		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
+		if (q_data->fmt->fourcc != V4L2_PIX_FMT_JPEG)
+			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage);
+		else if (ctx->enable_exif)
+			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage +
 					      MTK_JPEG_MAX_EXIF_SIZE);
-		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
 	}
 
 	return 0;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
