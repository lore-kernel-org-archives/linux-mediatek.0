Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDEECDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER83NPi30J3seQDoSaM/YXD649vL/4o83t3smZbJ/84=; b=eS4OG09Cyf/UFsh66hwaed+ZtO
	C5ZNQtbtwcOYBGeVM6oLm5zZjDPokvPMHBjS7FuQsdu6Guo7faB9yTo5/LJT00nZpMojAcdWhpVgf
	Dg/1E94Ib4spt3077emdFjF8HyCFU9yf/RTP8c9aWSs/DZeHttfuSAefyNyuq5jCXPgyQXPOIQwaM
	jDUUV+618s5QS5kVmk+IxlRgtb2hI+T2k8py4htUrTpTrL87z8SVtgJcBDPmrMX6/cAIsTTx5SeWM
	ujwvA2TN1OJtWfDha367XhrII5vGOSXrGS1CnmMQiDWp83hhgYWZrWCLmGZodUZiXQK38KPA51Z21
	iAZUrAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquCX-000qqV-0x;
	Thu, 12 Oct 2023 11:50:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9l-000o8k-04;
	Thu, 12 Oct 2023 11:47:12 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AD7A6607342;
	Thu, 12 Oct 2023 12:47:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111227;
	bh=fi+Fxcs6m07q1y5Umer9Ad8BDnSh9/sSAfF+r67YVOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MeUP9vNzWBasugY68j+66SW3C/LzkLPve86K4aNyyQ8g++Q76e+RYBrQ7LINrkiK2
	 dsRGKCnEg6ehWToc0Tncef+RTzatdbeo/RNZrTk3Dbo5KvI4v47Vt6wvsvpenCVL0/
	 y+0a8Wh1yV6ny/p02Tl32UDcVc7xMtAlNltup5VYEr43eFC1BV4fb0nqEsusg3DHtU
	 rQCOAq2Yfh3yQTde3Wfmp7KWiR0PWlxKxpY3IszrosThGBVzGgCd5HOOCuLe0XWICi
	 EZvCqXBc9OZUrFfT5a44sHvMPfl1hTbJXeMn5R0TEEji6U92aR0Ok3gWrm45MOQ8ky
	 0oR+n+dAb7a5Q==
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
Subject: [PATCH v11 34/56] media: usb: cx231xx: Set min_buffers_needed to CX231XX_MIN_BUF
Date: Thu, 12 Oct 2023 13:46:20 +0200
Message-Id: <20231012114642.19040-35-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044709_239269_34759902 
X-CRM114-Status: GOOD (  10.41  )
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


