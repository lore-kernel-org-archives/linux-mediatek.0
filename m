Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4E2CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vielkOJMqA0ytGuj4VcIXvslkPviGgJqqY/Lasa6Ho=; b=4ZcFZkXWEGj0V/vf5LcQevuZ1B
	da++xS8Y2VPzxL4vNFKvKEvIqHVDGiQeS/lA539+QKV0/nUeokJLQtvaiNezlPC20DW+5KTgNqm0q
	NMcc4Gvzl5EGfvy7gapbHMYhm83aTpscn8jPFqfPHlpJGRLX9yBx9DzFVLjtiCivds52f9Lb6kks0
	gs2jpBZ9uPYQwIH0sERkIt8EPEzvM7Z6K0jgQ59sYdZTHvWaCjT1EYU1SmmJ3MnB5elFw1t0eESYW
	kEAGRee7riUN3fYMNBcERtMVEKwduHWv3i6sh1z7reZjBH8GqnhggDPII6n0GzOiDf6ZyLoO6K/Oa
	B4VtzoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquBX-000pjP-0b;
	Thu, 12 Oct 2023 11:48:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9f-000o2T-0C;
	Thu, 12 Oct 2023 11:47:07 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0498A6607346;
	Thu, 12 Oct 2023 12:47:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111220;
	bh=GJfXFDdnhGS92TEmv49OanHL2tR3kTI5Ce9MknjELEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=US3th3hfJtwGDlltn2tiBSpDfxGx696Sr4C++b8Vp4MPXfcZqMEwbSfaaD3yrDLQn
	 ufgqhY8RxztnDKdXxSgt1e+ud+vbz5XIulKShZXOJVWfSt+fPETsPr69q6gCInhQhf
	 dX/yL89aJoMkPkL8lUhUst6kNCj0QPfLcZ1cxYsO8l/Sans2SmFtPXnH3MucvNnv8E
	 9vdQLAEzA5AXM8l5gOcs23ki6ZcRwA74IaJcscWjaVxYGPuIjxxSDHAcsJylgEooEl
	 vd0TArlTOjDYzSKUm9vo/1wuMvFUxbuejc44WJGvQh+zP8GiKnn02zLSoadhi0l3lX
	 nUjMPXE/xlg4Q==
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
	Antti Palosaari <crope@iki.fi>
Subject: [PATCH v11 20/56] media: dvb-frontends: rtl2832_srd: Use queue min_buffers_needed field
Date: Thu, 12 Oct 2023 13:46:06 +0200
Message-Id: <20231012114642.19040-21-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044703_235547_317DACD1 
X-CRM114-Status: GOOD (  10.70  )
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

queue_setup checks for a minimum number of buffers so use queue
min_buffers_needed field and remove the check done in
rtl2832_sdr_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Antti Palosaari <crope@iki.fi>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 02c619e51641..597b1548ed8b 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -440,14 +440,9 @@ static int rtl2832_sdr_queue_setup(struct vb2_queue *vq,
 	struct rtl2832_sdr_dev *dev = vb2_get_drv_priv(vq);
 	struct platform_device *pdev = dev->pdev;
 
-	dev_dbg(&pdev->dev, "nbuffers=%d\n", *nbuffers);
-
-	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
-	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);
+	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
@@ -1364,6 +1359,8 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
 	dev->vb_queue.ops = &rtl2832_sdr_vb2_ops;
 	dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	dev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	/* Need at least 8 buffers */
+	dev->vb_queue.min_buffers_needed = 8;
 	ret = vb2_queue_init(&dev->vb_queue);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not initialize vb2 queue\n");
-- 
2.39.2


