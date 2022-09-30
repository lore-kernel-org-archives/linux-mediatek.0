Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZ6iZbj6BvSVHMPh1bMt0Yjt/oNZDitv9Er3efiiglE=; b=Q6nF0wbp0SvEuUJPVcEFMoPBc8
	wH4KZMcy+werW7YUVyxiDQjurr0B1R267BVzcEyVKxY9xPtBFoSO7x1PW3WqWHsbOZ9gqk2cGa04g
	3Dw6kyRLCZRTp6swM/vrEZtyWXu9sgoOvNeR5XZ/MFsE/fEpm+OfDc9yCho/v+gYGFm22R6Q3jMpQ
	AoH22JPswgKyqwwop7LqmZ2yTv3tf7noL1AeSL0plD8Uq+XNTanjkowBT2VXxA7VavsTBuwf5aIMh
	/NkigzsYxZf2YkuKQMBpxIm7S5Us9UojAnXF6E4l31h314J1WsQkRToHO+T/suuaAAwF4bhQcFUv7
	dodqM4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeD8h-008YFc-Ju; Fri, 30 Sep 2022 10:21:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeD8f-008YD9-12; Fri, 30 Sep 2022 10:21:03 +0000
X-UUID: 81f0c1ea445d495f9a0efdf80adaedf1-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FZ6iZbj6BvSVHMPh1bMt0Yjt/oNZDitv9Er3efiiglE=;
	b=hBPZi8bfr1jknpLvOpPCduidXmFWj1pvHtoAXlu2MkKpEUZn8qFn8Ggjr1R9g6vM5SYpvu5DOH7OZIPZgmXgbnvTiITSaJvfUTVHek1o8QgBDBCjXIgDAhz8fU9udCE6+n1SbpHakmrACqYQE+GIh4VuC3fCLMNcyU359vbrFoQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e0a80884-301d-4b35-8027-408f38de1a84,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:67b09307-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 81f0c1ea445d495f9a0efdf80adaedf1-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1730263112; Fri, 30 Sep 2022 03:20:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 17:59:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 30 Sep 2022 17:59:18 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v7, 2/3] mailbox: mtk-cmdq: add gce ddr enable support flow
Date: Fri, 30 Sep 2022 17:59:14 +0800
Message-ID: <20220930095915.13684-3-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930095915.13684-1-yongqiang.niu@mediatek.com>
References: <20220930095915.13684-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_032101_365498_5A572B4B 
X-CRM114-Status: GOOD (  12.11  )
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

add gce ddr enable control flow when gce suspend/resume

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 04eb44d89119..84a60750d0c4 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -94,6 +94,21 @@ struct gce_plat {
 	u32 gce_num;
 };
 
+static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
+{
+	if (!cmdq->sw_ddr_en)
+		return;
+
+	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
+
+	if (enable)
+		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+	else
+		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+
+	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+}
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -319,6 +334,8 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
+	cmdq_sw_ddr_enable(cmdq, false);
+
 	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 
 	return 0;
@@ -330,6 +347,9 @@ static int cmdq_resume(struct device *dev)
 
 	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 	cmdq->suspended = false;
+
+	cmdq_sw_ddr_enable(cmdq, true);
+
 	return 0;
 }
 
@@ -337,6 +357,8 @@ static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
+	cmdq_sw_ddr_enable(cmdq, false);
+
 	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 	return 0;
 }
-- 
2.25.1


