Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532A8C761A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:09:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCDBF20725
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:09:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pYyGYs9o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KU7uNzSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCDBF20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwwyVOoQ3l0s3Dg/ZPFwylsY9AIaMbObe+KpNYF/pYg=; b=pYyGYs9oZEvt0I
	Uj9w8tgMPOaCRvG8FY62jyCzO/xWiHtTgb82mRZ0Wuqok86RVbrU2e+jPZ+hCRgRNGUFxFxHPCBw+
	3ahbc16scQGYZ3Bh/hvI9Q/A3SspPfhJGE6bPsOEy1cgzaX2HrJ9hVVPkVHmPkrnfqNtDMIRRNI8F
	0t8nXx8W8hQwd4GTTiVw1GDyYrDJUGAcZZRugBbshM44lgZM52dvbXcmpCesqh16t49hotkN+rGf1
	Mq3EpbxDHUNNIN6BmS3LLfgPcyXa0XHW3usBMId9xwrayTA2m+c+GS7zEhElvHUOJ7xvEpSyGyaOV
	20R5i+RGEtBDByQcEaGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3cPX-0004vb-Nr; Mon, 17 Feb 2020 09:09:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cPP-0004ne-FB; Mon, 17 Feb 2020 09:09:44 +0000
X-UUID: a664acd45a3c460293d1ac853917cd48-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=035FQ1Fw3xURfPM55/UUoa6QVfGND190Ak9FtnTFJ0g=; 
 b=KU7uNzSuul8qgKRsTbzaDNP5WB0tPR8kiGqP+Q7NbcpsuuPrgR1kCuL+ysbvjyQgCdqi99oQPI2akmkcT0Vhe6SUlCZXPUT2422hUUOVhoH/HpSE6EXCn5R1zqN3wnjN6MlJP10VUd+z+4mlv08ucLZpDm2S8CQB2+2ugtGWjaI=;
X-UUID: a664acd45a3c460293d1ac853917cd48-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2027552165; Mon, 17 Feb 2020 01:09:38 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 01:05:34 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 17:04:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 17 Feb 2020 17:03:36 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH v1 3/3] mailbox: mediatek: remove implementation related to
 atomic_exec
Date: Mon, 17 Feb 2020 17:05:32 +0800
Message-ID: <20200217090532.16019-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
References: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_010943_517976_CE96A73B 
X-CRM114-Status: GOOD (  15.11  )
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
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 76 ++++--------------------------
 1 file changed, 8 insertions(+), 68 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 0da5e2dc2c0e..b24822ad8409 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -56,7 +56,6 @@ struct cmdq_thread {
 	void __iomem		*base;
 	struct list_head	task_busy_list;
 	u32			priority;
-	bool			atomic_exec;
 };
 
 struct cmdq_task {
@@ -162,48 +161,11 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
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
@@ -383,36 +345,15 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
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
@@ -501,7 +442,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 
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
