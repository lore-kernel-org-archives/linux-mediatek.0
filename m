Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D52C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kn0czDL9ROtsg+tOnyfufQQRPDDzdxPC3Nm7NdaC1Xg=; b=WdEeGO243aFDLT
	YG6lel+IpfKtYT87QRNYUHssHBUwrWdhG6/TWvAiNJAZGQekp84mBhzvCDuX2fp/X+a/8p8lr53w6
	OWKW6UonrZ8nZwQASHv+Yp/K1uhcdX34j6bbtpUAbYOeeLRXlFV3AfKhGm09lCF0YdFeQwhfPuuyk
	EsA8il7YHKVDrM2X4F8KoKSZlXtTqvq+8iL6uqQNR+S+p20WO5JKka6SCgna8JEsiPZscagDs1EbV
	bxY8TgV5/vGSRihyplkqv40TKSH7WfeJO5WqIW+WAJyMY4RYDZ9E+ogADQk+K0A4pGj69hb2tpc/Y
	g6As0tDG+uEtR4C4CCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx54g-00DTEL-OZ; Tue, 14 Dec 2021 10:30:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3wT-00DF1i-Td; Tue, 14 Dec 2021 09:17:56 +0000
X-UUID: 2aac35d94648473288a42624f4123945-20211214
X-UUID: 2aac35d94648473288a42624f4123945-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1839454193; Tue, 14 Dec 2021 02:17:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 01:17:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 17:17:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Dec 2021 17:17:42 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
CC: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH] mailbox: remove runtime GCE clk control
Date: Tue, 14 Dec 2021 17:17:41 +0800
Message-ID: <20211214091741.2699-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_011750_015753_7FF63413 
X-CRM114-Status: GOOD (  16.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. GCE is a frequently used module, so runtime controlling
GCE clk may not saving too much power.

2. mt8195 sharing the same event table for 2 GCE core.
Runtime controlling 2 GCE clk will cause display HW register
configured in worng stream done event issue below:
  GCE should config HW in every vblanking duration.
  The stream done event is the start signal of vblanking.

  If stream done event is sent between GCE clk_disable
  and clk_enable. After GCE clk_enable the stream done event
  may not appear immediately and have about 3us delay.

  Normal case:
  clk_disable -> get EventA -> clk_enable -> clear EventA
  -> wait EventB -> get EventB -> config HW

  Abnormal case:
  clk_disable -> get EventA -> clk_enable -> EventA delay appear
  -> clear EventA fail -> wait EventB but get EventA -> config HW

So just remove the runtime GCE clock contorl.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 342b91f16e65..1faf35e8aff0 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -127,13 +127,11 @@ static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
 
-	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
 	if (cmdq->control_by_sw)
 		writel(0x7, cmdq->base + GCE_GCTL_VALUE);
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 }
 
 static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
@@ -269,10 +267,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 			break;
 	}
 
-	if (list_empty(&thread->task_busy_list)) {
+	if (list_empty(&thread->task_busy_list))
 		cmdq_thread_disable(cmdq, thread);
-		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
-	}
 }
 
 static irqreturn_t cmdq_irq_handler(int irq, void *dev)
@@ -316,7 +312,7 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_disable_unprepare(cmdq->gce_num, cmdq->clocks);
 
 	return 0;
 }
@@ -325,7 +321,7 @@ static int cmdq_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
-	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare_enable(cmdq->gce_num, cmdq->clocks));
 	cmdq->suspended = false;
 	return 0;
 }
@@ -334,7 +330,7 @@ static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_disable_unprepare(cmdq->gce_num, cmdq->clocks);
 	return 0;
 }
 
@@ -360,8 +356,6 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
-
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -433,7 +427,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 
 done:
 	/*
@@ -479,7 +472,6 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -621,7 +613,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cmdq);
 
-	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare_enable(cmdq->gce_num, cmdq->clocks));
 
 	cmdq_init(cmdq);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
