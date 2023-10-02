Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924E1E784B5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3nndBmOIa5aTyPdxH8URZ6RNVydaSV8aLaykgwN9r0=; b=w78l5oqAcpWpwDou3yI7c7MC6b
	+jWVkdU88VrXxNgSUVdnL8VmDcnnCO9CCLwZyZEHxGmTdRA0yTUGAHdsk34XCz07il74Rbk9ypJ40
	V8hSEJJbBkrv+XjpwNH2f7Bjq61tIlv4bQRLpu+N4xRaw+7H6PcgTTj6gansOLllz37TaMtJBhoeR
	MGy4XnjHWue1eh4m4vF7pyVCXtIKlodhRqyJlwqBXufnt/bPUi6dlSG11fc7PrYu/1GrNpqLHCCwK
	8jwO8ELZZm3ujy+pPIpESz9O8fPqlYsUWTl3ZhMeejqy98vP7M4mPa5v7qWc3mgHmcjjXSD9r3/6H
	nclOar1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkN-00CfLH-04;
	Mon, 02 Oct 2023 12:09:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhX-00CbgN-28;
	Mon, 02 Oct 2023 12:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=u3nndBmOIa5aTyPdxH8URZ6RNVydaSV8aLaykgwN9r0=; b=CkcD3M8Lh0hlSTOUDeRU045BCm
	Zb5gbca0c8SW0Iq/01k8Hc7i82jmuHccW84SpOtkcknqYm3EegQ1PC5AgoQ/qwTHH1f7njEf2QWdT
	nht/caU4fMBNLJWtYKD67rr46uhMI7RRIdpNhv3T4D30CG0dXCUPSSzys+HHBpykW6egpsp4aE3Nr
	kTD0NuzwuaBi+IcyHNcsKytLlStq1Ykux71Rncs5g9/5lJD2o7ElmXgTTyXMa9rxS1a6S1Qi9DA4U
	C0f1NMW8x/tTKdB6GAMRCkXLxDwkq0JP3E40e02f7X7ZIQ+kKd7W41Z1+0q7RA02BKFlg4rAqPjhg
	BMPeQ4gw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhL-0090Ro-1O;
	Mon, 02 Oct 2023 12:07:01 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CE17660738D;
	Mon,  2 Oct 2023 13:06:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248410;
	bh=ab3b0OnRgwE0tLcrbw3ezabANr7f3bguMXcLjpsSnBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUzURIJgF2X3CiZYQcFBU9DwTk6hOQTEp8ajqLhxSjnJLLik+662uPT1MFD6S5Ycm
	 +KeL402Cz3X9esFjhVCgQW+NDOtg+LIiRTuJZPBj6e4Ck2tPuyJLBFfWso0bcKlhI/
	 9u8PvwrI6+MA4sNJTITeRVreIbm8VJLqHUXKFjePse/pCrk+tldbte5FxScZAArVBq
	 KuWgvrd5FN+9pS+Z5JC6udbyWxnJP8M7CnEYL6XxR8lqNiWgQ1A4MnPr/MsB1XuGzr
	 EIzUTuc5JR3C/+YzzmNY4BW107tVWBp4HOGIQBJvqGbxQOOHHWAjCP09mKZwO9+zyF
	 WQFVXzHjMaIrg==
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
Subject: [PATCH v9 47/53] media: cedrus: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:06:11 +0200
Message-Id: <20231002120617.119602-48-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130653_252194_1C43933C 
X-CRM114-Status: GOOD (  11.73  )
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
version 9:
- run 'test-media -kmemleak mc' at this point of the series without
  problems.

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


