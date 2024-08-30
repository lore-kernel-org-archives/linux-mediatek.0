Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97701CA0FE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAwkqjTpFxpk5xS+tDznK7/xN7La1ng329AG8HtDRLk=; b=rCUdJyT1m4YuAbuUbCFoCBGSa4
	7AoqsQ2Vaq6Jn2AuF+cwp9aRgCk00D3DKLKfvVlgicEhznG5VKIh0UL0YdxykLFXSgmBiP3Mz1m6b
	iov3LLNEyiT7s3rAetiulQcDf6IvQ4z9UsZYE/kW7PAiBMxow8r7vJq7sm0mpT73A84obc5InH5w+
	CuqYlHbYxEhjgQvz1EhMZdf0EPGB7PIIOajyXcYGK/1tlH56SScdnSUB3+UBmXs8V2d0KqIQ44Lho
	AIxLmrvXB84Kf2DLRhEUYLg1aABGYRmRGB688P5ME45HkO92Lfq1yzjX2auIymX5ixWBIDiR8sy3x
	7k9IgfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzY4-00000005zhW-0siM;
	Fri, 30 Aug 2024 11:12:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzUa-00000005yYQ-3W0d;
	Fri, 30 Aug 2024 11:08:40 +0000
X-UUID: 30ee391c66c011efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KAwkqjTpFxpk5xS+tDznK7/xN7La1ng329AG8HtDRLk=;
	b=CSk5/++E47CeTgzj5B+GGIjb0p5N1MpWeWMEfyPirfvAVkIYSev1d27dUCqYMLAG3EfKE50Rg6UwlOrMMAcEedAGBWLkJkRBJZuicNGdK2kkXnOptFlI8NlYcGYytLfOQqULOD9Xd8V5RRXquVHE6hupc6+gLdHSTNEf+doBrkU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:0f6b1d2e-1493-4d8f-bfe3-5aefa5685333,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:69840d15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 30ee391c66c011efb3adad29d29602c1-20240830
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1741021600; Fri, 30 Aug 2024 04:08:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 19:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 19:08:28 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek
	<pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, Lee Jones
	<lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu
	<flora.fu@mediatek.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 2/7] dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format
Date: Fri, 30 Aug 2024 19:07:27 +0800
Message-ID: <20240830110732.30080-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_040836_955744_00DFDB83 
X-CRM114-Status: GOOD (  23.57  )
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

Convert the mfd: mediatek: mt6397 binding to DT schema format.

MT6323/MT6358/MT6397 are PMIC devices with multiple function of
subdevices. They have some variant of the combinations of subdevices
but share a common PMIC design.

New updates in this conversion:
 - RTC:
  - Convert rtc-mt6397.txt and add it into parent's mt6397 PMIC DT schema.
 - regulators:
  - Align generic names "regulators" instead of origin names.
  - mt6323-regulator: Replace "txt" reference with mt6323-regulaotr.yaml
  - mt6358-regulator: Replace "txt" reference with mt6358-regulator.yaml
  - mt6397-regulator: Replace "txt" reference with mt6397-reuglator.yaml
 - audio-codec:
  - Align generic name "audio-codec" for codec and sound subdevices.
  - Add "mediatek,dmic-mode" and "Avdd-supply".
 - clocks:
  - Align generic name "clocks" for clockbuffer subdevices.
 - leds:
  - Convert leds-mt6323.txt and add it into parent's mt6397 PMIC DT schema.
 - keys:
  - Add more specific descriptions for power and home keys.
  - Add compatible: mediatek,mt6358-keys
 - power-controller:
  - Add property #power-domain-cells for fixing dt-binding check error.
  - Add "Baseband power up" as the explaination of abbrevitation "BBPU".
 - pinctrl:
  - Align generic name "pinctrl" instead of "pin-controller".

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 1026 +++++++++++++++++
 .../devicetree/bindings/mfd/mt6397.txt        |  110 --
 2 files changed, 1026 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt

Changes for v1:
 - This patch depends on conversion of mediatek,mt6397-regulator.yaml
   [1] https://lore.kernel.org/lkml/20240807091738.18387-1-macpaul.lin@mediatek.com/T/

Changes for v2:
 - This patch has been made base on linux-next/master git repo.
 - Keep the parent and child relationship with mediatek,pwrap in description.
   [2] https://lore.kernel.org/all/20240826-slurp-earphone-0d5173923ae8@spud/
 - Keep the $ref for regulators since dt_binding_check didn't report any issue
   based on linux-next/master repo.  
 - Fix description of mt6397/mt6323 devices, use "power management chip"
   instead of "multifunction device"
 - Drop unnecessary comments or description according to the review.
 - Convert sub-modules to DT Schema:
  - RTC, LEDs, power-controllers, regulators
 - Drop duplicate sub node name and description for sub-modules
  - RTC, Keys
 - examples: 
  - drop parent pwrap node
  - Add examples from mediatek,mt6323-regulator.yaml
  - Add examples from mediatek,mt6358-regulator.yaml
  - Add examples from mediatek,mt6397-regulator.yaml
  - Complete the examples as could as possible.

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
new file mode 100644
index 0000000..f5bea33
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -0,0 +1,1026 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6397/MT6323 Multifunction Device (PMIC)
+
+maintainers:
+  - Sen Chu <sen.chu@mediatek.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
+
+description: |
+  MT6397/MT6323 is a power management system chip.
+  Please see the sub-modules below for supported features.
+
+  MT6397/MT6323 is a multifunction device with the following sub modules:
+  - Regulators
+  - RTC
+  - Audio codec
+  - GPIO
+  - Clock
+  - LED
+  - Keys
+  - Power controller
+
+  It is interfaced to host controller using SPI interface by a proprietary hardware
+  called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of pwrap.
+  See the following for pwrap node definitions:
+  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt6323
+          - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
+          - mediatek,mt6357
+          - mediatek,mt6358
+          - mediatek,mt6359
+          - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6366
+          - const: mediatek,mt6358
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    description:
+      MT6397 Real Time Clock.
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-rtc
+              - mediatek,mt6331-rtc
+              - mediatek,mt6358-rtc
+              - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6366-rtc
+              - const: mediatek,mt6358-rtc
+      start-year: true
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    oneOf:
+      - $ref: /schemas/regulator/mediatek,mt6323-regulator.yaml
+      - $ref: /schemas/regulator/mediatek,mt6358-regulator.yaml
+      - $ref: /schemas/regulator/mediatek,mt6397-regulator.yaml
+    unevaluatedProperties: false
+    description:
+      List of child nodes that specify the regulators.
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-regulator
+              - mediatek,mt6358-regulator
+              - mediatek,mt6397-regulator
+          - items:
+              - enum:
+                  - mediatek,mt6366-regulator
+              - const: mediatek,mt6358-regulator
+
+  audio-codec:
+    type: object
+    additionalProperties: false
+    description:
+      Audio codec support with MT6397 and MT6358.
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6397-codec
+              - mediatek,mt6358-sound
+          - items:
+              - enum:
+                  - mediatek,mt6366-sound
+              - const: mediatek,mt6358-sound
+
+      mediatek,dmic-mode:
+        description: |
+          Indicates how many data pins are used to transmit two channels of PDM
+          signal.
+          0 - two wires;
+          1 - one wire;
+          Default value is 0.
+        enum: [0, 1]
+        default: 0
+
+      Avdd-supply:
+        description: Power source of AVDD.
+
+    required:
+      - compatible
+
+  clocks:
+    type: object
+    additionalProperties: false
+    description:
+      This is a clock buffer node for mt6397. However, there are no sub nodes
+      or any public document exposed in public.
+    properties:
+      compatible:
+        const: mediatek,mt6397-clk
+      '#clock-cells':
+        const: 1
+    required:
+      - compatible
+
+  leds:
+    type: object
+    additionalProperties: false
+    description:
+      MT6323 LED controller is subfunction provided by MT6323 PMIC, so the LED
+      controllers are defined as the subnode of the function node provided by MT6323
+      PMIC controller that is being defined as one kind of Muti-Function Device (MFD)
+      using shared bus called PMIC wrapper for each subfunction to access remote
+      MT6323 PMIC hardware.
+
+      Each led is represented as a child node of the mediatek,mt6323-led that
+      describes the initial behavior for each LED physically and currently only four
+      LED child nodes can be supported.
+
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-led
+              - mediatek,mt6331-led
+              - mediatek,mt6332-led
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+      reg:
+        description:
+          LED channel number (0..3)
+        minimum: 0
+        maximum: 3
+
+  keys:
+    type: object
+    $ref: /schemas/input/mediatek,pmic-keys.yaml
+    unevaluatedProperties: false
+    description:
+      Power and Home keys.
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-keys
+              - mediatek,mt6331-keys
+              - mediatek,mt6358-keys
+              - mediatek,mt6397-keys
+
+  power-controller:
+    type: object
+    additionalProperties: false
+    description:
+      The power controller which could be found on PMIC is responsible for
+      externally powering off or on the remote MediaTek SoC through the
+      circuit BBPU (baseband power up).
+    properties:
+      compatible:
+        const: mediatek,mt6323-pwrc
+      '#power-domain-cells':
+        const: 0
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
+    unevaluatedProperties: false
+    description:
+      Pin controller
+    properties:
+      compatible:
+        const: mediatek,mt6397-pinctrl
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mt6323_pmic: pmic {
+        compatible = "mediatek,mt6323";
+        interrupt-parent = <&pio>;
+        interrupts = <150 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mt6323_leds: leds {
+                compatible = "mediatek,mt6323-led";
+                #address-cells = <1>;
+                status = "disabled";
+        };
+
+        mt6323_regulator: regulators {
+            compatible = "mediatek,mt6323-regulator";
+            mt6323_vproc_reg: buck_vproc {
+                regulator-name = "vproc";
+                regulator-min-microvolt = < 700000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vsys_reg: buck_vsys {
+                regulator-name = "vsys";
+                regulator-min-microvolt = <1400000>;
+                regulator-max-microvolt = <2987500>;
+                regulator-ramp-delay = <25000>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vpa_reg: buck_vpa {
+                regulator-name = "vpa";
+                regulator-min-microvolt = < 500000>;
+                regulator-max-microvolt = <3650000>;
+            };
+
+            mt6323_vtcxo_reg: ldo_vtcxo {
+                regulator-name = "vtcxo";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <90>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vcn28_reg: ldo_vcn28 {
+                regulator-name = "vcn28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <185>;
+            };
+
+            mt6323_vcn33_bt_reg: ldo_vcn33_bt {
+                regulator-name = "vcn33_bt";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3600000>;
+                regulator-enable-ramp-delay = <185>;
+            };
+
+            mt6323_vcn33_wifi_reg: ldo_vcn33_wifi {
+                regulator-name = "vcn33_wifi";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3600000>;
+                regulator-enable-ramp-delay = <185>;
+            };
+
+            mt6323_va_reg: ldo_va {
+                regulator-name = "va";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vcama_reg: ldo_vcama {
+                regulator-name = "vcama";
+                regulator-min-microvolt = <1500000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vio28_reg: ldo_vio28 {
+                regulator-name = "vio28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vusb_reg: ldo_vusb {
+                regulator-name = "vusb";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-boot-on;
+            };
+
+            mt6323_vmc_reg: ldo_vmc {
+                regulator-name = "vmc";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+                regulator-boot-on;
+            };
+
+            mt6323_vmch_reg: ldo_vmch {
+                regulator-name = "vmch";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+                regulator-boot-on;
+            };
+
+            mt6323_vemc3v3_reg: ldo_vemc3v3 {
+                regulator-name = "vemc3v3";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+                regulator-boot-on;
+            };
+
+            mt6323_vgp1_reg: ldo_vgp1 {
+                regulator-name = "vgp1";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vgp2_reg: ldo_vgp2 {
+                regulator-name = "vgp2";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vgp3_reg: ldo_vgp3 {
+                regulator-name = "vgp3";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vcn18_reg: ldo_vcn18 {
+                regulator-name = "vcn18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vsim1_reg: ldo_vsim1 {
+                regulator-name = "vsim1";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vsim2_reg: ldo_vsim2 {
+                regulator-name = "vsim2";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vrtc_reg: ldo_vrtc {
+                regulator-name = "vrtc";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vcamaf_reg: ldo_vcamaf {
+                regulator-name = "vcamaf";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vibr_reg: ldo_vibr {
+                regulator-name = "vibr";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <36>;
+            };
+
+            mt6323_vrf18_reg: ldo_vrf18 {
+                regulator-name = "vrf18";
+                regulator-min-microvolt = <1825000>;
+                regulator-max-microvolt = <1825000>;
+                regulator-enable-ramp-delay = <187>;
+            };
+
+            mt6323_vm_reg: ldo_vm {
+                regulator-name = "vm";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vio18_reg: ldo_vio18 {
+                regulator-name = "vio18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+                regulator-always-on;
+                regulator-boot-on;
+            };
+
+            mt6323_vcamd_reg: ldo_vcamd {
+                regulator-name = "vcamd";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+
+            mt6323_vcamio_reg: ldo_vcamio {
+                regulator-name = "vcamio";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <216>;
+            };
+        };
+
+        mt6323_keys: keys {
+                compatible = "mediatek,mt6323-keys";
+                mediatek,long-press-mode = <1>;
+                power-off-time-sec = <0>;
+
+                power {
+                        linux,keycodes = <116>;
+                        wakeup-source;
+                };
+
+                home {
+                        linux,keycodes = <114>;
+                };
+        };
+
+        power-controller {
+            compatible = "mediatek,mt6323-pwrc";
+            #power-domain-cells = <0>;
+        };
+
+        rtc {
+            compatible = "mediatek,mt6323-rtc";
+        };
+    };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mt6358_pmic: pmic {
+        compatible = "mediatek,mt6358";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mt6358_codec: audio-codec {
+            compatible = "mediatek,mt6358-sound";
+            Avdd-supply = <&mt6358_vaud28_reg>;
+            mediatek,dmic-mode = <0>;
+        };
+
+        mt6358_regulator: regulators {
+            compatible = "mediatek,mt6358-regulator";
+
+            mt6358_vdram1_reg: buck_vdram1 {
+                regulator-name = "vdram1";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <2087500>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <0>;
+                regulator-always-on;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vcore_reg: buck_vcore {
+                regulator-name = "vcore";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <200>;
+                regulator-always-on;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vpa_reg: buck_vpa {
+                regulator-name = "vpa";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3650000>;
+                regulator-ramp-delay = <50000>;
+                regulator-enable-ramp-delay = <250>;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vproc11_reg: buck_vproc11 {
+                regulator-name = "vproc11";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <200>;
+                regulator-always-on;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vproc12_reg: buck_vproc12 {
+                regulator-name = "vproc12";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <200>;
+                regulator-always-on;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vgpu_reg: buck_vgpu {
+                regulator-name = "vgpu";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <200>;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vs2_reg: buck_vs2 {
+                regulator-name = "vs2";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <2087500>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <0>;
+                regulator-always-on;
+            };
+
+            mt6358_vmodem_reg: buck_vmodem {
+                regulator-name = "vmodem";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <900>;
+                regulator-always-on;
+                regulator-allowed-modes = <0 1>;
+            };
+
+            mt6358_vs1_reg: buck_vs1 {
+                regulator-name = "vs1";
+                regulator-min-microvolt = <1000000>;
+                regulator-max-microvolt = <2587500>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <0>;
+                regulator-always-on;
+            };
+
+            mt6358_vdram2_reg: ldo_vdram2 {
+                regulator-name = "vdram2";
+                regulator-min-microvolt = <600000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <3300>;
+            };
+
+            mt6358_vsim1_reg: ldo_vsim1 {
+                regulator-name = "vsim1";
+                regulator-min-microvolt = <1700000>;
+                regulator-max-microvolt = <3100000>;
+                regulator-enable-ramp-delay = <540>;
+            };
+
+            mt6358_vibr_reg: ldo_vibr {
+                regulator-name = "vibr";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <60>;
+            };
+
+            mt6358_vrf12_reg: ldo_vrf12 {
+                regulator-name = "vrf12";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1200000>;
+                regulator-enable-ramp-delay = <120>;
+            };
+
+            mt6358_vio18_reg: ldo_vio18 {
+                regulator-name = "vio18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <2700>;
+                regulator-always-on;
+            };
+
+            mt6358_vusb_reg: ldo_vusb {
+                regulator-name = "vusb";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3100000>;
+                regulator-enable-ramp-delay = <270>;
+                regulator-always-on;
+            };
+
+            mt6358_vcamio_reg: ldo_vcamio {
+                regulator-name = "vcamio";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <325>;
+            };
+
+            mt6358_vcamd_reg: ldo_vcamd {
+                regulator-name = "vcamd";
+                regulator-min-microvolt = <900000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <325>;
+            };
+
+            mt6358_vcn18_reg: ldo_vcn18 {
+                regulator-name = "vcn18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vfe28_reg: ldo_vfe28 {
+                regulator-name = "vfe28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vsram_proc11_reg: ldo_vsram_proc11 {
+                regulator-name = "vsram_proc11";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <240>;
+                regulator-always-on;
+            };
+
+            mt6358_vcn28_reg: ldo_vcn28 {
+                regulator-name = "vcn28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vsram_others_reg: ldo_vsram_others {
+                regulator-name = "vsram_others";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <240>;
+                regulator-always-on;
+            };
+
+            mt6358_vsram_gpu_reg: ldo_vsram_gpu {
+                regulator-name = "vsram_gpu";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <240>;
+            };
+
+            mt6358_vxo22_reg: ldo_vxo22 {
+                regulator-name = "vxo22";
+                regulator-min-microvolt = <2200000>;
+                regulator-max-microvolt = <2200000>;
+                regulator-enable-ramp-delay = <120>;
+                regulator-always-on;
+            };
+
+            mt6358_vefuse_reg: ldo_vefuse {
+                regulator-name = "vefuse";
+                regulator-min-microvolt = <1700000>;
+                regulator-max-microvolt = <1900000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vaux18_reg: ldo_vaux18 {
+                regulator-name = "vaux18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vmch_reg: ldo_vmch {
+                regulator-name = "vmch";
+                regulator-min-microvolt = <2900000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <60>;
+            };
+
+            mt6358_vbif28_reg: ldo_vbif28 {
+                regulator-name = "vbif28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vsram_proc12_reg: ldo_vsram_proc12 {
+                regulator-name = "vsram_proc12";
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1293750>;
+                regulator-ramp-delay = <6250>;
+                regulator-enable-ramp-delay = <240>;
+                regulator-always-on;
+            };
+
+            mt6358_vcama1_reg: ldo_vcama1 {
+                regulator-name = "vcama1";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <325>;
+            };
+
+            mt6358_vemc_reg: ldo_vemc {
+                regulator-name = "vemc";
+                regulator-min-microvolt = <2900000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <60>;
+            };
+
+            mt6358_vio28_reg: ldo_vio28 {
+                regulator-name = "vio28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_va12_reg: ldo_va12 {
+                regulator-name = "va12";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <1200000>;
+                regulator-enable-ramp-delay = <270>;
+                regulator-always-on;
+            };
+
+            mt6358_vrf18_reg: ldo_vrf18 {
+                regulator-name = "vrf18";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-enable-ramp-delay = <120>;
+            };
+
+            mt6358_vcn33_reg: ldo_vcn33 {
+                regulator-name = "vcn33";
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vcama2_reg: ldo_vcama2 {
+                regulator-name = "vcama2";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <325>;
+            };
+
+            mt6358_vmc_reg: ldo_vmc {
+                regulator-name = "vmc";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <60>;
+            };
+
+            mt6358_vldo28_reg: ldo_vldo28 {
+                regulator-name = "vldo28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vaud28_reg: ldo_vaud28 {
+                regulator-name = "vaud28";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <270>;
+            };
+
+            mt6358_vsim2_reg: ldo_vsim2 {
+                regulator-name = "vsim2";
+                regulator-min-microvolt = <1700000>;
+                regulator-max-microvolt = <3100000>;
+                regulator-enable-ramp-delay = <540>;
+            };
+        };
+
+        mt6358_rtc: rtc {
+            compatible = "mediatek,mt6358-rtc";
+        };
+
+        mt6358_keys: keys {
+            compatible = "mediatek,mt6358-keys";
+            power {
+                linux,keycodes = <KEY_POWER>;
+                wakeup-source;
+            };
+            home {
+                linux,keycodes = <KEY_HOME>;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mt6397_pmic: pmic {
+        compatible = "mediatek,mt6397";
+        interrupt-parent = <&pio>;
+        interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mt6397_codec: audio-codec {
+            compatible = "mediatek,mt6397-codec";
+        };
+
+        mt6397_clock: clocks {
+            compatible = "mediatek,mt6397-clk";
+            #clock-cells = <1>;
+        };
+
+        mt6397_pinctrl: pinctrl {
+            compatible = "mediatek,mt6397-pinctrl";
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+
+        mt6397_regulators: regulators {
+            compatible = "mediatek,mt6397-regulator";
+
+            mt6397_vpca15_reg: buck_vpca15 {
+                regulator-name = "vpca15";
+                regulator-min-microvolt = < 850000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <200>;
+            };
+
+            mt6397_vpca7_reg: buck_vpca7 {
+                regulator-name = "vpca7";
+                regulator-min-microvolt = < 850000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <115>;
+            };
+
+            mt6397_vsramca15_reg: buck_vsramca15 {
+                regulator-name = "vsramca15";
+                regulator-min-microvolt = < 850000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <115>;
+            };
+
+            mt6397_vsramca7_reg: buck_vsramca7 {
+                regulator-name = "vsramca7";
+                regulator-min-microvolt = < 850000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <115>;
+            };
+
+            mt6397_vcore_reg: buck_vcore {
+                regulator-name = "vcore";
+                regulator-min-microvolt = < 850000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <115>;
+            };
+
+            mt6397_vgpu_reg: buck_vgpu {
+                regulator-name = "vgpu";
+                regulator-min-microvolt = < 700000>;
+                regulator-max-microvolt = <1350000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <115>;
+            };
+
+            mt6397_vdrm_reg: buck_vdrm {
+                regulator-name = "vdrm";
+                regulator-min-microvolt = < 800000>;
+                regulator-max-microvolt = <1400000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <500>;
+            };
+
+            mt6397_vio18_reg: buck_vio18 {
+                regulator-name = "vio18";
+                regulator-min-microvolt = <1500000>;
+                regulator-max-microvolt = <2120000>;
+                regulator-ramp-delay = <12500>;
+                regulator-enable-ramp-delay = <500>;
+            };
+
+            mt6397_vtcxo_reg: ldo_vtcxo {
+                regulator-name = "vtcxo";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <90>;
+            };
+
+            mt6397_va28_reg: ldo_va28 {
+                regulator-name = "va28";
+                /* fixed output 2.8 V */
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vcama_reg: ldo_vcama {
+                regulator-name = "vcama";
+                regulator-min-microvolt = <1500000>;
+                regulator-max-microvolt = <2800000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vio28_reg: ldo_vio28 {
+                regulator-name = "vio28";
+                /* fixed output 2.8 V */
+                regulator-enable-ramp-delay = <240>;
+            };
+
+            mt6397_usb_reg: ldo_vusb {
+                regulator-name = "vusb";
+                /* fixed output 3.3 V */
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vmc_reg: ldo_vmc {
+                regulator-name = "vmc";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vmch_reg: ldo_vmch {
+                regulator-name = "vmch";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vemc_3v3_reg: ldo_vemc3v3 {
+                regulator-name = "vemc_3v3";
+                regulator-min-microvolt = <3000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vgp1_reg: ldo_vgp1 {
+                regulator-name = "vcamd";
+                regulator-min-microvolt = <1220000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <240>;
+            };
+
+            mt6397_vgp2_reg: ldo_vgp2 {
+                regulator-name = "vcamio";
+                regulator-min-microvolt = <1000000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vgp3_reg: ldo_vgp3 {
+                regulator-name = "vcamaf";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vgp4_reg: ldo_vgp4 {
+                regulator-name = "vgp4";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vgp5_reg: ldo_vgp5 {
+                regulator-name = "vgp5";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vgp6_reg: ldo_vgp6 {
+                regulator-name = "vgp6";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+
+            mt6397_vibr_reg: ldo_vibr {
+                regulator-name = "vibr";
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-enable-ramp-delay = <218>;
+            };
+        };
+
+        mt6397_rtc: rtc {
+            compatible = "mediatek,mt6397-rtc";
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
deleted file mode 100644
index 10540aa..0000000
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-MediaTek MT6397/MT6323 Multifunction Device Driver
-
-MT6397/MT6323 is a multifunction device with the following sub modules:
-- Regulator
-- RTC
-- Audio codec
-- GPIO
-- Clock
-- LED
-- Keys
-- Power controller
-
-It is interfaced to host controller using SPI interface by a proprietary hardware
-called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
-See the following for pwarp node definitions:
-../soc/mediatek/mediatek,pwrap.yaml
-
-This document describes the binding for MFD device and its sub module.
-
-Required properties:
-compatible:
-	"mediatek,mt6323" for PMIC MT6323
-	"mediatek,mt6331" for PMIC MT6331 and MT6332
-	"mediatek,mt6357" for PMIC MT6357
-	"mediatek,mt6358" for PMIC MT6358
-	"mediatek,mt6359" for PMIC MT6359
-	"mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
-	"mediatek,mt6397" for PMIC MT6397
-
-Optional subnodes:
-
-- rtc
-	Required properties: Should be one of follows
-		- compatible: "mediatek,mt6323-rtc"
-		- compatible: "mediatek,mt6331-rtc"
-		- compatible: "mediatek,mt6358-rtc"
-		- compatible: "mediatek,mt6397-rtc"
-	For details, see ../rtc/rtc-mt6397.txt
-- regulators
-	Required properties:
-		- compatible: "mediatek,mt6323-regulator"
-	see ../regulator/mt6323-regulator.txt
-		- compatible: "mediatek,mt6358-regulator"
-		- compatible: "mediatek,mt6366-regulator", "mediatek-mt6358-regulator"
-	see ../regulator/mt6358-regulator.txt
-		- compatible: "mediatek,mt6397-regulator"
-	see ../regulator/mt6397-regulator.txt
-- codec
-	Required properties:
-		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
-- clk
-	Required properties:
-		- compatible: "mediatek,mt6397-clk"
-- led
-	Required properties:
-		- compatible: "mediatek,mt6323-led"
-	see ../leds/leds-mt6323.txt
-
-- keys
-	Required properties: Should be one of the following
-		- compatible: "mediatek,mt6323-keys"
-		- compatible: "mediatek,mt6331-keys"
-		- compatible: "mediatek,mt6397-keys"
-	see ../input/mtk-pmic-keys.txt
-
-- power-controller
-	Required properties:
-		- compatible: "mediatek,mt6323-pwrc"
-	For details, see ../power/reset/mt6323-poweroff.txt
-
-- pin-controller
-	Required properties:
-		- compatible: "mediatek,mt6397-pinctrl"
-	For details, see ../pinctrl/pinctrl-mt65xx.txt
-
-Example:
-	pwrap: pwrap@1000f000 {
-		compatible = "mediatek,mt8135-pwrap";
-
-		...
-
-		pmic {
-			compatible = "mediatek,mt6397";
-
-			codec: mt6397codec {
-				compatible = "mediatek,mt6397-codec";
-			};
-
-			regulators {
-				compatible = "mediatek,mt6397-regulator";
-
-				mt6397_vpca15_reg: buck_vpca15 {
-					regulator-compatible = "buck_vpca15";
-					regulator-name = "vpca15";
-					regulator-min-microvolt = <850000>;
-					regulator-max-microvolt = <1400000>;
-					regulator-ramp-delay = <12500>;
-					regulator-always-on;
-				};
-
-				mt6397_vgp4_reg: ldo_vgp4 {
-					regulator-compatible = "ldo_vgp4";
-					regulator-name = "vgp4";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-enable-ramp-delay = <218>;
-				};
-			};
-		};
-	};
-- 
2.45.2


