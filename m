Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3lze4mBN99EtiOb+jIyhpr+UPE6lfL7GgWZ3fgnCYg=; b=WwUiFRXxEtNfyr
	2aW0QNvspPuvjS3xMiSEwMwtv3TAMGHVsFoJr3z9hGMyzB6ewsqaOtp9eEYaB51g56u485e8uYUDv
	7QvfACfYHGUeLTbhaIzXQGYsok6GGVYBGR8gon2/pgaWl+IuKJ4YwmOwFQhWblByLpeIfn41GcJiE
	e6EfXRR2AyPDjUMmNHOpVmEA1+4CUplPu3D20fIIWbC8E+AAGmzHezuAxaglwuJibkJF3FxaY6+P1
	jitE7tdj3YB4bgamYZ5T+LTUc5NYwA+jkcTsFDBAIxxvzYO5ylN9eJEKtkDfD8w97cE2KmAIlaAMW
	yYDKageLUEvfFjmavlcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYWi-00GvJC-Rp; Fri, 13 May 2022 16:52:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYVM-00GuQP-Pq; Fri, 13 May 2022 16:51:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 221F01F46364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652460662;
 bh=xwq1gpeccyvcU8bMkAWwkySqeJSH5hDRD7v8Dl7oSm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nM6ZVdltYgVqvG4Sw32cOOnOkzKiYDCPjSizxfJWvzYGqYdfS3wQH54dDKB1ShSmy
 f+sslyONbphYOauIX/IvcLkpArvHTv6gpc3oOYyLMtYO9OnWD8cZpWioUSwlkSd2b4
 SVY7oVRwcv98BmvjS/GHzhLS9XnbwNlqRQE8qTs/EyvUq8J0KYz+Y0AnLcF56s6ETV
 aHzZvhN7/QWgTHKqKbrT/B3lNwjiE/MNMp8cw1JSfr690t9e7l/5UPIa0oD85ncsgZ
 UbG3wnRccghFCiQudl7FzwEG9Qd2xr0Z5zEJGrpk4unXwfAQDG0Ub//jBOPf809UAe
 VlyjHctf6+z/w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
Subject: [PATCH 4/5] dt-bindings: arm: mediatek: Add clock driver bindings for
 MT6795
Date: Fri, 13 May 2022 18:50:49 +0200
Message-Id: <20220513165050.500831-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_095105_146408_16DF260E 
X-CRM114-Status: GOOD (  12.95  )
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

Add the bindings for the clock drivers of the MediaTek Helio X10
MT6795 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,mt6795-clock.yaml   | 67 +++++++++++++++++
 .../mediatek/mediatek,mt6795-sys-clock.yaml   | 73 +++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
new file mode 100644
index 000000000000..b7d96d0ed867
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt6795-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Functional Clock Controller for MT6795
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description: |
+  The clock architecture in MediaTek like below
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The devices provide clock gate control in different IP blocks.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt6795-mfgcfg
+          - mediatek,mt6795-vdecsys
+          - mediatek,mt6795-vencsys
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
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
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@13000000 {
+            compatible = "mediatek,mt6795-mfgcfg";
+            reg = <0 0x13000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+
+        clock-controller@16000000 {
+            compatible = "mediatek,mt6795-vdecsys";
+            reg = <0 0x16000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+
+        clock-controller@18000000 {
+            compatible = "mediatek,mt6795-vdecsys";
+            reg = <0 0x18000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+    };
+
+
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
new file mode 100644
index 000000000000..389dd8e245ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt6795-sys-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek System Clock Controller for MT6795
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek system clock controller provides various clocks and system configuration
+  like reset and bus protection on MT6795.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt6795-apmixedsys
+          - mediatek,mt6795-infracfg
+          - mediatek,mt6795-pericfg
+          - mediatek,mt6795-topckgen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
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
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        topckgen: clock-controller@10000000 {
+            compatible = "mediatek,mt6795-topckgen", "syscon";
+            reg = <0 0x10000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+
+        infracfg: power-controller@10001000 {
+            compatible = "mediatek,mt6795-infracfg", "syscon";
+            reg = <0 0x10001000 0 0x1000>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        }
+
+        pericfg: power-controller@10003000 {
+            compatible = "mediatek,mt6795-pericfg", "syscon";
+            reg = <0 0x10003000 0 0x1000>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+
+        apmixedsys: clock-controller@10209000 {
+            compatible = "mediatek,mt6795-apmixedsys", "syscon";
+            reg = <0 0x10209000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+    };
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
