Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974ABE82CA5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX8R6FNAbkZWYkueMBme92XT1wQcqt/mdQigvZGLeSI=; b=TwUANThwr2/mVDAt2NHB1W1m6v
	gGpJv2IMO6WVYf5UIflVp1SwmHgk5gycyTE/gRI/tyhIaXJ6z/RNBbI1KjvJz0p1ckWRYjsNutTbR
	YNe1uOt10/EFhfpyqMNL124+QOHmF7w/Stj3ZdQRekRqgkaZ2zeh6hDOBHEdkIxFCvhmZzbrv8b9n
	Ho7wrsrZCNCtjIieNfWx8XAkL1OGninR5mwTTcB27Z1ZGWNzZMpAJxb+5/rNwxbGdDSx64lMl/4zf
	O4KFw0oLQn/DX8jSM/6bPS9ibudUYnyfA16NitctnhTGMPjF3p/la1TlStX5qJWVL9E11DbJIEX5W
	VH4K5CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWeF-001KUC-1C;
	Wed, 27 Sep 2023 15:40:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWac-001Gj6-1p;
	Wed, 27 Sep 2023 15:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VX8R6FNAbkZWYkueMBme92XT1wQcqt/mdQigvZGLeSI=; b=Y8bzOwCM1rfYdB6vFQCp093ibd
	dBEJ+ErzFIUjsDEBqAqIC5cv2ofu4C8aVci1fj8vGm81rhFiZ9j7gkzQx+2IHWy4r3uPKbw5mb3mx
	GcRvzGo930wQbxheYB7PIgKXicXjnZv7GQtxXVk2/wK3jtcs/ME5znrrLa7J0B3AIJf+WWF0pglNc
	R9qhp/IZsz/C768XGw7d33n9iMG7E+4FwjX4W6AEl7tX09hWmIwsNRkYmwampgTOZ6QADThLLWwZK
	x1EvCEJg+g5+IaOXi1dNWAr+J9BibilehtVriYKhnsU/86AGXvIHKvfOcclFiKeppFDZYwVCqtIxv
	gatJUgJg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qlWaW-00EesW-N4; Wed, 27 Sep 2023 15:36:37 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 949A4660737E;
	Wed, 27 Sep 2023 16:36:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828991;
	bh=KSp/qlyb4qZpMVJTjYq3/CPJYCUJtKhZMjqFSVLO9ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9XT//pNSSGX4LBSeOtPtJ2TABK4QPyHBj8m9jujd+0oex5aXQ0zMxDIWGrVPGorv
	 Aobtgq32zoxra+5/8mNmyXZI6FOTEbCKJKE4lkG7ujWT/aZ3Xmb9D1+X7hGthonSNK
	 KqD73NIkD3KNFkMmgT4l4UdAdyLdVRc7DIyzryz5LoWjUs8VWVwywEXD1fCQo2pxj9
	 J9NXBfBjNx9DeHxEDCZfYa9ajxh0z6SD3GWBPieNnTh3MLCSRUJ9MaLTPy6L1IzuQg
	 EfvBB/dEYI00LXxpKvILsOk8Z1pNqKWt+tPJ/8oms38l4MRWCF5As6rlMNoz34ujTl
	 D7FUba1Aq56sg==
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
Subject: [PATCH v8 47/53] media: cedrus: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:52 +0200
Message-Id: <20230927153558.159278-48-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163632_793824_055F0C73 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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


