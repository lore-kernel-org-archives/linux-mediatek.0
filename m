Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voSevi6NX/SLvI/d1P2+13Eyutgwo4QzBkkfNf3muFs=; b=VRLUjOdB+QAHA6
	ePKvU3CSSp1YuonI4SNYpNaYxcJ9m3+DN2PeG4tcz1yFbgKGjSqRaBc/BkLz7Ils1bTM1SqXrOhqK
	EXBIZZaWtePWQQ5RrCNI5DiP+ElrvXndypZo7ZVXXMQlpdKxvK/uMI7zGMKZAgMkrtDMDbv5fnpEI
	Vqsy8X+90pt5ninvtNBtMLjbJTuY+LjcgkIyImvoCf3QP/AQ1SRex23z5x6erhgNA95p2Njx6uxd6
	x7QmmCIrd1xRGH5X4k2+IlNs2HUB1uiSOF33pwB7xQnmZ3V5xs9JXmfHqF6h36xCu4zzSphFYw4w8
	JRAS5kwtg0Z+sDuoO3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjqA-002twz-0A; Fri, 10 Dec 2021 17:37:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjpM-002tg3-Kk; Fri, 10 Dec 2021 17:37:02 +0000
X-UUID: 3249f1c2e4e44e829c7cf56faa67b0d6-20211210
X-UUID: 3249f1c2e4e44e829c7cf56faa67b0d6-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1875880072; Fri, 10 Dec 2021 10:36:55 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:38 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 03/17] dt-bindings: remoteproc: mediatek: Add APU rproc
 compatible
Date: Sat, 11 Dec 2021 01:25:51 +0800
Message-ID: <20211210172605.30618-4-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_093700_711846_65A3A803 
X-CRM114-Status: GOOD (  14.28  )
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

Add new binding document for the APU remote processor.
The initial version is used for MT8192 SOC.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../bindings/remoteproc/mediatek,apu-rv.yaml  | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml
new file mode 100644
index 000000000000..c390b85040eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 (C) MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mediatek,apu-rv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU remote processor controller bindings
+
+description: |
+  APU integrated subsystem having MD32RV33 (MD32) that runs tinysys.
+  The tinysys runs on a microprocessor in APU.
+  Its firmware is loaded and booted from Kernel side.
+  Kernel and tinysys uses IPI to send and receive messages.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+  - Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apusys-rv
+      - const: simple-mfd
+
+  reg:
+    minItems: 1
+
+  reg-names:
+    minItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  interrupts:
+    description: List of interrupts.
+
+  interrupt-names:
+    description: Name list of interrupts.
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - interrupts
+  - mboxes
+
+additionalProperties:
+  type: object
+  description:
+    Represent subnodes that will register as rpmsg devices.
+  properties:
+    compatible:
+      enum:
+        - mediatek,apu-ctrl-rpmsg
+        - mediatek,apupwr-tx-rpmsg
+        - mediatek,apupwr-rx-rpmsg
+        - mediatek,apu-mdw-rpmsg
+    mediatek,rpmsg-name:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        Contains the name for the rpmsg device. Used to match
+        the subnode to rpmsg device announced by APU.
+  required:
+    - compatible
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+
+    apusys_rv@19001000 {
+      compatible = "mediatek,mt8192-apusys-rv", "simple-mfd";
+      reg = <0x19001000 0x1000>;
+      reg-names = "md32_sysctrl";
+      power-domains = <&apuspm 0>;
+      iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+      interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>;
+      interrupt-names = "apu_wdt";
+      mboxes = <&apu_mailbox 0>;
+      apu_ctrl {
+        compatible = "mediatek,apu-ctrl-rpmsg";
+        mediatek,rpmsg-name = "apu-ctrl-rpmsg";
+      };
+      apu_pwr_tx {
+        compatible = "mediatek,apupwr-tx-rpmsg";
+        mediatek,rpmsg-name = "apupwr-tx-rpmsg";
+      };
+      apu_pwr_rx {
+        compatible = "mediatek,apupwr-rx-rpmsg";
+        mediatek,rpmsg-name = "apupwr-rx-rpmsg";
+      };
+      apu_mdw_rpmsg {
+        compatible = "mediatek,apu-mdw-rpmsg";
+        mediatek,rpmsg-name = "apu-mdw-rpmsg";
+      };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
