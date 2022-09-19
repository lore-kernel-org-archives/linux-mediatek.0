Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2ADC6FA90
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sybNd4ffeG3bz/UNX8AgLF+t9XR2tFyzTILybVNaYxA=; b=UGXhnsxS3afSW8RPsBIb3FcijQ
	IvvWcrUH61enqHSnbvoivW/qwa3xlLXmLQcGPRskG9LfIltwM/z1rEwcTSNkg85a9n9J+8iffhu5c
	NG0SvIwQ5ua7O8sru/5zJAYin80uXDyYiFw/+F2nJj8tLifsxvhUIZRgs0YXeNB5BSoExI+UCT9K7
	UZ7dEEFtkkfbdFWobOeg2LxHbe/cZATB1hxMVVKxnsbU3fMi9xONRnHZLW+EyPzSxra3spA6D5p5e
	pGS9PVDha7u41Aj06LwoITV8XZEi3AZntVEyqWVWtVoInZZpG8f3vPk9MWJQWQcPJ9WtwkUpq67it
	ZnzecdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBlM-009ieW-TE; Mon, 19 Sep 2022 08:04:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBkV-009hjC-EC; Mon, 19 Sep 2022 08:03:41 +0000
X-UUID: e18c7a939a08432199c4d9044c37f261-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sybNd4ffeG3bz/UNX8AgLF+t9XR2tFyzTILybVNaYxA=;
	b=DuSbKAjCuHbjScEC5O2R76jCNy+h61yxFKVFZHEmsaOD4UCndYBaAZkdOXh3jqiP2NZTeYzuZmi1hA+9iRdXwmxM3yrYlVQXDgXXGKlW2JFK32duVDjhMDDwcRjRVjF4tFlDefCMPerghB7ZRT0+TSDJS/gyrhwToYTzuWaphY0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5e4b1b20-cdcf-4d9f-b630-82654d84b70a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:b98bdff6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e18c7a939a08432199c4d9044c37f261-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1247798884; Mon, 19 Sep 2022 01:03:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 15:12:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 15:12:41 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [RESEND PATCH v2] mailbox: mtk-cmdq: fix gce timeout issue
Date: Mon, 19 Sep 2022 15:12:38 +0800
Message-ID: <20220919071238.23920-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_010328_291115_2E53032A 
X-CRM114-Status: GOOD (  19.84  )
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

1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18) when gce work,
and disable gce ddr enable when gce work job done
2. split cmdq clk enable/disable api, and control gce ddr enable/disable
in clk enable/disable function to make sure it could protect when cmdq
is multiple used by display and mdp

this is only for some SOC which has flag "control_by_sw".
for this kind of gce, there is a handshake flow between gce and ddr
hardware,
if not set ddr enable flag of gce, ddr will fall into idle mode,
then gce instructions will not process done.
we need set this flag of gce to tell ddr when gce is idle or busy
controlled by software flow.

ddr problem is a special case.
when test suspend/resume case, gce sometimes will pull ddr, and ddr can
not go to suspend.
if we set gce register 0x48 to 0x7, will fix this gce pull ddr issue,
as you have referred [1] and [2] (8192 and 8195)
but for mt8186, the gce is more special, except setting of [1] and [2],
we need add more setting set gce register 0x48 to (0x7 << 16 | 0x7)
when gce working to make sure gce could process all instructions ok.
this case just need normal bootup, if we not set this, display cmdq
task will timeout, and chrome homescreen will always black screen.

and with this patch, we have done these test on mt8186:
1.suspend/resume
2.boot up to home screen
3.playback video with youtube.

suspend issue is special gce hardware issue, gce client  driver
command already process done, but gce still pull ddr.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 66 +++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..3a1b11de84be 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -80,16 +80,60 @@ struct cmdq {
 	bool			suspended;
 	u8			shift_pa;
 	bool			control_by_sw;
+	bool			sw_ddr_en;
 	u32			gce_num;
+	atomic_t		usage;
+	spinlock_t		lock;
 };
 
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
 	bool control_by_sw;
+	bool sw_ddr_en;
 	u32 gce_num;
 };
 
+static s32 cmdq_clk_enable(struct cmdq *cmdq)
+{
+	s32 usage, ret;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cmdq->lock, flags);
+
+	usage = atomic_inc_return(&cmdq->usage);
+
+	ret = clk_bulk_enable(cmdq->gce_num, cmdq->clocks);
+	if (usage <= 0 || ret < 0) {
+		dev_err(cmdq->mbox.dev, "ref count %d ret %d suspend %d\n",
+			usage, ret, cmdq->suspended);
+	} else if (usage == 1) {
+		if (cmdq->sw_ddr_en)
+			writel((0x7 << 16) + 0x7, cmdq->base + GCE_GCTL_VALUE);
+	}
+
+	spin_unlock_irqrestore(&cmdq->lock, flags);
+
+	return ret;
+}
+
+static void cmdq_clk_disable(struct cmdq *cmdq)
+{
+	s32 usage;
+
+	usage = atomic_dec_return(&cmdq->usage);
+
+	if (usage < 0) {
+		dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
+			usage, cmdq->suspended);
+	} else if (usage == 0) {
+		if (cmdq->sw_ddr_en)
+			writel(0x7, cmdq->base + GCE_GCTL_VALUE);
+	}
+
+	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+}
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -266,7 +310,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	if (list_empty(&thread->task_busy_list)) {
 		cmdq_thread_disable(cmdq, thread);
-		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+
+		cmdq_clk_disable(cmdq);
 	}
 }
 
@@ -355,8 +400,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
-
+		WARN_ON(cmdq_clk_enable(cmdq) < 0);
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -428,7 +472,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+	cmdq_clk_disable(cmdq);
 
 done:
 	/*
@@ -468,7 +512,8 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+
+	cmdq_clk_disable(cmdq);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -543,6 +588,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
 	cmdq->control_by_sw = plat_data->control_by_sw;
+	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
 	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
@@ -615,6 +661,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 
+	spin_lock_init(&cmdq->lock);
 	cmdq_init(cmdq);
 
 	return 0;
@@ -660,9 +707,18 @@ static const struct gce_plat gce_plat_v6 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_v7 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.control_by_sw = true,
+	.sw_ddr_en = true,
+	.gce_num = 1
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
+	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
-- 
2.25.1


