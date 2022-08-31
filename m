Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF1ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1gON577MpchCSxyKYEbduzrjWst5XYqzHZ47x/O7SQ=; b=4+DbuHZ16Y8+xGHy/a0ejrwJxf
	vUiTRPAigfKddacCtbIM8PsOdxFVPMILYduAYg8sKx4uPsxvWrm9F5VGJWzxyOKON1gtGN6eK27jk
	tZCwSWsyjB/z70LedRofwzLpkmqa48xhbUIGY/8XRG/9Vpie8vEN/1OgJJByYn7PALrvL0pcGbPOv
	FBLzKsnhkfvoG/FSQWThZtecPyZebxr2oaM6kO/3sszF3KHZ4m/nAA/NOWZK2b0ktvJE5LWdjU2fa
	AkBgbb7Noj3fxWooCAYGfufExWP7bY6gY31gk8sSvQ4Tmk8xqxCO6mtNkvs7Ah0C3ZI/0Sd68kllY
	hV1g5NfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRtV-007SXr-Mv; Wed, 31 Aug 2022 17:52:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRtJ-007SSn-1E; Wed, 31 Aug 2022 17:52:43 +0000
X-UUID: a2b1fe4efb0540ae806ebd05db041dde-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/1gON577MpchCSxyKYEbduzrjWst5XYqzHZ47x/O7SQ=;
	b=UKu7Vgf7ZCjB89X9vlJSM+0WBfFIE44TpLXRSvP+1hl9iYtseesZcG0ifpw797TN0MxSpX2RDVRHjPs75M3JoF55L9ye10E72D0e8e/DZJ/fKeUXUdDHG86biaFwBdE7ZJHPbaf7G5Zm8ydGW23/g+GdS5XMvPimqfB0JBrmJEY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:63562b7d-a4ef-4730-84f9-20ca1a7d0f58,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:62d1b520-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a2b1fe4efb0540ae806ebd05db041dde-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1645821470; Wed, 31 Aug 2022 10:52:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 01:21:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 01:21:56 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Xiandong Wang
	<xiandong.wang@mediatek.com>
Subject: [PATCH v3 2/2] soc: mediatek: mutex: Add mt8186 mutex mod settings for mdp3
Date: Thu, 1 Sep 2022 01:21:51 +0800
Message-ID: <20220831172151.10215-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220831172151.10215-1-allen-kh.cheng@mediatek.com>
References: <20220831172151.10215-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_105241_109857_7507723C 
X-CRM114-Status: GOOD (  11.60  )
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

Add mt8186 mutex mod settings for mdp3.

Co-developed-by: Xiandong Wang <xiandong.wang@mediatek.com>
Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 28 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5ea43de4e410..f95100d4de73 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -91,6 +91,15 @@
 #define MT8183_MUTEX_MOD_MDP_AAL0		23
 #define MT8183_MUTEX_MOD_MDP_CCORR0		24
 
+#define MT8186_MUTEX_MOD_MDP_RDMA0		0
+#define MT8186_MUTEX_MOD_MDP_AAL0		2
+#define MT8186_MUTEX_MOD_MDP_HDR0		4
+#define MT8186_MUTEX_MOD_MDP_RSZ0		5
+#define MT8186_MUTEX_MOD_MDP_RSZ1		6
+#define MT8186_MUTEX_MOD_MDP_WROT0		7
+#define MT8186_MUTEX_MOD_MDP_TDSHP0		9
+#define MT8186_MUTEX_MOD_MDP_COLOR0		14
+
 #define MT8173_MUTEX_MOD_DISP_OVL0		11
 #define MT8173_MUTEX_MOD_DISP_OVL1		12
 #define MT8173_MUTEX_MOD_DISP_RDMA0		13
@@ -324,6 +333,17 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA1] = MT8186_MUTEX_MOD_DISP_RDMA1,
 };
 
+static const unsigned int mt8186_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
+	[MUTEX_MOD_IDX_MDP_RDMA0] = MT8186_MUTEX_MOD_MDP_RDMA0,
+	[MUTEX_MOD_IDX_MDP_RSZ0] = MT8186_MUTEX_MOD_MDP_RSZ0,
+	[MUTEX_MOD_IDX_MDP_RSZ1] = MT8186_MUTEX_MOD_MDP_RSZ1,
+	[MUTEX_MOD_IDX_MDP_TDSHP0] = MT8186_MUTEX_MOD_MDP_TDSHP0,
+	[MUTEX_MOD_IDX_MDP_WROT0] = MT8186_MUTEX_MOD_MDP_WROT0,
+	[MUTEX_MOD_IDX_MDP_HDR0] = MT8186_MUTEX_MOD_MDP_HDR0,
+	[MUTEX_MOD_IDX_MDP_AAL0] = MT8186_MUTEX_MOD_MDP_AAL0,
+	[MUTEX_MOD_IDX_MDP_COLOR0] = MT8186_MUTEX_MOD_MDP_COLOR0,
+};
+
 static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
@@ -458,6 +478,12 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.no_clk = true,
 };
 
+static const struct mtk_mutex_data mt8186_mdp_mutex_driver_data = {
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.mutex_table_mod = mt8186_mdp_mutex_table_mod,
+};
+
 static const struct mtk_mutex_data mt8186_mutex_driver_data = {
 	.mutex_mod = mt8186_mutex_mod,
 	.mutex_sof = mt8186_mutex_sof,
@@ -810,6 +836,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8183_mutex_driver_data},
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = &mt8186_mutex_driver_data},
+	{ .compatible = "mediatek,mt8186-mdp3-mutex",
+	  .data = &mt8186_mdp_mutex_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index a0f4f51a3b45..b335c2837cd8 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -20,6 +20,8 @@ enum mtk_mutex_mod_index {
 	MUTEX_MOD_IDX_MDP_WDMA,
 	MUTEX_MOD_IDX_MDP_AAL0,
 	MUTEX_MOD_IDX_MDP_CCORR0,
+	MUTEX_MOD_IDX_MDP_HDR0,
+	MUTEX_MOD_IDX_MDP_COLOR0,
 
 	MUTEX_MOD_IDX_MAX		/* ALWAYS keep at the end */
 };
-- 
2.18.0


