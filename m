Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491B9C5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmj8YPmmqvqYG5v+SWsXq/apQfPyzcxQHhDN/sTXgcQ=; b=XSF1MtwM+7cHygHRsLNcxtcpyR
	kvYVT25U1mxX/mpRyJPIEuoLH28IGXU4PSUTXZK5vBLP6bPsg1zxlZg9/I60I1A24TOLUUTWTOIpR
	Wjq6pi6TkSCIcA78BJswj/XQ8LTAITctr95ytvcBYX2FJRLCr5TxkTH4ATcSV8803FSSYin1e2/s5
	6JHtGb0u3ZJ3xC2EbCwCxwb2tEtcgapzBk+16UuQRFuzNNjjOdZZf/yq/7XmDHTJ920RZ2lQdKZ+N
	pw9pWXi/iljd5JOqWRjwyn8AlsEo8aUiLdRqu+vdm96JMSAoB42wsJOnBh8oq44TB/olj8RiHNkMB
	zH5EZGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retMz-00000004R7L-2ClR;
	Tue, 27 Feb 2024 09:03:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retMu-00000004R2N-18B9;
	Tue, 27 Feb 2024 09:03:21 +0000
X-UUID: 07e7e732d54f11eeb017d5921c808e14-20240227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tmj8YPmmqvqYG5v+SWsXq/apQfPyzcxQHhDN/sTXgcQ=;
	b=WAFouEi6N11te0IuPXOLm7Qkrqqo6ImhICnKtq1D242RoaWBlb2dmarCmNDEuFetCup64fQY0hftU6hiXCydE550XhE72iU5tiZ2n6TA77NVTPD5typFHmA4nuSDAk8/kjTHdDoNIXHQawuA4wQS9Tx/sEExNuODCWDz/zsf8WY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:872f7d82-8ed1-4884-bd26-c0617c8f63e5,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:6f543d0,CLOUDID:b85ac58f-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 07e7e732d54f11eeb017d5921c808e14-20240227
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1076568858; Tue, 27 Feb 2024 02:03:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 27 Feb 2024 17:02:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 27 Feb 2024 17:02:36 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Yow-shin Liou
	<yow-shin.liou@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH 1/2] dt-bindings: usb: Add binding for TI USB8020B hub controller
Date: Tue, 27 Feb 2024 17:02:27 +0800
Message-ID: <20240227090228.22156-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_010320_415843_5C8A77EB 
X-CRM114-Status: GOOD (  15.55  )
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

The TI USB8020B is a USB 3.0 hub controller with 2 ports.

This initial version of the binding only describes USB related aspects
of the USB8020B, it does not cover the option of connecting the controller
as an i2c slave.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
new file mode 100644
index 000000000000..8ef117793e11
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI USB8020B USB 3.0 hub controller
+
+maintainers:
+  - Macpaul Lin <macpaul.lin@mediatek.com>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb451,8025
+      - usb451,8027
+
+  reg: true
+
+  reset-gpios:
+    items:
+      - description: GPIO specifier for GRST# pin.
+
+  vdd-supply:
+    description:
+      VDD power supply to the hub
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
+required:
+  - compatible
+  - reg
+  - peer-hub
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+          compatible = "usb451,8027";
+          reg = <1>;
+          peer-hub = <&hub_3_0>;
+          reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+          vdd-supply = <&usb_hub_fixed_3v3>;
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+          compatible = "usb451,8025";
+          reg = <2>;
+          peer-hub = <&hub_2_0>;
+          reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+          vdd-supply = <&usb_hub_fixed_3v3>;
+        };
+    };
-- 
2.18.0


