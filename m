Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3292E75437
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLYlo9XYgH6iBcNR/XOOMljUho1Rg9mdosWEHBzdo7A=; b=aH15qnJ+sb3GLcme4h2Br8JSMk
	edqLzjH8w0rEh641Bsk/Ihd/FtKX8MGvSgy0ckYcJaS8WKcX9ArQG2zoe8cg9EaoEj8u+oyXNctkw
	sq1vAsYGt7o34zEDc7NM4O4LMQngo8JddgZ2LaPEQL3DfPjZZKWlu7q4OC2U4dmuqzJgKBeqHuKh7
	a//BSGW/oUfyRrq50mIPB/rF0gM+9+9Iah85rogkc1pYLg29E3RJajkOrdNkm3xpax1F7D9t4+U7n
	BvH4+dHmkyylGtrNSGFxrvnqW1pIc95seM/bxIo/HqTdk93dYvxtHkiAcY0aBGsbuJkJtzamVsc3u
	5ITEMX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTT-00E5z4-1D;
	Tue, 03 Oct 2023 08:09:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRP-00E3Ts-2G;
	Tue, 03 Oct 2023 08:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QLYlo9XYgH6iBcNR/XOOMljUho1Rg9mdosWEHBzdo7A=; b=JHlOJhYBASdK6lrpmG6O3Otobj
	iAg0WiuBKO5hpMGZMmgRDNHrCSLy7AQeatOixOXnSCsO4B6qDZ4pJxy+O0ghJIlqFE/W/WcSv8DZL
	WnFGkyyHFwZpAwq8llxJM4GGjNoPFuanywDK0qgv/83+tsITmgCrj/AT4wbrZgufChKa8inPHskdy
	SzD2Gqql9fokNBIfDEWqPNcLyCZWhXIKsVM/+k7Szsf2bO8rgCBslxWi4/Tk5n80ZG9/weXclhwcl
	XGbJ1bMnzWANSxOEY99EEIeps01XMtFdZc8TB3bQiUWjyA7oEzW60V1Rngz0C4oZooALkoDdiTQHj
	ZPslfxJA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qnaRK-00DuGH-EP; Tue, 03 Oct 2023 08:07:38 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E97B26607365;
	Tue,  3 Oct 2023 09:07:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320448;
	bh=fLRtME703ZZcICdPkAIYRy+HHmsEI0CB5+N7/vWII0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j7Bq2gtVDBhG9iQjYBJ80RtnofhcA50IlzJC0yCXhO2cOrKNN5UBe9owntP7hRBrI
	 k0HktMWXpaon0mnJO+nbeTF28WFt5Z2T8r/Vd8fynoJN/5ONlerRvAIgxhQcHurtNn
	 8c1kAbmaR4PFESyeY7cvgkF0qFaz7GXe5Xrm3HoDGvUb9T89BhAU7/5yvIIUxAfvU7
	 pMERitgw0waPxTdRigtrOQGAlT5AZCB6YmWWmn9586VeI3S6KNjmIZIiWCvuW8kXRo
	 3oCgWettXC7D9M4flcyRJEtpJMqVoihVcxBDkhZFm0+DyOIl6EIJYNtNWJH19KKPbh
	 AWH5LSiEkw/mw==
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
Subject: [PATCH v10 29/54] media: pci: tw686x: Set min_buffers_needed to 3
Date: Tue,  3 Oct 2023 10:06:38 +0200
Message-Id: <20231003080704.43911-30-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090734_935266_6B3B30E8 
X-CRM114-Status: GOOD (  10.53  )
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


