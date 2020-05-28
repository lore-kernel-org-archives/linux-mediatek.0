Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821A0C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 17:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25AED20721
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 17:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YobZxOd6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="muT9H6Nh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25AED20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwtHXiVe2e+CzlxxubS7M6dGb5jyUtCNiF4kV5Gbty0=; b=YobZxOd6VOVum6
	BjleseOsyuGQ7quBEk1uMZEyitfNDllI5pyshGjZm7VaJEo7f1Xo01CiLTMPiitut37ZxLa5MGvcf
	uJbC5dOzcp6khoddI8X2QYTTVzpZC5KuIDw91r/bMZKZ6yByeWxUmxpkP6ADgZ57pmZOn2Z2pecKb
	2PieONKy6lNMdhbrvo5barot3s6d8JPH9rnMpcNlH1M6gG3XrV/5r9NoSbbYlJlcKcK0+K8+UthPl
	HZgcF95X05BD4t6b6SzYY3KlEhhR/VVnz8YIqgSi1a2CjT1AG0DldoztKslTuSUyuvX84fT/5vVw8
	jSAlkbfC1kxwdGYv7iIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeM0u-0002uM-GJ; Thu, 28 May 2020 17:08:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeLyB-0000AH-Ad; Thu, 28 May 2020 17:05:29 +0000
X-UUID: a276d5615ea941c0b62ccb4f88d57bab-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hw0PvFUSErns+K5JyLf5hPMVOfyHlYNsFup0D9YVq0U=; 
 b=muT9H6NhF+YeDlBAZDxxaWpoXYTC1bOuHi8X3RuJ25tjvS9TCZeKihEB2JK4llYG1iXvGNzvBcs0uRpAupPneJyRja3kRmjOVxSMpkhmiq4n9oslek9kL084Pqkfc6Hydtns3oCuDUbpe8/gzHfDquC9x633q8QFuEkIYXQxW9k=;
X-UUID: a276d5615ea941c0b62ccb4f88d57bab-20200528
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 113592220; Thu, 28 May 2020 09:04:59 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 10:05:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 01:05:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 May 2020 01:05:07 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 02/16] mailbox: cmdq: variablize address shift in platform
Date: Fri, 29 May 2020 01:04:38 +0800
Message-ID: <1590685491-17107-4-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6715BA87260D7444E4BF06A584A87B9B954D2F27BD0420E4E4590E8FBC77EF22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_100527_399905_45CAA99D 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some gce hardware shift pc and end address in register to support
large dram addressing.
Implement gce address shift when write or read pc and end register.
And add shift bit in platform definition.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
 include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
 2 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..4dbee9258127 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -76,8 +76,22 @@ struct cmdq {
 	struct cmdq_thread	*thread;
 	struct clk		*clock;
 	bool			suspended;
+	u8			shift_pa;
 };
 
+struct gce_plat {
+	u32 thread_nr;
+	u8 shift;
+};
+
+u8 cmdq_mbox_shift(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	return cmdq->shift_pa;
+}
+EXPORT_SYMBOL(cmdq_mbox_shift);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
@@ -183,7 +197,7 @@ static void cmdq_task_remove_wfe(struct cmdq_task *task)
 	for (i = 0; i < CMDQ_NUM_CMD(task->pkt); i++)
 		if (cmdq_command_is_wfe(base[i]))
 			base[i] = (u64)CMDQ_JUMP_BY_OFFSET << 32 |
-				  CMDQ_JUMP_PASS;
+				  CMDQ_JUMP_PASS >> task->cmdq->shift_pa;
 	dma_sync_single_for_device(dev, task->pa_base, task->pkt->cmd_buf_size,
 				   DMA_TO_DEVICE);
 }
@@ -221,13 +235,15 @@ static void cmdq_task_handle_error(struct cmdq_task *task)
 {
 	struct cmdq_thread *thread = task->thread;
 	struct cmdq_task *next_task;
+	struct cmdq *cmdq = task->cmdq;
 
-	dev_err(task->cmdq->mbox.dev, "task 0x%p error\n", task);
-	WARN_ON(cmdq_thread_suspend(task->cmdq, thread) < 0);
+	dev_err(cmdq->mbox.dev, "task 0x%p error\n", task);
+	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 	next_task = list_first_entry_or_null(&thread->task_busy_list,
 			struct cmdq_task, list_entry);
 	if (next_task)
-		writel(next_task->pa_base, thread->base + CMDQ_THR_CURR_ADDR);
+		writel(next_task->pa_base >> cmdq->shift_pa,
+		       thread->base + CMDQ_THR_CURR_ADDR);
 	cmdq_thread_resume(thread);
 }
 
@@ -257,7 +273,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR);
+	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->shift_pa;
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -373,16 +389,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		WARN_ON(clk_enable(cmdq->clock) < 0);
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base, thread->base + CMDQ_THR_CURR_ADDR);
-		writel(task->pa_base + pkt->cmd_buf_size,
+		writel(task->pa_base >> cmdq->shift_pa,
+		       thread->base + CMDQ_THR_CURR_ADDR);
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
 		       thread->base + CMDQ_THR_END_ADDR);
+
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
 		writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
 		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR);
-		end_pa = readl(thread->base + CMDQ_THR_END_ADDR);
+		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
+			cmdq->shift_pa;
+		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
+			cmdq->shift_pa;
 
 		/*
 		 * Atomic execution should remove the following wfe, i.e. only
@@ -395,7 +415,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 				cmdq_thread_wait_end(thread, end_pa);
 				WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 				/* set to this task directly */
-				writel(task->pa_base,
+				writel(task->pa_base >> cmdq->shift_pa,
 				       thread->base + CMDQ_THR_CURR_ADDR);
 			} else {
 				cmdq_task_insert_into_thread(task);
@@ -407,14 +427,14 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 			if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 			    curr_pa == end_pa) {
 				/* set to this task directly */
-				writel(task->pa_base,
+				writel(task->pa_base >> cmdq->shift_pa,
 				       thread->base + CMDQ_THR_CURR_ADDR);
 			} else {
 				cmdq_task_insert_into_thread(task);
 				smp_mb(); /* modify jump before enable thread */
 			}
 		}
-		writel(task->pa_base + pkt->cmd_buf_size,
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
 		       thread->base + CMDQ_THR_END_ADDR);
 		cmdq_thread_resume(thread);
 	}
@@ -461,6 +481,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
+	struct gce_plat *plat_data;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -479,7 +500,14 @@ static int cmdq_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmdq->thread_nr = (u32)(unsigned long)of_device_get_match_data(dev);
+	plat_data = (struct gce_plat *)of_device_get_match_data(dev);
+	if (!plat_data) {
+		dev_err(dev, "failed to get match data\n");
+		return -EINVAL;
+	}
+
+	cmdq->thread_nr = plat_data->thread_nr;
+	cmdq->shift_pa = plat_data->shift;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
@@ -542,9 +570,12 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 	.resume = cmdq_resume,
 };
 
+static const struct gce_plat gce_plat_v2 = {.thread_nr = 16};
+static const struct gce_plat gce_plat_v3 = {.thread_nr = 24};
+
 static const struct of_device_id cmdq_of_ids[] = {
-	{.compatible = "mediatek,mt8173-gce", .data = (void *)16},
-	{.compatible = "mediatek,mt8183-gce", .data = (void *)24},
+	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
+	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{}
 };
 
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a4dc45fbec0a..dfe5b2eb85cc 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -88,4 +88,6 @@ struct cmdq_pkt {
 	void			*cl;
 };
 
+u8 cmdq_mbox_shift(struct mbox_chan *chan);
+
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
