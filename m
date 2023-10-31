Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95347C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVc3Gw7um+ugtNMPbdIQp4POT0sbfp8d45vmiRVz7f4=; b=2TBMQa6oT4+4ewZ6ver4/7qCcq
	r+MIUyDDSITv0FSn1rRSNnS7QvVgyT+Ge0tNX7mrYACXndOOiwI06rihKoZqqLUkyrdh2y17q/qvH
	Vm8pywmLQ1a0gnbCsCJNG7xmhRmUhh0MTs9bbcNb+K86f/LfcDJDciepYKBovN46gJZO7q9XqT/mf
	SRNWivy9yJut1YM17DBoLUdkTblZx9aT9naUWphgjeT6MTzL+3LJoAqx30e71rBt9r22FWMxaMeiZ
	Geaqt5FMmZfcJ+n3Wa8fFNzrB2z8Fa3MgtP1NKHkqAutiBsrrCIy2VwihGXs4T47aIZdykOnRwNnN
	8DhrOAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrhe-005eIY-2O;
	Tue, 31 Oct 2023 16:34:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxreb-005c4b-1s;
	Tue, 31 Oct 2023 16:31:47 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBA9866073C6;
	Tue, 31 Oct 2023 16:31:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769904;
	bh=mNj/uXX2BkOwU+t/CAhw8+caswKl9nv73YeSkh4q3yA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aW+gOBlKVm4CrU6qFiH+hj5sWD0UalI04+iJj4eFob+S86dBwIbLl0KxpRFPwB0/j
	 4B9IHVZTXs3Px0DotdDYxRX3kqMNML6mUfySpnezIxx1Pt8w+shrU8Y5LPONs4SZ60
	 oPs5TEIsAV0dyF4ltkCvWoAH4ekLZqx1cvMoXY4CszHLBJdx2l+iN7a/qTUjq7d+ci
	 qtZPyrMJovfnhGwoON4sAzlxFyKwAshZI300AHckoWZl5SZlZhR1Wa+CDkDQRvYrvM
	 0ts5s4Avyutrihi0xTCeoQrZDGXjqSk7YNOne9xRgyDz5U0e7Fo2rJe1Yz4kY+n/Sd
	 eUTEjSePSeQFw==
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
Subject: [PATCH v14 20/56] media: dvb-frontends: rtl2832: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:28 +0100
Message-Id: <20231031163104.112469-21-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093145_770367_B6C1ED1B 
X-CRM114-Status: GOOD (  10.91  )
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
CC: Antti Palosaari <crope@iki.fi>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 02c619e51641..023db6e793f8 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -439,12 +439,13 @@ static int rtl2832_sdr_queue_setup(struct vb2_queue *vq,
 {
 	struct rtl2832_sdr_dev *dev = vb2_get_drv_priv(vq);
 	struct platform_device *pdev = dev->pdev;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(&pdev->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
 	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);
-- 
2.39.2


