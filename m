Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A8DCD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ay/KesTJvfQ4nZo6GA6z9hZkyPGI4W/uZ7hpSH0F7lw=; b=MPtjJVLzZsgrEYYGcepk6dwoe8
	ikvJOaj2jeAbeF+6ly8SiXF5zW6B87rRn5ln4t9Xxu4YCBAOEs91AH0KoUkC+G3Q6655GqpT3ADMo
	p3Tr3/Qgd1zBQIOuF4rQ0NMFkb4sDMVOmJwG89Gj7WXuCBIF994AOQzkAEJt2s8+e0uWMQ2u3NqPZ
	Kz56/c5OBkbnfQqkIN3yyGdUz4miXjYlChgLvonA62IQpxdV6t6TL5wGC3wZOiRYNWS1YAYonrXif
	HK7grD9gaCKB2iFbENHJAwSxqL9f90usraP662mzd3WnSHbwv0sgOH78nYx5pqFI0dGEZmpcvKsWP
	55pr4a1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJp9-00GAMN-03;
	Mon, 18 Sep 2023 19:22:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJp2-00GAG4-2f;
	Mon, 18 Sep 2023 19:22:18 +0000
X-UUID: aa4d8796565811ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ay/KesTJvfQ4nZo6GA6z9hZkyPGI4W/uZ7hpSH0F7lw=;
	b=BZrUPu9I+Ds0Y3sa9oWeQ76Z2g5BokDqywb72sACicjZCbs2HmVKG/q6twctGB1Vp+YHSkFn2IlpoL/4dfWsBTXFq7cIDDvOdZI6h+SipDY1wqOAtqI175kVhwsI1B61PEieNq2ChBX0JkzNQbvaEaY+U2Cnu8nzQHZAHWnYxu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:fddd5781-a372-452c-8006-1dd65beecebd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:f69a2bc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa4d8796565811ee9b7791016c24628a-20230918
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 959722531; Mon, 18 Sep 2023 12:22:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:07 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Elvis
 Wang <Elvis.Wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 09/15] mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
Date: Tue, 19 Sep 2023 03:21:58 +0800
Message-ID: <20230918192204.32263-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_122216_874962_F6BCE8D7 
X-CRM114-Status: GOOD (  18.43  )
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

CMDQ driver will probe a secure CMDQ driver when has_sec flag
in platform data is true and its device node in dts has defined a
event id of CMDQ_SYNC_TOKEN_SEC_EOF.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 40 ++++++++++++++++++++++--
 include/linux/mailbox/mtk-cmdq-mailbox.h | 11 +++++++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a3b831b6bab9..cd4a8f0ef6ad 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -87,6 +87,7 @@ struct gce_plat {
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool has_sec;
 	u32 gce_num;
 };
 
@@ -566,14 +567,23 @@ static int cmdq_probe(struct platform_device *pdev)
 	int alias_id = 0;
 	static const char * const clk_name = "gce";
 	static const char * const clk_names[] = { "gce0", "gce1" };
+	struct resource *res;
+	struct platform_device *mtk_cmdq_sec;
+	u32 hwid = 0;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
 		return -ENOMEM;
 
-	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(cmdq->base))
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	cmdq->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(cmdq->base)) {
+		dev_err(dev, "failed to ioremap cmdq\n");
 		return PTR_ERR(cmdq->base);
+	}
 
 	cmdq->irq = platform_get_irq(pdev, 0);
 	if (cmdq->irq < 0)
@@ -591,6 +601,8 @@ static int cmdq_probe(struct platform_device *pdev)
 		dev, cmdq->base, cmdq->irq);
 
 	if (cmdq->pdata->gce_num > 1) {
+		hwid = of_alias_get_id(dev->of_node, clk_name);
+
 		for_each_child_of_node(phandle->parent, node) {
 			alias_id = of_alias_get_id(node, clk_name);
 			if (alias_id >= 0 && alias_id < cmdq->pdata->gce_num) {
@@ -659,6 +671,30 @@ static int cmdq_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (cmdq->pdata->has_sec) {
+		struct cmdq_sec_plat gce_sec_plat;
+
+		if (of_property_read_u32_index(dev->of_node, "mediatek,gce-events", 0,
+					       &gce_sec_plat.cmdq_event) == 0) {
+			gce_sec_plat.gce_dev = dev;
+			gce_sec_plat.base = cmdq->base;
+			gce_sec_plat.base_pa = res->start;
+			gce_sec_plat.hwid = hwid;
+			gce_sec_plat.gce_num = cmdq->pdata->gce_num;
+			gce_sec_plat.clocks = cmdq->clocks;
+			gce_sec_plat.thread_nr = cmdq->pdata->thread_nr;
+
+			mtk_cmdq_sec = platform_device_register_data(dev, "mtk_cmdq_sec",
+								     PLATFORM_DEVID_AUTO,
+								     &gce_sec_plat,
+								     sizeof(gce_sec_plat));
+			if (IS_ERR(mtk_cmdq_sec)) {
+				dev_err(dev, "failed to register platform_device mtk_cmdq_sec\n");
+				return PTR_ERR(mtk_cmdq_sec);
+			}
+		}
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index fc663b994b7a..a8f4f78f21d8 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -79,6 +79,17 @@ struct cmdq_pkt {
 	bool			loop;
 };
 
+struct cmdq_sec_plat {
+	struct device *gce_dev;
+	void __iomem *base;
+	dma_addr_t base_pa;
+	u32 hwid;
+	u32 gce_num;
+	struct clk_bulk_data *clocks;
+	u32 thread_nr;
+	u32 cmdq_event;
+};
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
 void cmdq_mbox_stop(struct mbox_chan *chan);
 
-- 
2.18.0


