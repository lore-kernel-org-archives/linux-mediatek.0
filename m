Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDF4C04E85
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlVpk/v8Chc2a6AJegqTBSpHm2hql9K0z/Q5hqKtV8M=; b=xLKbZGuoxP4HcuCDQq87GA9iLF
	E8oEEJVhBNHkuI8re0NMmKXE5ojm7i3Mo8gaUwz33W7qmcRm7EB0byN9bAN0DDsOLp5QL0mIDDxu+
	6SdtOsrPorBNJ37/lRqqwNclf4VqKFw2Q75C204DJtYQjwlRL59yEjDjpp/m6XfCnB83IRUvEkdZw
	07oQWUMvF0En21zlVrglI3wQYv8VK/MG8cLN2QiafurWG9B0R+AXWYTP4n5U5iksPkgEqlcP2gnXl
	at2JlllFwGQX4LCbBAdkLcbS9KK3I7Bokjh+UWXC4Ij5lZ1zDcBFtRozV0F59mign6nPpn6ABGP6L
	QT0e/saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r182h-006lRd-1h;
	Thu, 09 Nov 2023 16:38:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r182R-006l79-0a;
	Thu, 09 Nov 2023 16:37:52 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F04C166076AE;
	Thu,  9 Nov 2023 16:37:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547870;
	bh=FGosfQkz7xDt3TH8JNApENUZqKlKqY5ctlOL3LauTLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bxpn1yEWIuMMw47RbvyzRY+B1Nq2sbyshmfEU2vk3UJFJrcdElM/dEm+mzPtO8mgR
	 6ZVRQ7jXCVw5BqTkK6VGz7+qYoBVgpni8NcUxaykkZUbJCsEahIZkT5ZH6EwOm5MWB
	 xlCKgCe2x+bU7IgSVG8q34wjZMw6vCV6fFTw1FI0hk1XgGqqtSeociY083FG3DCkII
	 NX+vGMZCirJ3Qrq6nzpldzcFhDC/xdFIvhFEzsYndxVujyt4U++PvHj4Cjr7EYl8Hj
	 pZNc2xP2vg1LGy+ahJeZTeIVEq1AMrvS1T4FB3ZE+gELYWF8l15mdmsLgbfz/7zMg5
	 ykf5cinJr/h7w==
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
Subject: [PATCH v15 20/56] media: dvb-frontends: rtl2832: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:34:36 +0100
Message-Id: <20231109163512.179524-21-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083751_374262_9A613137 
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


