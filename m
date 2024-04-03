Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D2C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 06:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URfUMiQT17lJh/yOODBv4ku3XEJlT+WvGvldzqruyDc=; b=dV7VPbsdEm14keNPbZ/WFCTeTV
	CuUYlxo8Xsjk7J8Mz+eeO9z9eXUcA0Mx58kq6nhphsMCmTa0uHW0WF7PSeFM52jHv2yFeRXwG/Ufk
	tYvGPnajjVtXxe2wV0xoD15oCsRjwjGEkQcsrMvORxL2nDIe9OEHY3flXkIm49pO58jV2QI9atb8I
	QSqYTb9Vm2knvNMsO0qqQ+35rDyK5rPgJ28e30VSsp7ejBYj2QP1KrS41TBKFmuAdWQeTifB2V9+N
	4sSqdxW4hx0Oa9fiG4RF/6NfNwG4+gZwPV8fNEqB20zd9zF8HgdHvqSpVCQroE5ub+OiS7kyUGNGP
	P44ZNvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruYG-0000000ELW5-2qJ4;
	Wed, 03 Apr 2024 06:56:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruYC-0000000ELTA-27V4;
	Wed, 03 Apr 2024 06:56:50 +0000
X-UUID: 53657a4af18711eeac1957ae9f99f617-20240402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=URfUMiQT17lJh/yOODBv4ku3XEJlT+WvGvldzqruyDc=;
	b=MvQXH+EQUco0AVb0iTokZwyqSSkPnDD91UyriLdyjvlyyPmyADNuC3lZUXsbIohiuy4j2fmknBUBGKutLAwFhwW+tSbCYDHqykCYsWWRsnMUUCFUosSX/9eSkr5Weih3HoPaLfybbJs84vecjy/dAkvRVwM8965TOjc+pLaeYfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:f2bc4bfe-02f8-4810-b70d-8df181330642,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:f175c385-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 53657a4af18711eeac1957ae9f99f617-20240402
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 979811891; Tue, 02 Apr 2024 23:56:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 14:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 14:56:06 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 9/9] mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
Date: Wed, 3 Apr 2024 14:56:03 +0800
Message-ID: <20240403065603.21920-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403065603.21920-1-shawn.sung@mediatek.com>
References: <20240403065603.21920-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.381100-8.000000
X-TMASE-MatchedRID: 4YoTATPIqSwlen1U/pCyekKcYi5Qw/RVCt59Uh3p/NVZps+y1VXzqUY/
	auwRJnMLb1ikhugskqP8Qxx3otU4NmJZXQNDzktShK8o4aoss8quiRuR9mCaugqiCYa6w8tv235
	yFjo/J+U1Wb8n14I41eXQHI6jQlB9DPIzF4wRfrAURSScn+QSXt0H8LFZNFG7hqz53n/yPnq6Sb
	mHE/H1FlFBnyH44vf3KT6JGY05QCPJJ6OKxZ1HqboOfFLgUu3n
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.381100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B592F25D7C28CDD7C62ED6832DD71E7793473CC29696CB18FC5E8E1456399C762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_235648_753651_4CE4E49C 
X-CRM114-Status: GOOD (  18.09  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

CMDQ driver will probe a secure CMDQ driver when has_sec flag
in platform data is true and its device node in dts has defined a
event id of CMDQ_SYNC_TOKEN_SEC_EOF.

Secure CMDQ driver support on mt8188 and mt8195 currently.
So add a has_secure flag to their driver data to probe it.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index e04302ca6ec03..a8a0619baaa5c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/of.h>
 
 #define CMDQ_MBOX_AUTOSUSPEND_DELAY_MS	100
@@ -60,6 +61,9 @@ struct gce_plat {
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool has_secure;
+	u32 secure_thread_nr;
+	u32 secure_thread_min;
 	u32 gce_num;
 };
 
@@ -569,6 +573,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	int alias_id = 0;
 	static const char * const clk_name = "gce";
 	static const char * const clk_names[] = { "gce0", "gce1" };
+	u32 hwid = 0;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -594,6 +599,8 @@ static int cmdq_probe(struct platform_device *pdev)
 		dev, cmdq->base, cmdq->irq);
 
 	if (cmdq->pdata->gce_num > 1) {
+		hwid = of_alias_get_id(dev->of_node, clk_name);
+
 		for_each_child_of_node(phandle->parent, node) {
 			alias_id = of_alias_get_id(node, clk_name);
 			if (alias_id >= 0 && alias_id < cmdq->pdata->gce_num) {
@@ -676,6 +683,31 @@ static int cmdq_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(dev, CMDQ_MBOX_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
 
+	if (cmdq->pdata->has_secure) {
+		struct platform_device *mtk_cmdq_sec;
+		static struct gce_sec_plat sec_plat = {0};
+
+		if (of_property_read_u32_index(dev->of_node, "mediatek,gce-events", 0,
+					       &sec_plat.cmdq_event) == 0) {
+			sec_plat.gce_dev = dev;
+			sec_plat.hwid = hwid;
+			sec_plat.gce_num = cmdq->pdata->gce_num;
+			sec_plat.clocks = cmdq->clocks;
+			sec_plat.thread_nr = cmdq->pdata->thread_nr;
+			sec_plat.secure_thread_nr = cmdq->pdata->secure_thread_nr;
+			sec_plat.secure_thread_min = cmdq->pdata->secure_thread_min;
+
+			mtk_cmdq_sec = platform_device_register_data(dev, "mtk-cmdq-sec",
+								     PLATFORM_DEVID_AUTO,
+								     &sec_plat,
+								     sizeof(sec_plat));
+			if (IS_ERR(mtk_cmdq_sec)) {
+				dev_err(dev, "failed to register platform_device mtk-cmdq-sec\n");
+				return PTR_ERR(mtk_cmdq_sec);
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -719,6 +751,9 @@ static const struct gce_plat gce_plat_mt8188 = {
 	.thread_nr = 32,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_secure = true,
+	.secure_thread_nr = 2,
+	.secure_thread_min = 8,
 	.gce_num = 2
 };
 
@@ -733,6 +768,9 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_secure = true,
+	.secure_thread_nr = 2,
+	.secure_thread_min = 8,
 	.gce_num = 2
 };
 
-- 
2.18.0


