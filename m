Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC6606A32A
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RLRd7wU6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqTCOIYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iPkAHXq9kHCijdQVDkRSkzsGpRx+BYkqVu4mfSObAl8=; b=RLRd7wU6wJMh1r
	cqNzFlWVItb1Nsx9dWV3LayVnoPQlmhfEVhHD9/s6vaPnINquaRekVNXMtWIezeL2PtfJACzDv9ed
	nyFjtfVaV2UH9SV1JhmcKhAUAfXtv0KTfMy/QYW/cVpw3t1dXcEwgVx542EETEPHn1P+zfRBPFOHd
	GMDlGXMQf//kPMaCGqSOOX2g8OTXHjjUHh4qRqkne1jqguK+MoQlzSkBKp4VLjVkm6sZ7Pno/OLE5
	wyf2y4iuU4w4ee5XHKmPnK3snWT2PPGe3rAwBAjTjt17F8Yx7znz6UJ5kTk2atJ6Mrj2JUmGpVTT7
	i4hxrlDRlS5BYaYeSNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5SL-000000010U2-0OWO;
	Sun, 22 Nov 2026 11:10:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5S8-000000010PU-01IV;
	Sun, 22 Nov 2026 11:09:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE6D04244C;
	Sun, 22 Nov 2026 11:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243761F000C4;
	Sun, 22 Nov 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345787;
	bh=iPkAHXq9kHCijdQVDkRSkzsGpRx+BYkqVu4mfSObAl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VqTCOIYgkK547wymhySSSZvHC4hs+M6RaQ8W2SQOfPA2sEPCTV13YpsJ0xvzFLBwq
	 N5YCqWTBnbHjaziO0MFCT6dK89c6siP0/XuNRLrFdFIYfy7pWpMbdAx2mLmb7HYuP9
	 OYp3Zd9Xgdb38yC+HYdwMslpxb2bcy3i5g+U3O/a5cIQdyAHfSB5br2+CsQUGQnXTW
	 VL7eO77kynrpRf7S7efC6GykbDoNl1PK7kJl9Ns1gaQ7/NFdLmA+neCrqseyIO3EY7
	 Fp0lyJ17PCaGS/pQh3N/clk6QLi8o9b8/Rm8CRP2qXe0ZZtTTiPMemSo4fMj1QjWmT
	 WWiE4/Xxwpd0A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 22 Nov 2026 12:09:15 +0100
Subject: [PATCH 2/2] wifi: mt76: npu: do not run mt76_npu_queue_cleanup()
 for not allocated queues
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-mt76-npu-fixes-v1-2-8d8876b91970@kernel.org>
References: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
In-Reply-To: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt76_npu_deinit() unconditionally calls mt76_npu_queue_cleanup() on the
NPU RX queues, even when the NPU is not active and the queues were never
allocated. In that case q->lock was never initialized by
mt76_dma_alloc_queue() and mt76_npu_queue_cleanup() takes a zeroed,
uninitialized spinlock. This is caught by CONFIG_DEBUG_SPINLOCK ("bad
magic") and lockdep, and is reachable on any mt76 device once
CONFIG_MT76_NPU is enabled, not just on NPU-capable ones.

Only call mt76_npu_queue_cleanup() when the queue was actually allocated,
i.e. when ndesc is set, matching the check already present in
mt76_dma_rx_cleanup(). Since mt76_dma_alloc_queue() initializes q->lock
before setting ndesc, a non-zero ndesc guarantees the lock is valid.

Run the cleanup while still holding dev->mutex so it is serialized with
the rest of the NPU teardown, keeping the dev->mutex -> q->lock order used
by mt76_npu_rx_queue_init().

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index fbefc86001ff..af5bc3da26ab 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -554,8 +554,10 @@ void mt76_npu_deinit(struct mt76_dev *dev)
 	if (ppe_dev)
 		airoha_ppe_put_dev(ppe_dev);
 
-	mutex_unlock(&dev->mutex);
+	if (dev->q_rx[MT_RXQ_NPU0].ndesc)
+		mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU0]);
+	if (dev->q_rx[MT_RXQ_NPU1].ndesc)
+		mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU1]);
 
-	mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU0]);
-	mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU1]);
+	mutex_unlock(&dev->mutex);
 }

-- 
2.56.1


