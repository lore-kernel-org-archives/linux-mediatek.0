Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAD6E75434
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX8R6FNAbkZWYkueMBme92XT1wQcqt/mdQigvZGLeSI=; b=wh10T+7Bb3MKL08F6bf0S4+MlT
	/gWEpNIm/xGCoIg9cwyPwLABvWhAYJWq7vIPmZrfsnhaMNhEPiJXv19Cowm7WxFd32J9ocLCQe85P
	OUhJg8ePpFfxAWHvPXoFM7/1VEjnAj11Ta808JiIbzvLXN60Om3vBDu7HahIRY2CIlU187pCgcByU
	EpFDI2I8gkH0zy7l+Ur+P4CnLLp8cEoBD1WHx5MlG1xWUKXsQ9FO72j9gboMZtwQoUMNIEP9F4EQC
	HG6dY+1N/25YIGJM41MPqYorqK/KQIdg7dFNkr0zyFbYEPX7RQ2fpQ24s29mot1IFAR5zXiir+wQB
	MBjLLXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTl-00E6VY-17;
	Tue, 03 Oct 2023 08:10:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRP-00E3TW-1x;
	Tue, 03 Oct 2023 08:07:45 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63D8766072E6;
	Tue,  3 Oct 2023 09:07:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320457;
	bh=KSp/qlyb4qZpMVJTjYq3/CPJYCUJtKhZMjqFSVLO9ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CeGOACJ68l3iNAs2qo3ldowsagtp3cQicupSSWr2Ye9NBptxqIknD2Qdj3nGICTHo
	 zI+phreMwrpQh7Z+RsgOBSHdtVZkmmOxxSvHyqiYk5Tbd5acFCMXOEtjGYo2XNOu3B
	 3Px116X5jpfboXh1CZ/Lt5DDtj3vbnIPexTdgbPDyfusBRT4zwzbisHdUvwVQVLdor
	 EDF5oGHdxdyF4+QdbWesfHWXG5e9xfyyJSfdqPHdm7olxMGFEB6pPPywRmlPImlfaY
	 zsfDzeWuUQ3sNsy3btmCxLSOLe4fz7KwOBT+dhMF7zUqVQWSBVGQU8f9wckW7Ad0Em
	 x4B54q5F8Q4VQ==
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
Subject: [PATCH v10 47/54] media: cedrus: Stop direct calls to queue num_buffers field
Date: Tue,  3 Oct 2023 10:06:56 +0200
Message-Id: <20231003080704.43911-48-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010739_863914_DEDE0152 
X-CRM114-Status: GOOD (  11.29  )
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

Use vb2_get_num_buffers() and queue max_num_buffers field
to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++--
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index dfb401df138a..88061310f815 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -653,8 +653,12 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	for (i = 0; i < vq->num_buffers; i++) {
-		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
+	for (i = 0; i < vq->max_num_buffers; i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
+
+		if (!vb)
+			continue;
+		buf = vb2_to_cedrus_buffer(vb);
 
 		if (buf->codec.h264.mv_col_buf_size > 0) {
 			dma_free_attrs(dev->dev,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index fc9297232456..b8b66d0d951e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	for (i = 0; i < vq->num_buffers; i++) {
-		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
+	for (i = 0; i < vq->max_num_buffers; i++) {
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


