Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF37C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D6020872
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuXZwzXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68D6020872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kG0oV+kgIXWO7CnqVl2WGoEBpShEgzFQ0/TCw+Yd39E=; b=OuXZwzXFujdjUoqS8MM6Kyo07
	oAENAa2b0U+JD32nSO3pc/agSi+oP0EtXgDYeekkVal6YCeRwS6282vksudK6OVfLNnyddvt1UqsR
	TuXydA3KyEdtnpzptUsK7TFrrckWA/3niQrO2jxk0FmZGFdT6AoxFDK6Jg80LwxHNOpQIqYxlsNDs
	yE1dTGsl1IPsjPYmEQU7hnmfpRX2y9uITlJqL7TZzYcQ9dAdrJSn8MT/XiHzFjO6HqcKKJUskqLbz
	wqmCbQisg39sTjOeusCie2zAMBW0GLIC5A6AVfhtRcFsw+7s+k79qVWqULGFaKYJLw81S3goL+tRu
	jNMNz62fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO12A-0008Uj-Iv; Thu, 01 Oct 2020 16:02:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO11w-0008Mu-6q; Thu, 01 Oct 2020 16:02:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6C11529D758
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/12] dt-bindings: power: Add bindings for the Mediatek
 SCPSYS power domains controller
Date: Thu,  1 Oct 2020 18:01:43 +0200
Message-Id: <20201001160154.3587848-2-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001160154.3587848-1-enric.balletbo@collabora.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120204_439804_B655F7CD 
X-CRM114-Status: GOOD (  17.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The System Control Processor System (SCPSYS) has several power management
related tasks in the system. Add the bindings to define the power
domains for the SCPSYS power controller.

Co-developed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2:
- Use generic node names (power-domain).
- Define valid values for common properties like #power-domain-cells.

 .../power/mediatek,power-controller.yaml      | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
new file mode 100644
index 000000000000..9ac7a7694d61
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Power Domains Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+  - Matthias Brugger <mbrugger@suse.com>
+
+description: |
+  Mediatek processors include support for multiple power domains which can be
+  powered up/down by software based on different application scenes to save power.
+
+  IP cores belonging to a power domain should contain a 'power-domains'
+  property that is a phandle for SCPSYS node representing the domain.
+
+properties:
+  $nodename:
+    const: power-controller
+
+  compatible:
+    enum:
+      - mediatek,mt8173-power-controller
+
+  '#power-domain-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^power-domain@[0-9]$":
+    type: object
+    description: |
+      Represents the power domains within the power controller node as documented
+      in Documentation/devicetree/bindings/power/power-domain.yaml.
+
+    properties:
+
+      '#power-domain-cells':
+        description:
+            Must be 0 for nodes representing a single PM domain and 1 for nodes
+            providing multiple PM domains.
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      reg:
+        description: |
+          Power domain index. Valid values are defined in:
+              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
+        maxItems: 1
+
+      clocks:
+        description: |
+          A number of phandles to clocks that need to be enabled during domain
+          power-up sequencing.
+
+      clock-names:
+        description: |
+          List of names of clocks, in order to match the power-up sequencing
+          for each power domain we need to group the clocks by name. BASIC
+          clocks need to be enabled before enabling the corresponding power
+          domain, and should not have a '-' in their name (i.e mm, mfg, venc).
+          SUSBYS clocks need to be enabled before releasing the bus protection,
+          and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
+
+          In order to follow properly the power-up sequencing, the clocks must
+          be specified by order, adding first the BASIC clocks followed by the
+          SUSBSYS clocks.
+
+      mediatek,infracfg:
+        $ref: /schemas/types.yaml#definitions/phandle
+        description: phandle to the device containing the INFRACFG register range.
+
+      mediatek,smi:
+        $ref: /schemas/types.yaml#definitions/phandle
+        description: phandle to the device containing the SMI register range.
+
+    required:
+      - reg
+      - '#power-domain-cells'
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        scpsys: syscon@10006000 {
+            compatible = "syscon", "simple-mfd";
+            reg = <0 0x10006000 0 0x1000>;
+
+            spm: power-controller {
+                compatible = "mediatek,mt8173-power-controller";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #power-domain-cells = <1>;
+
+                /* power domains of the SoC */
+                power-domain@MT8173_POWER_DOMAIN_VDEC {
+                    reg = <MT8173_POWER_DOMAIN_VDEC>;
+                    clocks = <&topckgen CLK_TOP_MM_SEL>;
+                    clock-names = "mm";
+                    #power-domain-cells = <0>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_VENC {
+                    reg = <MT8173_POWER_DOMAIN_VENC>;
+                    clocks = <&topckgen CLK_TOP_MM_SEL>,
+                             <&topckgen CLK_TOP_VENC_SEL>;
+                    clock-names = "mm", "venc";
+                    #power-domain-cells = <0>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_ISP {
+                    reg = <MT8173_POWER_DOMAIN_ISP>;
+                    clocks = <&topckgen CLK_TOP_MM_SEL>;
+                    clock-names = "mm";
+                    #power-domain-cells = <0>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_MM {
+                    reg = <MT8173_POWER_DOMAIN_MM>;
+                    clocks = <&topckgen CLK_TOP_MM_SEL>;
+                    clock-names = "mm";
+                    #power-domain-cells = <0>;
+                    mediatek,infracfg = <&infracfg>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_VENC_LT {
+                    reg = <MT8173_POWER_DOMAIN_VENC_LT>;
+                    clocks = <&topckgen CLK_TOP_MM_SEL>,
+                             <&topckgen CLK_TOP_VENC_LT_SEL>;
+                    clock-names = "mm", "venclt";
+                    #power-domain-cells = <0>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_AUDIO {
+                    reg = <MT8173_POWER_DOMAIN_AUDIO>;
+                    #power-domain-cells = <0>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_USB {
+                    reg = <MT8173_POWER_DOMAIN_USB>;
+                    #power-domain-cells = <0>;
+                };
+                power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
+                    reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
+                    clocks = <&clk26m>;
+                    clock-names = "mfg";
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    #power-domain-cells = <1>;
+
+                    power-domain@MT8173_POWER_DOMAIN_MFG_2D {
+                        reg = <MT8173_POWER_DOMAIN_MFG_2D>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        #power-domain-cells = <1>;
+
+                        power-domain@MT8173_POWER_DOMAIN_MFG {
+                            reg = <MT8173_POWER_DOMAIN_MFG>;
+                            #power-domain-cells = <0>;
+                            mediatek,infracfg = <&infracfg>;
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
