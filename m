Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38422C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9t/F+JMbwDsMpqLtuEY4uCI2C3pHq7TrRCe+nmUuRU=; b=Gmla/QraN1pPmkGQOfKwc4pbMs
	ZaaPvH8wAqTGc7jjRGumVq8VII0jWHqtg95SiztkQiwwIXJPYLpadAaIMY/hu70jbJ8NYsn5TzbFM
	gbc9dldN5hh9Oz34ZAmTU573C0xQTkKfRapyocp6jBQeVc+X4HuJRDeP563L3xYSHUVEW/XXE4LZG
	o9ilwNjYs2GEipAnnAlq3Tmo9pOfKOxY3H+ClI09twiEYqrE4s2UdMoJUS6j8WdpwnYhNzgUoDd0Z
	KJbm6b520DzX7BtZwYX5XM2/4lyB1ywNHeO42VnnuceFE7RLLQGgH0rNOkyVWnWsq9GgImsT/e2Rk
	wZrdnASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE44I-002YLG-0W;
	Fri, 15 Dec 2023 09:01:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE44G-002YKs-08;
	Fri, 15 Dec 2023 09:01:13 +0000
X-UUID: 7bcbf7629b2811ee958cff29c719f35b-20231215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v9t/F+JMbwDsMpqLtuEY4uCI2C3pHq7TrRCe+nmUuRU=;
	b=SUml5VQjVLcFhg/gUBUlMaWawwgAPNBQGaea+EthLCsKtF2tdqb7JkTPVWX1sxseiVc38FUEi/KXpLc/2U1l+JTkJm/H7vZakvxE5WOQeN1a7HWd0IIJrB15GhgxzWz7eHHLCu/oQRgawBMDD2UypgtGiGK1ZYrm3gc9QcsLHmk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ce0f8e4d-43c9-494c-ac6d-1b491795865c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:9721d473-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7bcbf7629b2811ee958cff29c719f35b-20231215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 7555285; Fri, 15 Dec 2023 02:01:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH v2 1/3] mailbox: mtk-cmdq: Rename gce_plat variable with SoC name postfix
Date: Fri, 15 Dec 2023 15:00:24 +0800
Message-ID: <20231215070026.2507-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
References: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_010112_093590_56D52ACC 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Rename gce_plat variable postfix from 'v1~v7' to SoC names.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index de862e9137d5..16c504f8d9d5 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -706,42 +706,42 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 			   cmdq_runtime_resume, NULL)
 };
 
-static const struct gce_plat gce_plat_v2 = {
+static const struct gce_plat gce_plat_mt8173 = {
 	.thread_nr = 16,
 	.shift = 0,
 	.control_by_sw = false,
 	.gce_num = 1
 };
 
-static const struct gce_plat gce_plat_v3 = {
+static const struct gce_plat gce_plat_mt8183 = {
 	.thread_nr = 24,
 	.shift = 0,
 	.control_by_sw = false,
 	.gce_num = 1
 };
 
-static const struct gce_plat gce_plat_v4 = {
+static const struct gce_plat gce_plat_mt6779 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = false,
 	.gce_num = 1
 };
 
-static const struct gce_plat gce_plat_v5 = {
+static const struct gce_plat gce_plat_mt8192 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
 	.gce_num = 1
 };
 
-static const struct gce_plat gce_plat_v6 = {
+static const struct gce_plat gce_plat_mt8195 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
 	.gce_num = 2
 };
 
-static const struct gce_plat gce_plat_v7 = {
+static const struct gce_plat gce_plat_mt8186 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
@@ -750,12 +750,12 @@ static const struct gce_plat gce_plat_v7 = {
 };
 
 static const struct of_device_id cmdq_of_ids[] = {
-	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
-	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
-	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
-	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
-	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
-	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
+	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
+	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},
+	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_mt8186},
+	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
+	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
+	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
 	{}
 };
 
-- 
2.18.0


