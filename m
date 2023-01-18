Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02341C00A5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN51BJnMBVt6eIzSAFUig/omX5Qxj0/mctmif611K30=; b=qQ6WegpW+Rc1xcaXLXGx8dGMxs
	juYnaI4cWhUUUvrJ+QxdNy6aEnT3hbMX5BgSnkAFXwG2Mv2PnW3+3grvyNtKP2nKrQjBZzhnjVEkU
	I78vsRUKe8hbcfPDcoOIhdCBV9UEHEeOOV+IPbxEux+uFcLa1sJTWDdx+CPAmPcAB+p0lDtb7CFhr
	oXMMEu8L+z54YlHGJrbvH3orJr34dy1rtJkx2bY25nL8+OFg7ag3gN7zAUTSD6CCgBEKkffSysrfI
	Qi8lvN0bh+VcHMn6dY9Y7yjckrQHsFsXvWmIfDI9sh2HzFncv9wcEXXJUrPsyRLaroviOIjqOwGBx
	PZlfdzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz2o-00GicY-Jm; Wed, 18 Jan 2023 03:23:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz29-00GiGU-2W; Wed, 18 Jan 2023 03:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TN51BJnMBVt6eIzSAFUig/omX5Qxj0/mctmif611K30=; b=WO7jev0Lk8meRiG25LH22CeRNG
	38sMgdRHYTiHAX3BCbmtuPZEzm21tNWNIYBGlTV40uxvhPnKLMLTrj7sougGg0tPFn89UDKelbgvd
	ghedqx6LIWmR3ovj1ZtZYEf42qxNNUSJI1GJMvRcG7jaRuldXrybbVLS+wYNCegdPSy1SFotGpRzE
	V7h/kOZV5dnr+uKjzUZWZU1ikrbq1V4eEEp5b3mOkJ8QPlxT0guLpcE7X+43TlPaYopfNPq1H1EPO
	lukKdkitEQF1BIS+9vV8i+zRXKqjL1SZJ5Sb45H/GZoNaJXdkkINreH3mLIU52BnksZBMmZ8HFQme
	2BOLKATQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHz1v-0068iz-18;
	Wed, 18 Jan 2023 03:22:29 +0000
X-UUID: 57b7a7e896df11eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TN51BJnMBVt6eIzSAFUig/omX5Qxj0/mctmif611K30=;
	b=Y1HtPWKGHSOAMD/s4J9tzjQqniAwjktwW8B7i2C+KQ1zj+lLt/Z1ENvnKMSID49Ono6HKyQtLxfQK36BeGV/eXthxuErWasF8V3ZPee6RiDDxez+qu99Rr/zHwZZDxjBOzlQYUMcnpQhZFyW2ts9dzyj39yoXMiqsfvv/qgi0ZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:2daec945-aae5-4ffe-9d3d-a6816c2898de,IP:0,U
	RL:0,TC:0,Content:34,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:34
X-CID-META: VersionHash:3ca2d6b,CLOUDID:bf3120f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 57b7a7e896df11eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 314557709; Tue, 17 Jan 2023 20:22:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:21:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:21:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 6/6] soc: mediatek: mutex: support MT8195 VPPSYS
Date: Wed, 18 Jan 2023 11:21:22 +0800
Message-ID: <20230118032122.29956-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118032122.29956-1-moudy.ho@mediatek.com>
References: <20230118032122.29956-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_032227_824257_3B355847 
X-CRM114-Status: GOOD (  12.54  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add MT8195 VPPSYS0 and VPPSYS1 mutex info to driver data

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 102 +++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  35 +++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index d4124800c886..4e1414dd277f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -146,6 +146,53 @@
 #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
 #define MT8195_MUTEX_MOD_DISP_PWM0		27
 
+/* VPPSYS0 */
+#define MT8195_MUTEX_MOD_MDP_RDMA0             0
+#define MT8195_MUTEX_MOD_MDP_FG0               1
+#define MT8195_MUTEX_MOD_MDP_STITCH0           2
+#define MT8195_MUTEX_MOD_MDP_HDR0              3
+#define MT8195_MUTEX_MOD_MDP_AAL0              4
+#define MT8195_MUTEX_MOD_MDP_RSZ0              5
+#define MT8195_MUTEX_MOD_MDP_TDSHP0            6
+#define MT8195_MUTEX_MOD_MDP_COLOR0            7
+#define MT8195_MUTEX_MOD_MDP_OVL0              8
+#define MT8195_MUTEX_MOD_MDP_PAD0              9
+#define MT8195_MUTEX_MOD_MDP_TCC0              10
+#define MT8195_MUTEX_MOD_MDP_WROT0             11
+
+/* VPPSYS1 */
+#define MT8195_MUTEX_MOD_MDP_TCC1              3
+#define MT8195_MUTEX_MOD_MDP_RDMA1             4
+#define MT8195_MUTEX_MOD_MDP_RDMA2             5
+#define MT8195_MUTEX_MOD_MDP_RDMA3             6
+#define MT8195_MUTEX_MOD_MDP_FG1               7
+#define MT8195_MUTEX_MOD_MDP_FG2               8
+#define MT8195_MUTEX_MOD_MDP_FG3               9
+#define MT8195_MUTEX_MOD_MDP_HDR1              10
+#define MT8195_MUTEX_MOD_MDP_HDR2              11
+#define MT8195_MUTEX_MOD_MDP_HDR3              12
+#define MT8195_MUTEX_MOD_MDP_AAL1              13
+#define MT8195_MUTEX_MOD_MDP_AAL2              14
+#define MT8195_MUTEX_MOD_MDP_AAL3              15
+#define MT8195_MUTEX_MOD_MDP_RSZ1              16
+#define MT8195_MUTEX_MOD_MDP_RSZ2              17
+#define MT8195_MUTEX_MOD_MDP_RSZ3              18
+#define MT8195_MUTEX_MOD_MDP_TDSHP1            19
+#define MT8195_MUTEX_MOD_MDP_TDSHP2            20
+#define MT8195_MUTEX_MOD_MDP_TDSHP3            21
+#define MT8195_MUTEX_MOD_MDP_MERGE2            22
+#define MT8195_MUTEX_MOD_MDP_MERGE3            23
+#define MT8195_MUTEX_MOD_MDP_COLOR1            24
+#define MT8195_MUTEX_MOD_MDP_COLOR2            25
+#define MT8195_MUTEX_MOD_MDP_COLOR3            26
+#define MT8195_MUTEX_MOD_MDP_OVL1              27
+#define MT8195_MUTEX_MOD_MDP_PAD1              28
+#define MT8195_MUTEX_MOD_MDP_PAD2              29
+#define MT8195_MUTEX_MOD_MDP_PAD3              30
+#define MT8195_MUTEX_MOD_MDP_WROT1             31
+#define MT8195_MUTEX_MOD_MDP_WROT2             32
+#define MT8195_MUTEX_MOD_MDP_WROT3             33
+
 #define MT8365_MUTEX_MOD_DISP_OVL0		7
 #define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
 #define MT8365_MUTEX_MOD_DISP_RDMA0		9
@@ -411,6 +458,52 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
 };
 
+static const unsigned int mt8195_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
+	[MUTEX_MOD_IDX_MDP_RDMA0] = MT8195_MUTEX_MOD_MDP_RDMA0,
+	[MUTEX_MOD_IDX_MDP_RDMA1] = MT8195_MUTEX_MOD_MDP_RDMA1,
+	[MUTEX_MOD_IDX_MDP_RDMA2] = MT8195_MUTEX_MOD_MDP_RDMA2,
+	[MUTEX_MOD_IDX_MDP_RDMA3] = MT8195_MUTEX_MOD_MDP_RDMA3,
+	[MUTEX_MOD_IDX_MDP_STITCH0] = MT8195_MUTEX_MOD_MDP_STITCH0,
+	[MUTEX_MOD_IDX_MDP_FG0] = MT8195_MUTEX_MOD_MDP_FG0,
+	[MUTEX_MOD_IDX_MDP_FG1] = MT8195_MUTEX_MOD_MDP_FG1,
+	[MUTEX_MOD_IDX_MDP_FG2] = MT8195_MUTEX_MOD_MDP_FG2,
+	[MUTEX_MOD_IDX_MDP_FG3] = MT8195_MUTEX_MOD_MDP_FG3,
+	[MUTEX_MOD_IDX_MDP_HDR0] = MT8195_MUTEX_MOD_MDP_HDR0,
+	[MUTEX_MOD_IDX_MDP_HDR1] = MT8195_MUTEX_MOD_MDP_HDR1,
+	[MUTEX_MOD_IDX_MDP_HDR2] = MT8195_MUTEX_MOD_MDP_HDR2,
+	[MUTEX_MOD_IDX_MDP_HDR3] = MT8195_MUTEX_MOD_MDP_HDR3,
+	[MUTEX_MOD_IDX_MDP_AAL0] = MT8195_MUTEX_MOD_MDP_AAL0,
+	[MUTEX_MOD_IDX_MDP_AAL1] = MT8195_MUTEX_MOD_MDP_AAL1,
+	[MUTEX_MOD_IDX_MDP_AAL2] = MT8195_MUTEX_MOD_MDP_AAL2,
+	[MUTEX_MOD_IDX_MDP_AAL3] = MT8195_MUTEX_MOD_MDP_AAL3,
+	[MUTEX_MOD_IDX_MDP_RSZ0] = MT8195_MUTEX_MOD_MDP_RSZ0,
+	[MUTEX_MOD_IDX_MDP_RSZ1] = MT8195_MUTEX_MOD_MDP_RSZ1,
+	[MUTEX_MOD_IDX_MDP_RSZ2] = MT8195_MUTEX_MOD_MDP_RSZ2,
+	[MUTEX_MOD_IDX_MDP_RSZ3] = MT8195_MUTEX_MOD_MDP_RSZ3,
+	[MUTEX_MOD_IDX_MDP_MERGE2] = MT8195_MUTEX_MOD_MDP_MERGE2,
+	[MUTEX_MOD_IDX_MDP_MERGE3] = MT8195_MUTEX_MOD_MDP_MERGE3,
+	[MUTEX_MOD_IDX_MDP_TDSHP0] = MT8195_MUTEX_MOD_MDP_TDSHP0,
+	[MUTEX_MOD_IDX_MDP_TDSHP1] = MT8195_MUTEX_MOD_MDP_TDSHP1,
+	[MUTEX_MOD_IDX_MDP_TDSHP2] = MT8195_MUTEX_MOD_MDP_TDSHP2,
+	[MUTEX_MOD_IDX_MDP_TDSHP3] = MT8195_MUTEX_MOD_MDP_TDSHP3,
+	[MUTEX_MOD_IDX_MDP_COLOR0] = MT8195_MUTEX_MOD_MDP_COLOR0,
+	[MUTEX_MOD_IDX_MDP_COLOR1] = MT8195_MUTEX_MOD_MDP_COLOR1,
+	[MUTEX_MOD_IDX_MDP_COLOR2] = MT8195_MUTEX_MOD_MDP_COLOR2,
+	[MUTEX_MOD_IDX_MDP_COLOR3] = MT8195_MUTEX_MOD_MDP_COLOR3,
+	[MUTEX_MOD_IDX_MDP_OVL0] = MT8195_MUTEX_MOD_MDP_OVL0,
+	[MUTEX_MOD_IDX_MDP_OVL1] = MT8195_MUTEX_MOD_MDP_OVL1,
+	[MUTEX_MOD_IDX_MDP_PAD0] = MT8195_MUTEX_MOD_MDP_PAD0,
+	[MUTEX_MOD_IDX_MDP_PAD1] = MT8195_MUTEX_MOD_MDP_PAD1,
+	[MUTEX_MOD_IDX_MDP_PAD2] = MT8195_MUTEX_MOD_MDP_PAD2,
+	[MUTEX_MOD_IDX_MDP_PAD3] = MT8195_MUTEX_MOD_MDP_PAD3,
+	[MUTEX_MOD_IDX_MDP_TCC0] = MT8195_MUTEX_MOD_MDP_TCC0,
+	[MUTEX_MOD_IDX_MDP_TCC1] = MT8195_MUTEX_MOD_MDP_TCC1,
+	[MUTEX_MOD_IDX_MDP_WROT0] = MT8195_MUTEX_MOD_MDP_WROT0,
+	[MUTEX_MOD_IDX_MDP_WROT1] = MT8195_MUTEX_MOD_MDP_WROT1,
+	[MUTEX_MOD_IDX_MDP_WROT2] = MT8195_MUTEX_MOD_MDP_WROT2,
+	[MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
+};
+
 static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
@@ -571,6 +664,13 @@ static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
+	.mutex_sof = mt8195_mutex_sof,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.mutex_table_mod = mt8195_mutex_table_mod,
+};
+
 static const struct mtk_mutex_data mt8365_mutex_driver_data = {
 	.mutex_mod = mt8365_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
@@ -925,6 +1025,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = &mt8195_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-vpp-mutex",
+	  .data = &mt8195_vpp_mutex_driver_data},
 	{ .compatible = "mediatek,mt8365-disp-mutex",
 	  .data = &mt8365_mutex_driver_data},
 	{},
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index b335c2837cd8..635218e3ac68 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -22,6 +22,41 @@ enum mtk_mutex_mod_index {
 	MUTEX_MOD_IDX_MDP_CCORR0,
 	MUTEX_MOD_IDX_MDP_HDR0,
 	MUTEX_MOD_IDX_MDP_COLOR0,
+	MUTEX_MOD_IDX_MDP_RDMA1,
+	MUTEX_MOD_IDX_MDP_RDMA2,
+	MUTEX_MOD_IDX_MDP_RDMA3,
+	MUTEX_MOD_IDX_MDP_STITCH0,
+	MUTEX_MOD_IDX_MDP_FG0,
+	MUTEX_MOD_IDX_MDP_FG1,
+	MUTEX_MOD_IDX_MDP_FG2,
+	MUTEX_MOD_IDX_MDP_FG3,
+	MUTEX_MOD_IDX_MDP_HDR1,
+	MUTEX_MOD_IDX_MDP_HDR2,
+	MUTEX_MOD_IDX_MDP_HDR3,
+	MUTEX_MOD_IDX_MDP_AAL1,
+	MUTEX_MOD_IDX_MDP_AAL2,
+	MUTEX_MOD_IDX_MDP_AAL3,
+	MUTEX_MOD_IDX_MDP_RSZ2,
+	MUTEX_MOD_IDX_MDP_RSZ3,
+	MUTEX_MOD_IDX_MDP_MERGE2,
+	MUTEX_MOD_IDX_MDP_MERGE3,
+	MUTEX_MOD_IDX_MDP_TDSHP1,
+	MUTEX_MOD_IDX_MDP_TDSHP2,
+	MUTEX_MOD_IDX_MDP_TDSHP3,
+	MUTEX_MOD_IDX_MDP_COLOR1,
+	MUTEX_MOD_IDX_MDP_COLOR2,
+	MUTEX_MOD_IDX_MDP_COLOR3,
+	MUTEX_MOD_IDX_MDP_OVL0,
+	MUTEX_MOD_IDX_MDP_OVL1,
+	MUTEX_MOD_IDX_MDP_PAD0,
+	MUTEX_MOD_IDX_MDP_PAD1,
+	MUTEX_MOD_IDX_MDP_PAD2,
+	MUTEX_MOD_IDX_MDP_PAD3,
+	MUTEX_MOD_IDX_MDP_TCC0,
+	MUTEX_MOD_IDX_MDP_TCC1,
+	MUTEX_MOD_IDX_MDP_WROT1,
+	MUTEX_MOD_IDX_MDP_WROT2,
+	MUTEX_MOD_IDX_MDP_WROT3,
 
 	MUTEX_MOD_IDX_MAX		/* ALWAYS keep at the end */
 };
-- 
2.18.0


