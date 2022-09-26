Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1FEC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9RTTGBKw/m3J4ZPg/V/vQYrAez3B1A8ypKk7tRv9tWo=; b=rXPW6ANDbXTnXTOyAMAuAfIgYC
	rv9jDbxQQFMaUvhCsi6B3Dy4807WnmPz7X0R+YEVXssqt9oE7BvrSTQ5FVJtARcveuhYAcT/S6bbl
	+l4S3J5o+JqpMNFimoNesKTbyA6VtJ3jbbJYvNgM4y7XZIP3wTrm/kCCcAyalN+ps85scSq17gA3+
	RMXBsK6677whtGOunSPO+RI+dVW78KVrNb0YX6jqYnMPxXmjv6G9vidcnOqJIDF3Fqlx7GOqW8Gqv
	6ffLtjhVXNPr5yM4zDxwW5iQTIytlmjARmGHlE4e6boh82zoPJXexp81zsUnm+8L6nVQTs0JjB8Dq
	JOtrGhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjkX-003IZQ-AF; Mon, 26 Sep 2022 08:46:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjkU-003IWL-9Y; Mon, 26 Sep 2022 08:46:00 +0000
X-UUID: b813d8a0fe6348baa5bb8e1991fa748d-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9RTTGBKw/m3J4ZPg/V/vQYrAez3B1A8ypKk7tRv9tWo=;
	b=uO84daE4Z07soC8kYHQd+gvery2NxMjKw+aUaxsQi3yAhUg32Zu39gRsRlAVkorqcFcTKNXa3rXrVoyUe3kNkQDnedRpweRdTZT8tF9pHhTwm+X7T0tVDviVcq2r0ohtEudCxxTu7hq7Ro/Y/hka8tV4+V2alA6RJqcWghls+uA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fa716824-c289-4c6a-a2e7-574de60aa003,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:c1720607-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b813d8a0fe6348baa5bb8e1991fa748d-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 570163914; Mon, 26 Sep 2022 01:45:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 16:35:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Sep 2022 16:35:14 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH] mailbox: mtk-cmdq: fix gce timeout issue
Date: Mon, 26 Sep 2022 16:35:11 +0800
Message-ID: <20220926083511.3382-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_014558_366795_21EFD5DD 
X-CRM114-Status: GOOD (  19.48  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 68 +++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..bd63773b05fd 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -38,6 +38,8 @@
 #define CMDQ_THR_PRIORITY		0x40
 
 #define GCE_GCTL_VALUE			0x48
+#define GCE_CTRL_BY_SW				GENMASK(18, 16)
+#define GCE_DDR_EN				GENMASK(2, 0)
 
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
@@ -80,16 +82,60 @@ struct cmdq {
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
+			writel(GCE_DDR_EN + GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
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
+			writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+	}
+
+	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+}
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -266,7 +312,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	if (list_empty(&thread->task_busy_list)) {
 		cmdq_thread_disable(cmdq, thread);
-		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+
+		cmdq_clk_disable(cmdq);
 	}
 }
 
@@ -355,8 +402,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
-
+		WARN_ON(cmdq_clk_enable(cmdq) < 0);
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -428,7 +474,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+	cmdq_clk_disable(cmdq);
 
 done:
 	/*
@@ -468,7 +514,8 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+
+	cmdq_clk_disable(cmdq);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -543,6 +590,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
 	cmdq->control_by_sw = plat_data->control_by_sw;
+	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
 	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
@@ -615,6 +663,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 
+	spin_lock_init(&cmdq->lock);
 	cmdq_init(cmdq);
 
 	return 0;
@@ -660,9 +709,18 @@ static const struct gce_plat gce_plat_v6 = {
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


