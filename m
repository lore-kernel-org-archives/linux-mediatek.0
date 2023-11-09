Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C996C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fVDZ9548ij6RrHBZZ1umTUIm9WD1qTw3ZAOz/aG7Jw=; b=W9Hlg3g4dMvrrM3y+TEKU44gkm
	jYJCI88Z/Axc7O2uwbsU8o/kzzcK7mUNrthlOcDCnyq9sY5HP6hfhDBj5ArTDlYQZw8D10+WmCxqz
	DgsDpkqzmcGkHc1n7HuI1paDRIwwzL7eAfnAsbLOhI8aKKNTPu2BkgLNFLfYOWJbFEBj8io6v8dj2
	vse5T4+nrzqpQQPQ08awCSvcw/mI8LBHiv/ndRZM/LuO8Cc/JFZ6pAth0Cy8AFbVZJwX2o7yE8oUH
	IIMRy9nDrgShKXoFYBRYNk0XHo2/sUabe5340o+bHwFg9X4BIQod/KIMp834x0xJAWWr+W1GKa3jr
	o3Qdpszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r184j-006nmk-02;
	Thu, 09 Nov 2023 16:40:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1832-006lqL-2K;
	Thu, 09 Nov 2023 16:38:30 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3DFBD66076B3;
	Thu,  9 Nov 2023 16:38:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547907;
	bh=NppHGvNMzHpeRnryqExvoNEtSwathlR3U98iRKn31sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7xor/DTJ1HNHWgjz51eI96QO91oXdYe8VGOhJ5b4tQRdfWTVn6Nsw3D1jgU/TLvC
	 jZibvjE9X2vs80fvj8IsLyE/2H9qHE7Vn9XtQmhtkOZA3k6XqGtTKVYCt3RT9uClN/
	 GyR0blOiaGfwZcksojyLH4kp6bzc1GPB1ST6ewA9nau8+d348dVMhD05AV57/UBBv6
	 jcUKh3XvqfKmpBNo2z6tui1SEfOmEzQuUyGzu+TDj2AOQhCld2dT9yvXiWHgGscEZ1
	 NjkbqKKz6FSnf9hO1v1+JkVvLBTzSFy0zhMRnPCDwuKm7+wAEz+UxWGBOJ9Us0AtXE
	 IE0g9XmMWl8fg==
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Antti Palosaari <crope@iki.fi>
Subject: [PATCH v15 41/56] media: usb: hackrf: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:34:57 +0100
Message-Id: <20231109163512.179524-42-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083828_905408_2D0BF5C3 
X-CRM114-Status: GOOD (  11.19  )
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
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Antti Palosaari <crope@iki.fi>
---
 drivers/media/usb/hackrf/hackrf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 3e535be2c520..9c0ecd5f056c 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -753,12 +753,13 @@ static int hackrf_queue_setup(struct vb2_queue *vq,
 		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct hackrf_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(dev->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
 
-- 
2.39.2


