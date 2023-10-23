Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C970DC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 04:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCE1xwplhv7g43FWzmxofcp5fWVm6amYBKyf89k0HWI=; b=SWAgCJp7OotsQ09gRbCVOxnENO
	enjbVVSmqNchCL2CtwF9revdZALZQdlgYkdsiQIokMBkOpNQGGkZ9BOm4Ukv5/zmEIHMbBR9pfEkD
	WSSRbrdyNKyG05cT++aQLkcasgTMQpbZXsVJXsaUWZJgBSvANQEpR3nDJxwaFiS73VfWfMAbun6Q2
	Syy4BpYyd0pOFnt+gA5Y9S2wvRstJgIFDEpq8aoMplQde+1lIdqOPfZ8Ypb08RDc1cxgvpM1Ud68Q
	hYELqe6V5SaVFBOleK4C+2SYe7OmzI4616OYnSbGch8GLPKCriNhka1LprvT5TQncDa7EIsY/pdP/
	/1NallmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qumiZ-006OxF-2V;
	Mon, 23 Oct 2023 04:39:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qumiU-006Ou4-3D;
	Mon, 23 Oct 2023 04:39:04 +0000
X-UUID: 151fe7d8715e11ee9b7791016c24628a-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QCE1xwplhv7g43FWzmxofcp5fWVm6amYBKyf89k0HWI=;
	b=N4nxgJKz6b0nOW4GauYagDw+YIt93txnWgW5URpUWg7qu9GmShoPwW8B+phbDbJY+7sETROtFi5kRuxIStebVGXkQTun1bPUEaLfh3lzDKs2wDSRl+mUiXJy/ipf2eh8FbBU+AMl7+0lOsFRIT4t8HicGaEZJZyEAevcFyDGh88=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:73cfffeb-b53f-4790-ac6d-0fc0ebb64b34,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:59018294-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 151fe7d8715e11ee9b7791016c24628a-20231022
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 490841723; Sun, 22 Oct 2023 21:38:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:37:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:37:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, "Johnson
 Wang" <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 7/9] mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
Date: Mon, 23 Oct 2023 12:37:49 +0800
Message-ID: <20231023043751.17114-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.531600-8.000000
X-TMASE-MatchedRID: R4jZHsvSUGclen1U/pCyekKcYi5Qw/RVCt59Uh3p/NVZps+y1VXzqUY/
	auwRJnMLb1ikhugskqOOaaDenG8Fpc3AmdtMjGJVA9lly13c/gGuiRuR9mCaugqiCYa6w8tv235
	yFjo/J+UK+kRk9ukAW+gSLotCiZMMHbClfpWB0AaeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8jHUU
	+U0ACZwDM3/yauti3zE7n0nNNLhws2fCNH4eoPw5Wqh7x/wwDnnqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.531600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0A72A5C88A1BA3E630A7B31C2BAC12F0A299FB84059DF24239935E87E14291BE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_213903_040020_74C7D2F7 
X-CRM114-Status: GOOD (  19.23  )
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

Secure CMDQ driver support on mt8188 and mt8195 currently.
So add a has_sec flag to their driver data to probe it.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 42 ++++++++++++++++++++++--
 include/linux/mailbox/mtk-cmdq-mailbox.h | 11 +++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 3bdfb9a60614..4db5eb76f353 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -87,6 +87,7 @@ struct gce_plat {
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool has_sec;
 	u32 gce_num;
 };
 
@@ -560,14 +561,23 @@ static int cmdq_probe(struct platform_device *pdev)
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
@@ -585,6 +595,8 @@ static int cmdq_probe(struct platform_device *pdev)
 		dev, cmdq->base, cmdq->irq);
 
 	if (cmdq->pdata->gce_num > 1) {
+		hwid = of_alias_get_id(dev->of_node, clk_name);
+
 		for_each_child_of_node(phandle->parent, node) {
 			alias_id = of_alias_get_id(node, clk_name);
 			if (alias_id >= 0 && alias_id < cmdq->pdata->gce_num) {
@@ -653,6 +665,30 @@ static int cmdq_probe(struct platform_device *pdev)
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
 
@@ -693,6 +729,7 @@ static const struct gce_plat gce_plat_v6 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_sec = true,
 	.gce_num = 2
 };
 
@@ -708,6 +745,7 @@ static const struct gce_plat gce_plat_v8 = {
 	.thread_nr = 32,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_sec = true,
 	.gce_num = 2
 };
 
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index f78a08e7c6ed..fdda995a69ce 100644
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
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.18.0


