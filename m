Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC9C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 03:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqINvGVZ3MdtERFP0p1vlV/ZfAjPsoruqdwVGSyeDWI=; b=wKo6AOQQ5Fc8Gz3tiFO2gR8IS9
	aNnGLLKRfm+igdK7Cq6VnK4uZ2WF3rMWBVZv4gMmP1wh52KfxOV/d+fyeM9hU9EFeycMiRJqYXWDy
	LBkHRDUVHNKz5A4L4yyGqyQ7IRiM7RfbAK9zZ+UZzMcNZS1W+apTD7uZnR8n4tJFrxbgFT9anqAAT
	SqrCBIbBLY7PZsyXLcpYofNzvstXZX+nMZ9/rDSvbEQ7B+tSItbdRwrnk4S6YIk6A9MsXpb3xnb9E
	Q2JbLs+HhbzXE42k4Qo3FIoVYJeSpdHZQOqtuvnPMBjV58hpnBMnAiF8UTg/tWEvLMtE+1DA3mhIf
	6/agvSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pep4N-00EQWc-2B;
	Wed, 22 Mar 2023 03:23:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pep4K-00EQVh-34;
	Wed, 22 Mar 2023 03:23:22 +0000
X-UUID: e337c7b4c86011ed8687db9d93187ff1-20230321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HqINvGVZ3MdtERFP0p1vlV/ZfAjPsoruqdwVGSyeDWI=;
	b=QuI9t4EZ1RUpTrWPigCbUx08lBuU41qlcexJhhUP1ab3xDrGOQOO8IuEuUFMddk3W3QIIinalVjG/XUiIKL/vdaMUK7Ejqq6GMUZmxVwqbM9A02u4fiRoD0vpf4m4RMEQUIpKqzV3sZWm0jTxpbQ0P/jCYUfpmC8gT12a6LkztU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:67fd2da1-b149-46c4-b8a9-9a6b4581789b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.22,REQID:67fd2da1-b149-46c4-b8a9-9a6b4581789b,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:120426c,CLOUDID:3b361829-564d-42d9-9875-7c868ee415ec,B
	ulkID:230322112243BQPGG959,BulkQuantity:5,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e337c7b4c86011ed8687db9d93187ff1-20230321
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 42776413; Tue, 21 Mar 2023 20:23:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 11:22:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 11:22:40 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, "Shawn
 Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v1 2/2] soc: mediatek: Add reset control for DSI0
Date: Wed, 22 Mar 2023 11:22:02 +0800
Message-ID: <20230322032202.12598-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230322032202.12598-1-shawn.sung@mediatek.com>
References: <20230322032202.12598-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_202320_997459_2DCCD10E 
X-CRM114-Status: GOOD (  11.68  )
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

Add reset control for DSI0.

Signed-off-by: Shawn Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index 448cc3761b43..08c7de771aec 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -3,6 +3,7 @@
 #ifndef __SOC_MEDIATEK_MT8188_MMSYS_H
 #define __SOC_MEDIATEK_MT8188_MMSYS_H

+#define MT8188_VDO0_SW0_RST_B				0x190
 #define MT8188_VDO0_OVL_MOUT_EN				0xf14
 #define MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0		BIT(0)
 #define MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0		BIT(1)
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index eb4c7e57896c..e82dd42d9c34 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -78,6 +78,8 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.clk_driver = "clk-mt8188-vdo0",
 	.routes = mmsys_mt8188_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
+	.sw0_rst_offset = MT8188_VDO0_SW0_RST_B,
+	.num_resets = 32,
 };

 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
--
2.18.0


