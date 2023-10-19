Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B53DCDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSy093gtu6sYylpAu1pxaiVT8mQtQI50EVpPlPpLNJ0=; b=gJLMsG97d5IBjdRpWwzLqCV/1W
	XPL3U6O0MwwM3vk28l+925mpX4LEt405z7lXlrWpzFMtttljRXvxkyJi5JJ/YbhbJn2Krpx7Dr7Fu
	9G2bPOMCn5xWmF+Q/ntO82CsOJonyctOTZoiwXORa9yA6JJ7qI0tfqbA9P5/L5kooLJYbnwwOzKhM
	SkIYPlP15hKgOegEp2TU5HKMwKrJcIcsb1OzbvWKB0Y2oE8tc7tOxR1VbyUNQlezox0HRIeR9s6c/
	mrsRGmKkQzYkWZzUT7OiTIXahHcP2mGxwNi6Tct/LRGpA523G8rrQRaXFIXiwOV/W6y3V0WKYzXiT
	NNbrTNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSZ4-00HQd7-2R;
	Thu, 19 Oct 2023 12:55:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWE-00HNbg-1k;
	Thu, 19 Oct 2023 12:52:59 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E7F206607334;
	Thu, 19 Oct 2023 13:52:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719970;
	bh=I24/t0ZqSyeKvdZtsSJpVc7QnzmONAbV5k9WYLKmpuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGQZ0uEQO3rs1XmURBUPRvA8nKSH1kdVUbI7Fn1LiGDupmgB1HYcYEpwrmhpvYHO8
	 UIbFbDr6MvkbhsNvpvqjGhOcA5paO6TVc+tnHjMOX9OrdO1YmIM9d/5IMPznEVYRjL
	 4fy+dBFLlCXNtARymxvhg0+cZgraUgyoqB/Vkt1x2/hIGLRPGgsnmFoYnMxdZCF1/l
	 3w4CVUQlSbAGjjANefzNmGWuPDPFeU4E7R/8EEt5RF3PLZv//XVI66Xdrm95YIdMNu
	 RQiY97kfN+9ZvGU0sGWQkyBp8csYadlaECbKqyJjlLo8efmLH8335ICvO8i4o2d9nX
	 l6DWtTUE2Pxwg==
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v13 37/56] media: renesas: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:03 +0200
Message-Id: <20231019125222.21370-38-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055254_737714_853F8575 
X-CRM114-Status: GOOD (  11.88  )
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
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 292c5bf9e50c..f21d05054341 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
 			unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	/* Need at least 16 buffers */
-	if (vq->num_buffers + *num_buffers < 16)
-		*num_buffers = 16 - vq->num_buffers;
+	if (q_num_bufs + *num_buffers < 16)
+		*num_buffers = 16 - q_num_bufs;
 
 	*num_planes = 1;
 	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);
-- 
2.39.2


