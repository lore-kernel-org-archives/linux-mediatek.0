Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF29C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TzFIwouZEcivlJJKig6vtNF+AeLrIsSqmaihWMI0/Y=; b=HFUImdtO7v65a9vDnmgzNEblXe
	hCw5F6emoUiC80jyFYDVEZs/pWqrI9T8/+jNzUMajry6lMAiRly04X5lKZPdbVveiYID2SVl+vHnt
	GHzuOdzwJPqQmSASh+cK9UuPf2TQnTNYG8ezMqSI67HD3EA99WDhaqdEBloRGPRd26apRS/P67Oq+
	Ezn8X3rcTJHWnt4zhm4gfz3W7vHywyLA0ZTiLeh0WZyEHfLE+STFEVO5z9ZQGh0XpF8nBGDz2vHZ6
	tmYD1tmxe52fi9kkV+YzC+Q6kpa9Gw5IkcW9MJ4qVjFHfG1AHq0oshGMWOf2tsTrVxCXNwmKpYjXx
	s9plbplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrlD-005gEz-2K;
	Tue, 31 Oct 2023 16:38:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrfK-005clS-0j;
	Tue, 31 Oct 2023 16:32:32 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 921DD66073AF;
	Tue, 31 Oct 2023 16:32:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769949;
	bh=ctJwIFCoy8onwGJKVxQ8/AgSsQL3q8AbAm0x7jyK8jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lpTYYjoec2BVqLecNDQ9vK9qYIrv/wDzLm84b8cncKHIDPVneanEdSkC2ebz3VEh3
	 UgxjEdt+xXVIiSlDpARUTv+vRR4Xi57cDsiyT+byAI+Hsu7QnN3k0Mky00LmFg3zEv
	 gFv72iWCN+J15cGp/lonk42hCYjHdUvggeCYoVq4vPeN7rJChOFFiJ57m+pm4ddOXU
	 dQ9sqlITzxWVeNjnjmtoUgjEn35SFiR5VN4R6fU8XnF3zShsrmF3DxQO9jrtLrkzgX
	 DCQnLl5mgrO+Fag6FYfQCWW/0sGkm3FnFDAQ0e3s3tiUYI1uyhrmjqgY4uIDdnyqiB
	 1XFGoCWF5Y4tQ==
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
Subject: [PATCH v14 40/56] media: usb: cx231xx: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:48 +0100
Message-Id: <20231031163104.112469-41-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093230_408281_6C9D2E98 
X-CRM114-Status: GOOD (  10.94  )
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


