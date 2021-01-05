Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8332C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 05:37:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728BA22482
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 05:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 728BA22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5eEMo3wLVmZ0L4tEoT7lUag4mhZZibxOChdXdLr05IQ=; b=XKpAXDN3eiJm9vse79yTV+GS1C
	SmGjGTLmBihvF8VTCJB4WkWuGw8cODO/mRPW2HVByp0ibFc6h+xNNXmliUDUhi1asuks69yBYsQE8
	Nu5UsMoVGGo/q+8nCsCBa/YiLFTuVK5NRxUh07l+HsYbXDJ1K4V1I40jqYXI4s5WLCveKyelMZo5E
	sJKyhPHF06F/CnWv6PAdO2AtJaHHMlQDwzKdsw8L+aYma5U3QBe6Sj3jycgDjNgnnypO6S1Bh6m44
	FyqzlRNqbvCiyJqhgkkqK/MjoATDv2DpM/hsu9UEx6T2HMMZa7ELGwz+syaFrJmdwAbc/zVOnuZgc
	SV6OM+LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwf1W-0003zI-Gu; Tue, 05 Jan 2021 05:36:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwf1R-0003yV-05; Tue, 05 Jan 2021 05:36:46 +0000
X-UUID: 7b040aed894b43f49dd1b10aa23f01d3-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OYnbuzNt8GTG2Ot97VNKoEMIUzBn10AvcLLZC+TH4E8=; 
 b=JC72mZfUmO2Kh/nHtN1Y9Hp8oTv5MCD7qzF/Lvh6oC8LjhO+MaxY80NKAfSXT2CVm/mu/ERm/h0jVvo23tEXdohoQdZuQgIJ0Y5N9FZBN5FZLdgRwSy0RNyuS0RPbrCj13OPS21F517GbZTNjB27di5TppY+SwylxyM9NN82LNI=;
X-UUID: 7b040aed894b43f49dd1b10aa23f01d3-20210104
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 811912672; Mon, 04 Jan 2021 21:36:37 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 21:36:35 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 13:36:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 13:36:33 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Date: Tue, 5 Jan 2021 13:36:31 +0800
Message-ID: <20210105053632.5476-1-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_003645_312481_F2BBDC75 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Nick Fan <Nick.Fan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add devicetree schema for Arm Mali Valhall GPU

Define a compatible string for the Mali Valhall GPU
for Mediatek's SoC platform.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
 .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
 1 file changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
new file mode 100644
index 000000000000..436294c032ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
@@ -0,0 +1,252 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali Valhall GPU
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-mali
+      - const: arm,mali-valhall
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: GPU interrupt
+      - description: MMU interrupt
+      - description: Job interrupt
+
+  interrupt-names:
+    items:
+      - const: gpu
+      - const: mmu
+      - const: job
+
+  clocks:
+    minItems: 1
+
+  power-domains:
+    minItems: 1
+    maxItems: 5
+
+  mali-supply: true
+  sram-supply: true
+
+  operating-points-v2: true
+
+  "#cooling-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
+      properties:
+        sram-supply: true
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 5
+          maxItems: 5
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+
+      required:
+        - sram-supply
+        - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@13000000 {
+           compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+           reg = <0x13000000 0x4000>;
+           interrupts =
+                   <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
+           interrupt-names =
+                   "gpu",
+                   "mmu",
+                   "job";
+
+           clocks = <&mfgcfg 0>;
+
+           power-domains =
+                   <&scpsys 4>,
+                   <&scpsys 5>,
+                   <&scpsys 6>,
+                   <&scpsys 7>,
+                   <&scpsys 8>;
+
+           operating-points-v2 = <&gpu_opp_table>;
+           mali-supply = <&mt6315_7_vbuck1>;
+           sram-supply = <&mt6359_vsram_others_ldo_reg>;
+    };
+
+    gpu_opp_table: opp_table0 {
+      compatible = "operating-points-v2";
+      opp-shared;
+
+      opp-358000000 {
+              opp-hz = /bits/ 64 <358000000>;
+              opp-hz-real = /bits/ 64 <358000000>,
+                            /bits/ 64 <358000000>;
+              opp-microvolt = <606250>,
+                              <750000>;
+      };
+
+      opp-399000000 {
+              opp-hz = /bits/ 64 <399000000>;
+              opp-hz-real = /bits/ 64 <399000000>,
+                            /bits/ 64 <399000000>;
+              opp-microvolt = <618750>,
+                              <750000>;
+      };
+
+      opp-440000000 {
+              opp-hz = /bits/ 64 <440000000>;
+              opp-hz-real = /bits/ 64 <440000000>,
+                            /bits/ 64 <440000000>;
+              opp-microvolt = <631250>,
+                              <750000>;
+      };
+
+      opp-482000000 {
+              opp-hz = /bits/ 64 <482000000>;
+              opp-hz-real = /bits/ 64 <482000000>,
+                            /bits/ 64 <482000000>;
+              opp-microvolt = <643750>,
+                              <750000>;
+      };
+
+      opp-523000000 {
+              opp-hz = /bits/ 64 <523000000>;
+              opp-hz-real = /bits/ 64 <523000000>,
+                            /bits/ 64 <523000000>;
+              opp-microvolt = <656250>,
+                              <750000>;
+      };
+
+      opp-564000000 {
+              opp-hz = /bits/ 64 <564000000>;
+              opp-hz-real = /bits/ 64 <564000000>,
+                            /bits/ 64 <564000000>;
+              opp-microvolt = <668750>,
+                              <750000>;
+      };
+
+      opp-605000000 {
+              opp-hz = /bits/ 64 <605000000>;
+              opp-hz-real = /bits/ 64 <605000000>,
+                            /bits/ 64 <605000000>;
+              opp-microvolt = <681250>,
+                              <750000>;
+      };
+
+      opp-647000000 {
+              opp-hz = /bits/ 64 <647000000>;
+              opp-hz-real = /bits/ 64 <647000000>,
+                            /bits/ 64 <647000000>;
+              opp-microvolt = <693750>,
+                              <750000>;
+      };
+
+      opp-688000000 {
+              opp-hz = /bits/ 64 <688000000>;
+              opp-hz-real = /bits/ 64 <688000000>,
+                            /bits/ 64 <688000000>;
+              opp-microvolt = <706250>,
+                              <750000>;
+      };
+
+      opp-724000000 {
+              opp-hz = /bits/ 64 <724000000>;
+              opp-hz-real = /bits/ 64 <724000000>,
+                            /bits/ 64 <724000000>;
+              opp-microvolt = <725000>,
+                              <750000>;
+      };
+
+      opp-760000000 {
+              opp-hz = /bits/ 64 <760000000>;
+              opp-hz-real = /bits/ 64 <760000000>,
+                            /bits/ 64 <760000000>;
+              opp-microvolt = <743750>,
+                              <750000>;
+      };
+
+      opp-795000000 {
+              opp-hz = /bits/ 64 <795000000>;
+              opp-hz-real = /bits/ 64 <795000000>,
+                            /bits/ 64 <795000000>;
+              opp-microvolt = <762500>,
+                              <762500>;
+      };
+
+      opp-831000000 {
+              opp-hz = /bits/ 64 <831000000>;
+              opp-hz-real = /bits/ 64 <831000000>,
+                            /bits/ 64 <831000000>;
+              opp-microvolt = <781250>,
+                              <781250>;
+      };
+
+      opp-855000000 {
+              opp-hz = /bits/ 64 <855000000>;
+              opp-hz-real = /bits/ 64 <855000000>,
+                            /bits/ 64 <855000000>;
+              opp-microvolt = <793750>,
+                              <793750>;
+      };
+
+      opp-902000000 {
+              opp-hz = /bits/ 64 <902000000>;
+              opp-hz-real = /bits/ 64 <902000000>,
+                            /bits/ 64 <902000000>;
+              opp-microvolt = <818750>,
+                              <818750>;
+      };
+
+      opp-950000000 {
+              opp-hz = /bits/ 64 <950000000>;
+              opp-hz-real = /bits/ 64 <950000000>,
+                            /bits/ 64 <950000000>;
+              opp-microvolt = <843750>,
+                              <843750>;
+      };
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
