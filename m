Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE70C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 07:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYgiiIeLx+IWuygJtp8CNsHZ0VYNVDCr/JZPgq7y/lw=; b=JNoO1YvXcOPasK/NYgFXj/zy+1
	74hsJ2Z+Eb0CX/Y0B5h5NORsiJEk2Jn78Re0kl1VZbqZjE8rKKjDMzREQDTyNbb2LVuX+oN3ukl9j
	GHuU2bXVsMDYinv/AhYi1/+nodaxMYt+EVFYPx8WTjgYZXjIq+gR+Ml3GSnqjEx5p2DsEhWmDopSt
	LdB1qgqcAsy3jX01Hcp0BHIahuYSRZhOI3zpWeNAgM07rZDUl5ZDnw+ocejFia09eAeSNMua97Lkm
	fTKWPSGgcUPsub9eXsbmc5BrYICx5fNkN5sld2cGyGycXZx/5lwB7K1tlO+YAjsdNN0Qa3M4hb5B7
	abK1Qo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ig8-007E9S-5E; Thu, 15 Dec 2022 07:29:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ig5-007E78-Kz; Thu, 15 Dec 2022 07:29:15 +0000
X-UUID: 208b89cd88c44e9a86c258dda42cb9ed-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EYgiiIeLx+IWuygJtp8CNsHZ0VYNVDCr/JZPgq7y/lw=;
	b=kQ82JP8abnNQthfbboesmbM6TkRUbobC/zgi5+86FxQgnvVB++y7cUW4a1ONwuNm8hcNkslC787l3Wb1yTRtrJpDkui8dKVzAnyvi0q9GGaevaYjbR6YGrKA4QyajYI3VV3ww4HRWLGYmxN6jVgxG2i4Un+L8hOi4Wuollz7VrY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:3e724509-a63b-4c79-b108-606fd0592e68,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:5,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:dcaaed0,CLOUDID:fdb5b4af-9f02-4d44-9c44-6e4bb4e4f412,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 208b89cd88c44e9a86c258dda42cb9ed-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1351000092; Thu, 15 Dec 2022 00:29:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 15:28:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Dec 2022 15:28:10 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi
 Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v11, 3/4] mailbox: mtk-cmdq: add gce ddr enable support flow
Date: Thu, 15 Dec 2022 15:28:05 +0800
Message-ID: <20221215072806.10224-4-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215072806.10224-1-yongqiang.niu@mediatek.com>
References: <20221215072806.10224-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_232913_711364_9B279B21 
X-CRM114-Status: GOOD (  12.37  )
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

when all cmdq instruction task has been processed done,
we need set this gce ddr enable to disable status to tell
cmdq hardware gce there is none task need process, and the hardware
can go into idle mode and no access ddr anymore, then the spm can go
into suspend.

the original issue is gce still access ddr when cmdq suspend function
call, but there is no task run.
so, we need control gce access ddr with this flow.
when cmdq suspend function, there is no task need process, we can
disable gce access ddr, to make sure system go into suspend success.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index d2363c6b8b7a..53904511598d 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -94,6 +94,18 @@ struct gce_plat {
 	u32 gce_num;
 };
 
+static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
+{
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
@@ -322,6 +334,9 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
+	if (cmdq->sw_ddr_en)
+		cmdq_sw_ddr_enable(cmdq, false);
+
 	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 
 	return 0;
@@ -333,6 +348,10 @@ static int cmdq_resume(struct device *dev)
 
 	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 	cmdq->suspended = false;
+
+	if (cmdq->sw_ddr_en)
+		cmdq_sw_ddr_enable(cmdq, true);
+
 	return 0;
 }
 
@@ -340,6 +359,9 @@ static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
+	if (cmdq->sw_ddr_en)
+		cmdq_sw_ddr_enable(cmdq, false);
+
 	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 	return 0;
 }
-- 
2.25.1


