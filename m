Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADDFC83F27
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR2/kO4p5aFOj3EzM7lqDaUKtgWjJiJb7mkKWS+4/PE=; b=GwnDok6YmMWGEONFRe/1GhvCfI
	xv6OYiyxFPQAKYfORTuIk98Md18lGdDAYrfJiKAMjJv1dRNHsCq3q36EsoxEuExlg/xHacHR0Vu35
	fQOyJQiqwGqBBvU4THZfD4L43vVjth12raaaJ5PQbX5vLcef1BcDAwiIxZqsLZ7h7FqDypqRC5G43
	/pzwjd499/vLGGmWHsqk68Ky00U6BFpmRLdjVs9VEMNmKs9SMjuPP/9Sq21zLMlM2JkX1VxceLEAU
	DyERI0k4bl/yc2zwhIHD9U3RsFRmLD8IyJz0LCELE6QOKEOQttzzyppeXBeQXg15eW6/F/DW20dcV
	QApuScpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMgr-00000002vCn-2IXd;
	Mon, 14 Jul 2025 17:10:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKvP-00000002cyu-183Q
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Jul 2025 15:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABAE85C62EC;
	Mon, 14 Jul 2025 15:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7927C4CEF6;
	Mon, 14 Jul 2025 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506222;
	bh=ehhPScnBu/pFnDquLo0e3popXPH+ZYkTYjeUsGCcKDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLBWD7eM8rXUMq/WbFTynjwhv2j5xubJF4BCj3r639RoDUFNeAefpKx88r7Q72Z2b
	 xvEfFUS56TPCQzDzNf/qz7a7lWNWkafYyEh6qg6DapIVS9PVwyhtxBkC1F/h84Bgze
	 imXxFZKfCIh0GtrneXVGE7tq5Dfdal8BDu6PTM7xpcGZf7A59U1Lz/yz0T3M9maqf4
	 JHMvjkFoPrD7wvzfgf0UQYo0h4JN8PvA+liRPaLC4WyHPBQkrNAmZN12FTPlufZH7r
	 /pY59Fcmr7aF/NT27HC5+29ZjoGuYWP/D+gLbhzcwcJpCv3UICebyM8dk6raegNKF4
	 InQ0m3hnNwHxQ==
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
Subject: [RFC mt76 2/4] wifi: mt76: Add mt76_dev pointer in mt76_queue struct.
Date: Mon, 14 Jul 2025 17:16:20 +0200
Message-ID: <3136109fae513b224587bf84de841735c09bce03.1752505597.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1752505597.git.lorenzo@kernel.org>
References: <cover.1752505597.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081703_351131_939E2649 
X-CRM114-Status: UNSURE (   8.35  )
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


