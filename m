Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA362C001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aW4MnkZXDOajNmrXYpt6GNCJxqJykJSzBGG0EXFMA8E=; b=R9eJrGF2MNRubu04l0XXxYFNQi
	CFB31rX4B2x7CbAJShHw6yxcnHutOkD9H3eD6m7CikOKek5P4Ab92EbqdHETsVkl8RisWRCkj0POj
	nvm/THBF8KmGMZiuQB+JVQohlWjFdSXNopL4pN1WHBNjNwCCQSTnfzXEV9WShfR/73n1MWR64rF81
	2onk1B6OY/wgRSZtxTq8LClE03BYtgnR21S1GXlNRkkjuPaeYZcx5fjOIXXRhwOhfOApx2/qEdatk
	455gPtiuCZw+sFolp23i6JAalp7I84SFvthDdVGmHwIGDbP7mofA3dZiW5HTQH25vSMKuc62xae3f
	LHztl8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5px-007l0C-1w;
	Thu, 10 Aug 2023 13:36:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5pt-007kxf-2g;
	Thu, 10 Aug 2023 13:36:23 +0000
Received: from eugen-station.. (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B241B6607225;
	Thu, 10 Aug 2023 14:36:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691674577;
	bh=FZNpea/iwGbxvzCEyLfqqXbsIddKAIFuEpzLsMyHdHA=;
	h=From:To:Cc:Subject:Date:From;
	b=TlxqIOQm3c85cQpJVwAvVXbI0l3QpW2ur0Lqg5PTGOGge1W9lIHE38YuRRelM69Qp
	 NIX1BNE/oJhBbXykkrpkNoVM0J2DqpqetVag5+6uO/6P3IPnVNQKktRjgDoG4gD79W
	 r3nItD5oR4SMmkazxMnrGMkvfh8G9++UBLvwb3rPnaVmD1NUyTcRIyZON/qBHj9M1i
	 7gDMv3lAKj18yZPALdR0F9rcyR6iVTTpvSIBlmsPRFXb22KomU32a56i0+aKG8l/uO
	 /wlKMZs+iydxAstIyI7AGNcP+CgsYQEcyYFhSVpgn1RVnNXUSpolxh4yyr5wvbo7b8
	 78WtIgJnupCmw==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] dt-bindings: arm: mediatek: convert audsys to yaml
Date: Thu, 10 Aug 2023 16:36:02 +0300
Message-Id: <20230810133602.48024-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_063622_053481_B9399836 
X-CRM114-Status: GOOD (  14.09  )
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

Convert the mediatek,audsys binding to YAML.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---

Ref to /schemas/sound/mt2701-afe-pcm.yaml added as informative only because
that schema has not been converted yet


 .../bindings/arm/mediatek/mediatek,audsys.txt | 39 -----------
 .../arm/mediatek/mediatek,audsys.yaml         | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
deleted file mode 100644
index 699776be1dd3..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-MediaTek AUDSYS controller
-============================
-
-The MediaTek AUDSYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-audsys", "syscon"
-	- "mediatek,mt6765-audsys", "syscon"
-	- "mediatek,mt6779-audio", "syscon"
-	- "mediatek,mt7622-audsys", "syscon"
-	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
-	- "mediatek,mt8167-audiosys", "syscon"
-	- "mediatek,mt8183-audiosys", "syscon"
-	- "mediatek,mt8192-audsys", "syscon"
-	- "mediatek,mt8516-audsys", "syscon"
-- #clock-cells: Must be 1
-
-The AUDSYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Required sub-nodes:
--------
-For common binding part and usage, refer to
-../sonud/mt2701-afe-pcm.txt.
-
-Example:
-
-	audsys: clock-controller@11220000 {
-		compatible = "mediatek,mt7622-audsys", "syscon";
-		reg = <0 0x11220000 0 0x2000>;
-		#clock-cells = <1>;
-
-		afe: audio-controller {
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
new file mode 100644
index 000000000000..b879a3a060da
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AUDSYS controller
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@collabora.com>
+
+description:
+  The MediaTek AUDSYS controller provides various clocks to the system.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-audsys
+              - mediatek,mt6765-audsys
+              - mediatek,mt6779-audsys
+              - mediatek,mt7622-audsys
+              - mediatek,mt8167-audsys
+              - mediatek,mt8173-audsys
+              - mediatek,mt8183-audsys
+              - mediatek,mt8186-audsys
+              - mediatek,mt8192-audsys
+              - mediatek,mt8516-audsys
+          - const: syscon
+      - items:
+          # Special case for mt7623 for backward compatibility
+          - const: mediatek,mt7623-audsys
+          - const: mediatek,mt2701-audsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  audio-controller:
+    #  $ref: /schemas/sound/mt2701-afe-pcm.yaml#
+    type: object
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        audsys: clock-controller@11220000 {
+            compatible = "mediatek,mt7622-audsys", "syscon";
+            reg = <0 0x11220000 0 0x2000>;
+            #clock-cells = <1>;
+
+            audio-controller {
+            };
+        };
+    };
-- 
2.34.1


