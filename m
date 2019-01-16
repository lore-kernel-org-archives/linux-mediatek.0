From: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 2/3] mailbox: mediatek: Implement abort_data function.
Date: Wed, 16 Jan 2019 13:04:34 +0800
Message-ID: <20190116050435.11624-3-ck.hu@mediatek.com>
References: <20190116050435.11624-1-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116050435.11624-1-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

For client driver which need to reorganize the command buffer, it could
use this function to abort the sent but not executed command buffer.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 22811784dc7d..f2219f263ef6 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -417,6 +417,45 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	return 0;
 }
 
+static void cmdq_mbox_abort_data(struct mbox_chan *chan)
+{
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
+	struct cmdq_task *task, *tmp;
+	unsigned long flags;
+	u32 enable;
+
+	spin_lock_irqsave(&thread->chan->lock, flags);
+	if (list_empty(&thread->task_busy_list))
+		goto out;
+
+	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
+	if (!cmdq_thread_is_in_wfe(thread))
+		goto wait;
+
+	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
+				 list_entry) {
+		list_del(&task->list_entry);
+		kfree(task);
+	}
+
+	cmdq_thread_resume(thread);
+	cmdq_thread_disable(cmdq, thread);
+	clk_disable(cmdq->clock);
+
+out:
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+	return;
+
+wait:
+	cmdq_thread_resume(thread);
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+	if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,
+				      enable, !enable, 1, 20))
+		dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",
+			(u32)(thread->base - cmdq->base));
+}
+
 static int cmdq_mbox_startup(struct mbox_chan *chan)
 {
 	return 0;
@@ -427,6 +466,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 }
 
 static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
+	.abort_data = cmdq_mbox_abort_data,
 	.send_data = cmdq_mbox_send_data,
 	.startup = cmdq_mbox_startup,
 	.shutdown = cmdq_mbox_shutdown,
-- 
2.18.1
