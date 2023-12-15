Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21842C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQFrFJz8Fcv4o+QSkMTCins8sao8rmNVqzntXh3ULuY=; b=dMNk0Z/ViHJjWw8ETonojfUYka
	Qrr30rdHApMDyWeoH42dEmiqW56hnnuNfGD9iLnAMMUIhYjrLlw2csG764UFzcdJG2XPtOPpeonJe
	d1vNH7+s/D5C2znREfCsbqn/qldX1pmvPoVIWDqM3eFyWPfmRv6d/h8Q4/XZKOB12rtzB3wXflJjI
	E16C0rNMgGAAQwVxy3mOfj3+pdvjRGWgQPTw1aisdXnpzVb4Q7njsW4XDGtteng52PWHDlZtEA/TU
	/KQZqQhiY8fk1cyl1wa59E2RK1I2r1aGWqRrfm5ZkzAPige757arthAm33vj/L/U7nmcIBRvimR+p
	A3fIFvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3v5-002X4w-3B;
	Fri, 15 Dec 2023 08:51:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3v4-002X3l-0x;
	Fri, 15 Dec 2023 08:51:43 +0000
X-UUID: 2866e3c69b2711ee9b09ad09c76753c8-20231215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GQFrFJz8Fcv4o+QSkMTCins8sao8rmNVqzntXh3ULuY=;
	b=dfCFG0/ICqm3PqSD7IfUvYy9rC3IRQrGt/peC1oVUSKCOIGKv2SlbtbQx7qSO3cdVlQRg02dBH1vpfgN8X0jEivFBu1D2GJOg6kG/POwmFsRpypwR1vJsSkRdgHMz6TjYyE73GemhXrjttCFOB/V4+Fj/lw7t08vdPY7SmULfdU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d71377fa-eea9-4d72-b88d-83834d6f4298,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:576db5fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2866e3c69b2711ee9b09ad09c76753c8-20231215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 439092541; Fri, 15 Dec 2023 01:51:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 16:51:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 16:51:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson
 Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 2/3] mailbox: mtk-cmdq: Sort cmdq platform data by compatible name
Date: Fri, 15 Dec 2023 15:00:25 +0800
Message-ID: <20231215070026.2507-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
References: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_005142_339686_C91822B0 
X-CRM114-Status: GOOD (  11.08  )
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

Sort cmdq platform data according to the number sequence of
compatible names.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 16c504f8d9d5..39bf066d376e 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -706,6 +706,13 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 			   cmdq_runtime_resume, NULL)
 };
 
+static const struct gce_plat gce_plat_mt6779 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.control_by_sw = false,
+	.gce_num = 1
+};
+
 static const struct gce_plat gce_plat_mt8173 = {
 	.thread_nr = 16,
 	.shift = 0,
@@ -720,10 +727,11 @@ static const struct gce_plat gce_plat_mt8183 = {
 	.gce_num = 1
 };
 
-static const struct gce_plat gce_plat_mt6779 = {
+static const struct gce_plat gce_plat_mt8186 = {
 	.thread_nr = 24,
 	.shift = 3,
-	.control_by_sw = false,
+	.control_by_sw = true,
+	.sw_ddr_en = true,
 	.gce_num = 1
 };
 
@@ -741,19 +749,11 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.gce_num = 2
 };
 
-static const struct gce_plat gce_plat_mt8186 = {
-	.thread_nr = 24,
-	.shift = 3,
-	.control_by_sw = true,
-	.sw_ddr_en = true,
-	.gce_num = 1
-};
-
 static const struct of_device_id cmdq_of_ids[] = {
+	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},
 	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_mt8186},
-	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
 	{}
-- 
2.18.0


