Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DF8C83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR2/kO4p5aFOj3EzM7lqDaUKtgWjJiJb7mkKWS+4/PE=; b=AawIka4oQAQYz7jAW803ozXji9
	vZLG3qj5jlyd9L1RT4rpZ4JMUHtaDzFbFlHxSVdbnaMKCvSYaqQru4Q8VGLCm9qTuouxiu7TZdJ17
	QBup+TXxIiURf1qcooZ80+P/+UFA6mgfm/B5uLGyl87DF1tMvBmf/6ALEqr7Vm1Gp1IZsFxdfe8kB
	5psA+vYPjPR8U6O1UZ8KH4zJjhKVtTLSUN3phajo7S3hDzqIpsy+t6IMxy/yrKWarFFp3TdNJjx71
	sljc6an/RtAEJOQ/iLqr3VCsZPFeyzLpoJVhvl3sLwJmY7MRAMNTcQdkZDaHkAhkPONoZY5AilIip
	6prye1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ak-00000001rYh-0Aob;
	Tue, 22 Jul 2025 08:43:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ai-00000001rXR-0Qt1
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 08:43:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 699A760202;
	Tue, 22 Jul 2025 08:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93666C4CEEB;
	Tue, 22 Jul 2025 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753173795;
	bh=ehhPScnBu/pFnDquLo0e3popXPH+ZYkTYjeUsGCcKDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Js01oqJOuEkrc8K2Jsp0hBZg9omlkwwLDwnacIoVicH9bvqwSTytE721yOYxEMGCx
	 GHWQri5nPsTXIsZVHrccpmlvba3rwKSoagZ4SepfzY5JCV5Qa///+HvKP8lcIRo7Ef
	 P7h/LHKOYuvEfH9cOvkOFdzM5a2Ju0ewSxlAz/jXzMa2bK3LnHYZ1LjKtCf3Nafry1
	 iPy3wfQ1iSjFfQM63P95dGSwWCpmJZwc22HzdtTc2alCKytq/VwjBApaYjzNFIunyM
	 Pjm1f0duSbJCr44w0EYyWcnaPDufZBTE6dZMUqu7qkvhYf//LrxKBP3A+wIKYVc2gN
	 kfDMSLHWRGNhw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	krzk@kernel.org,
	lorenzo@kernel.org,
	horms@kernel.org
Subject: [RFC mt76 v2 2/4] wifi: mt76: Add mt76_dev pointer in mt76_queue struct.
Date: Tue, 22 Jul 2025 10:42:25 +0200
Message-ID: <db97d4466f03f8feb932c5113b5d7c257350956b.1753173330.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753173330.git.lorenzo@kernel.org>
References: <cover.1753173330.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a preliminary patch to enable traffic forward offloading via the
Airoha NPU module available on the Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index a66cda167374..48e5c4e98937 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -669,6 +669,7 @@ mt76_dma_alloc_queue(struct mt76_dev *dev, struct mt76_queue *q,
 	q->ndesc = n_desc;
 	q->buf_size = bufsize;
 	q->hw_idx = idx;
+	q->dev = dev;
 
 	size = mt76_queue_is_wed_rro_ind(q) ? sizeof(struct mt76_wed_rro_desc)
 					    : sizeof(struct mt76_desc);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 2912568612bc..db37de583709 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -234,6 +234,7 @@ struct mt76_queue {
 	u16 flags;
 
 	struct mtk_wed_device *wed;
+	struct mt76_dev *dev;
 	u32 wed_regs;
 
 	dma_addr_t desc_dma;
-- 
2.50.1


