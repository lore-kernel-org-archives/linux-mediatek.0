Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591E7CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa0gGpZNMAqHQmNMLRw2KJGOdZocq9+DqAJPNBVbPVs=; b=R6OepoTSuWSvpm9sW+ZEiC45Es
	mDi+57tfBuRZD9/bxYE9hPitODt3haHeJKDoJtsTbjhUTwCX7n2labjBSvbVIwtiPcl0x2KkUiLpZ
	re2P/CROEPQOIMjcHDdExOYIRrPfxUitYXjvZxhJY9iBqhBHvzkYtfC3xRVAB7Z2gSEKNf5ToMTXA
	E0+o/e81T/VGSKKkdQLQPQYIG3mrugFUpjaoOFeU7LQDDbsRKvX4XQkycKKVVomjZ6D1Ipe5cXqOa
	Ejy8yEsCnGlrMrc7ampBAwQGC9BM48CNeBsUJNXRVPreWvqrk3bUd11rKi7kZThOOOsegLCISswKB
	G1LbrL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSaN-00HRvT-2o;
	Thu, 19 Oct 2023 12:57:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWE-00HNaX-0f;
	Thu, 19 Oct 2023 12:52:59 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DB9DC6607377;
	Thu, 19 Oct 2023 13:52:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719969;
	bh=+N2NXYHRMMiyUC0gb7VJb1oDXBrovxuB6Pt09SJAcIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XV5FLo+TUzvHfEOAgrj0IPsE6R7ebKhE3JzjZP4OY+sTIgxJTPxko5wOXx50hnXls
	 NqugT+P4wtk1gmWU5nuLD0pLQnasBGBaYjg/FtdRiHoPRfFLYDSzySZGwBqduZBpc8
	 jY9jSlxqfpp2M8x73ZtB+UYLBGIbO+bXNuf3/WX7z89WE3LqhgB8Gpv4xAHdPUwz89
	 OTZeo2ZfhFQA13BoMs6gGoKxovJ4ruEaHX+u80ccL1EyWTPHJDgucdOQe806WMKfJR
	 mWF3xVcx9IriP1g+Z8ikgWz+OgUol9SWOOJZSIrW8qa1AZ5766UELHR2yfAnu3CREm
	 PsC6YgDIff9qw==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v13 35/56] media: cedrus: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:01 +0200
Message-Id: <20231019125222.21370-36-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055254_396875_FD454872 
X-CRM114-Status: GOOD (  12.11  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Maxime Ripard <mripard@kernel.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 9 +++++++--
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index dfb401df138a..3e2843ef6cce 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -653,8 +653,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	for (i = 0; i < vq->num_buffers; i++) {
-		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
+	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
+
+		if (!vb)
+			continue;
+
+		buf = vb2_to_cedrus_buffer(vb);
 
 		if (buf->codec.h264.mv_col_buf_size > 0) {
 			dma_free_attrs(dev->dev,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index fc9297232456..52e94c8f2f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	for (i = 0; i < vq->num_buffers; i++) {
-		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
+	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
+
+		if (!vb)
+			continue;
+
+		buf = vb2_to_cedrus_buffer(vb);
 
 		if (buf->codec.h265.mv_col_buf_size > 0) {
 			dma_free_attrs(dev->dev,
-- 
2.39.2


