Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95816E784AC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xy6ulbgeM0AXpFjPT8iDRlOuwuMKx6m/ngwiUulPb0=; b=UAox1NnByi+AD2t7fA93onwinH
	eo+k4lUUs3N9OuraWhND+syZWwCR+jvv3v9IeMG16dP5vkcbaOF6pEGW/j+JQ3PVh/qBcHAAzqBzX
	vnbvqMCEXcDHI4K7Vo1Qy0+TsNW0eF+rpz5xDo+vAQhwLx351/93btj6cnIXO3KjIE2iDOL8rBiFt
	2THeMmqSw0GzPwVP+lGD9MPZ9HopHDnWzogUN7uoM63zNe4bfHIeImTcT4EfBhUNdzqCq5efensGI
	C1fjhoVq1fZVICeUcdKxQpAVKcDHbjr8BM6VYRtl6p17yUCYLKbKojeigCdCfPmgwxsBwCAIfX3/X
	6GpBAndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHjL-00Cdtz-1B;
	Mon, 02 Oct 2023 12:08:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhK-00CbPs-3A;
	Mon, 02 Oct 2023 12:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5xy6ulbgeM0AXpFjPT8iDRlOuwuMKx6m/ngwiUulPb0=; b=RINPpeWGDkWNmpwR/G84oljqLw
	a8ZFAK0YzzGkAw3FEM0xwtrJsMN8f0KFsu+lWa/cQGBlkETkUERciSyYHc5oBwllSzenMlqfJkZ5g
	hkXVRKkNSO0l1gpZxTZS92AHLxGQ1C2qyQP14XFgekAAOqLZ3UGGIF09O+VYrIzgnOo0Q9aVb9dvQ
	ppDEGDYLhwMgoqbkVVUlPKAHoYguC+G7J3JelP2vIvvke7qL6aCqkKX3GolKQZ94H/1ziZPp15TYA
	na1k19V9ztPYSMhA8RJagsRP11nfV7A3VzBrJhM77lIx+r2UPeiVuIfLhuYvzK66yrSDy5Qje7jtC
	ztbUZU7g==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090N6-08;
	Mon, 02 Oct 2023 12:06:47 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2176C66071CC;
	Mon,  2 Oct 2023 13:06:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248395;
	bh=1dskbbkJ3zkcIpXG7ctqvahZ8PrAeLCG0dqn3ErBFLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GArcyLDYSkfOg/bRKLRtfDV9Evg/+21CqpgAh6HhTBGfXQIGHHUuS/XCWsQnf/7i9
	 CSaGi7Jt1IK1NGij2mJXYpy281QKk8QUVguf0acAhCQQdzvUpAFbFEpk2qd68oMbI2
	 BKg3BmMVWXHJXJKRGE6jViuJ1u2Brp+QeeLc4TE5RksfLxqV8c7XBHa4gs/PBsZ2nM
	 tiE8AbIfCXlnFgAlotVblXispb6RehFvXjviSmLA3Jvfwnu23j74teo2SQPFWqHRg2
	 rwcQTJJ+et+PYC2ylLZF4sBFrpD0cfGk3RIDo57rRlzVCDm6MM7NmYTzSjufTd2yME
	 Q8KRX6Sh721yA==
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
Subject: [PATCH v9 20/53] media: Remove duplicated index vs q->num_buffers check
Date: Mon,  2 Oct 2023 14:05:44 +0200
Message-Id: <20231002120617.119602-21-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130644_156530_36D7A5A7 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

vb2_get_buffer() already checks if the requested index is valid.
Stop duplicating this kind of check everywhere.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 51b16cd14582..38eef0c5d18c 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -378,11 +378,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 		return -EINVAL;
 	}
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "%s: buffer index out of range\n", opname);
-		return -EINVAL;
-	}
-
 	vb = vb2_get_buffer(q, b->index);
 	if (!vb) {
 		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
@@ -833,10 +828,6 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 		return -EBUSY;
 	}
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
-		return -EINVAL;
-	}
 	vb = vb2_get_buffer(q, b->index);
 	if (!vb) {
 		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
@@ -908,10 +899,6 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 {
 	struct vb2_buffer *vb;
 
-	if (eb->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
-		return -EINVAL;
-	}
 	vb = vb2_get_buffer(q, eb->index);
 	if (!vb) {
 		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
-- 
2.39.2


