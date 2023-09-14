Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B585CEEAA44
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeFU4iirMD/C8zAnnLuvVsqExwwX9oyU662qIGcGqiA=; b=bFgPdbfoygE+9ov+w55hHme/V/
	2iVEvlseNiji5foGwNN52xNzDTGCjFoObDm36nBcXUIUWK4EtFGMkXuWz/YGhBMNBEAw7YprYqpdm
	xC8wdZx/PqPvbKnJ/fgW/+Nr2VH5qH6Bh2Zj9WyUmP5kPIGbEiyCcQEMKhakBUQe8FOc3WLHfWFg/
	xoxDL51wFsZMEFALl907l7Q1sAC4ypPFNRXfI/GPT/XhB6tk2ctBPVMWNCblxd9yQivECMoDA5CCc
	PFhSa6Mz2SbaJ17o/FBOLlwXfKhWYoygTp+ORSxyFX+GY6Q/QJ0VZ91wRNFegD5GudzZYo/n3C7iF
	bT2rYULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmV9-008U4n-1k;
	Thu, 14 Sep 2023 13:35:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTc-008SMq-1p;
	Thu, 14 Sep 2023 13:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HeFU4iirMD/C8zAnnLuvVsqExwwX9oyU662qIGcGqiA=; b=SNY8gABYVR9ibX6I3D4nYSDQJA
	+nmP/ij4eCI8rTe/JkSlnCLAKyV9iVDnOBOL9j3oPaHRQuOxO6PM0c+eMXNwXa7SIhWKG+J4kf5NJ
	47IKBQqfQvh0luLvEO1zpn6oo7YqvAhgcDfsmo9xIvaFe2wjOx0EDwk1JirxAWmnbJMicGV9FeRYb
	yP/YEj8AZLy9GoZiHv2NsqiMZbzjOCAAucqRztkFh/4jy4YWdZSOp9O+nKKDc7iaZNeQQFT8RsuJA
	SA9JDyTo23KRx3EW3Q0koC1KO8Dl2Zky7IEli3x+ugVbZibr0wl44wFzvFD2cK/YlcIAXV8dR5b8N
	snSLzbdw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTU-007uei-04;
	Thu, 14 Sep 2023 13:33:45 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0044F660736E;
	Thu, 14 Sep 2023 14:33:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698420;
	bh=WDraZOgWi0izES0K9FdWnGrtWWF6tf7zOBBP/EoWBNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G4xnHH0KcQzrC++tnJyG3so3XikK6AMopnyr12kJ1wAl7ovGny4ZMEhuefe8pv1tH
	 4DdUp/W7t5x3xMd+04fSvwy9n8XsNYY+dt0PnD/c8Y2QDnAC0nHQCguxOz9ZvDgZlK
	 3xjag9k+Y6F6gST25smLN5FawKJk6JX5CSqJt124SX2S9xCgNlE8jxnXKJf0HYey7q
	 TlazMshotZRaBXptW8QO+fqiJw4dTFH60pdgdtlQLLMjBat/nTHqLs8nnHcdFakSh/
	 gxf6fVrWpSVksVC3jYOcDCSHfT96Nj2MNctttv9owfpV/YwmJ+4FU3Qml9jSWMZ012
	 Tcq5AJnNGkAyQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 17/49] media: verisilicon: vp9: Allow to change resolution while streaming
Date: Thu, 14 Sep 2023 15:32:51 +0200
Message-Id: <20230914133323.198857-18-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143341_881897_3BA65DC4 
X-CRM114-Status: GOOD (  13.70  )
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

Remove all checks that prohibit to set a new format while streaming.
This allow to change dynamically the resolution if the pixel format
remains the same.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_v4l2.c  | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index f0d8b165abcd..27a1e77cca38 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -514,25 +514,14 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 		return ret;
 
 	if (!ctx->is_encoder) {
-		struct vb2_queue *peer_vq;
-
 		/*
 		 * In order to support dynamic resolution change,
 		 * the decoder admits a resolution change, as long
-		 * as the pixelformat remains. Can't be done if streaming.
-		 */
-		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
-		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
-			return -EBUSY;
-		/*
-		 * Since format change on the OUTPUT queue will reset
-		 * the CAPTURE queue, we can't allow doing so
-		 * when the CAPTURE queue has buffers allocated.
+		 * as the pixelformat remains.
 		 */
-		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
-					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (vb2_is_busy(peer_vq))
+		if (vb2_is_streaming(vq) && pix_mp->pixelformat != ctx->src_fmt.pixelformat) {
 			return -EBUSY;
+		}
 	} else {
 		/*
 		 * The encoder doesn't admit a format change if
@@ -577,15 +566,8 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp)
 {
-	struct vb2_queue *vq;
 	int ret;
 
-	/* Change not allowed if queue is busy. */
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
-			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (vb2_is_busy(vq))
-		return -EBUSY;
-
 	if (ctx->is_encoder) {
 		struct vb2_queue *peer_vq;
 
-- 
2.39.2


