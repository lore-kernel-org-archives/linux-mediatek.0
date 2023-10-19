Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019B8CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TzFIwouZEcivlJJKig6vtNF+AeLrIsSqmaihWMI0/Y=; b=PIGCDp+uiQB7TNTM+veMCknxu0
	pKwbVXTWOvH1evKdWnf8NBfwLOix+XAGx6xMITo+Lixc2VK18+k4PmsDTd3bscUaQ2baM/0zSBEl2
	pKNma4gmEl0rsIpYZa7qA/p+9kf0KJvBZqw2ZYuwP10Ou7OfNCR78U/wMNd3ec4PyB+MpuwAxYO2b
	E+kJupKIs890ecQPDQtcZAMVHT5NGWZtONisWvN6EuBJLC8huqEiXE2Smf8eUsCqy8cn4/UReRFGe
	QgUjeaH3+z6Gga3C/v/3IWF5T/HxcaTDvapb0H7gh/vGaJQRMcV9xPoaILXRoufZ3r2dzvqGJRU8m
	c4N6X5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSaR-00HRzg-2l;
	Thu, 19 Oct 2023 12:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWM-00HNmW-1L;
	Thu, 19 Oct 2023 12:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7TzFIwouZEcivlJJKig6vtNF+AeLrIsSqmaihWMI0/Y=; b=jTLiXKCOSy8hLraRQqvIEqE8eY
	oSsNufTZlWKr/+MIBhvxExUKeLHZoMw8tW/MAsQYSG8jBJe/irkbaJa/RfhtRKCOx9QdIuCA2PGla
	4tSuRuQsl3za44LSBRdNJCggRvFEainSKo6dyjxB3A5z4fovWENi+HOmjplPy+Wd4rNqVD/z0h75v
	bWqAZzZqd+peq2xc8iAbx2PQfuCa3GUZk7pzHdrquohWhfAV4XLmd1U0XzmDeSmcL396/tTXB/Pqu
	X+MVipe4uaCjYLVylCAzWHSTuu0PfS6JARYeBH6i3sRNXOkfrvyC4Pa3W7yQAYzjI0/8IWE6fiSrT
	r+lvEu2w==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWF-009rWc-0B;
	Thu, 19 Oct 2023 12:53:00 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79C176607383;
	Thu, 19 Oct 2023 13:52:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719971;
	bh=ctJwIFCoy8onwGJKVxQ8/AgSsQL3q8AbAm0x7jyK8jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WgFF4qP6A1m1kW1mP90ZYzARSYhFCfcujQeYQFu7kypYHKTsoy08F7Bxud5fkvgcP
	 X9VJkpyYHrMvH0pHNsF1Pv5wixUw3e5QK8T6qLZ1ME1Oa2lvAkHTGqgEnpTFEspAsj
	 FhaKKeGrDFVq1YPbyEtGKJm99Yf0/TpVBbWez9oqWxMqmCVB89GPndujnT6DVymkNE
	 ZNn3jGhLtrS7r6PIjka19CUqeuI906YZBE/UzB+fvK9Ab+vokgv1W0+mWmRf7y43CN
	 5VQK09wEvEi/J+sm4a0W+EOCqzmWkJrD2An+V0x9uQLykETwZBtFG6AHAuyRdf49UM
	 Vn9wZlA68NXTQ==
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
Subject: [PATCH v13 40/56] media: usb: cx231xx: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:06 +0200
Message-Id: <20231019125222.21370-41-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135255_182954_A1463565 
X-CRM114-Status: GOOD (  11.65  )
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
---
 drivers/media/usb/cx231xx/cx231xx-417.c   | 5 +++--
 drivers/media/usb/cx231xx/cx231xx-video.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index fe4410a5e128..45973fe690b2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1218,12 +1218,13 @@ static int queue_setup(struct vb2_queue *vq,
 {
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
 	unsigned int size = mpeglinesize * mpeglines;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev->ts1.ts_packet_size  = mpeglinesize;
 	dev->ts1.ts_packet_count = mpeglines;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
+		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index e23b8ccd79d4..c8eb4222319d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -714,11 +714,12 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
+		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < dev->size ? -EINVAL : 0;
-- 
2.39.2


