Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEB7C27C78
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 02:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGM2xlUH+VnRPefY+jxFlDJ/PMiE4bAj+VUcZaPnKPw=; b=cBTBhQIoWRmu6eppod6z9kYSJk
	FUIaoQ+2wZV9mt3DfpmwQGT5Ma9Wj0S9vsZxnlhrzcgfCG8We4SVMLC/KdrJXCekcK323PN4r2RfF
	MQF8Jl/Z3xCcgNNkLxS7rYMpRtHVgXBtMkjICgT2TlChQtN9fvaZ1nCRzLN1pR7rwNWeAvl3PvwnW
	yHohBfAZuh9j3qXnblKrb8MvQHiWdgyCh3DkK9SKelFScOINGRiBwixJXbKKlr0M/uU/kJcFOx9mT
	edEjbGFxJWUyc31hFpUiSkiG7VIJI5Sl19NrA+LSBiknse3H6tpUUIksoi2F9Mh8qYs5G8Pv1Jn4R
	vi4FWzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHDZG-0000000AmX6-1bly;
	Wed, 12 Jun 2024 02:18:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHDZD-0000000AmVL-0nKa;
	Wed, 12 Jun 2024 02:18:28 +0000
X-UUID: 0bed9366286211efba8bfb22b0451c12-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WGM2xlUH+VnRPefY+jxFlDJ/PMiE4bAj+VUcZaPnKPw=;
	b=DHtYheX14FoBISjKEXMrw/1O9ZEmOyqXKoR2ArReHrTq6pieTur2lQTkwIzOlVpr466jQbf4w/acMUjy4mXSA/XFbCYbs8SvY6VcstkJGnYQkgeC4FWPCMKgVpiI3pGNZ7UbCb908clo7dHpJ2G/090vWeVOIbtRLLpxgK+ja1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:6a16f73c-e907-4fe6-9b4e-74d3f84365e5,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:bdc9e093-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0bed9366286211efba8bfb22b0451c12-20240611
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1605807287; Tue, 11 Jun 2024 19:18:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 19:18:20 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 10:18:18 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <10572168@qq.com>, <hverkuil-cisco@xs4all.nl>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/3] media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
Date: Wed, 12 Jun 2024 10:17:58 +0800
Message-ID: <20240612021800.19512-2-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612021800.19512-1-zhi.mao@mediatek.com>
References: <20240612021800.19512-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_191827_405645_BDE2D3A0 
X-CRM114-Status: GOOD (  13.78  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 .../bindings/media/i2c/galaxycore,gc08a3.yaml | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
new file mode 100644
index 000000000000..51b8ece09c72
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek Inc.
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
+description:
+  The gc08a3 is a raw image sensor with an MIPI CSI-2 image data
+  interface and CCI (I2C compatible) control bus. The output format
+  is raw Bayer.
+
+properties:
+  compatible:
+    const: galaxycore,gc08a3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dovdd-supply: true
+
+  avdd-supply: true
+
+  dvdd-supply: true
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the RESETB pin.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
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
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
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
+        sensor@31 {
+            compatible = "galaxycore,gc08a3";
+            reg = <0x31>;
+
+            clocks = <&gc08a3_clk>;
+
+            reset-gpios = <&pio 19 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&gc08a3_avdd>;
+            dovdd-supply = <&gc08a3_dovdd>;
+            dvdd-supply = <&gc08a3_dvdd>;
+
+            port {
+                sensor_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <336000000 207000000>;
+                    remote-endpoint = <&seninf_csi_port_0_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1


