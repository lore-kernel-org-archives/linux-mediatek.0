Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6716C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yA70gQkZA8ZhnNLE0Yb7MSdy61hnh9QJuTLwvtbmBqI=; b=H9PXKVu/9/itXrojMoEMk/tFv6
	/kJXoRhxU2I8kafr+rY8xePava2gNdVaIbcd8+WPZK387ix8j5fuWeS9tshYsUFboECuysqoZZkL0
	H+SkLlcC3fEWBm3qjnzHJ7Vefj6qcnloGPaiaIzEDDw8M0pGzBuYyJC2ruIYElliiB238G5DwWKkO
	xke+K4vwNjHr70jzo3Ljex38gBT6pHkEjH8dVi03KxPuByEQgkmceQLxF1UvVqhgUXCvMZQqFARBN
	pY4jr7GUD14c5pL5wbXY33ePhpY/cpXsjeZ+S27Cry6GIBT3BjFaVHNP/pqq4KC5Glt4qccZboIR9
	CN8BlTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHZw-001rTR-H9; Fri, 13 Jan 2023 10:46:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHYl-001qxJ-Nc; Fri, 13 Jan 2023 10:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yA70gQkZA8ZhnNLE0Yb7MSdy61hnh9QJuTLwvtbmBqI=; b=f3rJJBDNRNxlBtFDfWSEEikTEp
	ufBJnUZEdQQV8VfcDzCB0+qxVPOvtTRuiCqDbFomOgKfZMg9lQu6hIlUlOw5Drz52ArCZYio3Ja3W
	/Frz19XernWkbmw8mH5rk8b7N71zE2F6rXyxx0k8FD6WAIH/Oj1xaCJoB+ka91ZCRUYbd4pnvm/+E
	h29avvwVxFEsUyb/M00KLws2/+10TpIXCsEZrT6XnZhXpfCcQznywSNgvIdF8vNPE+lwMjA+5eu+K
	yHirclMCZ+C4fQVvV0M9gFgo+8XO0xcicDGNIZqkZEs0JoRJ/xS3noNXaRvwssqDl6HaJZ2kUyD4W
	gAHT7v+A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGHYZ-004K83-1e;
	Fri, 13 Jan 2023 10:45:09 +0000
X-UUID: 5b09f49a932f11eda08d4d6090ec5a5c-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yA70gQkZA8ZhnNLE0Yb7MSdy61hnh9QJuTLwvtbmBqI=;
	b=PH5FSdN0q7uRft/QjIGRb7I7zPxaegJlM5vZodGseRoK6/gHeoaxE7Sv48GcBRaqsvm/BlYcNXap2TXlaIJgjPyR6Dbsn4jIMX68R/4+Ym+z2eCos53MclQCwCxvHewV7GVlIwDuP1pwtQwoB0J48z4R3Yd7onJ8sDu8/NQM0Ho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:348bda00-960e-4e34-9c4e-0a77fcb218cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:348bda00-960e-4e34-9c4e-0a77fcb218cd,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:11539354-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230113184439U9UV79TL,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: 5b09f49a932f11eda08d4d6090ec5a5c-20230113
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 692378703; Fri, 13 Jan 2023 03:45:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 18:44:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 18:44:36 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan
 Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Xinlei
 Lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v30 04/11] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
Date: Fri, 13 Jan 2023 18:44:27 +0800
Message-ID: <20230113104434.28023-5-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_104508_042479_A09179E3 
X-CRM114-Status: GOOD (  13.00  )
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

Add mt8195 vdosys1 routing table to the driver data of mtk-mmsys.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h | 139 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  10 ++
 2 files changed, 149 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index abfe94a30248..fd7b455bd675 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,70 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
+#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
+
+#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
+#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			1
+
+#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
+#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT			0
+
+#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
+#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		0
+
+#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
+#define MT8195_MERGE4_SOUT_TO_DPI1_SEL					2
+#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL				3
+
+#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
+#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
+#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
+#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
+#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
+#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL				1
+
+#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
+#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			1
+
+#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
+#define MT8195_SOUT_TO_MIXER_IN1_SEL					1
+
+#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
+#define MT8195_SOUT_TO_MIXER_IN2_SEL					1
+
+#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
+#define MT8195_SOUT_TO_MIXER_IN3_SEL					1
+
+#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
+#define MT8195_SOUT_TO_MIXER_IN4_SEL					1
+
+#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
+#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
+#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
+#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				0xf60
+#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				0xf64
+#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
+#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
@@ -367,4 +431,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	}
 };
 
+static const struct mtk_mmsys_routes mmsys_mt8195_vdo1_routing_table[] = {
+	{
+		DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	}, {
+		DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	}, {
+		DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	}, {
+		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN1_SEL
+	}, {
+		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN2_SEL
+	}, {
+		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN3_SEL
+	}, {
+		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN4_SEL
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
+		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	}, {
+		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
+		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
+		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
+		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8195_MERGE4_SOUT_TO_DPI1_SEL
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
+		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
+	}
+};
 #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 38f1dd92e7c6..e75ac7f5aa3c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -88,6 +88,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8195-vdo1",
+	.routes = mmsys_mt8195_vdo1_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -323,6 +329,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &mt8195_vdosys1_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
 		.data = &mt8365_mmsys_driver_data,
-- 
2.18.0


