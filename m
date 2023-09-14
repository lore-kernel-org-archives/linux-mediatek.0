Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D4EEAA46
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhnSqOiSmfX2a0e2tL7vBTe/pZHQ5iui/RY1FADwjgE=; b=OnFG0ZzEv/RHzv7fYnkkj3kW5k
	e0+Pi7qBGt1rDEbtxdJonJb8Jw4irBNoMu/ghNfqLxPk5P6Ae1giVFclbe/BrQoi/qAsch6IY4aZI
	6AEb+qApOXxK9rbjwuP4gXw49bLsjjHZMPFoA9+ydHBCUr2z9yKnKJhwKeqCQtetQS7VkCFWdTUMP
	363d63TiajiDPC9QyxOLEQ0LQ7SCvNgcrUz6a6nrvWMoyCPFqjaJ7OVEpP2oZFu1v5e1PBgYqYOgg
	+/5PsB6e7hq1Asz2jqf9UTc2jp3OGUuNNcgffhHMhKuOvmujxDRGbz1Eoo/KfH/Ncj2jn2/CAB138
	D/Lasd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTx-008Snu-1F;
	Thu, 14 Sep 2023 13:34:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTR-008S98-2n;
	Thu, 14 Sep 2023 13:33:39 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D61D56607355;
	Thu, 14 Sep 2023 14:33:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698415;
	bh=iZqd1w+9hJa+OQD7BuHGMyLxr+up+MZt6k1cr275d/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YBKyrFSx5bL9zrE3+6VE9UoNa6a/2EJcx9kGRCOy32Z7Tk5r/DL0ScHoaO+15m5om
	 N3rNbLa3LJTej/+SCRGhoNXiyiU1YiLJslsY4DKCRXNkTxrLLplPbTqmchMGtMDRxR
	 q6ZVBm+UXjnzSvx1PsV5VMB9+xq0i012Mxl3b9jb39a2e0KQ+p+OrJ7Q9uCl8zBFJW
	 9alTy9FMYas1CjZb3DLQJ06R+SLjPCU12THGyJl5MqIYAfXmnkO+8u3Hj2acXQzbHV
	 fco8OlfKWtLh+L+nT+ohqLGOQQfdwRAd0HxvgnREI6AwPfGBVum0a8mvtL2WH6UG/1
	 PlZooX4ru6Xvg==
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
Subject: [PATCH v7 07/49] media: sti: hva: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu, 14 Sep 2023 15:32:41 +0200
Message-Id: <20230914133323.198857-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063338_065131_C12D7E2E 
X-CRM114-Status: GOOD (  10.34  )
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

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 3a848ca32a0e..326be09bdb55 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -577,6 +577,10 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		}
 
 		vb2_buf = vb2_get_buffer(vq, buf->index);
+		if (!vb2_buf) {
+			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
+			return -EINVAL;
+		}
 		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
 		stream->bytesused = buf->bytesused;
 	}
-- 
2.39.2


