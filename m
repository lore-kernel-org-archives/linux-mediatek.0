Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168CDEEAA42
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTqy2pC04+lk+/eoSQ19afzHN9WljXx7c9EzRlHGO24=; b=ns+pBZggtDHl8mAlPZM2WSaAO1
	b1dWXouowUQt5P+A2aPeVSMfDNZQxwHKk/NjDJUGyJuAHeJmPrM7OWf6Jf7b+4hBzegDCuJ/1Idqs
	S9s2LfF8UsHyZSFe6b4hfOQR/kFXlqsJIQtFlmuysYiIryaGQwXgZIxfhMetPgvCIvpGV1G6CxOHM
	2kWUs3oC3zG2nGKLcU/EIBXV9joLtALsmwuWl1XQJUQAwUpITQ1qagEVeApSaMLMUD+ICuOdR/DHf
	1Q0r2XOfGA+RzN3kMlHWiqTlxbeYzK0fCTHOUngQYUUfnGJFeHlFzNT69sxx3ivOPEWTUKajUU2EB
	OwivlAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmX1-008W18-2P;
	Thu, 14 Sep 2023 13:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTo-008ScQ-10;
	Thu, 14 Sep 2023 13:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JTqy2pC04+lk+/eoSQ19afzHN9WljXx7c9EzRlHGO24=; b=aoDVk0mzPBG4oBg5GntCp0FdcZ
	swBbhcbY3ZQDW0V3xsV1T5nkFXzlk76P7iqeyufYhFXZATLzrFIMdVflmtdCINwRey0va1sXcjs8M
	OKkRW6sBG7e4T7iijbraWH8lyADZE8DYs8Nz/tgv73hmraERH6h/Ie52Lc/3hSEL7KytIYJd7MFdc
	BhOtf8nkDIItsMfhi2xi+4HVyzFRxFKog9xI2PteSvGMZoWYlTWIucnhTvg6Nsry7dDAiPWcQTPsI
	XFNKwfqi+1D8e2yXpVO5GC2oj0xee85BncnISiHXmArYLqwhiZ49Se4e3+jZE+msbNmvTyzbBk5P7
	SPv2e7vQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTi-007ul5-1Y;
	Thu, 14 Sep 2023 13:33:58 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2AD386607397;
	Thu, 14 Sep 2023 14:33:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698434;
	bh=yoC4Zwhq5KTur5ZjSqFZrMNs6UvSbNFXWhR9MCqzlE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EN1kyPC5ZKZ0JvmFCHlIc1mglG9qMNrLetcPCcD67N4xE1hTklCKDCBTvVfTSBYtU
	 4VNAqqLMDJojsiDBr9PfSg4Kt/L5wOkzMHIp7Usvkg/OS+8DY4qa1pvR2N7afmXPyC
	 NPow5YjSKRGIxTyvDgTgfOMCCa1zzZFqt6bl9BATFAck5lp7Bimj7Aas9Pf+8xC0Tq
	 3NLcbDX6LdHM4Xmh6JOa78HIpfZYGLmJWaZHRQGjuXwOpDpMKaH5y5+d9U+DCk+m8K
	 9ABes+Pt0cxXhdedx+kGDyyVz/RVHpy946pJKhtX/sNhAZUv13kdwss33nLLep2094
	 cH5Qa5D0y4jKg==
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
Subject: [PATCH v7 44/49] media: cedrus: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:18 +0200
Message-Id: <20230914133323.198857-45-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143356_201537_0E88F4A1 
X-CRM114-Status: GOOD (  11.45  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 4 +++-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index dfb401df138a..bbe5802ea861 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -649,11 +649,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 	struct cedrus_dev *dev = ctx->dev;
 	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
+	unsigned int q_num_bufs;
 	unsigned int i;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	q_num_bufs = vb2_get_num_buffers(vq);
 
-	for (i = 0; i < vq->num_buffers; i++) {
+	for (i = 0; i < q_num_bufs; i++) {
 		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
 
 		if (buf->codec.h264.mv_col_buf_size > 0) {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index fc9297232456..533a38316686 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -865,11 +865,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 	struct cedrus_dev *dev = ctx->dev;
 	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
+	unsigned int q_num_bufs;
 	unsigned int i;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	q_num_bufs = vb2_get_num_buffers(vq);
 
-	for (i = 0; i < vq->num_buffers; i++) {
+	for (i = 0; i < q_num_bufs; i++) {
 		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
 
 		if (buf->codec.h265.mv_col_buf_size > 0) {
-- 
2.39.2


