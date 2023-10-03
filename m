Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD47E75435
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER83NPi30J3seQDoSaM/YXD649vL/4o83t3smZbJ/84=; b=xN2gZ4guDX/H2uPyPd3e09Sgll
	YRtfGS0Vzp0AtbSofNfSo+punzUDT9+VqS7MOlHv273nvnFO4CAGbSbGMGX2slIVVzw9w+9RZb/L6
	NxZCgoMCfrysmemNBlJeJ5gmWByXBGXfen+j0oN2lGPV08mbvi2swF1w2+dzRf1EA8rt23PE8/qt5
	aQkb1PtP1ra/g945TewZfZZc+PXR7Gv40rcwlhDOUgZTP24+wAoB3qoir97KN0nMVGdEyXQ0uo1t0
	J3Abwymj66eukCwVvP6gFlXfmkpdvEzFtPeXuL7qXY/WkN6eVgLJU72xIEiFTHNTT8uBjVGBUtBgr
	KVRvzyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTR-00E5wL-2Y;
	Tue, 03 Oct 2023 08:09:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRL-00E3OU-23;
	Tue, 03 Oct 2023 08:07:39 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38D36660737C;
	Tue,  3 Oct 2023 09:07:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320453;
	bh=fi+Fxcs6m07q1y5Umer9Ad8BDnSh9/sSAfF+r67YVOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHl9kcaIjEE3QPHTc0x6G9y5uUi6tcSbCAI3vRU+1S3tcOuUoUQvglY1UkD8fJLaq
	 UHwDtEdwOS8zYExRaEFzAfdlI6a5+zi2VlsfW1Eb21VWV+hvdLAKC1MX6cLxJj1Ahf
	 MTGEXC33jOTxI5kegirgL8iL8GKatS85mlqKQEcn9kVNHOhqlk+cy8AUQdcPzGmUqx
	 smAZxcTczGTF/8OKqTI6CJeBMu/tVodTcN9fQjV7tJJWjggUp4oL2GfmFGs7aaOyCR
	 sgjIKPmtkRluKu4zcUsYc0OtMi4OD96aXDd1uc7o1QOB3al7N6fRF6NEttWjalhBuv
	 smbqutsiK9nQw==
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
Subject: [PATCH v10 39/54] media: usb: cx231xx: Set min_buffers_needed to CX231XX_MIN_BUF
Date: Tue,  3 Oct 2023 10:06:48 +0200
Message-Id: <20231003080704.43911-40-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010735_853454_92DE895D 
X-CRM114-Status: GOOD (  10.87  )
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
min_buffers_needed to  aCX231XX_MIN_BUFnd remove the useless check in
cx231xx queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c   | 4 +---
 drivers/media/usb/cx231xx/cx231xx-video.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c5e21785fafe..fecdb12f5ef7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1223,9 +1223,6 @@ static int queue_setup(struct vb2_queue *vq,
 	dev->ts1.ts_packet_size  = mpeglinesize;
 	dev->ts1.ts_packet_count = mpeglines;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
-
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -1777,6 +1774,7 @@ int cx231xx_417_register(struct cx231xx *dev)
 	q = &dev->mpegq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->min_buffers_needed = CX231XX_MIN_BUF;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx231xx_buffer);
 	q->ops = &cx231xx_video_qops;
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index e23b8ccd79d4..26b593844157 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -717,9 +717,6 @@ static int queue_setup(struct vb2_queue *vq,
 
 	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
-
 	if (*nplanes)
 		return sizes[0] < dev->size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -1805,6 +1802,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 	q = &dev->vidq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->min_buffers_needed = CX231XX_MIN_BUF;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx231xx_buffer);
 	q->ops = &cx231xx_video_qops;
-- 
2.39.2


