Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84606C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 04:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqt2qDFNbfsmqWFHQYYGGsgfhqmp4gbQQHYsgXAQHGQ=; b=161P9ax8ho3ecHvW8GraQmmcMY
	UxyCWT1zs55lSdB4S0VMfnp2Wgu5NRvSnzxLim6UvlTemXD64I17imGWEQkVqV8RkpM1TDwzJ+vdo
	9cBaAGu4DIYHhsEEipzbII9ObTWBb+5THXtVqL8Lkz4J8kmNVamwBCgpQrPGcbWG0MNXzJwfVhIUT
	lxRuaE4+XwWZWyO3sZ6vtgznM9Xk/YUX8tJ4A2/LOx2esQBQcCfW6ww2or7M4XakalmXyfdJtKMME
	/27OTS2RnyY28GqTmqQVoodeAh6WHsv74C0lgygF4pszFQP+gY2XfvQ8rGKX+fPNCjTFsb+K1PNuO
	UdySJWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osGJ9-002fRB-Vs; Tue, 08 Nov 2022 04:33:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osGJ6-002fQD-AE; Tue, 08 Nov 2022 04:33:54 +0000
X-UUID: db9479067b744580a462b8aeaca9a6d0-20221107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hqt2qDFNbfsmqWFHQYYGGsgfhqmp4gbQQHYsgXAQHGQ=;
	b=L2J9v1kHmOJ2KDo0kUtRImPKRqqk61walCkhtqODu4/nbvDvXt1dN9HYF1fZGVKN5tK0v1NTM2oHPGpw2zYBa8X/HVY1R4n9luaXXuVtErnl8A7rY7eUhCiBnk3am4r31ls2Ng5b+rRa9C8XzjZE+GmdwfMCpjg5HVgUnVpHNYY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:48392748-fe06-4f32-966e-f6df87345d58,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:62cd327,CLOUDID:8284fbf3-a19e-4b45-8bfe-6a73c93611e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: db9479067b744580a462b8aeaca9a6d0-20221107
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 875077537; Mon, 07 Nov 2022 21:33:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 8 Nov 2022 11:32:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 8 Nov 2022 11:32:13 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <nfraprado@collabora.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 5/7] dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
Date: Tue, 8 Nov 2022 11:32:07 +0800
Message-ID: <20221108033209.22751-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_203352_386070_B51BBB4A 
X-CRM114-Status: GOOD (  15.09  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Convert the MediaTek watchdog bindings to schema.

The original binding only had 4 without a fallback but there is a reset
controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt",
"mediatek,mt8188-wdt" and "mediatek,mt8195-wdt" Since there is no reset
controller for the mt6589, we remove "mediatek,mt6589-wdt" as a
fallback.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 78 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 43 ----------
 2 files changed, 78 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
new file mode 100644
index 000000000000..b3d2273f323b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoCs Watchdog timer
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The watchdog supports a pre-timeout interrupt that fires
+  timeout-sec/2 before the expiry.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2712-wdt
+          - mediatek,mt6589-wdt
+          - mediatek,mt7986-wdt
+          - mediatek,mt8183-wdt
+          - mediatek,mt8186-wdt
+          - mediatek,mt8188-wdt
+          - mediatek,mt8192-wdt
+          - mediatek,mt8195-wdt
+      - items:
+          - enum:
+              - mediatek,mt2701-wdt
+              - mediatek,mt6582-wdt
+              - mediatek,mt6797-wdt
+              - mediatek,mt7622-wdt
+              - mediatek,mt7623-wdt
+              - mediatek,mt7629-wdt
+              - mediatek,mt8516-wdt
+          - const: mediatek,mt6589-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog pre-timeout (bark) interrupt
+
+  mediatek,disable-extrst:
+    description: Disable sending output reset signal
+    type: boolean
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        watchdog@10007000 {
+            compatible = "mediatek,mt8183-wdt";
+            reg = <0 0x10007000 0 0x100>;
+            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
+            mediatek,disable-extrst;
+            timeout-sec = <10>;
+            #reset-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
deleted file mode 100644
index b900c85d4560..000000000000
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Mediatek SoCs Watchdog timer
-
-The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
-before the expiry.
-
-Required properties:
-
-- compatible should contain:
-	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
-	"mediatek,mt2712-wdt": for MT2712
-	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
-	"mediatek,mt6589-wdt": for MT6589
-	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
-	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
-	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
-	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
-	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
-	"mediatek,mt8183-wdt": for MT8183
-	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
-	"mediatek,mt8188-wdt", "mediatek,mt6589-wdt": for MT8188
-	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
-	"mediatek,mt8192-wdt": for MT8192
-	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
-
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-- mediatek,disable-extrst: disable send output reset signal
-- interrupts: Watchdog pre-timeout (bark) interrupt.
-- timeout-sec: contains the watchdog timeout in seconds.
-- #reset-cells: Should be 1.
-
-Example:
-
-watchdog: watchdog@10007000 {
-	compatible = "mediatek,mt8183-wdt",
-		     "mediatek,mt6589-wdt";
-	mediatek,disable-extrst;
-	reg = <0 0x10007000 0 0x100>;
-	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
-	timeout-sec = <10>;
-	#reset-cells = <1>;
-};
-- 
2.18.0


