Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E283C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owzIL+dYqZurn6IY+RwV7ffhtyrq8iwYunlvwJ3kt0M=; b=QR9PMmwlRPwM6N
	+p1Vm4Te5S8BdkyAvQGL89Qtyh5Kw1OulF2te5ilwu3aKu7H+IUQoEa4c0dA4qMgjdD0hx1YoDXbV
	njo4FbTIsghj/kJANoPBqjDXWtUzHoBingrwg3bTJPbTR4NYAEkw34q695SYq0XLaYU1/e9Bq286k
	n03qAQ6igHdU6JL+Tf659IEIvod+RO2qcJ37OGe+ZUNuSzlBGJFFL5dA2gcXqpKBxkNBsTY+Cqi9X
	rWVKXsDn4OjNQ5E1fPqkAmro24lmo3QQ5RUW+CRhfmHt0sjGWtt8shj8uRHjVww4xJ5f3Zqy7KxrQ
	y1oX0mA5XVQ5I7r1fFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfHXB-009Ly5-63; Fri, 15 Apr 2022 08:42:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfHWh-009LhL-Px; Fri, 15 Apr 2022 08:42:01 +0000
X-UUID: c0ed6c6d02fc416a9eaa4150076ebccc-20220415
X-UUID: c0ed6c6d02fc416a9eaa4150076ebccc-20220415
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 767773283; Fri, 15 Apr 2022 01:41:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 01:39:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 16:39:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 16:39:14 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v19 08/10] soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for
 mt8195 vdosys0
Date: Fri, 15 Apr 2022 16:39:09 +0800
Message-ID: <20220415083911.5186-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_014159_896010_E0DD8DC0 
X-CRM114-Status: GOOD (  12.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mmsys routing table of mt8195 vdosys0 has 2 DITHER components,
so mmsys need to add DDP_COMPONENT_DITHER1 and change all usages of
DITHER enum form DDP_COMPONENT_DITHER to DDP_COMPONENT_DITHER0.

But its header need to keep DDP_COMPONENT_DITHER enum
until drm/mediatek also changed it.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h    |  2 +-
 drivers/soc/mediatek/mt8183-mmsys.h    |  2 +-
 drivers/soc/mediatek/mt8186-mmsys.h    |  4 ++--
 drivers/soc/mediatek/mt8192-mmsys.h    |  4 ++--
 drivers/soc/mediatek/mt8195-mmsys.h    |  8 ++++----
 drivers/soc/mediatek/mt8365-mmsys.h    |  4 ++--
 drivers/soc/mediatek/mtk-mutex.c       | 10 +++++-----
 include/linux/soc/mediatek/mtk-mmsys.h |  1 +
 8 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 2772ef5e3934..f7a35b3656bb 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -18,7 +18,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
 		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_RDMA0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_RDMA0,
 		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0
 	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
index 0c021f4b76d2..ff6be1703469 100644
--- a/drivers/soc/mediatek/mt8183-mmsys.h
+++ b/drivers/soc/mediatek/mt8183-mmsys.h
@@ -41,7 +41,7 @@ static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
 		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1,
 		MT8183_OVL1_2L_MOUT_EN_RDMA1
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0,
 		MT8183_DITHER0_MOUT_IN_DSI0
 	}, {
diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index c72ccf86ea28..eb1ad9c37a9c 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -76,12 +76,12 @@ static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
 		MT8186_RDMA0_SOUT_TO_COLOR0
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
 		MT8186_DITHER0_MOUT_TO_DSI0,
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
 		MT8186_DSI0_FROM_DITHER0
 	},
diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
index 6aae0b12b6ff..a016d80b4bc1 100644
--- a/drivers/soc/mediatek/mt8192-mmsys.h
+++ b/drivers/soc/mediatek/mt8192-mmsys.h
@@ -40,7 +40,7 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
 		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4,
 		MT8192_OVL2_2L_MOUT_EN_RDMA4
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0,
 		MT8192_DITHER0_MOUT_IN_DSI0
 	}, {
@@ -52,7 +52,7 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
 		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
 		MT8192_AAL0_SEL_IN_CCORR0
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
 		MT8192_DSI0_SEL_IN_DITHER0
 	}, {
diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 13ab0ab64396..abfe94a30248 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -113,7 +113,7 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
 		MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
 		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
 		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
 	}, {
@@ -181,7 +181,7 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
 		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
 		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
 	}, {
@@ -245,11 +245,11 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA0_FROM_MASK,
 		MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
 		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
 		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
 		MT8195_SOUT_DISP_DITHER0_TO_DSI0
 	}, {
diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
index 690e3fe2dee0..24129a6c25f8 100644
--- a/drivers/soc/mediatek/mt8365-mmsys.h
+++ b/drivers/soc/mediatek/mt8365-mmsys.h
@@ -41,12 +41,12 @@ static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 		MT8365_DISP_COLOR_SEL_IN_COLOR0,MT8365_DISP_COLOR_SEL_IN_COLOR0
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN,
 		MT8365_DITHER_MOUT_EN_DSI0, MT8365_DITHER_MOUT_EN_DSI0
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
 		MT8365_DSI0_SEL_IN_DITHER, MT8365_DSI0_SEL_IN_DITHER
 	},
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 729ee88035ed..9184684baf1d 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -232,7 +232,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
-	[DDP_COMPONENT_DITHER] = MT8167_MUTEX_MOD_DISP_DITHER,
+	[DDP_COMPONENT_DITHER0] = MT8167_MUTEX_MOD_DISP_DITHER,
 	[DDP_COMPONENT_GAMMA] = MT8167_MUTEX_MOD_DISP_GAMMA,
 	[DDP_COMPONENT_OVL0] = MT8167_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_OVL1] = MT8167_MUTEX_MOD_DISP_OVL1,
@@ -265,7 +265,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8183_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
 	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
@@ -279,7 +279,7 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8186_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8186_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8186_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_GAMMA] = MT8186_MUTEX_MOD_DISP_GAMMA0,
 	[DDP_COMPONENT_OVL0] = MT8186_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_OVL_2L0] = MT8186_MUTEX_MOD_DISP_OVL0_2L,
@@ -292,7 +292,7 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8192_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
 	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
 	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
@@ -310,7 +310,7 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
-	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8195_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
 	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
 	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index cff5c9adbf46..59117d970daf 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -17,6 +17,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
 	DDP_COMPONENT_DITHER1,
 	DDP_COMPONENT_DP_INTF0,
 	DDP_COMPONENT_DP_INTF1,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
