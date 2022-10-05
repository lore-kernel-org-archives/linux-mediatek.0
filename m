Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF6EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMvOxD6EypyaekB+IaimSEYshZAsQk9Lz9fNUMf2Y0w=; b=CmF9GYsOsuqijvwRUezH/TgBTN
	ZG2W/Rts2gMbGDnxDQV2pxYSVdNPZhfnRUXz9Rirm3UeA13rWX6wWF4TmnSCMn/2YY8+FgujYNzsd
	m1w02zE4AkKxPG/YsoIgIcju+ElAeRqqvL6G5jga6Mubeud1EPfkqtX+/r87KboZYf1zH9kbSDKRh
	InmkiqD6Rp/21zF5MNbjwRSfD6zwMr8z05PTebBeh8/3OEzGPkeQYd74qeIfHHtRWC0+TRRzaOs9P
	vLBfk4tJCM57iaAtPTlPH2pSg5f12gW3NqZ0WjkYFoJr9P/bL+scmMnr2HY8P6fLOo0WXwaVm8rhJ
	pooUlIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2hF-00Dodi-So; Wed, 05 Oct 2022 11:36:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gd-00DoPp-G6; Wed, 05 Oct 2022 11:35:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9284366022F8;
	Wed,  5 Oct 2022 12:35:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664969738;
	bh=3t7BDTuD27Hzn+PWYye7KW5kxqz4FnjQqvH/Ul9Or9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9g3zdbMO4lO+2i/SRgQYg7EaM8oExhDfmVqCi05WaC39n4baw4xEPO2T9urtMlOE
	 CIyIepD4V2WE+34PghHaO+NFOWaPlb6vZZ3R5sCFSMAbtLn1zxbfizxi4JmNg5RLuH
	 Y1WxjhZ5p2NW3Zg3IhuEb21R8vwSnySxwdjbhmfrthzx1m4WahnDqok2crWyPIAvud
	 qXhFQjL5GzZBruECTEIIahRCDisSQbkWn/tEIl3on0m/A0FkS9KI9Yu1kRkDEzSzOP
	 yAhuuJ6MtHhRJoJQmfdD6x6pARRldLJdspWdQ/JmaEqg5/Pz4Ml34l6LM5gm7q+SZ+
	 SwXoMSmNrrOSQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	allen-kh.cheng@mediatek.com,
	seiya.wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
Date: Wed,  5 Oct 2022 13:35:15 +0200
Message-Id: <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_043539_818786_E8B7935F 
X-CRM114-Status: GOOD (  14.75  )
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

Convert the MediaTek watchdog bindings to schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
 2 files changed, 80 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
new file mode 100644
index 000000000000..f43b5af92d40
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -0,0 +1,80 @@
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
+      - items:
+          - enum:
+              - mediatek,mt2712-wdt
+              - mediatek,mt6589-wdt
+              - mediatek,mt7986-wdt
+              - mediatek,mt8183-wdt
+              - mediatek,mt8186-wdt
+              - mediatek,mt8192-wdt
+              - mediatek,mt8195-wdt
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
+  timeout-sec: true
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        watchdog: watchdog@10007000 {
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
index 762c62e428ef..000000000000
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ /dev/null
@@ -1,42 +0,0 @@
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
2.37.2


