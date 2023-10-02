Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37E2E7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLYlo9XYgH6iBcNR/XOOMljUho1Rg9mdosWEHBzdo7A=; b=uGT+3cARTEIgGh8WPbEWhj7GiM
	fQu/9v8MoPhKiIlFCrTJzVnOYSM1p/T2F6Kv3AUZ4JjWcvIrdvC4WKRXSpoDHwJaZkKkDpHbDjdTX
	hAEJO8ZHm79LH2EU/jCZdpeAgiS0RpqR16HJFoRPeuVxDfvQBZ2qsgIOnjmh8NaDOvobY0aNGCayT
	jElY9plOIbKS4JiI3ILW0gKtKZ1hlx5/Pt2ICrTfAGFB8h7rJtU+7fW+8p+rn2zzWCASvJFzh/8hx
	8WLMf1L/5Q+oZrazW4Z0OstBHxpu0J2Mv7DNzW5acoekOprQfWOUp8pefKE7UqCodx/GdrFAFaA0g
	EJxovf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHij-00Cd9Z-26;
	Mon, 02 Oct 2023 12:08:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhB-00CbDp-2w;
	Mon, 02 Oct 2023 12:06:48 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E6A57660735E;
	Mon,  2 Oct 2023 13:06:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248400;
	bh=fLRtME703ZZcICdPkAIYRy+HHmsEI0CB5+N7/vWII0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c03Ru1tYnGMpuFqjWI31KctbRJeleYz1GuYndnICw+Daiw3FIxZGlxwCDsEbjUJ1K
	 Ptdhz2+zKwmXgAWkiqJNqNZi5iwMcf/VY/ipG30ATm7B8C8m8ZycwGo9bQBkEW7dxl
	 pYdHV6sk4nWApiN5YR/lC4+yAMtAOujsu3Lt7oW994srKL4+Kwm1aLKRT2oO42tUa3
	 1ri8HXQhKTCIyt8lvRgTIfvKo+bcZdWjd3ikbpmbpKvVYAylveu9YYdVCdiAXOOxF2
	 /EzG3nDp+J1AaiSSnzElHO9JuEt+6IDhbi5PjXRwLU3dW5tO3MBvBrFe8L5ODpxIhW
	 TOP8WG4fyYBjQ==
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
Subject: [PATCH v9 29/53] media: pci: tw686x: Set min_buffers_needed to 3
Date: Mon,  2 Oct 2023 14:05:53 +0200
Message-Id: <20231002120617.119602-30-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050642_125532_9BD0AA41 
X-CRM114-Status: GOOD (  11.58  )
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
min_buffers_needed to 3 and remove the useless check in
tw686x_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/tw686x/tw686x-video.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3ebf7a2c95f0..74cd864365aa 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -426,13 +426,6 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 	unsigned int szimage =
 		(vc->width * vc->height * vc->format->depth) >> 3;
 
-	/*
-	 * Let's request at least three buffers: two for the
-	 * DMA engine and one for userspace.
-	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
 			return -EINVAL;
@@ -1221,7 +1214,11 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		vc->vidq.ops = &tw686x_video_qops;
 		vc->vidq.mem_ops = dev->dma_ops->mem_ops;
 		vc->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		vc->vidq.min_buffers_needed = 2;
+		/*
+		 * Let's request at least three buffers: two for the
+		 * DMA engine and one for userspace.
+		 */
+		vc->vidq.min_buffers_needed = 3;
 		vc->vidq.lock = &vc->vb_mutex;
 		vc->vidq.gfp_flags = dev->dma_mode != TW686X_DMA_MODE_MEMCPY ?
 				     GFP_DMA32 : 0;
-- 
2.39.2


