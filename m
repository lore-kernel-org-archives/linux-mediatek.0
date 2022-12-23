Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E05DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNTv3Kts879mltFjm2F03rB7477m39CSotM8/heyrEs=; b=SFHB6xmxUCV4RnKUBUM7+1TtIs
	QpAv/L4avFFWveWMO6OkSwX7RefWmBox5LsNlcq5zOyQ4n+zR/1z+DbzWMIDqZ6ffN//BfOWjiyPG
	0isRS2SpEzTL6ejhllvTRye0kazvsrksC0XUgYIBnSUELH0y2bOvInnyIbRisi0Zg8Qspf8sRlV8D
	qq4etcNiQFObscwLHT5UVYTtxmTl0i5J7OK3RSt3lglkS2ra4JwBNNShyn6YehsDHuFnopu+fafru
	SMPH4S720IZNHrLPLc8DYrKj0qMqOpQ6sEv6PBeS4H0b4X7ib1IpeY6ZEPYeaoRA1yNg9Z4Si0oMP
	jFSrQQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8dO6-005Bud-J3; Fri, 23 Dec 2022 08:26:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8dO2-005BtB-B0; Fri, 23 Dec 2022 08:26:40 +0000
X-UUID: 5bd93db38b234fa98a48eb399674e14d-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WNTv3Kts879mltFjm2F03rB7477m39CSotM8/heyrEs=;
	b=EXHjYLEijgMGhADCldL/od4sPPaIiiYOraal+L1cL8spzBNhcKc9oZ87ZT9YFdYwt65ggyCQIIiIFLUfQjzZ2vNh1HyCgN1/cVaMeAQcIfG2uZfYGNEreX/EPzKJzmZzNLQ8VDZYwaJJiT7h8YklqEGTPlpT+aLTbHvdlI1quxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:cb8e8d8e-c8e0-49da-902b-740a0bb594bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:9303358a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5bd93db38b234fa98a48eb399674e14d-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 784853982; Fri, 23 Dec 2022 01:26:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Dec 2022 16:05:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 16:05:56 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: power: Add MT8188 power domains
Date: Fri, 23 Dec 2022 16:05:52 +0800
Message-ID: <20221223080553.9397-2-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
References: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_002638_416461_4665AE43 
X-CRM114-Status: GOOD (  12.32  )
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

Add power domains dt-bindings for MT8188.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      |  2 +
 .../dt-bindings/power/mediatek,mt8188-power.h | 44 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 605ec7ab5f63..c9acef80f452 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -28,6 +28,7 @@ properties:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
       - mediatek,mt8186-power-controller
+      - mediatek,mt8188-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
 
@@ -84,6 +85,7 @@ $defs:
               "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
+              "include/dt-bindings/power/mediatek,mt8188-power.h" - for MT8188 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
         maxItems: 1
diff --git a/include/dt-bindings/power/mediatek,mt8188-power.h b/include/dt-bindings/power/mediatek,mt8188-power.h
new file mode 100644
index 000000000000..57e75cf3aa2c
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt8188-power.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8188_POWER_H
+#define _DT_BINDINGS_POWER_MT8188_POWER_H
+
+#define MT8188_POWER_DOMAIN_MFG0			0
+#define MT8188_POWER_DOMAIN_MFG1			1
+#define MT8188_POWER_DOMAIN_MFG2			2
+#define MT8188_POWER_DOMAIN_MFG3			3
+#define MT8188_POWER_DOMAIN_MFG4			4
+#define MT8188_POWER_DOMAIN_PEXTP_MAC_P0		5
+#define MT8188_POWER_DOMAIN_PEXTP_PHY_TOP		6
+#define MT8188_POWER_DOMAIN_CSIRX_TOP			7
+#define MT8188_POWER_DOMAIN_ETHER			8
+#define MT8188_POWER_DOMAIN_HDMI_TX			9
+#define MT8188_POWER_DOMAIN_ADSP_AO			10
+#define MT8188_POWER_DOMAIN_ADSP_INFRA			11
+#define MT8188_POWER_DOMAIN_ADSP			12
+#define MT8188_POWER_DOMAIN_AUDIO			13
+#define MT8188_POWER_DOMAIN_AUDIO_ASRC			14
+#define MT8188_POWER_DOMAIN_VPPSYS0			15
+#define MT8188_POWER_DOMAIN_VDOSYS0			16
+#define MT8188_POWER_DOMAIN_VDOSYS1			17
+#define MT8188_POWER_DOMAIN_DP_TX			18
+#define MT8188_POWER_DOMAIN_EDP_TX			19
+#define MT8188_POWER_DOMAIN_VPPSYS1			20
+#define MT8188_POWER_DOMAIN_WPE				21
+#define MT8188_POWER_DOMAIN_VDEC0			22
+#define MT8188_POWER_DOMAIN_VDEC1			23
+#define MT8188_POWER_DOMAIN_VENC			24
+#define MT8188_POWER_DOMAIN_IMG_VCORE			25
+#define MT8188_POWER_DOMAIN_IMG_MAIN			26
+#define MT8188_POWER_DOMAIN_DIP				27
+#define MT8188_POWER_DOMAIN_IPE				28
+#define MT8188_POWER_DOMAIN_CAM_VCORE			29
+#define MT8188_POWER_DOMAIN_CAM_MAIN			30
+#define MT8188_POWER_DOMAIN_CAM_SUBA			31
+#define MT8188_POWER_DOMAIN_CAM_SUBB			32
+
+#endif /* _DT_BINDINGS_POWER_MT8188_POWER_H */
-- 
2.18.0


