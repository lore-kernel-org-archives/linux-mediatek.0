Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14AECDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nr1KYax36VZZBnabbjIyUGPTkvQFXV8YfPxk2A654tA=; b=aqTW0bnqLaQpLd7g3AegbO3Cq1
	O5Es3AWCcvvTOCyT/DDnji0uKI7LTKdhcBHQb5lAFhEFjwLsYn9o80jfhLsb3JLIum802RGf7tPGC
	QFRQi28imaynBvoYmWsUryQ5sNMOhoLe3VxZYEu5VIUVzHYqn7DPfQfsK00fMeSNx4EXyImpUH6jO
	gWYq/4x6Xnrn1L/SoUovQ0rdadWeMQ5Ve0AIxxLZAEHI+Rfz56Rhr8IXDK5rabPvZwVjL6r9aocAt
	4U4DW5vli1llw5HcP7xURPdXS8R0llS1OC3nQ/7icCbzh5dLDN5C8xlkdSD/UrCmX/tmhJhDFGMHY
	bY31r1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQe-00CdD8-0a;
	Tue, 17 Oct 2023 14:52:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslN9-00CZRP-1r;
	Tue, 17 Oct 2023 14:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nr1KYax36VZZBnabbjIyUGPTkvQFXV8YfPxk2A654tA=; b=oXJ1nwAt9rMDIVEVLYBG6fCf7P
	hLFRR+ms4MFxhXnE+4Ud3QGAnIDI/iYiMisNUV4eOAjqeX/YIix1mp+mmhDokXkjiu9Oia7cQo/ar
	WyGEpiL5FA8fXIdNGjBaPg0uzSFnyNYFGTw5qwV23uxlffXwtdEf/4qT1sH3RufZse3ke41Pc0/m4
	kjrmGwM4r1iGTtFyqQi6I6ckYf+eSkCk0pErCPDFXF2QbePDqdETG/CyfPNfCTi8cZnStw28MfopB
	4700wVchz7wwwWaNGQCq4heVIg+ZkLPcBl1S7EdxdaCvaBB4e2Fki06pIInCvavIO0epXjPxSw+BA
	CWgwVjCg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslN1-007A7M-1u;
	Tue, 17 Oct 2023 14:48:36 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A003A66073BE;
	Tue, 17 Oct 2023 15:48:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554110;
	bh=dg5TyqcXTbK8D5lR679m2t1zA3rG8sR+3z3V0ZimwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AYUf7aodyCaxPT8pTO2gysdeTe2MgfMO6+oWZtRFooi1iecWEgGe4JSHK822PTRgC
	 5JTPxT6ffpQkQLwQTzyEcEB9bISBoFv9Syau/oHT3RRvP8aA6QWr1LaLXyC0psUnQX
	 zK/C0NdY6j7d/u1iI+33d+Nng1K3OccyX7ss+fFQfu2URCQGVtiu86KPyoGYLFio4o
	 s8DyIIFA9DfpeRKyR+IZpIYMYfe2IIUBKBtt8tP0MnO5FmhfhBAsjkenaxRWvla0y/
	 //IVw/yodiYpKjrvrubJqJCufPsBPR+MjU9dqCCWWcS5lPpy83MCsvf5xraqjpVvv2
	 mfaoWzdoPqRVg==
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
Subject: [PATCH v12 50/56] media: verisilicon: vp9: Allow to change resolution while streaming
Date: Tue, 17 Oct 2023 16:47:50 +0200
Message-Id: <20231017144756.34719-51-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154831_676050_744C9FC5 
X-CRM114-Status: GOOD (  13.64  )
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
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Philipp Zabel <p.zabel@pengutronix.de>
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


