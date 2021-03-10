Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89CCC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 07:43:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A8164FDE
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 07:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A8164FDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yCfjeF/iJR/XM8ap6+OvOzet5uVfk0GW0kOHq5OAQhg=; b=TNy9oW1cPo1nKnjHiUE5XcS6x
	j4wNqo/TnVFYcJBxktMroNodLauW55XQ8c2+SJgJ8K06RMthpVj2WEE3bNBg0yuo8kHAoAYIpclyA
	lKAKB4ZSbqFR6M1iJu7LwY+QQ/RhB0WqnmZfDmoZPji1GF/Wx2+OpU6fXOhrR66SPRvlSVtlfui6o
	cOG4Y8L6TO2aCnH/yUIdT93IbkrYbrO+DFTagoyQZ+R0jCX4d1sBX58NxxdNz7FEnZr+Gc/GBi2vG
	Ls8ZnIhA0E3XWLjnY4djHoCFCUtkpcgabY+ZzXStJm+XEDNpilA32PmJRCV4e9kE0bjJ+0/45bkle
	4c3g++QrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJtV0-006Exs-3D; Wed, 10 Mar 2021 07:43:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJtUd-006Esp-LV; Wed, 10 Mar 2021 07:42:57 +0000
X-UUID: 2e115b7facf0421298e8223f33253367-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b5ruACkjCZLLdRVzxhpd615PfjeehpNb38d4EOe3Jbo=; 
 b=ZffMr8WamqhtfoKAmxCu4YM0tgxtAMO0kM/uYK1xdxDu7EVC3Q5Sj2m99GlYGX9egUt0zaWEY6S4yUMy9jLcAcoYtjPzl/8ZfC+aAW+yQZtHX7ueO9Oz6Vp5uviYRs8/1zxEhSlZsp8pggSPtBH+/OYlxWkdKgic5xWDtV2v/UE=;
X-UUID: 2e115b7facf0421298e8223f33253367-20210309
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1288178564; Tue, 09 Mar 2021 23:42:51 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 23:42:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 15:42:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 15:42:47 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 2/2] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
Date: Wed, 10 Mar 2021 15:42:12 +0800
Message-ID: <1615362132-30603-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1615362132-30603-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1615362132-30603-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_074256_101582_BED8B451 
X-CRM114-Status: GOOD (  20.44  )
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

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 80 +++++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5665b6e..1eac05f 100644
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
+		(task->pa_base >> cmdq->shift_pa);
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
