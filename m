Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3A7CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsLoD+WAnvw+y2C6s/Kx1I7li9WEBddqHhS2AkeQ4aY=; b=31IeMLQamYepFmvt/GCqgE/FH/
	Aq36merbpooBtmsWH/KKkM7DXulzmFTGzF41+rND8j8ELStGYQ3brhvX4q4Ykp9jADH04P513j0ui
	/afOCSIbEfjFtoI9y2VgOLcSNDZX6ViWsdwm+3OkKenRgm1ldGGfcgHDPjDiiJZkYdQ5U3+iM62N8
	WmG09txIo5ot2idrcfdDExBaMd59ZCrwwCUNY6MiJnb3VEmp9R2eR6K3W4W492KgzSKGD0pswe9U2
	u++9emYIQDwC3HlI0ztJHroP8knu+d41ZbK6yz076ma+fjboX+NplHI23VYXH+9YgZiflHLVtmhBo
	5PftABTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSYG-00HPqs-32;
	Thu, 19 Oct 2023 12:55:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWF-00HNdn-2S;
	Thu, 19 Oct 2023 12:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PsLoD+WAnvw+y2C6s/Kx1I7li9WEBddqHhS2AkeQ4aY=; b=lkZo39jsM9u/OrTea9Mwy5Sm0H
	ASy6Ohadzpn1hb7rT2JPb5iZrzEwIq+X/8glIfS10zfJkpXpFvdQ9Cqj0Am8Wu133H9TTiCYtFQhC
	YZrYM5RsssR9Kficz1DrmEIwEUvYvQXCy/E6W4cRq581onp97SiitjJyMFVO0iWXlmEE0fLkQi2sQ
	Nd8uj+33+jFQfjvFUMUmUjcvttXUEbf0PrSJbA0YlzZl2Y4XIuJRUBr7u85Fo5Ai2tqUDPQD454Gk
	OXOce5gtOOnFUazL52K6kx0AkM6YrEN1i/Ow/FipKUQkN31vhvLhspzRFlOF9TgY3GYbyL5qJgm7u
	6aR1sC2w==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSW5-009rSY-0M;
	Thu, 19 Oct 2023 12:52:48 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 488816607335;
	Thu, 19 Oct 2023 13:52:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719957;
	bh=lpFYGDh7g/0FRgTondvosfvNWLuluJLuRgdJJzYs6SM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KIGzTG6xxoqu3f3jIUQN6LpZol4bD+5an8o2C85fF0sZtbCcizGpTCAFz60vLg1Pj
	 b3la9LIJoJ6J3pRyBhxA57TXQV6O+pJ0hB4VOljLM8dspwg0kDOh6NB/vy3D7BOhb2
	 0ChWn89HBQxRJiFi6NEpwgnUV2kxYIB1Z2vUwA3hwx34Vq6/RgUA3xlAdCDEdG5+L/
	 7rZ3RCIM7vzVlU14v9xjxigQ6yKwCHKzJDIs3oXxkfLrZz3N3uSrXU1bopGO2FbCb1
	 rrDVEAxiEoPhydPTofvKHKTaeKyL4fZx6t16ZUX8XSLUtoBm5Yechj+A1W5Zuv7NPJ
	 JEJnGtOj4oL7w==
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
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 13/56] media: mediatek: vcodec: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:39 +0200
Message-Id: <20231019125222.21370-14-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135245_432854_FF3AB60D 
X-CRM114-Status: GOOD (  12.18  )
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
CC: Bin Liu <bin.liu@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index eb381fa6e7d1..181884e798fd 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -912,7 +912,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 err_start_stream:
-	for (i = 0; i < q->num_buffers; ++i) {
+	for (i = 0; i < vb2_get_num_buffers(q); ++i) {
 		struct vb2_buffer *buf = vb2_get_buffer(q, i);
 
 		/*
-- 
2.39.2


