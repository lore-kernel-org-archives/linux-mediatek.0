Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F4DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rHvdHyFGT8YUTP5lBNMszn2pbzYaUtIyUsvYA8bYfQ=; b=yXPyqBTw1ut8UMVSlb7dxrVume
	6LISxDCJgN96+YQs3cqL1Zliei5XaOzV4n7GMbQXFLtk9zZST1KO9GGpTqu6HpnxNWnE5qP83Rcl8
	Lycw9gauIjF0qn6yCSfdC5qqDjBPJOrP/RLj1t4irUrp9BcxetbL3WNbcUSqy647ICJzL6wwQmTuO
	MGPfSqtekJK+aPmdbPt4RPIfNDqbVB+XENv1fxzvrHxbcVJu1CLQPLaxeb/54Gutj3VpEnfgyMGWX
	2Xo0mZBjlWv9GPK4hFYNWCwm2zVS2O7pVWq+WaifnV/em2PqOakxRWeFwJoOirRE7UKtemsyYQnLj
	6YT1ZdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxriY-005eoG-1H;
	Tue, 31 Oct 2023 16:35:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrej-005cDA-1l;
	Tue, 31 Oct 2023 16:31:54 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE9AF66073CB;
	Tue, 31 Oct 2023 16:31:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769912;
	bh=ABio7Fn7k/+8wlqN/VSwa9bzp38ffNKUWzBFOmL8pwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHurycj6oOxTsICCTaItqgiiZNkfVeiMnGOnBiF8GUU5195C5kmVnYc5yxEfJWjm3
	 7pxDOZhlCAIUdI2/Mb9LKuJPdK0Hgi0WLV3R62F+/Yyjqin7Nla6VSTEu4FGSDLZjO
	 gbP4xdltT8HsGHvX8jRL5I6ATzBXT7tHAeBz2RdZphH/HxYPRdGMGQ9uSc3DdyV9S0
	 Tuo6uGZudwWFFq3G7qlc7zkxzsKZ8dU4bmz/Tc0aH+DSFZF6Z4/VCNz3Ko7vLC6Suu
	 CUGitVZqBvZApf8KHZWxno93t0nwtk5Nz+wQeZDOhQApExh1jtxO/wKIXj3RqcGBZF
	 kTWJARDwBMqlA==
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
Subject: [PATCH v14 25/56] media: pci: tw68: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:33 +0100
Message-Id: <20231031163104.112469-26-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093153_717617_0CADC84A 
X-CRM114-Status: GOOD (  12.08  )
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
 drivers/media/pci/tw68/tw68-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 773a18702d36..35296c226019 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -360,13 +360,13 @@ static int tw68_queue_setup(struct vb2_queue *q,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw68_dev *dev = vb2_get_drv_priv(q);
-	unsigned tot_bufs = q->num_buffers + *num_buffers;
+	unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
 	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
 
 	if (tot_bufs < 2)
 		tot_bufs = 2;
 	tot_bufs = tw68_buffer_count(size, tot_bufs);
-	*num_buffers = tot_bufs - q->num_buffers;
+	*num_buffers = tot_bufs - vb2_get_num_buffers(q);
 	/*
 	 * We allow create_bufs, but only if the sizeimage is >= as the
 	 * current sizeimage. The tw68_buffer_count calculation becomes quite
-- 
2.39.2


