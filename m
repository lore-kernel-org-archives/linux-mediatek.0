Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780F9C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa0gGpZNMAqHQmNMLRw2KJGOdZocq9+DqAJPNBVbPVs=; b=S1uGELZ9D8i/yS5Vaoq0VMrC2E
	wvZ3tc9hTDD2ZCMnoDxQ4vCJUN5d+kuyf7JH2NeqWUfDOQ2td90R+yeZGkxDac00xRfY+ySZbUIQD
	/dWl3sPxXOP53e2YyvwsrYyofdTTGfJ95jsJn4UJPe8S9Zb1h5z3SiQeLERxZgNJIU/IJK6ywS2xh
	mH9yIFYy5fRX7COy/11HCscejXmEDRE6RERCKLxO58Md0utTHCzXfOzS/Ny1fyQhQisHBtIJ8R1da
	os6AuKfv5Jf5+AVhZu+yWE7tuMzm07EO3Eb1E2HHV5rnvGLeuetLifln9HkHJ1lclBfBzdmFbApjg
	pFD1pGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrkK-005fmk-2J;
	Tue, 31 Oct 2023 16:37:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrfA-005cbj-0F;
	Tue, 31 Oct 2023 16:32:21 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71A3166073C5;
	Tue, 31 Oct 2023 16:32:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769938;
	bh=+N2NXYHRMMiyUC0gb7VJb1oDXBrovxuB6Pt09SJAcIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nyWFCGJRTiLSd8jxLolK9jZdPV9nPmfSKbaQ6fsrFS27GeVj70PBU75s7Wb9gwA9e
	 CnY6GLGfAfyc7BW0SVOjCXWxGofzm/14RFHb2wXKVnF5CjrN0ye71snxb1emEKIXPN
	 Wb8MQJBLKkgDOX4CHIQ2AP0H0wSBCqLZ4RdLKQHbCxL/1qo/6nr99kmu/1tJfdPcL0
	 EGaW0Km1JuBp8sxiR5/NdieknbuV2/bf1lfRVDWFxaNAqibh84/MBqCJF4HnaZLD9M
	 z0TRPr5IbEbvfs4CMy4GA+DwvL+nnwYYZcgFlYo0CyBLuOJcmC6ciTC+ALAZx6iW7N
	 KLovdv4wnE0gQ==
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
Subject: [PATCH v14 35/56] media: cedrus: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:43 +0100
Message-Id: <20231031163104.112469-36-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093220_244498_5B099A64 
X-CRM114-Status: GOOD (  11.55  )
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


