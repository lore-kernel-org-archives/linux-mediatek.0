Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E01C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Imoz2RFJlPTrOcsZ8fTsH4GOsnZrICfV+tqsnJvwp2o=; b=eDGqjg8A2vSjaAptTn7Kbzt7t2
	SN99nYmP39Ekm6dEf0Mt1/C2cPyZYwB7QRjujsdK1fkf3PGj9O+H+wcrpSjuIfj6jSfYrU83Br9lq
	QXncnZOWLG6Kzs90pM3HpFrUCkDXRGUEZrpBmi696dH5VLEUAzRcq4ySA5Ne5JymiYREKcBxVhSV6
	Fppnd4vMvlVIT4yLjjOMDM+7T0fDA05wmmycPFfxjWaKqOBkZ6f82u1UZaSE9BuhFCnT8PYocx0kX
	1B+z6leUhF7nrxN8TrSkuJyTLOEm8CGIsIvAzcpIUCoc4ct9KdwuDyXVgglzU/esY8SYKTtb6yCB7
	eW4U09og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAf8-00ARMu-UI; Wed, 02 Nov 2022 10:07:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAex-00ARHN-L6; Wed, 02 Nov 2022 10:07:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 41381660293F;
	Wed,  2 Nov 2022 10:07:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667383663;
	bh=dOsyMJtPdAV3jUm/GhRp03PrdsruZCqyjWbSMeaW3o4=;
	h=From:To:Cc:Subject:Date:From;
	b=ihmo7pC9gmxuRgb4GL9+EjnPNKr7SgIk+u7e2rgbj6C7ewb3Fuug+lWHh0ER1ep3B
	 3egtMbqPVnt1qmwPVf1FBbr8O0dmrop2UH/ryB2KrqCi6GlsLYygiQzsSlAcrdbmuW
	 rDN5M3shLv77U2N0VpQ9OH2ZYn6hz7i/geud+D3uALLODBjkbjSwzCy7lUT+lVx6yS
	 AX2dJqyxD8foOyz0h0/LXl+Qq7GdMbtnBZ9Rmuwd/mPAtatymHQdAqaqnPHTPQzO7K
	 E/k/h+V8wclxsdBoX2tg7AB7EAdo95O1r6IDVdAqenVAYaQL9WoUJvKEMW4UE0jeZ4
	 I5hUnHxo6Vgnw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] mailbox: mtk-cmdq-mailbox: Use platform data directly instead of copying
Date: Wed,  2 Nov 2022 11:07:36 +0100
Message-Id: <20221102100736.37815-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_030748_068361_EEB7C710 
X-CRM114-Status: GOOD (  21.87  )
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

Copying platform data to struct cmdq serves to no purpose, as that
data is never modified during runtime: it's worth at this point
storing a pointer to gce_plat in gce and.

Remove all duplicated `struct gce_plat` members from `struct gce`
and reuse the platform data across the driver to save some memory.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

This commit applies only on top of series [1]

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684195

 drivers/mailbox/mtk-cmdq-mailbox.c | 88 +++++++++++++-----------------
 1 file changed, 39 insertions(+), 49 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index c5229f377c5e..a460ee26eb11 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -75,15 +75,11 @@ struct cmdq {
 	struct mbox_controller	mbox;
 	void __iomem		*base;
 	int			irq;
-	u32			thread_nr;
 	u32			irq_mask;
+	const struct gce_plat	*pdata;
 	struct cmdq_thread	*thread;
 	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
 	bool			suspended;
-	u8			shift_pa;
-	bool			control_by_sw;
-	bool			sw_ddr_en;
-	u32			gce_num;
 };
 
 struct gce_plat {
@@ -96,21 +92,21 @@ struct gce_plat {
 
 static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
 {
-	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 	if (enable)
 		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
 	else
 		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
 
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 }
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
-	return cmdq->shift_pa;
+	return cmdq->pdata->shift;
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
@@ -144,10 +140,10 @@ static void cmdq_init(struct cmdq *cmdq)
 	int i;
 	u32 gctl_regval = 0;
 
-	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
-	if (cmdq->control_by_sw)
+	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
+	if (cmdq->pdata->control_by_sw)
 		gctl_regval = GCE_CTRL_BY_SW;
-	if (cmdq->sw_ddr_en)
+	if (cmdq->pdata->sw_ddr_en)
 		gctl_regval |= GCE_DDR_EN;
 
 	if (gctl_regval)
@@ -156,7 +152,7 @@ static void cmdq_init(struct cmdq *cmdq)
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 }
 
 static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
@@ -201,7 +197,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
 		(u64)CMDQ_JUMP_BY_PA << 32 |
-		(task->pa_base >> task->cmdq->shift_pa);
+		(task->pa_base >> task->cmdq->pdata->shift);
 	dma_sync_single_for_device(dev, prev_task->pa_base,
 				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 
@@ -235,7 +231,7 @@ static void cmdq_task_handle_error(struct cmdq_task *task)
 	next_task = list_first_entry_or_null(&thread->task_busy_list,
 			struct cmdq_task, list_entry);
 	if (next_task)
-		writel(next_task->pa_base >> cmdq->shift_pa,
+		writel(next_task->pa_base >> cmdq->pdata->shift,
 		       thread->base + CMDQ_THR_CURR_ADDR);
 	cmdq_thread_resume(thread);
 }
@@ -266,7 +262,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->shift_pa;
+	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -289,7 +285,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	if (list_empty(&thread->task_busy_list)) {
 		cmdq_thread_disable(cmdq, thread);
-		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+		clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 	}
 }
 
@@ -303,7 +299,7 @@ static irqreturn_t cmdq_irq_handler(int irq, void *dev)
 	if (!(irq_status ^ cmdq->irq_mask))
 		return IRQ_NONE;
 
-	for_each_clear_bit(bit, &irq_status, cmdq->thread_nr) {
+	for_each_clear_bit(bit, &irq_status, cmdq->pdata->thread_nr) {
 		struct cmdq_thread *thread = &cmdq->thread[bit];
 
 		spin_lock_irqsave(&thread->chan->lock, flags);
@@ -323,7 +319,7 @@ static int cmdq_suspend(struct device *dev)
 
 	cmdq->suspended = true;
 
-	for (i = 0; i < cmdq->thread_nr; i++) {
+	for (i = 0; i < cmdq->pdata->thread_nr; i++) {
 		thread = &cmdq->thread[i];
 		if (!list_empty(&thread->task_busy_list)) {
 			task_running = true;
@@ -334,10 +330,10 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	if (cmdq->sw_ddr_en)
+	if (cmdq->pdata->sw_ddr_en)
 		cmdq_sw_ddr_enable(cmdq, false);
 
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 
 	return 0;
 }
@@ -346,10 +342,10 @@ static int cmdq_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
-	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
 	cmdq->suspended = false;
 
-	if (cmdq->sw_ddr_en)
+	if (cmdq->pdata->sw_ddr_en)
 		cmdq_sw_ddr_enable(cmdq, true);
 
 	return 0;
@@ -359,10 +355,10 @@ static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
-	if (cmdq->sw_ddr_en)
+	if (cmdq->pdata->sw_ddr_en)
 		cmdq_sw_ddr_enable(cmdq, false);
 
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 	return 0;
 }
 
@@ -388,7 +384,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
+		WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 		/*
 		 * The thread reset will clear thread related register to 0,
@@ -398,9 +394,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base >> cmdq->shift_pa,
+		writel(task->pa_base >> cmdq->pdata->shift,
 		       thread->base + CMDQ_THR_CURR_ADDR);
-		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
 		       thread->base + CMDQ_THR_END_ADDR);
 
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
@@ -409,20 +405,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
-			cmdq->shift_pa;
+			cmdq->pdata->shift;
 		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
-			cmdq->shift_pa;
+			cmdq->pdata->shift;
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
 			/* set to this task directly */
-			writel(task->pa_base >> cmdq->shift_pa,
+			writel(task->pa_base >> cmdq->pdata->shift,
 			       thread->base + CMDQ_THR_CURR_ADDR);
 		} else {
 			cmdq_task_insert_into_thread(task);
 			smp_mb(); /* modify jump before enable thread */
 		}
-		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
 		       thread->base + CMDQ_THR_END_ADDR);
 		cmdq_thread_resume(thread);
 	}
@@ -461,7 +457,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 
 done:
 	/*
@@ -501,7 +497,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -548,7 +544,6 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct cmdq *cmdq;
 	int err, i;
-	struct gce_plat *plat_data;
 	struct device_node *phandle = dev->of_node;
 	struct device_node *node;
 	int alias_id = 0;
@@ -567,18 +562,13 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (cmdq->irq < 0)
 		return cmdq->irq;
 
-	plat_data = (struct gce_plat *)of_device_get_match_data(dev);
-	if (!plat_data) {
+	cmdq->pdata = device_get_match_data(dev);
+	if (!cmdq->pdata) {
 		dev_err(dev, "failed to get match data\n");
 		return -EINVAL;
 	}
 
-	cmdq->thread_nr = plat_data->thread_nr;
-	cmdq->shift_pa = plat_data->shift;
-	cmdq->control_by_sw = plat_data->control_by_sw;
-	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
-	cmdq->gce_num = plat_data->gce_num;
-	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
+	cmdq->irq_mask = GENMASK(cmdq->pdata->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
 	if (err < 0) {
@@ -589,10 +579,10 @@ static int cmdq_probe(struct platform_device *pdev)
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
 
-	if (cmdq->gce_num > 1) {
+	if (cmdq->pdata->gce_num > 1) {
 		for_each_child_of_node(phandle->parent, node) {
 			alias_id = of_alias_get_id(node, clk_name);
-			if (alias_id >= 0 && alias_id < cmdq->gce_num) {
+			if (alias_id >= 0 && alias_id < cmdq->pdata->gce_num) {
 				cmdq->clocks[alias_id].id = clk_names[alias_id];
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
 				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
@@ -614,12 +604,12 @@ static int cmdq_probe(struct platform_device *pdev)
 	}
 
 	cmdq->mbox.dev = dev;
-	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->thread_nr,
+	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
 					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
 	if (!cmdq->mbox.chans)
 		return -ENOMEM;
 
-	cmdq->mbox.num_chans = cmdq->thread_nr;
+	cmdq->mbox.num_chans = cmdq->pdata->thread_nr;
 	cmdq->mbox.ops = &cmdq_mbox_chan_ops;
 	cmdq->mbox.of_xlate = cmdq_xlate;
 
@@ -627,12 +617,12 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->mbox.txdone_irq = false;
 	cmdq->mbox.txdone_poll = false;
 
-	cmdq->thread = devm_kcalloc(dev, cmdq->thread_nr,
+	cmdq->thread = devm_kcalloc(dev, cmdq->pdata->thread_nr,
 					sizeof(*cmdq->thread), GFP_KERNEL);
 	if (!cmdq->thread)
 		return -ENOMEM;
 
-	for (i = 0; i < cmdq->thread_nr; i++) {
+	for (i = 0; i < cmdq->pdata->thread_nr; i++) {
 		cmdq->thread[i].base = cmdq->base + CMDQ_THR_BASE +
 				CMDQ_THR_SIZE * i;
 		INIT_LIST_HEAD(&cmdq->thread[i].task_busy_list);
@@ -647,7 +637,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cmdq);
 
-	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
 
 	cmdq_init(cmdq);
 
-- 
2.37.2


