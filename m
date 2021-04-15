Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE3DC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E9261454
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E9261454
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LEOzUKSscR1BB3m+/xhKVEswieRHIRtmsuK+mBgvmg8=; b=DIEzNS/LDkHItp/YcvZ5Jw/4v
	zSqBR1fYo+kIJ6wyQeRhmcNSF05FDOSbd3TaeYd/J6NCmCPAKvl/BUMogAV90Lb0+0C0wSPq76ut6
	KcnH5CxyGk4rNmV0n+WQ1jEf+qwNb6QwNGxTgsIhsUYTIQ7nOep8TEkXf/j6TvEp+y+ll/Q86rmGK
	iXKB6Q9/IqzwTWYXKEvOcfq/GJmBIMiQs1JplTgqunq1b8oV5gTIag3BOvW3lzaXUyYwGRZK4mK32
	+IXykH1CpeJGWCqZts2QbfuiucqcLQSc7laCyzmNlsv4U1Hq2A5Xo7UBq3TrCmbbW8QmObVFdwgUt
	yNE44iQJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWv4W-00EzAC-VM; Thu, 15 Apr 2021 06:01:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4I-00Ez6v-5S; Thu, 15 Apr 2021 06:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=lUe8WjCAOheJ5zBOd53zPsJTwAv3F/ttoZKj9Xta0Q8=; b=vLCSdLY8mAC3YEy1WOONKYE3kI
 9L/6ZTBbcHTkcoWxdX6K7JkWSfnaK8qvBqmVzE/DcXhutFnKKOFzGmhg7vRE0eIYKFqCaIvEa3V4a
 j8msPBrC1CLnMal7kRfYz6+Ws5+MqZy6EZQRzmjWZ9iiOwBXk58OnwKUr4hOhVCUbImaegvocTTv5
 NNnyr+82FtlyVn0D1TT/Wohh+FQ7lSa8mKw1zrOwe30BySULaUwJNCveCnkD6PEj7zk4zeXb4rc7S
 tlKibdIkcex9bzvbz5QKNcQBJWNZtaiUqXRb1xxu2Bp6dYXuKMVVIhcvSLAsBMG3rVj8pw6hzoYaQ
 H+gBQy0Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4F-008IO8-9W; Thu, 15 Apr 2021 06:01:32 +0000
X-UUID: 936612a1d5004f23b632ac3bbe18757d-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lUe8WjCAOheJ5zBOd53zPsJTwAv3F/ttoZKj9Xta0Q8=; 
 b=bCNPu75p3+hbYRj19B6vE3zn6HNLRqGFjrcQLDeLHdhAC+6GrBfZmdHtSO+HUtKSTbsL4kp4eHz420zvDbE0vvaDwVjgNxluH1Zng6BM+sSEUWQrNUeBRlo+iWzZKR0X5mjKoo4i4SNOov+2EBrhSyjOxYl8zAgBd3PMMLRd8JE=;
X-UUID: 936612a1d5004f23b632ac3bbe18757d-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 588510227; Wed, 14 Apr 2021 23:01:27 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:51 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 4/7] dt-bindings: soc: mediatek: apusys: Add new document
 for APU power domain
Date: Thu, 15 Apr 2021 13:52:37 +0800
Message-ID: <1618465960-3013-5-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_230131_367171_CC268B46 
X-CRM114-Status: GOOD (  15.56  )
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

Document the bindings for APU power domain on MediaTek SoC.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
Note:
This patch depends on MT8192 clock[1] patches which haven't yet been accepted.
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210324104110.13383-7-chun-jie.chen@mediatek.com/
---
 .../soc/mediatek/mediatek,apu-pm.yaml         | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
new file mode 100644
index 000000000000..6ff966920917
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek APU Power Domains
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+description: |
+  Mediatek AI Process Unit (APU) include support for power domains which can be
+  powered up/down by software.
+  APU subsys belonging to a power domain should contain a 'power-domains'
+  property that is a phandle for apuspm node representing the domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apu-pm
+      - const: syscon
+
+  reg:
+    description: Address range of the APU power domain controller.
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#power-domain-cells':
+    const: 1
+
+  vsram-supply:
+    description: apu sram regulator supply.
+
+  mediatek,scpsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys register range.
+
+  mediatek,apu-conn:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys apu conn register range.
+
+  mediatek,apu-conn1:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys apu conn1 register range.
+
+  mediatek,apu-vcore:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys apu vcore register range.
+
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+    description: |
+      Represents the power domains within the power controller node as
+      documented in Documentation/devicetree/bindings/power/power-domain.yaml.
+
+    properties:
+      reg:
+        description: |
+          Power domain index. Valid values are defined in:
+          "include/dt-bindings/power/mt8182-apu-power.h"
+        maxItems: 1
+
+      '#power-domain-cells':
+        description: |
+          Must be 0 for nodes representing a single PM domain and 1 for nodes
+          providing multiple PM.
+
+      clocks:
+        description: |
+          List of phandles of clocks list. Specify by order according to
+          power-up sequence.
+
+      clock-names:
+        description: |
+          List of names of clocks. Specify by order according to power-up
+          sequence.
+
+      assigned-clocks:
+        maxItems: 2
+
+      assigned-clock-parents:
+        maxItems: 2
+
+      domain-supply:
+        description: domain regulator supply.
+
+    required:
+      - reg
+      - '#power-domain-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#power-domain-cells'
+  - vsram-supply
+  - mediatek,scpsys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    apuspm: power-domain@190f0000 {
+        compatible = "mediatek,mt8192-apu-pm", "syscon";
+        reg = <0x190f0000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #power-domain-cells = <1>;
+        vsram-supply = <&mt6359_vsram_md_ldo_reg>;
+        mediatek,scpsys = <&scpsys>;
+        mediatek,apu-conn = <&apu_conn>;
+        mediatek,apu-vcore = <&apu_vcore>;
+
+        apu_top: power-domain@0 {
+            reg = <0>;
+            #power-domain-cells = <0>;
+            clocks = <&topckgen CLK_TOP_DSP_SEL>,
+                     <&topckgen CLK_TOP_IPU_IF_SEL>,
+                     <&clk26m>,
+                     <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
+            clock-names = "clk_top_conn",
+                          "clk_top_ipu_if",
+                          "clk_off",
+                          "clk_on_default";
+            assigned-clocks = <&topckgen CLK_TOP_DSP_SEL>,
+                              <&topckgen CLK_TOP_IPU_IF_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+                                     <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
+            domain-supply = <&mt6359_vproc1_buck_reg>;
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
