Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1104C47420
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:32:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53267206B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQpuWVaT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cYLZjE1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53267206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NkXqinAKUNXl3F5BoU0TONCUtuYjpnw+vq4+sPYp0yE=; b=CQpuWVaTtevcp/lM8wVqhnvfs
	j7osJy9ztilwYCzBX36rdkvdjYGwo5ve2cxBOv+VXvqNF2+cKjRTXh0fwkxS5eX4yEAfixfMuW2Ld
	344VCimLeTWEgB6d4zFZAZ7op0DxGc4Lj+rp1AuOpt6x4hOAeAlpbVktotPbMQHw+xQaNbAat65u/
	GdMBA8mL+nKGtE6WFu5gMUASWmbSBlm6HOEplBV/BsVr3tXc/uiDrsWeJbTRRVTYu7iJO2a2JdaDh
	2qTv0mI1t2f9M0fa7af/5CHBGV0qxVdPEzXZDtgfaNVmLZB639z/VqiYt8avXvLudNNOmyAhwQLeA
	v6YwwEEHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXXU-0003XJ-3Y; Wed, 30 Sep 2020 08:32:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXX2-0003G4-Ek; Wed, 30 Sep 2020 08:32:15 +0000
X-UUID: b7cb3f464f7640ae87d32237f384636a-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JwkyIqr7ujDIvydGAxgbxqOCED3M58ga4ObpqGk7sCQ=; 
 b=cYLZjE1Yc36Cq3i3L+9nGqC76EAzQVP32GIii5h2GUc4oG/MtSCIMyWeRtw6nhMsvnzbM6Xpn2wg1Ht6Kml3p1G4pfsw4KPw/RFJJ6T+5ijxRPLqRMwR5ZXyK3Bvp12aqF57qzAYf6FvZa3AC9tKdEJ2jn/b+aHYwJGnvq/k8vI=;
X-UUID: b7cb3f464f7640ae87d32237f384636a-20200930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 869983212; Wed, 30 Sep 2020 00:32:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 01:31:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 16:31:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 16:31:21 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: mmc: Convert mtk-sd to json-schema
Date: Wed, 30 Sep 2020 16:31:17 +0800
Message-ID: <20200930083120.11971-2-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930083120.11971-1-wenbin.mei@mediatek.com>
References: <20200930083120.11971-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043212_734522_E80A9D4A 
X-CRM114-Status: GOOD (  20.94  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the mtk-sd binding to DT schema format using json-schema.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 .../devicetree/bindings/mmc/mtk-sd.txt        |  75 --------
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 168 ++++++++++++++++++
 2 files changed, 168 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
deleted file mode 100644
index 26a8f320a156..000000000000
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-* MTK MMC controller
-
-The MTK  MSDC can act as a MMC controller
-to support MMC, SD, and SDIO types of memory cards.
-
-This file documents differences between the core properties in mmc.txt
-and the properties used by the msdc driver.
-
-Required properties:
-- compatible: value should be either of the following.
-	"mediatek,mt8135-mmc": for mmc host ip compatible with mt8135
-	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
-	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
-	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
-	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
-	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
-	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
-	"mediatek,mt7622-mmc": for MT7622 SoC
-	"mediatek,mt7623-mmc", "mediatek,mt2701-mmc": for MT7623 SoC
-	"mediatek,mt7620-mmc", for MT7621 SoC (and others)
-
-- reg: physical base address of the controller and length
-- interrupts: Should contain MSDC interrupt number
-- clocks: Should contain phandle for the clock feeding the MMC controller
-- clock-names: Should contain the following:
-	"source" - source clock (required)
-	"hclk" - HCLK which used for host (required)
-	"source_cg" - independent source clock gate (required for MT2712)
-	"bus_clk" - bus clock used for internal register access (required for MT2712 MSDC0/3)
-- pinctrl-names: should be "default", "state_uhs"
-- pinctrl-0: should contain default/high speed pin ctrl
-- pinctrl-1: should contain uhs mode pin ctrl
-- vmmc-supply: power to the Core
-- vqmmc-supply: power to the IO
-
-Optional properties:
-- assigned-clocks: PLL of the source clock
-- assigned-clock-parents: parent of source clock, used for HS400 mode to get 400Mhz source clock
-- hs400-ds-delay: HS400 DS delay setting
-- mediatek,hs200-cmd-int-delay: HS200 command internal delay setting.
-				This field has total 32 stages.
-				The value is an integer from 0 to 31.
-- mediatek,hs400-cmd-int-delay: HS400 command internal delay setting
-				This field has total 32 stages.
-				The value is an integer from 0 to 31.
-- mediatek,hs400-cmd-resp-sel-rising:  HS400 command response sample selection
-				       If present,HS400 command responses are sampled on rising edges.
-				       If not present,HS400 command responses are sampled on falling edges.
-- mediatek,latch-ck: Some SoCs do not support enhance_rx, need set correct latch-ck to avoid data crc
-		     error caused by stop clock(fifo full)
-		     Valid range = [0:0x7]. if not present, default value is 0.
-		     applied to compatible "mediatek,mt2701-mmc".
-- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
-- reset-names: Should be "hrst".
-
-Examples:
-mmc0: mmc@11230000 {
-	compatible = "mediatek,mt8173-mmc", "mediatek,mt8135-mmc";
-	reg = <0 0x11230000 0 0x108>;
-	interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
-	vmmc-supply = <&mt6397_vemc_3v3_reg>;
-	vqmmc-supply = <&mt6397_vio18_reg>;
-	clocks = <&pericfg CLK_PERI_MSDC30_0>,
-	         <&topckgen CLK_TOP_MSDC50_0_H_SEL>;
-	clock-names = "source", "hclk";
-	pinctrl-names = "default", "state_uhs";
-	pinctrl-0 = <&mmc0_pins_default>;
-	pinctrl-1 = <&mmc0_pins_uhs>;
-	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
-	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
-	hs400-ds-delay = <0x14015>;
-	mediatek,hs200-cmd-int-delay = <26>;
-	mediatek,hs400-cmd-int-delay = <14>;
-	mediatek,hs400-cmd-resp-sel-rising;
-};
diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
new file mode 100644
index 000000000000..7f89cbdc52a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MTK MSDC Storage Host Controller Binding
+
+maintainers:
+  - Chaotian Jing <chaotian.jing@mediatek.com>
+  - Wenbin Mei <wenbin.mei@mediatek.com>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+        - mediatek,mt2701-mmc
+        - mediatek,mt2712-mmc
+        - mediatek,mt6779-mmc
+        - mediatek,mt7620-mmc
+        - mediatek,mt7622-mmc
+        - mediatek,mt8135-mmc
+        - mediatek,mt8173-mmc
+        - mediatek,mt8183-mmc
+        - mediatek,mt8516-mmc
+      - items:
+        - const: mediatek,mt7623-mmc
+        - const: mediatek,mt2701-mmc
+
+  clocks:
+    description:
+      Should contain phandle for the clock feeding the MMC controller.
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: source clock (required).
+      - description: HCLK which used for host (required).
+      - description: independent source clock gate (required for MT2712).
+      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
+
+  clock-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      - const: source
+      - const: hclk
+      - const: source_cg
+      - const: bus_clk
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: state_uhs
+
+  pinctrl-0:
+    description:
+      should contain default/high speed pin ctrl.
+    maxItems: 1
+
+  pinctrl-1:
+    description:
+      should contain uhs mode pin ctrl.
+    maxItems: 1
+
+  vmmc-supply:
+    description:
+      power to the Core.
+    maxItems: 1
+
+  vqmmc-supply:
+    description:
+      power to the IO.
+    maxItems: 1
+
+  assigned-clocks:
+    description:
+      PLL of the source clock.
+    maxItems: 1
+
+  assigned-clock-parents:
+    description:
+      parent of source clock, used for HS400 mode to get 400Mhz source clock.
+    maxItems: 1
+
+  hs400-ds-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      HS400 DS delay setting.
+    minimum: 0
+    maximum: 0xffffffff
+
+  mediatek,hs200-cmd-int-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      HS200 command internal delay setting.
+      This field has total 32 stages.
+      The value is an integer from 0 to 31.
+    minimum: 0
+    maximum: 31
+
+  mediatek,hs400-cmd-int-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      HS400 command internal delay setting.
+      This field has total 32 stages.
+      The value is an integer from 0 to 31.
+    minimum: 0
+    maximum: 31
+
+  mediatek,hs400-cmd-resp-sel-rising:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      HS400 command response sample selection.
+      If present, HS400 command responses are sampled on rising edges.
+      If not present, HS400 command responses are sampled on falling edges.
+
+  mediatek,latch-ck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some SoCs do not support enhance_rx, need set correct latch-ck to avoid
+      data crc error caused by stop clock(fifo full) Valid range = [0:0x7].
+      if not present, default value is 0.
+      applied to compatible "mediatek,mt2701-mmc".
+    minimum: 0
+    maximum: 7
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: hrst
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    mmc0: mmc@11230000 {
+        compatible = "mediatek,mt8173-mmc";
+        reg = <0x11230000 0x1000>;
+        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
+        vmmc-supply = <&mt6397_vemc_3v3_reg>;
+        vqmmc-supply = <&mt6397_vio18_reg>;
+        clocks = <&pericfg CLK_PERI_MSDC30_0>,
+                 <&topckgen CLK_TOP_MSDC50_0_H_SEL>;
+        clock-names = "source", "hclk";
+        pinctrl-names = "default", "state_uhs";
+        pinctrl-0 = <&mmc0_pins_default>;
+        pinctrl-1 = <&mmc0_pins_uhs>;
+        assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
+        hs400-ds-delay = <0x14015>;
+        mediatek,hs200-cmd-int-delay = <26>;
+        mediatek,hs400-cmd-int-delay = <14>;
+        mediatek,hs400-cmd-resp-sel-rising;
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
