Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7187BC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:20:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F046128A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19F046128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1eBwmQluFEyjdqsiSEIsNyjaFI6NP6uAQ2MyUXB0ISM=; b=rfsbNU6mZkSSPo5i/OcZBZxzD
	99lqF5OK3F/QnxDuyQXejWXmeBvOvEYnEuG+bQwQW/vxGVgNYa00/+Nx35VNY24nWYmlYBgsFTDpi
	QEHOTsxjZRK76eP5jQgkPLwdoryb+Sh3dwwB3OkIR7p8osCpk+J2DuI+2P4/7Div1tOo89sh8WY/p
	7qYbcx7IvdgKYYCs3pqWXm/P0WeSluTXfQo/V1cw9BSMUj0lzOxkw51efJ6LBw50xMw7MWa2PAp0Q
	Vx9OxsnpBKk8yMVeGU8PDzRn8HTdZ8Tq3ldSLQm+93MYDpjJ1PN26RWd+E53jF4cx9wZ0Y/t0PYRf
	3Jf1wiHFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVubl-006WNT-3x; Mon, 12 Apr 2021 11:19:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuau-006WAv-5a; Mon, 12 Apr 2021 11:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=S+l9Syh5anQ61b/cqNIeHuv1FsKfcBXeo1Xcd5DpG0w=; b=O1YV7rwFDQUFgMWgiu3brAUTTV
 ZVlUuuyZ8pbc17/0hHE0fOlvKkEFbkeuJMOu3cX2LywdWHzpnVmFMTXxn4rfEfchwbO3c+RbGpptu
 I9sALe3lk6xgFToL5oztMzoF5ulQXiGKC8Zsjbv2PJ6TNicgbrgqD7fhDCmjsUzf3nnl6V/EA8Dew
 pMspD76gRTbZ4U/7vGMGU3l4DNXJOguX7Kv8VeoKIbx+z2QbcfeIkNvGFP66ZYbQUqI/bBWvnGB1x
 wzqUUhtWo86+vf8swxlQZZLZY23eoEknHhEPk+R0WY4QqzdWzsjKnrj/Un7Rm/M6u/S/WCasUHd4g
 CGmkw/ww==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuar-006AGP-Eb; Mon, 12 Apr 2021 11:19:02 +0000
X-UUID: ff399c3f0a5d41329571b1be50ca2f53-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=S+l9Syh5anQ61b/cqNIeHuv1FsKfcBXeo1Xcd5DpG0w=; 
 b=bkxNEh5v/KE1/ZXkljI5dXENmGAOsFhU74Q94wtkpz5B3TWV1deq/tZ16LZRoUhvcRsXvZF+NyB4jpA1qd9EPOUpo8siuICr7HqtSMce3aX/jsg/XArezIQfPWHBt2RBcOBacySzrpGE1f24RyHUC3oAGv37gFf0eFD8KC+77x4=;
X-UUID: ff399c3f0a5d41329571b1be50ca2f53-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 442650799; Mon, 12 Apr 2021 04:18:59 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 04:18:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 19:18:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 19:18:54 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,
 2/5] Revert "mailbox: mediatek: remove implementation related to
 atomic_exec"
Date: Mon, 12 Apr 2021 19:18:42 +0800
Message-ID: <1618226325-31927-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FFC2FDBF7FF001FC2B93517A177C20290575767D34FA3C2E67F281788FAD8C1F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_041901_518527_C008C7E7 
X-CRM114-Status: GOOD (  19.93  )
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

This reverts commit c9ea564f3d9dd20d88bd34f40a6ff6d31a0d7e8c.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 80 +++++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5665b6e..e0d9a86 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -56,6 +56,7 @@ struct cmdq_thread {
 	void __iomem		*base;
 	struct list_head	task_busy_list;
 	u32			priority;
+	bool			atomic_exec;
 };
 
 struct cmdq_task {
@@ -168,18 +169,56 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 	dma_sync_single_for_cpu(dev, prev_task->pa_base,
 				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
-		(u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
+		(u64)CMDQ_JUMP_BY_PA << 32 |
+		(task->pa_base >> task->cmdq->shift_pa);
 	dma_sync_single_for_device(dev, prev_task->pa_base,
 				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 
 	cmdq_thread_invalidate_fetched_data(thread);
 }
 
+static bool cmdq_command_is_wfe(u64 cmd)
+{
+	u64 wfe_option = CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE;
+	u64 wfe_op = (u64)(CMDQ_CODE_WFE << CMDQ_OP_CODE_SHIFT) << 32;
+	u64 wfe_mask = (u64)CMDQ_OP_CODE_MASK << 32 | 0xffffffff;
+
+	return ((cmd & wfe_mask) == (wfe_op | wfe_option));
+}
+
+/* we assume tasks in the same display GCE thread are waiting the same event. */
+static void cmdq_task_remove_wfe(struct cmdq_task *task)
+{
+	struct device *dev = task->cmdq->mbox.dev;
+	u64 *base = task->pkt->va_base;
+	int i;
+
+	dma_sync_single_for_cpu(dev, task->pa_base, task->pkt->cmd_buf_size,
+				DMA_TO_DEVICE);
+	for (i = 0; i < CMDQ_NUM_CMD(task->pkt); i++)
+		if (cmdq_command_is_wfe(base[i]))
+			base[i] = (u64)CMDQ_JUMP_BY_OFFSET << 32 |
+				  (CMDQ_JUMP_PASS >> task->cmdq->shift_pa);
+	dma_sync_single_for_device(dev, task->pa_base, task->pkt->cmd_buf_size,
+				   DMA_TO_DEVICE);
+}
+
 static bool cmdq_thread_is_in_wfe(struct cmdq_thread *thread)
 {
 	return readl(thread->base + CMDQ_THR_WAIT_TOKEN) & CMDQ_THR_IS_WAITING;
 }
 
+static void cmdq_thread_wait_end(struct cmdq_thread *thread,
+				 unsigned long end_pa)
+{
+	struct device *dev = thread->chan->mbox->dev;
+	unsigned long curr_pa;
+
+	if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_CURR_ADDR,
+			curr_pa, curr_pa == end_pa, 1, 20))
+		dev_err(dev, "GCE thread cannot run to end.\n");
+}
+
 static void cmdq_task_exec_done(struct cmdq_task *task, enum cmdq_cb_status sta)
 {
 	struct cmdq_task_cb *cb = &task->pkt->async_cb;
@@ -371,15 +410,37 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 			cmdq->shift_pa;
 		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
 			cmdq->shift_pa;
-		/* check boundary */
-		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
-		    curr_pa == end_pa) {
-			/* set to this task directly */
-			writel(task->pa_base >> cmdq->shift_pa,
-			       thread->base + CMDQ_THR_CURR_ADDR);
+
+		/*
+		 * Atomic execution should remove the following wfe, i.e. only
+		 * wait event at first task, and prevent to pause when running.
+		 */
+		if (thread->atomic_exec) {
+			/* GCE is executing if command is not WFE */
+			if (!cmdq_thread_is_in_wfe(thread)) {
+				cmdq_thread_resume(thread);
+				cmdq_thread_wait_end(thread,
+						     end_pa >> cmdq->shift_pa);
+				WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
+				/* set to this task directly */
+				writel(task->pa_base >> cmdq->shift_pa,
+				       thread->base + CMDQ_THR_CURR_ADDR);
+			} else {
+				cmdq_task_insert_into_thread(task);
+				cmdq_task_remove_wfe(task);
+				smp_mb(); /* modify jump before enable thread */
+			}
 		} else {
-			cmdq_task_insert_into_thread(task);
-			smp_mb(); /* modify jump before enable thread */
+			/* check boundary */
+			if (curr_pa == end_pa - CMDQ_INST_SIZE ||
+			    curr_pa == end_pa) {
+				/* set to this task directly */
+				writel(task->pa_base >> cmdq->shift_pa,
+				       thread->base + CMDQ_THR_CURR_ADDR);
+			} else {
+				cmdq_task_insert_into_thread(task);
+				smp_mb(); /* modify jump before enable thread */
+			}
 		}
 		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
 		       thread->base + CMDQ_THR_END_ADDR);
@@ -500,6 +561,7 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 
 	thread = (struct cmdq_thread *)mbox->chans[ind].con_priv;
 	thread->priority = sp->args[1];
+	thread->atomic_exec = (sp->args[2] != 0);
 	thread->chan = &mbox->chans[ind];
 
 	return &mbox->chans[ind];
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
