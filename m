Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24555E82CA9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u0tbnVEtzf7uFUy5O5GUVi6lUPIj12M/GhbBAenuws=; b=aVIY3soetrmdWqWXnV4schMdy4
	k6YCTote+Ab886TeQO7Q4T31NpRR0j+5iIwHYlucY8D40Ca0ju5JTMdQmJtVV5Z++EIArY8B/noi1
	8vyL1R3Na3+xjZCBwf3+z5aAfGBWFKc7AI8RV15TE9J0ddcQF07QnPgFUt6XzkhZhtb6W1Wp0U4PQ
	Dlg+kAB4f593PwQ8LrhUz8V/UKTdp8HrBU7WosT+0v0sjkaAXJP/JZNp3k19tD+Q0ItiVnxPc5FJc
	kmgbIPxEgjYmIDMz0sRnL+gjz5FjPzU3DJjbvA7WVwXh3TQ3Ypwu0ZkradWywNOuKAJde1pN98qfG
	TMG2xEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWc5-001IPc-0L;
	Wed, 27 Sep 2023 15:38:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaK-001GNt-04;
	Wed, 27 Sep 2023 15:36:25 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5875B6607352;
	Wed, 27 Sep 2023 16:36:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828978;
	bh=rkThknrqAdahL7+ESWJTTDJdizQjBtgRoFGagWtq+LE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DnKeeyUe2dD+FuHAZqX29h52sOHknpk95AAm30mGS5vC9ZvubNPU9yWIY2li0X4+p
	 WpwwRmNnQyUu4soZMxzfdiIXGf6XCv9slZ6Q7CL2tTvuTtyB/usrbo727gSJ+pytK1
	 59eHdaKJ7AqXdFuT+QLEUNghJECOU3926PKvW2rb6vuTJRZX+k9yw+A7epCx9hHwez
	 iT/B7SvF6amthuUul1WIyd3/Lch2V4tKVNeADlVE/SEYw7DIgXke9peatrmpbMC6xS
	 Wl3kRTpZFSyIZG1Hg9+X2vBwWJTotN5KDHg1ZlJWagjaxdIIk1QaAocQ9I4PSqGqZv
	 wJdP9WxkwGvfA==
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
Subject: [PATCH v8 23/53] media: dvb-frontends: rtl2832_srd: Use queue min_buffers_needed field
Date: Wed, 27 Sep 2023 17:35:28 +0200
Message-Id: <20230927153558.159278-24-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083620_229531_7FF22231 
X-CRM114-Status: GOOD (  11.53  )
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


