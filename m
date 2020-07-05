Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789A7C433E1
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461AB20870
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dlkvdrCO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UAlzSeKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461AB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TS/MioZ9yyx/3dKoY9c08QKk4+pWAuspRoSK7HzhLFo=; b=dlkvdrCOwZLIJHrb6WlPBEdJb
	U+6Yldhx35PkPxDiIy/hp9ZIwWKyj0OPH5cE0cPSFQxcAmPRrnWrFcPqEyc6UV0CugV32TB624l+x
	zd/qCbIN7Ij8BW4iNkVy1Y2FslA1owD5VzaThj7BXWCokjEbSWECreiNy2WEFQFmcbtOm6w3SktDH
	oJRJkal7g4Noz5bQjn/64XFi3c9+jx72iSRa1+mHhPrEIPWSnAu+idFEp9SrGlVQYqTn/1dVxsL0x
	mbhgyU+MHj84zrdqJRh9/KdfLluQJGchvvBfFkIC0RvVbvPrcV2aD9El5xWqHX8IupFXbLRICqZHP
	MXYqEAVpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jryHU-0005ln-Nd; Sun, 05 Jul 2020 06:37:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jryHM-0005hu-KA; Sun, 05 Jul 2020 06:37:33 +0000
X-UUID: 2e8683c6c17c47088a98d5b6d9a0d38f-20200704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NdM8OpfH178M4YTJZA0mq1tnvjoftBsw8vQ2+D7yQnw=; 
 b=UAlzSeKrS3rKI6M9OgO9PYuI+dFsRjAnUPeXboczgQSSLF7vQXncN2qWcloZAbLLpplQ4TUaZJaZWVomEAKsBlAk+gNGHNf+N5AWQag5bb4RBqM8rJkaYkcAXAixH35fflDEfdt+Ll6SBUkQX4LdrtAEdv+r+j4krid4hc/7i7U=;
X-UUID: 2e8683c6c17c47088a98d5b6d9a0d38f-20200704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1683444525; Sat, 04 Jul 2020 22:37:12 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Jul 2020 23:37:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 14:37:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 5 Jul 2020 14:37:17 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 2/4] mailbox: cmdq: variablize address shift in platform
Date: Sun, 5 Jul 2020 14:37:14 +0800
Message-ID: <1593931037-24405-3-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 884AC6DE2252317DD2F671BDE9E801916AEC40836AD00BD1D8A2AF48CCB0B8692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_023732_855493_25DCB869 
X-CRM114-Status: GOOD (  15.43  )
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
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
 drivers/mailbox/mtk-cmdq-mailbox.c       |   57 +++++++++++++++++++++++-------
 include/linux/mailbox/mtk-cmdq-mailbox.h |    2 ++
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index b24822ad8409..49d9264145aa 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -75,8 +75,22 @@ struct cmdq {
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
+u8 cmdq_get_shift_pa(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	return cmdq->shift_pa;
+}
+EXPORT_SYMBOL(cmdq_get_shift_pa);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
@@ -183,13 +197,15 @@ static void cmdq_task_handle_error(struct cmdq_task *task)
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
 
@@ -219,7 +235,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR);
+	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->shift_pa;
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -335,27 +351,31 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
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
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
 			/* set to this task directly */
-			writel(task->pa_base,
+			writel(task->pa_base >> cmdq->shift_pa,
 			       thread->base + CMDQ_THR_CURR_ADDR);
 		} else {
 			cmdq_task_insert_into_thread(task);
 			smp_mb(); /* modify jump before enable thread */
 		}
-		writel(task->pa_base + pkt->cmd_buf_size,
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
 		       thread->base + CMDQ_THR_END_ADDR);
 		cmdq_thread_resume(thread);
 	}
@@ -453,6 +473,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
+	struct gce_plat *plat_data;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -471,7 +492,14 @@ static int cmdq_probe(struct platform_device *pdev)
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
@@ -534,9 +562,12 @@ static int cmdq_probe(struct platform_device *pdev)
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
index a96e8c252bac..05eea1aef5aa 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -90,4 +90,6 @@ struct cmdq_pkt {
 	void			*cl;
 };
 
+u8 cmdq_get_shift_pa(struct mbox_chan *chan);
+
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
