Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liyU8eOxyP9nm4G+q0C8JSXKt1LTE0E0W3uyQbJe2Hs=; b=eVzHT+KqSrtxei
	WyB19RQGKWdp0jHQxikRWNxnDhXDYvrgGHqaphs6jKY81uDLynN3rML6J6Z4D8y304yg274ZmSDrF
	TcUtVPR4/ca7VWfhjZZHFgIErRfVoez9Qovde5x/k/wPhcthomeF35MZm7EkzXTfndaLUCn6v7U+a
	Z7sZTk6YQeCL+TY/KtUyCqxFM42IPP2ddhs3+k+m/NogPXrCy3tm33iCnNEAeF7zE3UdP/0mGScFJ
	XhYW78apV8enSYGDh/edoTc3MF9ghdUx1xk20myDMVwlpt2jBHp0h8YqkTCOouEJyX00ekJDkEFcG
	/ZoY7wn/JSjjzxjGXJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtGE-000aYk-W8; Fri, 22 Apr 2022 13:23:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtG0-000aU3-Sh; Fri, 22 Apr 2022 13:23:36 +0000
X-UUID: 794e5c9dbfd643a6bcf87848d83168f0-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3e23586e-e2db-4c61-8cae-8650d13641b0, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:6e15cbef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 794e5c9dbfd643a6bcf87848d83168f0-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2074782554; Fri, 22 Apr 2022 06:23:22 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 06:13:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 21:13:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 21:13:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 1/1] dt-bindings: timer: mediatek: Convert binding to YAML
Date: Fri, 22 Apr 2022 21:13:17 +0800
Message-ID: <20220422131317.25410-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422131317.25410-1-allen-kh.cheng@mediatek.com>
References: <20220422131317.25410-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_062333_040274_C89CE9BB 
X-CRM114-Status: GOOD (  14.93  )
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

Convert Mediatek timer devicetree binding to YAML.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../bindings/timer/mediatek,mtk-timer.txt     | 42 ----------
 .../bindings/timer/mediatek,mtk-timer.yaml    | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
deleted file mode 100644
index 6f1f9dba6e88..000000000000
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-MediaTek Timers
----------------
-
-MediaTek SoCs have two different timers on different platforms,
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
-	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
-	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
-	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
-	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
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
diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml
new file mode 100644
index 000000000000..be7eb09275f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mediatek,mtk-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoCs timers bindings
+
+description:
+  MediaTek SoCs have two different timers on different platforms,
+  - GPT (General Purpose Timer)
+  - SYST (System Timer)
+
+maintainers:
+  - Fengquan Chen <fengquan.chen@mediatek.com>
+  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+
+properties:
+  $nodename:
+    pattern: '^timer@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - const: mediatek,mt6577-timer
+      - const: mediatek,mt6765-timer
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
+      - items:
+          - enum:
+              - mediatek,mt7629-timer
+              - mediatek,mt8183-timer
+              - mediatek,mt8186-timer
+              - mediatek,mt8192-timer
+              - mediatek,mt8195-timer
+          - const: mediatek,mt6765-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: clk13m
+      - const: bus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@10008000 {
+        compatible = "mediatek,mt6577-timer";
+        reg = <0xd4014000 0x100>;
+        interrupts = <13>;
+        clocks = <&coreclk 2>;
+    };
+
+...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
