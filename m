Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7511AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0IkclvlLIjnR4XOpv2u+KAvfbq0vy1p7zBiIsdhSZ0=; b=WCwUrYCsxzry2P+BLCqbMaVXYP
	0iI6a1anlGcofJfKgltuPn/jK3bLHqXPuCe4yfsRwX5cjC1Kg2wfv+03uYY39J8TilYPBqzESNCf5
	ytIxtDjGVjBSgKOdyxUStE2M57e3B59MqPTtsNxZJWyXgyc4YVqkpfmsu4wQW/+dipiWg7joN5ryq
	7Vcszkz6QzQ4KY8NbLo0jfh5BkxybBNBt3+UvaQRhL7b04py8y0llbQJDALKfritg3/kvI4fvvsPr
	SjoL4+KZdUgdosqMSzt4Cg2MvtMjnCsw1ym1VcUnSa3FCfklHVawL6yKKFUVIXlr6c2szF0aSrqUA
	tU+F3VsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5izD-007N3J-BD; Thu, 15 Dec 2022 07:48:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5iz9-007MzO-P4; Thu, 15 Dec 2022 07:48:57 +0000
X-UUID: 4ed1da0065d54958863a1b600a5ed202-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F0IkclvlLIjnR4XOpv2u+KAvfbq0vy1p7zBiIsdhSZ0=;
	b=BMIUaroAXMmxQlpIr9AIakhCkymplVXS07FJlRjHpjzS5pqTvXRZHI1PhXr9P0cDbZ7YVgakwZJUHA9qoElv02QsBWB0rCYzL3cFKLRuLGqr+o7J7RKZqf9x6k7/+RJxCZDQPJCrE5dgxtLQ0IqnejkTnnsrG4PkKJC+eowr90I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:669f5172-4a94-4dbe-9e4d-f34392b191c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:dcaaed0,CLOUDID:485eb5af-9f02-4d44-9c44-6e4bb4e4f412,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4ed1da0065d54958863a1b600a5ed202-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2038836311; Thu, 15 Dec 2022 00:48:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 15:28:10 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Dec 2022 15:28:10 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi
 Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v11, 2/4] mailbox: mtk-cmdq: add gce software ddr enable private data
Date: Thu, 15 Dec 2022 15:28:04 +0800
Message-ID: <20221215072806.10224-3-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215072806.10224-1-yongqiang.niu@mediatek.com>
References: <20221215072806.10224-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_234856_060256_8532D4A0 
X-CRM114-Status: GOOD (  13.56  )
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

0x48[2:0] means control by software
0x48[18:16] means ddr enable
0x48[2:0] is pre-condition of 0x48[18:16].
if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at same
time.
and only these bits is useful, other bits is useless bits

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index c3cb24f51699..d2363c6b8b7a 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -39,6 +39,7 @@
 
 #define GCE_GCTL_VALUE			0x48
 #define GCE_CTRL_BY_SW				GENMASK(2, 0)
+#define GCE_DDR_EN				GENMASK(18, 16)
 
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
@@ -81,6 +82,7 @@ struct cmdq {
 	bool			suspended;
 	u8			shift_pa;
 	bool			control_by_sw;
+	bool			sw_ddr_en;
 	u32			gce_num;
 };
 
@@ -88,6 +90,7 @@ struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
 	bool control_by_sw;
+	bool sw_ddr_en;
 	u32 gce_num;
 };
 
@@ -127,10 +130,16 @@ static void cmdq_thread_resume(struct cmdq_thread *thread)
 static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
+	u32 gctl_regval = 0;
 
 	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
 	if (cmdq->control_by_sw)
-		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+		gctl_regval = GCE_CTRL_BY_SW;
+	if (cmdq->sw_ddr_en)
+		gctl_regval |= GCE_DDR_EN;
+
+	if (gctl_regval)
+		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
@@ -545,6 +554,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
 	cmdq->control_by_sw = plat_data->control_by_sw;
+	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
 	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
-- 
2.25.1


