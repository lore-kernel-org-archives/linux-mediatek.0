Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3CDE75439
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH2S6ZMYTSuMBfj/bSmXs0tW3siNrN6r9Aflom22WvI=; b=IliBioZCL2uBD8KSSKvoDyoEoN
	WebaHQRl+M1Gq1RgsNqPCnEMf5SdtB+Lpn/4xsJ1d1yhqRiWvdZsNafVdO60PF35KrMf6y+4P81zC
	lmnpg1rcjYis4CHbX5C4MuHKvhmKHPO6zRWrVE2YY0em1/aK7fZgg1rWlWjUy6Y0rvZoEutH0Fkem
	RC8D1i7DPHFNz1ahRzJ5yybf6PRSLkXc9plYQAvT5okK+YHO10CcBYw8uMoWfZZapC0+dED+F6HPd
	r/tpu+uFlW6KG1xNcfAi1cDrdHQWg7txHgv8krNvotu/qojo6sm/jPKONLbz65gOvbgmB0uB3WlgM
	aDJ8Lb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTF-00E5bn-2R;
	Tue, 03 Oct 2023 08:09:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRN-00E3QW-0m;
	Tue, 03 Oct 2023 08:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wH2S6ZMYTSuMBfj/bSmXs0tW3siNrN6r9Aflom22WvI=; b=AGWA556Sb3Lq4LW4nLSiD2QpOw
	HpAC5yTmdGkGp3oTufWnH28QmB49wQYo7rQb1qZkzF/dq4nVGgm6Gw0P1dl8PKRgPotWxZJ3nkOF4
	q1YZVinp3FYlTXPgTcJGaoQnAA0EjWt6l4GbbBnRF9E1qoXpGdORBFAUd+ZS5O5M+thSx7sLH+VYp
	257DIb/QrDu04g2jAov0r5DN8ff71WqscFww2l8dj2kVLEmvd2N46A6J3tcNJVCPFuvQa+fnCN4lr
	RfTlzR4byRR2RGtXgzRjCAAHc1VG16H+2lkodNovUq2zCTTrvcXWn/tvp5zd6uD/aHF58hLI8icTN
	dr8aGnkg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRH-009jsv-0y;
	Tue, 03 Oct 2023 08:07:34 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 139D16607372;
	Tue,  3 Oct 2023 09:07:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320451;
	bh=N6G4XfbycDnQUCOa7KuKCVKXaGxpGnmE1Di5qhpdnGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ous9vBJXl4Is8k+bDEceHHXnDJnaHLB7Oorw/14K8akp/zMks9AqOP3lRsd126Kt9
	 +EjWLKH/FSWgP1v18KVxw/UzaiqPXWG6kbv88zNYQYAEVq1cw2wEEIwWcRfgCh88qz
	 0A+b9vCH5C0fzq2ZqoqC08JOCQJnBbuA7ywbPPQQGub8YfO8qkRVX+LbCTH4+Hclyr
	 BqXIrPFwN9G8alXmaWZe52HupIqpPx7WgnsjaWFWRl92cX/pmM65fYxNwnCs9E9BVz
	 mXW/gQPptwYNpMIXqPP9ti0tjIEugxEyaaOhVhRbyXJDbDlzn4kBpioDuhAqipTwoW
	 06/bGG5815YrA==
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
Subject: [PATCH v10 35/54] media: ti: Use queue min_buffers_needed field to set the min number of buffers
Date: Tue,  3 Oct 2023 10:06:44 +0200
Message-Id: <20231003080704.43911-36-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090732_926346_18216932 
X-CRM114-Status: GOOD (  14.06  )
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

When queue min_buffers_needed field is correctly set vb2 queue_setup()
does take care of it and we can remove the checks from drivers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 7 ++-----
 drivers/media/platform/ti/cal/cal-video.c        | 5 +----
 drivers/media/platform/ti/davinci/vpif_capture.c | 5 +----
 drivers/media/platform/ti/davinci/vpif_display.c | 5 +----
 drivers/media/platform/ti/omap/omap_vout.c       | 5 +++--
 5 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 5fa2ea9025d9..80a74ee59bb9 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1772,9 +1772,6 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
 	unsigned size = vpfe->fmt.fmt.pix.sizeimage;
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	if (*nplanes) {
 		if (sizes[0] < size)
 			return -EINVAL;
@@ -1785,7 +1782,7 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
 	sizes[0] = size;
 
 	vpfe_dbg(1, vpfe,
-		"nbuffers=%d, size=%u\n", *nbuffers, sizes[0]);
+		"nbuffers=%u, size=%u\n", vb2_get_num_buffers(vq), sizes[0]);
 
 	/* Calculate field offset */
 	vpfe_calculate_offsets(vpfe);
@@ -2233,7 +2230,7 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
 	q->buf_struct_size = sizeof(struct vpfe_cap_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &vpfe->lock;
-	q->min_buffers_needed = 1;
+	q->min_buffers_needed = 3;
 	q->dev = vpfe->pdev;
 
 	err = vb2_queue_init(q);
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index a8abcd0fee17..924465b37e5f 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -604,9 +604,6 @@ static int cal_queue_setup(struct vb2_queue *vq,
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	if (*nplanes) {
 		if (sizes[0] < size)
 			return -EINVAL;
@@ -616,7 +613,7 @@ static int cal_queue_setup(struct vb2_queue *vq,
 	*nplanes = 1;
 	sizes[0] = size;
 
-	ctx_dbg(3, ctx, "nbuffers=%d, size=%d\n", *nbuffers, sizes[0]);
+	ctx_dbg(3, ctx, "nbuffers=%d, size=%d\n", vb2_get_num_buffers(vq), sizes[0]);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 99fae8830c41..8a4cc62cf562 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -122,9 +122,6 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
 		size = sizes[0];
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	*nplanes = 1;
 	sizes[0] = size;
 
@@ -1428,7 +1425,7 @@ static int vpif_probe_complete(void)
 		q->mem_ops = &vb2_dma_contig_memops;
 		q->buf_struct_size = sizeof(struct vpif_cap_buffer);
 		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 1;
+		q->min_buffers_needed = 3;
 		q->lock = &common->lock;
 		q->dev = vpif_dev;
 
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index f8ec2991c667..6fc32314cf9c 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -122,9 +122,6 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
 		size = sizes[0];
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	*nplanes = 1;
 	sizes[0] = size;
 
@@ -1168,7 +1165,7 @@ static int vpif_probe_complete(void)
 		q->mem_ops = &vb2_dma_contig_memops;
 		q->buf_struct_size = sizeof(struct vpif_disp_buffer);
 		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 1;
+		q->min_buffers_needed = 3;
 		q->lock = &common->lock;
 		q->dev = vpif_dev;
 		err = vb2_queue_init(q);
diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 4143274089c3..72ce903717d3 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -944,10 +944,11 @@ static int omap_vout_vb2_queue_setup(struct vb2_queue *vq,
 				     struct device *alloc_devs[])
 {
 	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	int size = vout->pix.sizeimage;
 
-	if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_NUM_BUFS) {
-		*nbufs = VRFB_NUM_BUFS - vq->num_buffers;
+	if (is_rotation_enabled(vout) && q_num_bufs + *nbufs > VRFB_NUM_BUFS) {
+		*nbufs = VRFB_NUM_BUFS - q_num_bufs;
 		if (*nbufs == 0)
 			return -EINVAL;
 	}
-- 
2.39.2


