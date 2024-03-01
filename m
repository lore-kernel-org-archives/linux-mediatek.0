Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E242FC54E55
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jCHjECWvQc/BrF8PoLKpz6E7MT5BMb3T/DMj3fy5Qo=; b=B4f9cbORbzS7ZibMabMdMxgPtE
	HJWTyCr77xv4iPj4JoVdgmcAl3GeFerBvgVRi7gZUev79/aWuN6QrviSGV6pZAom9+cFBBP4h5lp7
	30QdePNe3re/EDMgPXWzlBCp37UdiFARv0gKgkvvHXB+mV5zE3U6HZnkE2OM7YYKWtzTPUFnYSn9O
	xIhfqOKUw7/HXnrTaBpNSyduiWvM7w/BjQfx7s2a8PDeZ82lVpzK9KDHnmtxgfEJwnEPrcwCnmKjs
	zC4V7Hn4XhY7z4haAPsOLuTtekGjAztFv/mo36Qvm5IKkqlX/dbwumqbLP4VAbZhn1mA4BC/Ltd38
	dyOeQhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47e-00000000lGQ-21pi;
	Fri, 01 Mar 2024 14:44:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47X-00000000l84-1aF3;
	Fri, 01 Mar 2024 14:44:22 +0000
X-UUID: 291fada8d7da11eea40fa5ac21cdad35-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1jCHjECWvQc/BrF8PoLKpz6E7MT5BMb3T/DMj3fy5Qo=;
	b=r6HQnGL45/EeOIO4I0f1nxb7faQW1XznO6hhsFKFFTrCubTWHEhgIwjJxEaCnT2eRtYeKdC+SVQM72RJu/+vJ5ggiPKtmv0aj2heR5iGN0aLC1ccJuQXAEHUbuioYhE3yw0D4/dF0UfmhAOG5Ibk4NFQQlsXR5JL6oBGk+8HKjY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:57f41983-946f-4889-912c-20b50d0ab710,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:3c2c66ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 291fada8d7da11eea40fa5ac21cdad35-20240301
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 106386543; Fri, 01 Mar 2024 07:44:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 22:44:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 22:44:05 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND, PATCH 5/5] mailbox: mtk-cmdq: Add support runtime get and set GCE event
Date: Fri, 1 Mar 2024 22:44:03 +0800
Message-ID: <20240301144403.2977-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240301144403.2977-1-jason-jh.lin@mediatek.com>
References: <20240301144403.2977-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_064419_608924_92F6CED9 
X-CRM114-Status: GOOD (  13.11  )
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

ISP drivers need to get and set GCE event in their runtime contorl flow.
So add these functions to support get and set GCE by CPU.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 37 ++++++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index ead2200f39ba..d7c08249c898 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -25,7 +25,11 @@
 #define CMDQ_GCE_NUM_MAX		(2)
 
 #define CMDQ_CURR_IRQ_STATUS		0x10
+#define CMDQ_SYNC_TOKEN_ID		0x60
+#define CMDQ_SYNC_TOKEN_VALUE		0x64
+#define CMDQ_TOKEN_ID_MASK			GENMASK(9, 0)
 #define CMDQ_SYNC_TOKEN_UPDATE		0x68
+#define CMDQ_TOKEN_UPDATE_VALUE			BIT(16)
 #define CMDQ_THR_SLOT_CYCLES		0x30
 #define CMDQ_THR_BASE			0x100
 #define CMDQ_THR_SIZE			0x80
@@ -83,6 +87,7 @@ struct cmdq {
 	struct cmdq_thread	*thread;
 	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
 	bool			suspended;
+	spinlock_t		event_lock; /* lock for gce event */
 };
 
 struct gce_plat {
@@ -113,6 +118,38 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+void cmdq_set_event(void *chan, u16 event_id)
+{
+	struct cmdq *cmdq = container_of(((struct mbox_chan *)chan)->mbox,
+		typeof(*cmdq), mbox);
+	unsigned long flags;
+
+	spin_lock_irqsave(&cmdq->event_lock, flags);
+
+	writel(CMDQ_TOKEN_UPDATE_VALUE | event_id, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
+
+	spin_unlock_irqrestore(&cmdq->event_lock, flags);
+}
+EXPORT_SYMBOL(cmdq_set_event);
+
+u32 cmdq_get_event(void *chan, u16 event_id)
+{
+	struct cmdq *cmdq = container_of(((struct mbox_chan *)chan)->mbox,
+		typeof(*cmdq), mbox);
+	unsigned long flags;
+	u32 value = 0;
+
+	spin_lock_irqsave(&cmdq->event_lock, flags);
+
+	writel(CMDQ_TOKEN_ID_MASK & event_id, cmdq->base + CMDQ_SYNC_TOKEN_ID);
+	value = readl(cmdq->base + CMDQ_SYNC_TOKEN_VALUE);
+
+	spin_unlock_irqrestore(&cmdq->event_lock, flags);
+
+	return value;
+}
+EXPORT_SYMBOL(cmdq_get_event);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f0070c7aa9..f05cabd230da 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -79,5 +79,7 @@ struct cmdq_pkt {
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
+void cmdq_set_event(void *chan, u16 event_id);
+u32 cmdq_get_event(void *chan, u16 event_id);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.18.0


