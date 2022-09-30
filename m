Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yjl+Bzl2sRx8O3JnLZlmYNW0isbqNQocd4L3f9Rikao=; b=vGt89N58TsZzo4fQbpBMFHXpj9
	b4OR/+EKz2x8IxAkoXNJb4bU3N4J8wDXaREJU4ic1uCmlZY0XcWZPzIJVrnbn3d8moek7RXZx1Eam
	ZH4o8+9Y+9fmrg4Sk7MhQvxULNhNFsAtACd4bOLmNtYdrErr0p3AhnDDX924uDyGCS4wCtvpxfGS2
	WLHC7zlx93N/5k74k/qC1Z3XHX0iWLA8XWYwM9TzI9nLGIAY/jQnHgG6WLbO7SIQs4xLcTkGMlXhk
	v1ObPU1sOZlJEcAO5KV6dSW95t7Q4h2nfvEET//e8Ax2mgjn6AXq7Gcoz/2jYRRnD3nQWNqj5a3Yw
	hRSqcSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeJAb-00Aew7-85; Fri, 30 Sep 2022 16:47:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeJAZ-00AetX-Ek; Fri, 30 Sep 2022 16:47:24 +0000
X-UUID: 1e0c91eec4e54fe5bc2ca57877076910-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Yjl+Bzl2sRx8O3JnLZlmYNW0isbqNQocd4L3f9Rikao=;
	b=sSuU7RQMZdcwC22xUxMCOanqLbnIxdSfZ4RXhABLhj3cHDcV77xWtUFuXppKD47hgtlEddPxOt2A6v7HTOMRD+vYz3lrLbuSrv+s6YuLJ0+QnyyjEXpT6hcwfrm8I+sh7SdT4ZR7H+NsQXRKwhs35jbGSsC64zkWc/dMWK+vHCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0f02ae0b-4555-4d11-a540-cdeca2b732c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:eeddcee4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1e0c91eec4e54fe5bc2ca57877076910-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1071491184; Fri, 30 Sep 2022 09:47:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 1 Oct 2022 00:06:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 1 Oct 2022 00:06:40 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v8, 1/4] mailbox: mtk-cmdq: add gce software ddr enable private data
Date: Sat, 1 Oct 2022 00:06:35 +0800
Message-ID: <20220930160638.7588-2-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_094723_537431_0E819E7C 
X-CRM114-Status: GOOD (  12.30  )
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

if gce work control by software, we need set software enable
for MT8186 Soc

there is a handshake flow between gce and ddr hardware,
if not set ddr enable flag of gce, ddr will fall into idle
mode, then gce instructions will not process done.
we need set this flag of gce to tell ddr when gce is idle or busy
controlled by software flow.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..88db6b4642db 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -38,6 +38,8 @@
 #define CMDQ_THR_PRIORITY		0x40
 
 #define GCE_GCTL_VALUE			0x48
+#define GCE_CTRL_BY_SW				GENMASK(2, 0)
+#define GCE_DDR_EN				GENMASK(18, 16)
 
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
@@ -80,6 +82,7 @@ struct cmdq {
 	bool			suspended;
 	u8			shift_pa;
 	bool			control_by_sw;
+	bool			sw_ddr_en;
 	u32			gce_num;
 };
 
@@ -87,6 +90,7 @@ struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
 	bool control_by_sw;
+	bool sw_ddr_en;
 	u32 gce_num;
 };
 
@@ -130,6 +134,10 @@ static void cmdq_init(struct cmdq *cmdq)
 	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
 	if (cmdq->control_by_sw)
 		writel(0x7, cmdq->base + GCE_GCTL_VALUE);
+
+	if (cmdq->sw_ddr_en)
+		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
@@ -543,6 +551,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
 	cmdq->control_by_sw = plat_data->control_by_sw;
+	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
 	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
-- 
2.25.1


