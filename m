Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4AAE75433
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u0tbnVEtzf7uFUy5O5GUVi6lUPIj12M/GhbBAenuws=; b=3h89Al2/12bmH8aJek6DkOKKTN
	yGX4xnlbkjGpKvfKneKths3ip80JiA+WT/SgoKFXOdfK95WkOL/kIHGoVFxqYTHRykX52DOQkM9s0
	hxdS1EU7x7mTT5BcwKokwSacGkWpWVvKkpv5ephclgZuRaVEh7Dn8j5Og0V1h+g1jv+jZ/2KOfF4N
	uFAi579YmmLU7wjJMGMpE/SJa+j94XqB48snjMGQ7xFERkBL9s+CpropBbdhBcB3SABY109XPtKKM
	AKsIzP5CKcMoYJ/04d1CMuBORXgPuH8MrRbwY+qMqROFi0lHdJDpwU9znsCbjrlKQf4ZnqDBYu1tP
	gNKnOhKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSi-00E4tt-1D;
	Tue, 03 Oct 2023 08:09:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRJ-00E3MF-1u;
	Tue, 03 Oct 2023 08:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4u0tbnVEtzf7uFUy5O5GUVi6lUPIj12M/GhbBAenuws=; b=k5o8dLzKjwYFG9J2DYeYlnZ/bO
	/nUToF1/PZ9RYMvQQizVrtOuAeZEIfyE2OCY9CG9McVRl2vB4gdYRjrYmldm35ieQh2F9QrNk3kPa
	+h3wY+3o2M51uJMTrGlam6TUCZ9id0Bt2ZJUNCdYVVvEW3WlA4GHVs/DhxjrDaGI3H2VNVila3xP1
	nBuJAj5Csk79icT0uoIMU9XE0GPFZ69rHqrnL4r7E9r3ro1uuoaRtxpjNxSrc9tWeLHE0LzzmtZot
	551atgmNEho2lX9sBWA2/Ws/YNL1uBb5X/yPE6AuR2kuGsV3CJ7E62uRBw9gSuRC/BbX/Krc/7ypq
	GIrnahFw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRB-009jqq-1T;
	Tue, 03 Oct 2023 08:07:32 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D209D6607352;
	Tue,  3 Oct 2023 09:07:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320445;
	bh=rkThknrqAdahL7+ESWJTTDJdizQjBtgRoFGagWtq+LE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRogHSXPzfZ/I0k0Nzl91W9qV1mJMn+tjIirdiiHTO6dtSHaFslE+FVMvlJIYmxI9
	 wXKpJ/L9LAHZcGSrOlLuhfts7X+cAj12JTuwNQkwhv52wzqgNDEYSnoE5FSGnhFz/p
	 nJcBKyfHtwZRFP85ZukyaV+4p1Oonen2z9kenY17r8yqN2TTPkoxQtTRMkHfSxKE5C
	 Q9PeNGRjp+gge+o080sE4GFhP4PC51g5VFDANdZzlkn1Bvs+anQRTGTbSaA3ze36ec
	 JAEjM8q9tubHNNX0jJB1U8GBAXz91081XKBrEhVpbsp8gM4iFn8gaiogKM0u/kuzRp
	 7BV8HRejDxrCw==
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
Subject: [PATCH v10 23/54] media: dvb-frontends: rtl2832_srd: Use queue min_buffers_needed field
Date: Tue,  3 Oct 2023 10:06:32 +0200
Message-Id: <20231003080704.43911-24-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090728_085791_0D64BC23 
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

queue_setup checks for a minimum number of buffers so use queue
min_buffers_needed field and remove the check done in
rtl2832_sdr_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
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


