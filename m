Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05303C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XIRz830/FfhIoc4gOWXDijOyefpzS15tzQKsDgdTW0=; b=3XKKqhdK0h5wMvuPxCNOGV2uLZ
	ksjDeF1AZLQHOyfEE0whghJ9PnAUKj4ruuzwVjW2X60V0UyoTDKwYZg0wYLRpG7OjRyetm64TU2SN
	gsHgnr22uYPnRn7zQl9Si2Kk8w85lCT6xGP6QuuO/96g+Ip6FSn/pOA3JAKpDatlD2IGYaPDrj8eL
	Qn0ho9aahNNFFA1xM08X4B2Q7oqNFdOXmLQ2GdQuhQedM/OFeBlhsi+DD41I0d8b+UOmFva1R8o3u
	ga8ngClNXFXSGiHWT5dmkelbZmRdDDlSiOBNAUsh/Y/wtt4L19C1SLRtK5F+ggMzYetBQYO8bLLsd
	Skws47NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odskM-00308S-Jm; Thu, 29 Sep 2022 12:34:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsfJ-002yBk-Fi; Thu, 29 Sep 2022 12:29:24 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6248266022B3;
	Thu, 29 Sep 2022 13:29:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664454558;
	bh=tWLISRDl8sSojAqI5mblzCEFbyqsAUeF/F2kOkv3Nnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BSI8FxOjAEwgx4DMqNZoFeLylCj2W98/WMufWQTutMgpUu9dSnT317uvizQhlhIzN
	 ha76+VfOD8avSFtjKWo6VVzJDa1BUGHc5Cgv7e+KV/UuW12b2f74KB5Y/MHHQxmPqE
	 0y7lQserTDS4XD5iY7ScG/94BkvedBuQq4Ttpma6dkgXAV8we4gwQiVokEKOzE0hZO
	 4tQRhfV68yA6bXtxeK7XsryUzjuqBs5ic3PGpCs3PvKhWRu5IZkubVVAW342oKWHv4
	 A5jSjDlEhlY9MSv7SevCP6LIdd0qZuYkZdJPVn6t6/PndZz0AfZFo/aa9NsHtGv4Sj
	 ID4vsRbNHEy2g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] dt-bindings: timer: mediatek: Convert to json-schema
Date: Thu, 29 Sep 2022 14:29:01 +0200
Message-Id: <20220929122901.614315-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_052921_847301_45105411 
X-CRM114-Status: GOOD (  14.19  )
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

Convert the MediaTek SoC timer txt binding to json-schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/timer/mediatek,mtk-timer.txt     | 47 ----------
 .../bindings/timer/mediatek,timer.yaml        | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
deleted file mode 100644
index 8bbb6e94508b..000000000000
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-MediaTek Timers
----------------
-
-MediaTek SoCs have different timers on different platforms,
-- CPUX (ARM/ARM64 System Timer)
-- GPT (General Purpose Timer)
-- SYST (System Timer)
-
-The proper timer will be selected automatically by driver.
-
-Required properties:
-- compatible should contain:
-	For those SoCs that use GPT
-	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
-	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
-	* "mediatek,mt6582-timer" for MT6582 compatible timers (GPT)
-	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
-	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
-	* "mediatek,mt8127-timer" for MT8127 compatible timers (GPT)
-	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
-	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
-	* "mediatek,mt8516-timer" for MT8516 compatible timers (GPT)
-	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
-
-	For those SoCs that use SYST
-	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
-	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
-	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)
-	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
-	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
-	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
-	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
-
-	For those SoCs that use CPUX
-	* "mediatek,mt6795-systimer" for MT6795 compatible timers (CPUX)
-
-- reg: Should contain location and length for timer register.
-- clocks: Should contain system clock.
-
-Examples:
-
-	timer@10008000 {
-		compatible = "mediatek,mt6577-timer";
-		reg = <0x10008000 0x80>;
-		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&system_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
new file mode 100644
index 000000000000..a5ea4095852e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/timer/mediatek,timer.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek SoC timers
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  MediaTek SoCs have different timers on different platforms,
+  CPUX (ARM/ARM64 System Timer), GPT (General Purpose Timer)
+  and SYST (System Timer).
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt6577-timer
+              - mediatek,mt6765-timer
+              - mediatek,mt6795-systimer
+      # GPT Timers
+      - items:
+          - enum:
+              - mediatek,mt2701-timer
+              - mediatek,mt6580-timer
+              - mediatek,mt6582-timer
+              - mediatek,mt6589-timer
+              - mediatek,mt7623-timer
+              - mediatek,mt8127-timer
+              - mediatek,mt8135-timer
+              - mediatek,mt8173-timer
+              - mediatek,mt8516-timer
+          - const: mediatek,mt6577-timer
+      # SYST Timers
+      - items:
+          - enum:
+              - mediatek,mt7629-timer
+              - mediatek,mt8183-timer
+              - mediatek,mt8186-timer
+              - mediatek,mt8188-timer
+              - mediatek,mt8192-timer
+              - mediatek,mt8195-timer
+          - const: mediatek,mt6765-timer
+      # CPUX Timers
+      - items:
+          - const: mediatek,mt6795-systimer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Timer clock
+      - description: RTC or bus clock
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@10008000 {
+      compatible = "mediatek,mt6577-timer";
+      reg = <0x10008000 0x80>;
+      interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&system_clk>;
+    };
-- 
2.37.2


