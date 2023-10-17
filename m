Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7C1C46CA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/8N2eZbHgJ2ddP4bLUKysTIn1zEaNvdYUyEuZt7upw=; b=Wtb8kEbgFYx57lIYqZlJRC5KsP
	dlW3P9Ahq4nO6qQVbQzbJwxCDIE3rqOTy6c344of7N8sBrT1NMXQu1igvWzfoRWv7S6X7FUSCDdcM
	LYpxL9YamGQLs+0WJIDMGCvtO2hAoUWr/cxTld/pb0Rd/tJmNkNc3t/3oF2TsHTWimzvVhtwQenzA
	N01n4i/JeBqKxAGwiijHivX1/JyFaHPNTItzMeyTs7KkguazgBUgIj2J5UcMxPx8iTsGgWpbLNv4P
	1HcRmw0nnQCvMkxYyJ5ekY2husprcCddAfVtvk3lwy/sG1hFLudiA/9QGWT86pjfs+SrF7B/Dp7LU
	bRX8gyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslPa-00Cbvz-1f;
	Tue, 17 Oct 2023 14:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslN1-00CZHN-0W;
	Tue, 17 Oct 2023 14:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5/8N2eZbHgJ2ddP4bLUKysTIn1zEaNvdYUyEuZt7upw=; b=KDgcLFsGn0Oi95ts1ay6XgcYo6
	cyWm19XUjEIPFVZ5zxNZdfF2pcZY73hJWwdRwlVo3mY1VZ8OYARUyxwpLTrVPo3yIwYNtfw//jLEu
	Y+wp7OmkPlaozulIw2Mh+hd5F4C5tcO21PlVGSCuBHWSXQR1XSs/8gV8xzubWgtwYi+L6usfNuS1L
	SGojZGvA0RNCYU69qWT2YGUrqfYYW8zDekSykKl8K7PJ/sgp5EnXulW/gQ4kETd9HFKLGwoNtVbr2
	Qr2JTZ5oRce+Z9sJG1RwSDiaNCLfOItT3qgk2eWhQTe6qhAIIyQKC3wgyQ46VHkCwkidsQreeKwgw
	7xbCxMWA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMw-007A3C-1g;
	Tue, 17 Oct 2023 14:48:29 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 695EC66073A1;
	Tue, 17 Oct 2023 15:48:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554104;
	bh=8GZLJACA624oAq56RLro241MiteSnnQX+iq1uP+mVUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4g5amf3IqcMkd1LgNlsmjGOxWNOdppPYUTNsI5tgw+eidSHg5IejyW8NFBeZLaCS
	 o6wGiqYnnXoJJgySGgBp/lhjERCVXCJQv4ejR6YKnDG5Unc93S4psmBE1hI+FwSSkG
	 axcusg8C35kLc4k45KphdqhMJZkIQI8IwcGHtetj4t7ZbT453GsdFxO/uPfoYKSO0f
	 o0+0NcnBeFjD64co6TI0GWnJXCWTAOYsODbDcvdc6Py1beIhOn57bNbVFP5Z/nCJS8
	 sW4v6KTst5Fcq7D/dlK7KWODkBF7v4S850R1AvGVXWqTVz98xVMoIyBSdFITHOwUus
	 PnfHpIL+ff+Zg==
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
Subject: [PATCH v12 40/56] media: usb: cx231xx: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:40 +0200
Message-Id: <20231017144756.34719-41-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154826_718364_52918E63 
X-CRM114-Status: GOOD (  11.32  )
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
futur.

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


