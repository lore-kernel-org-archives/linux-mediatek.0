Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75424C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xguMu+KLuz6GsKE+6WL+OnguQJayStWx5rqb6L4PcY=; b=Zvdtb/8JjnadvMxspD1zl9ldjK
	dYs+CX9g1D+NScLy8qsp55NlM2g98xVXOkTteyKUKwm05ADv1n/P/s5Oo+PT7AqYxMPFmMs5uJIOe
	MBADF12dRwpG0Ndb+nbUNSBQsRqnDC4kCkfUVO6ImlZYvGHuZ5VZ/rOzJ7LiicjczvNZ73UvoU2WZ
	TqAm6Fp5meVMoW6kPv51Z2uQFnFjGq0ow7rlvfj1V2UAkJ66E4LqHIQjXp9kw0xOqtAnBX1LaSVSk
	GLAhSD8mOe1g4KJgp8XUWkX4ZlNcb8gO9nX+/cZgX31kwwv8c9rl3CUF8TfB5ojnV4TcxaO5N43TI
	vFl9WKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r183J-006m8u-1j;
	Thu, 09 Nov 2023 16:38:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r182Z-006lHZ-39;
	Thu, 09 Nov 2023 16:38:01 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F09B660741B;
	Thu,  9 Nov 2023 16:37:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547878;
	bh=AtH8K8Z2Aob2e0uNs8JrzF1vK5paJ9ly85DM9H+gmrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NkY1lwTGVi/CKA3h+b9wU7SZHZX1MOf9TKjj2eqU8RQDROcPck7kdVwtqdUU4RK2H
	 pa7BNi/Egy8NxGzfWIvMf3M/9Es/Apg+ySVgiCeW+/SQhQhL6Lj/pJdB4Fbm8RCdxd
	 RJdBrUm9JNFy2ZpLVpiBFaicG7YJc0w1ErD7a8gzWq35pqZcRDtPhHd0Nosq2/eqT3
	 tWwi+9t9i0b8ewQg+wLeLG1vwuD2eRzIc2PmVzExTcXWi6uboenunTtwltbT/E7qXY
	 xjOeh0+q4T5BHqw71+1+oJApl4F4B7qYwAJD1whO1q145h+f9Aiapc1H2eRrdQqWws
	 4UowFRVx6Jp9w==
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
Subject: [PATCH v15 25/56] media: pci: tw68: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:34:41 +0100
Message-Id: <20231109163512.179524-26-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083800_162609_0E812594 
X-CRM114-Status: GOOD (  11.96  )
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
 drivers/media/pci/tw68/tw68-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 773a18702d36..79b627ebc92a 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -360,13 +360,14 @@ static int tw68_queue_setup(struct vb2_queue *q,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw68_dev *dev = vb2_get_drv_priv(q);
-	unsigned tot_bufs = q->num_buffers + *num_buffers;
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+	unsigned int tot_bufs = q_num_bufs + *num_buffers;
 	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
 
 	if (tot_bufs < 2)
 		tot_bufs = 2;
 	tot_bufs = tw68_buffer_count(size, tot_bufs);
-	*num_buffers = tot_bufs - q->num_buffers;
+	*num_buffers = tot_bufs - q_num_bufs;
 	/*
 	 * We allow create_bufs, but only if the sizeimage is >= as the
 	 * current sizeimage. The tw68_buffer_count calculation becomes quite
-- 
2.39.2


