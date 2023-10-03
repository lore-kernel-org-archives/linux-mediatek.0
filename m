Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10514E75440
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDL5gETzUiP0VzZZCijO3U9Zzi9a1aLBhnH2wBWpEGU=; b=RoTY4ghN+TvqZ6+1WOCZrrzPx8
	qHY4LHS79ndCGH22H7dK7arxpFH2m05CzfetZC7YJPrkQgKDNn6ULKW2UGE1a8QPlrdbSDpGBaZuM
	qXIM+LwX8ervjgG+GLSvMn4+19zPWZntpzwS2p9yI0/mZqaldPlvwL3qlT/u2IAxc2a2aY8ZFi1XX
	UkjqnWKmuj5o9XNYwt8pdcsuAY/HEdschXn9SFJWcbCMj3cGz7hl4IKKs58tf4VamUfofYvz/xXM7
	qQNv1RU7exd/dcPT3RjfGO8MjzV4Gr+YkumgRr6NjhifbjMal9vOZ88y1R19Xa2bSC6VcH0dQKRYZ
	yrOmbU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRg-00E3nd-2K;
	Tue, 03 Oct 2023 08:07:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaR7-00E37H-0s;
	Tue, 03 Oct 2023 08:07:24 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0815F6607327;
	Tue,  3 Oct 2023 09:07:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320438;
	bh=EMKVWITArl2PHuWHDFd/NcTii9pr6T7GjKNa1Tuop1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmoMadL0VYQ4SO1f0mqwTSSJuVhOVa2F5V8ainkhDJ3Gc15tRKgEgwBrP4dNbh2Oe
	 OYtpscwSB22G53d8eFo6E0/gChSHp+pidlJ1RtOqTfWPL7ndL5jAYAina3hdZQP4nF
	 aI9+96EtZ3QpaPVfoRhYzYUlPlK+3CGxXLCUumgXMd51oVd9pNYCBXNRgtm3xv+8QN
	 NZTEMBiholN7iWq1tzLqAurHwgADyErv2n4FGGOUWhJ7nMMS7+bDhKarpKFNyKnH7F
	 UI6Ik7wX17W9PRbD8acaTOqUkjqQWqpA+ji0IT13tXUy/gosNDqNpuV9W65Sh+gjAU
	 jArFZr9pvW8Ig==
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
Subject: [PATCH v10 10/54] media: dvb-core: Use vb2_get_buffer() instead of directly access to buffers array
Date: Tue,  3 Oct 2023 10:06:19 +0200
Message-Id: <20231003080704.43911-11-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010721_443054_6872DD09 
X-CRM114-Status: GOOD (  11.87  )
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

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/dvb-core/dvb_vb2.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index b322ef179f05..3a966fdf814c 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -355,12 +355,13 @@ int dvb_vb2_reqbufs(struct dvb_vb2_ctx *ctx, struct dmx_requestbuffers *req)
 int dvb_vb2_querybuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
 {
 	struct vb2_queue *q = &ctx->vb_q;
+	struct vb2_buffer *vb2 = vb2_get_buffer(q, b->index);
 
-	if (b->index >= q->num_buffers) {
-		dprintk(1, "[%s] buffer index out of range\n", ctx->name);
+	if (!vb2) {
+		dprintk(1, "[%s] invalid buffer index\n", ctx->name);
 		return -EINVAL;
 	}
-	vb2_core_querybuf(&ctx->vb_q, q->bufs[b->index], b);
+	vb2_core_querybuf(&ctx->vb_q, vb2, b);
 	dprintk(3, "[%s] index=%d\n", ctx->name, b->index);
 	return 0;
 }
@@ -385,13 +386,14 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
 int dvb_vb2_qbuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
 {
 	struct vb2_queue *q = &ctx->vb_q;
+	struct vb2_buffer *vb2 = vb2_get_buffer(q, b->index);
 	int ret;
 
-	if (b->index >= q->num_buffers) {
-		dprintk(1, "[%s] buffer index out of range\n", ctx->name);
+	if (!vb2) {
+		dprintk(1, "[%s] invalid buffer index\n", ctx->name);
 		return -EINVAL;
 	}
-	ret = vb2_core_qbuf(&ctx->vb_q, q->bufs[b->index], b, NULL);
+	ret = vb2_core_qbuf(&ctx->vb_q, vb2, b, NULL);
 	if (ret) {
 		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
 			b->index, ret);
-- 
2.39.2


