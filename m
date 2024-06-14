Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1F4C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 04:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNX/6xJwVVdxINFYHElAcSxjFjZW+WO3wSYq/VQB9l8=; b=PtO+0MgdS4TJfezmegJg8heFDb
	fMzV1JIXWVDbpXDSJwYbGegmUkRRXfiZJGqAom/7iI3loTb8TYY98+Onw7byXEdlBFsEBKHA+Nn5J
	KHXlO4alaTbGcsMfcytYH7/Kiukt/UZ++t2990GjsFqqfkionsuC+lR+TfFcW1hV3Y2sKfjAdBRuY
	XCuCtwp8QKRT37qnIjR6maOle7kkV2ec08mmxVyofWU0OXdtBk7H0TgMfKe9SyA18X0XiAXYrLxef
	roO3LmLbqGEqW19OVKylJdSaA4dcI8/yirO3WBvpOCdcqjhqofubqFl8zu/2tQeVlA5jNg30eT7dV
	YeBfbdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy8H-00000001LLz-36yb;
	Fri, 14 Jun 2024 04:01:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy8E-00000001LLT-3gzV;
	Fri, 14 Jun 2024 04:01:44 +0000
X-UUID: cbfd43262a0211efba8bfb22b0451c12-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oNX/6xJwVVdxINFYHElAcSxjFjZW+WO3wSYq/VQB9l8=;
	b=sjXL8UqGlWgIsnSo9lrwDIATD+jETQMlrfUpOs7JNrM2puod97FJGW150fc/atq+ZdTIxQR9BPCPpOjgCURwu1LN3l1FPAtdijzMcGzyarVHe9WBr441yHuZEGf2Y6lLcPa7qoJC/xqe+4WjsU6SOFGm50leCcm1mNmJOexY8yc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:19b4b44b-d2d5-4b68-806e-c722f812b85b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:50d09288-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cbfd43262a0211efba8bfb22b0451c12-20240613
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1866911281; Thu, 13 Jun 2024 21:01:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 12:01:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 12:01:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to mbox_chan_ops API
Date: Fri, 14 Jun 2024 12:01:33 +0800
Message-ID: <20240614040133.24967-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_210143_207602_7BAC219B 
X-CRM114-Status: GOOD (  13.93  )
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

When we run kernel with lockdebug option, we will get the BUG below:
  BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 3616, name: kworker/u17:3
    preempt_count: 1, expected: 0
    RCU nest depth: 0, expected: 0
    INFO: lockdep is turned off.
    irq event stamp: 0
    CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-lockdep-14133-g26e933aca785 #1
    Hardware name: Google Ciri sku0/unprovisioned board (DT)
    Workqueue: imgsys_runner imgsys_runner_func
    Call trace:
     dump_backtrace+0x100/0x120
     show_stack+0x20/0x2c
     dump_stack_lvl+0x84/0xb4
     dump_stack+0x18/0x48
     __might_resched+0x354/0x4c0
     __might_sleep+0x98/0xe4
     __pm_runtime_resume+0x70/0x124
     cmdq_mbox_send_data+0xe4/0xb1c
     msg_submit+0x194/0x2dc
     mbox_send_message+0x190/0x330
     imgsys_cmdq_sendtask+0x1618/0x2224
     imgsys_runner_func+0xac/0x11c
     process_one_work+0x638/0xf84
     worker_thread+0x808/0xcd0
     kthread+0x24c/0x324
     ret_from_fork+0x10/0x20

We found that there is a spin_lock_irqsave protection in msg_submit()
of mailbox.c and it is in the atomic context.
So when cmdq driver calls pm_runtime_get_sync() in cmdq_mbox_send_data(),
it will get this BUG report.

To avoid using sleep in atomic context, move pm_runtime_get_sync to
mbox_chan_ops->power_get and also move pm_runtime_put_autosuspend to
mbox_chan_ops->power_put.

Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 37 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4aa394e91109..02cef3eee35a 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -387,20 +387,13 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task;
 	unsigned long curr_pa, end_pa;
-	int ret;
 
 	/* Client should not flush new tasks if suspended. */
 	WARN_ON(cmdq->suspended);
 
-	ret = pm_runtime_get_sync(cmdq->mbox.dev);
-	if (ret < 0)
-		return ret;
-
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
-	if (!task) {
-		pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	if (!task)
 		return -ENOMEM;
-	}
 
 	task->cmdq = cmdq;
 	INIT_LIST_HEAD(&task->list_entry);
@@ -448,7 +441,6 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	list_move_tail(&task->list_entry, &thread->task_busy_list);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 }
@@ -465,8 +457,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
 
-	WARN_ON(pm_runtime_get_sync(cmdq->mbox.dev) < 0);
-
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
 		goto done;
@@ -496,7 +486,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 }
 
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
@@ -507,11 +496,6 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
 	u32 enable;
-	int ret;
-
-	ret = pm_runtime_get_sync(cmdq->mbox.dev);
-	if (ret < 0)
-		return ret;
 
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
@@ -536,7 +520,6 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 
@@ -551,15 +534,31 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 		return -EFAULT;
 	}
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
+
 	return 0;
 }
 
+static int cmdq_mbox_pm_resume(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
+
+	return pm_runtime_get_sync(cmdq->mbox.dev);
+}
+
+static void cmdq_mbox_pm_susepnd(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
+
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
+}
+
 static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
 	.send_data = cmdq_mbox_send_data,
 	.startup = cmdq_mbox_startup,
 	.shutdown = cmdq_mbox_shutdown,
 	.flush = cmdq_mbox_flush,
+	.power_get = cmdq_mbox_pm_resume,
+	.power_put = cmdq_mbox_pm_susepnd,
 };
 
 static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
-- 
2.18.0


