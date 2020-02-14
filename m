Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB561C35242
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 04:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE252168B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 04:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SrBv2xyr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I+RgWdni"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE252168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YMxyuz6paq4GYqKbx6nyVg0CdNeBXIdXMerH3oAa1c=; b=SrBv2xyrejgYl1
	4n+cUzTmxu982bUAqViQ8T5J2v0yrk4z91t2RWbHIjszmdfd8BBjXZA9ulVh6jvxSxQjDkcqQ29a7
	Rkz2OXEfWgKB7wgJx84lopJ12VYsdotIV52EaOGq24dLa5lmxQlYL9MOcH8PxZvdGT0/z7IP94PKh
	YQz7M/r1jgHolmqMOVzPbpLkayf6QU4d4GrBan+k6hmyXFCNDBltrEgHvDWNYpiQUbaGDa1Gq8QfM
	4UCIhRYtpxvRxlqDLwee6o9zqDZFyYQjel6ZonPHqaNFef8dnCbmgbCC9BGjmj6yxEPn5+qAhlFUA
	jd/HJHP1gr95Bj8Vc2eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2SgE-0004Qx-3W; Fri, 14 Feb 2020 04:34:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Sfd-0003jN-R3; Fri, 14 Feb 2020 04:33:43 +0000
X-UUID: 2e18ca1699d44b95a537779f67df01e3-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w2NhLJ3fxw83KsKgFIdEJoeGbAL7h1s87A7XGio1z9k=; 
 b=I+RgWdnimSZez7CAoQ848R5Z0iXfgkdhj0mGQy4AvGtzYsHU4zRfVCtn687h1RG0ekbgyd2YfYIuRPEyELIGs+znAvi+k6T+o2HqJldVr+6UCMCEUDQkYGZd7/gI4kdJuEGYZ4n318wPxS1sQ/OJhh+i3LmN2Sb1wSUvjsS58Ew=;
X-UUID: 2e18ca1699d44b95a537779f67df01e3-20200213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1710761013; Thu, 13 Feb 2020 20:33:29 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 20:33:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 12:32:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 14 Feb 2020 12:33:19 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH 2/3] mailbox: mediatek: remove implementation related to
 atomic_exec
Date: Fri, 14 Feb 2020 12:33:24 +0800
Message-ID: <20200214043325.16618-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200214043325.16618-1-bibby.hsieh@mediatek.com>
References: <20200214043325.16618-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_203341_879738_DA7BBC1D 
X-CRM114-Status: GOOD (  15.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After implement flush, client can flush the executing
command buffer or abort the still waiting for event
command buffer, so controller do not need to implement
atomic_exe feature. remove it.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 76 ++++--------------------------
 1 file changed, 8 insertions(+), 68 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 03e58ff62007..3ce777001aa5 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -57,7 +57,6 @@ struct cmdq_thread {
 	void __iomem		*base;
 	struct list_head	task_busy_list;
 	u32			priority;
-	bool			atomic_exec;
 };
 
 struct cmdq_task {
@@ -163,48 +162,11 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 	cmdq_thread_invalidate_fetched_data(thread);
 }
 
-static bool cmdq_command_is_wfe(u64 cmd)
-{
-	u64 wfe_option = CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE;
-	u64 wfe_op = (u64)(CMDQ_CODE_WFE << CMDQ_OP_CODE_SHIFT) << 32;
-	u64 wfe_mask = (u64)CMDQ_OP_CODE_MASK << 32 | 0xffffffff;
-
-	return ((cmd & wfe_mask) == (wfe_op | wfe_option));
-}
-
-/* we assume tasks in the same display GCE thread are waiting the same event. */
-static void cmdq_task_remove_wfe(struct cmdq_task *task)
-{
-	struct device *dev = task->cmdq->mbox.dev;
-	u64 *base = task->pkt->va_base;
-	int i;
-
-	dma_sync_single_for_cpu(dev, task->pa_base, task->pkt->cmd_buf_size,
-				DMA_TO_DEVICE);
-	for (i = 0; i < CMDQ_NUM_CMD(task->pkt); i++)
-		if (cmdq_command_is_wfe(base[i]))
-			base[i] = (u64)CMDQ_JUMP_BY_OFFSET << 32 |
-				  CMDQ_JUMP_PASS;
-	dma_sync_single_for_device(dev, task->pa_base, task->pkt->cmd_buf_size,
-				   DMA_TO_DEVICE);
-}
-
 static bool cmdq_thread_is_in_wfe(struct cmdq_thread *thread)
 {
 	return readl(thread->base + CMDQ_THR_WAIT_TOKEN) & CMDQ_THR_IS_WAITING;
 }
 
-static void cmdq_thread_wait_end(struct cmdq_thread *thread,
-				 unsigned long end_pa)
-{
-	struct device *dev = thread->chan->mbox->dev;
-	unsigned long curr_pa;
-
-	if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_CURR_ADDR,
-			curr_pa, curr_pa == end_pa, 1, 20))
-		dev_err(dev, "GCE thread cannot run to end.\n");
-}
-
 static void cmdq_task_exec_done(struct cmdq_task *task, enum cmdq_cb_status sta)
 {
 	struct cmdq_task_cb *cb = &task->pkt->async_cb;
@@ -384,36 +346,15 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR);
 		end_pa = readl(thread->base + CMDQ_THR_END_ADDR);
-
-		/*
-		 * Atomic execution should remove the following wfe, i.e. only
-		 * wait event at first task, and prevent to pause when running.
-		 */
-		if (thread->atomic_exec) {
-			/* GCE is executing if command is not WFE */
-			if (!cmdq_thread_is_in_wfe(thread)) {
-				cmdq_thread_resume(thread);
-				cmdq_thread_wait_end(thread, end_pa);
-				WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-				/* set to this task directly */
-				writel(task->pa_base,
-				       thread->base + CMDQ_THR_CURR_ADDR);
-			} else {
-				cmdq_task_insert_into_thread(task);
-				cmdq_task_remove_wfe(task);
-				smp_mb(); /* modify jump before enable thread */
-			}
+		/* check boundary */
+		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
+		    curr_pa == end_pa) {
+			/* set to this task directly */
+			writel(task->pa_base,
+			       thread->base + CMDQ_THR_CURR_ADDR);
 		} else {
-			/* check boundary */
-			if (curr_pa == end_pa - CMDQ_INST_SIZE ||
-			    curr_pa == end_pa) {
-				/* set to this task directly */
-				writel(task->pa_base,
-				       thread->base + CMDQ_THR_CURR_ADDR);
-			} else {
-				cmdq_task_insert_into_thread(task);
-				smp_mb(); /* modify jump before enable thread */
-			}
+			cmdq_task_insert_into_thread(task);
+			smp_mb(); /* modify jump before enable thread */
 		}
 		writel(task->pa_base + pkt->cmd_buf_size,
 		       thread->base + CMDQ_THR_END_ADDR);
@@ -495,7 +436,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 
 	thread = (struct cmdq_thread *)mbox->chans[ind].con_priv;
 	thread->priority = sp->args[1];
-	thread->atomic_exec = (sp->args[2] != 0);
 	thread->chan = &mbox->chans[ind];
 
 	return &mbox->chans[ind];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
