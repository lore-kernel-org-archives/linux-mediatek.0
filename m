Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D107C624B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npo17YZ27fotVhhzuQeyCvo86ZlC56RHG3gTlq+INPQ=; b=CfAt81eusa5ySszHJFY8zAVANH
	HsKeDvftIxpPCGOf0DaPawMtHS/tLrZ1vSJOQcDATwD+vA1MK8SJcQvCzKDa1avIJdjyfUrXfpLlk
	+1LRUDJYhXNu1GiuGrq8sFIeJZuSTC5LPIop4K8UDZoYl1GcEAhJYTcPoxMs7uAoUZ4YmgAWaodZi
	/ghxcuDIWooe/U3VW6LbM90lI1Y0gSrk5CZyL6isdN1x4rI5GB5izEtgYyetOUvfwcBDZ/h4bEuYv
	wvD1gwzTjRDBC1cOPWmdSZ0DlF4h42CQ1mt64hUYxKEJE6xJgalFxDCdhhB01/i4xiF/qtDU9EDJy
	OeNfpgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r68GC-004e2S-07;
	Thu, 23 Nov 2023 11:52:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r68G9-004dxO-2t;
	Thu, 23 Nov 2023 11:52:43 +0000
X-UUID: c8c8e5fe89f611ee9b7791016c24628a-20231123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=npo17YZ27fotVhhzuQeyCvo86ZlC56RHG3gTlq+INPQ=;
	b=RdNpGN3cVjL19hw91ecR3MEo7Lv99kDeLl4fIKLsU/3UL+CetE2fSTLrMJ3uqPRmWHxjBoCz2+hZj3riAqRztt9pVBqeLrBD3ri+Gh5kdXNx03MsvHUZ/Didk1etFTE3fe7wqiW+Kwrg41Wr6XerWnLYYKVo5porJAhT197qCiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:51098fc4-868b-490e-989f-6e72f1a233b6,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:c089bb95-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c8c8e5fe89f611ee9b7791016c24628a-20231123
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 661053857; Thu, 23 Nov 2023 04:52:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 23 Nov 2023 19:52:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 23 Nov 2023 19:52:27 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<10572168@qq.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yunkec@chromium.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<sakari.ailus@linux.intel.com>, <zhi.mao@mediatek.com>,
	<hverkuil-cisco@xs4all.nl>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
	<macromorgan@hotmail.com>, <linus.walleij@linaro.org>,
	<laurent.pinchart@ideasonboard.com>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] media: dt-bindings: media: i2c: Document GC08A3 bindings
Date: Thu, 23 Nov 2023 19:51:03 +0800
Message-ID: <20231123115104.32094-2-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123115104.32094-1-zhi.mao@mediatek.com>
References: <20231123115104.32094-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_035241_949726_85ACE99F 
X-CRM114-Status: GOOD (  14.64  )
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

Add YAML device tree binding for GC08A3 CMOS image sensor, 
and the relevant MAINTAINERS entries.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 .../bindings/media/i2c/galaxycore,gc08a3.yaml | 128 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
new file mode 100644
index 000000000000..089ea321da91
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc08a3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GalaxyCore gc08a3 1/4" 8M Pixel MIPI CSI-2 sensor
+
+maintainers:
+  - Zhi Mao <zhi.mao@mediatek.com>
+
+description: |-
+  The gc08a3 is a raw image sensor with an MIPI CSI-2 image data
+  interface and CCI (I2C compatible) control bus. The output format
+  is raw Bayer.
+
+properties:
+  compatible:
+    const: GalaxyCore,gc08a3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference to the mclk clock.
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  enable-gpios:
+    description: Reference to the GPIO connected to the RESETB pin. Active low.
+    maxItems: 1
+
+  vddio-supply:
+    description: Definition of the regulator used for the VDDIO power supply.
+
+  vdda-supply:
+    description: Definition of the regulator used for the VDDA power supply.
+
+  vddd-supply:
+    description: Definition of the regulator used for the VDDD power supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - assigned-clocks
+  - assigned-clock-rates
+  - vddio-supply
+  - vdda-supply
+  - vddd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor0@2 {
+            status = "okay";
+            compatible = "GalaxyCore,gc08a3";
+            reg = <0x31>;
+
+            clocks = <&topckgen CLK_TOP_CAMTG>,
+                <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
+            clock-names = "xvclk", "freq_mux";
+            clock-frequency = <24000000>;
+
+            assigned-clocks = <&topckgen CLK_TOP_CAMTG>,
+                    <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
+            assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
+            assigned-clock-rates = <0>, <24000000>;
+
+            enable-gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&camera_pins_cam0>;
+
+            avdd-supply = <&mt6359_vfe28_ldo_reg>;
+
+            port {
+                sensor0_out_2: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <336000000 207000000>;
+                    remote-endpoint = <&seninf_csi_port_0_in_2>;
+                };
+            };
+        };
+
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..a0bbec0bfee2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -502,6 +502,8 @@ patternProperties:
     description: Fujitsu Ltd.
   "^fxtec,.*":
     description: FX Technology Ltd.
+  "^GalaxyCore,.*":
+    description: GalaxyCore Inc.
   "^gardena,.*":
     description: GARDENA GmbH
   "^gateway,.*":
-- 
2.25.1


