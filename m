Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D5E7543B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBIVbW4WLQCv5IssZ+dxuNiWdgjFxHzgD99kxkSCzJg=; b=21hJiAHB0/sEj9ScSQZ9vs8Os8
	E/4mxoPi2u8uelF6CsBMXpiEAAsQse2BLSgwTzx/t09sjrfhfMztvnYKoorVpnKJGHr1iKKtw2dtg
	3hU6BfBydOvcMjO/UspPpbA0H25cZ3vL0sTB0zQ4r80T88A7XPBowgPPvhjZKUvo03JUIaS3uIByA
	zTMb+opr6fhIbgvzhnvfAEQqAC2fHiGFZTJuS+6OI/DQqvDRZ7N+xDnWrgFrT7yPeGDed6vrkNhS1
	3E+H6zMqZVg4kQyH61oXDTK22qbU9ZdV0fii8SBLsdIowmixEDwGLZ+3uK0cu6+J8EMpbfzA4oe20
	cpaUzttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTG-00E5dK-2Q;
	Tue, 03 Oct 2023 08:09:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRI-00E3Kw-2b;
	Tue, 03 Oct 2023 08:07:37 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8998D6607370;
	Tue,  3 Oct 2023 09:07:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320450;
	bh=H1GfOB6mMJ44+7OCOGMjuo+dWjaU6UnQ+DdGWJmRb1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XlWAfaSTXg87NJNtSL7sLxzjqJul6QYunE6ahi5vV4Uwkf8VdGmA6gNwUHl4ixPNc
	 64TU1XdVJe/F/b9nWagYg5XjyPn8TM+ZxvU83snjR6s8wHawbsVbGsb+F/2NBWlBd7
	 VcLlJP92mf3JlSsS/7D6NBjoyMppFVRewnSWN8r7sFGQed4yJlfoQSBRNCiqYuE948
	 0Idvq+NpO8ypyvXkhZ6YYkFKQKKjiw8iDg5mk/mProNOEeyCl/3kqg4gSjYcPuYQXx
	 YI1swEP1ce5FqXJJPH06LBBS2LOrOqnOZiI57yfHm7iGK9dXgsCM1Lj8Za4iaHCpD8
	 PiCRmsiXDx5Pg==
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
Subject: [PATCH v10 34/54] media: renesas: Set min_buffers_needed to 16
Date: Tue,  3 Oct 2023 10:06:43 +0200
Message-Id: <20231003080704.43911-35-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010733_000142_2C51297D 
X-CRM114-Status: GOOD (  10.54  )
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

vb2 queue_setup checks for a minimum number of buffers so set
min_buffers_needed to 16 and remove the useless check in
rcar_drif_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 292c5bf9e50c..bb84fc089d5d 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -425,13 +425,9 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
 {
 	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
 
-	/* Need at least 16 buffers */
-	if (vq->num_buffers + *num_buffers < 16)
-		*num_buffers = 16 - vq->num_buffers;
-
 	*num_planes = 1;
 	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);
-	rdrif_dbg(sdr, "num_bufs %d sizes[0] %d\n", *num_buffers, sizes[0]);
+	rdrif_dbg(sdr, "num_bufs %u sizes[0] %d\n", vb2_get_num_buffers(vq), sizes[0]);
 
 	return 0;
 }
@@ -1310,6 +1306,8 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
 	/* Init videobuf2 queue structure */
 	sdr->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
 	sdr->vb_queue.io_modes = VB2_READ | VB2_MMAP | VB2_DMABUF;
+	/* Need at least 16 buffers */
+	sdr->vb_queue.min_buffers_needed = 16;
 	sdr->vb_queue.drv_priv = sdr;
 	sdr->vb_queue.buf_struct_size = sizeof(struct rcar_drif_frame_buf);
 	sdr->vb_queue.ops = &rcar_drif_vb2_ops;
-- 
2.39.2


