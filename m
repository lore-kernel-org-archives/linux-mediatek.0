Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F330DEEAA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HzoHUvVGp9ghcj+K/m/xcGH6bZqCgEuhp8DTUadv54=; b=pk4ayWBMVMX5JimQ1nUTMFlEyX
	nA92Ku2zBu2mbbELD6UXcEPZMcBb73kqRCh4ABUhk1wHmdYtfZ2Hc2akARYbUoYrq3xxaqKVJjwjZ
	kAOP1c8WbjFGspCKlpOnd0cdn91ogxgM8U/Z3tnZr1pflqZHphRszAPMm61XB30gBU0la1salwHlw
	W0T788+PxKrIatQhZXZhH5VuibMJNCEG3cOsvJuEGrpE0orcoWfK23vJKSwUfqhsOGjTHv6XhtSYZ
	CSxkk7U+EgkR/Q+bfI6EBKnTsq2KKnkl7Z/si7qXropbmV/e852H+nzVh7iTK02uyKVhB0JCDxRX9
	+6vqZ+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmVy-008UpS-1f;
	Thu, 14 Sep 2023 13:36:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTb-008SLG-0d;
	Thu, 14 Sep 2023 13:33:50 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C6BB6607352;
	Thu, 14 Sep 2023 14:33:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698425;
	bh=tAy3PWxSfQVkJIZXcTG5de+gZEZpPM2JZfwPqhWBibI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEP/V+iuUOYi2MTo66Frdk0Pt2cXkpb1dzgT0U/dICA49ehjlCHAL7XpJzJMUcER/
	 rRD9qTOr7d8zx9+87VOeV47F+p2+Mh2xAp0QYnU2P6Tzjxz3HzCKIn8IXhs3MD6u8A
	 Zk8FuXkREfZYyZBGgnIIjQg9hggy1s4IobL5sPVr8VY05PSd4HLGewUJ+T7iMvh56+
	 AUyiqobkuW3713EX0SXbTziy7FZpI4k5OEEweycYS4kJIlLscF6xv+oab1j0J7Mxt6
	 9/7+O8+4LiS34ChguqJkCN8U4ZIvLGTr39lzr/c7vFNv9JAXTi4XVxUaSH4ezG3uaP
	 7pXpfUBhFGyhg==
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
Subject: [PATCH v7 27/49] media: pci: tw686x: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:01 +0200
Message-Id: <20230914133323.198857-28-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063347_468070_52B7A5E5 
X-CRM114-Status: GOOD (  11.93  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/tw686x/tw686x-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3ebf7a2c95f0..6bc6d143d18c 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -423,6 +423,7 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 			      unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw686x_video_channel *vc = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int szimage =
 		(vc->width * vc->height * vc->format->depth) >> 3;
 
@@ -430,8 +431,8 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 	 * Let's request at least three buffers: two for the
 	 * DMA engine and one for userspace.
 	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
-- 
2.39.2


