Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079F9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Q7ZrRRCLUX7MQga/2Jp1mB9ALimtGx2XcWFCRhpmxI=; b=Y8oN7/C3kNLanCNv2FvByNUE1X
	YnKu6N343aWH/d8e1aUIpUI43G7kp4xa/Pck2HVZBKANPluXfGltECpnmiVYwAhT2DOFE6H2mrEhO
	DNDdthPSiWDUT/3YBGlEXyo9bMf3lFWGg3I9I9ojH2b2F0VVIktNX5gjqzHIvSiTCd3CdfDs7nvu3
	hTd+nPXoameR+7R5wyJqK4E0CU4IqdHgsUoEleCP/B/rmUS3WPy67ols+WPGeKPeaNcb6ghUMNyUf
	cG2ZDyyf22UP2wj48w4whF0UYpl9hbuhH3/HeYTC4i1cSEzl9/FCh99mTpbe1uYFgGTCIOMFc49+d
	T2JE5lGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrlP-005gKQ-07;
	Tue, 31 Oct 2023 16:38:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrfM-005cnH-1H;
	Tue, 31 Oct 2023 16:32:34 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE49E66073BF;
	Tue, 31 Oct 2023 16:32:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769951;
	bh=nxe8x/V/1l6XolEQlUJAmFRKBPmiBgQL0drOV0CYbaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOF6ma69mY9buv7hJHLR0h6Vl15crg0ezaW/yPcLElvpQmVaXL1CxvEPuaTl4De/b
	 140wp3zNZzbEqJcCnTI/5FaNJ6mDQ2GhO38HlRopPj91Vy65WTB78fyeC9OFjWAEHb
	 XHfElZyfpBl8ApUwwkO2AU3rDMGrUejL2E4XcJKb3UWzOcibTzPrSVHMhkwa5PNnYu
	 luforDop+1IOhqUw62ntXoBa1dXHFoCOjAHTyp8MwA44nA2ZCqnrK+IlBIoDubDewH
	 f5wA1U5SU5bMb6lWm2E/lFh2LYZA0H7fyZNSDOgBueT5qEefp0b1h7wxd5zEDWEhOh
	 H2GqxRVgW1TrQ==
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
Subject: [PATCH v14 41/56] media: usb: hackrf: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:49 +0100
Message-Id: <20231031163104.112469-42-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093232_592107_5DCD3242 
X-CRM114-Status: GOOD (  10.92  )
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
 drivers/media/usb/hackrf/hackrf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 3e535be2c520..9c0ecd5f056c 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -753,12 +753,13 @@ static int hackrf_queue_setup(struct vb2_queue *vq,
 		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct hackrf_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(dev->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
 
-- 
2.39.2


