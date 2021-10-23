Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CABC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498A260FDC
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 498A260FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+OB63tO/6LuX2Lw7a/QM6VSfx/rlj5jklrNuL9gDWQ=; b=Yun2F4GtQ1XuO/
	2w9fKuRx/amQhSF3RSpMRVXQjgzGt3OeaX9mmtedDkBv1S8yRPuv2bxbkCJIZGVzTsUlKMJo6FQ2C
	Admnr5T1mYXsAjyr7nVeZt9mOO/yN5qOTjpa3WzY4b1SZJtb1Grg7GuFAuYejN2TiUGRTN3V8b5up
	74ioNYbr5j+pg3ooWeg6rwQgg9wJChWeDBAkT7PkD7+xmAQlhWoSDYY0X4xS6fCPhEtpKWAW8YiJk
	uX0sYhPhvHXmZNjF1U5kDSiUqTOQ48ZMqsuOAK5Iy7rK6I1bAym+owB/514KaypUPl06aVj6rcphW
	eajZkxpRc5um9OgbmiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meEzZ-00CcT5-03; Sat, 23 Oct 2021 11:15:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meEzH-00CcLE-V2; Sat, 23 Oct 2021 11:14:57 +0000
X-UUID: 28f0ac0489f1434c9a70966f9b1d9e50-20211023
X-UUID: 28f0ac0489f1434c9a70966f9b1d9e50-20211023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1709543178; Sat, 23 Oct 2021 04:14:54 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 04:14:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:14:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:51 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 03/13] dt-bindings: soc: mediatek: apusys: Add new document for
 APU tinysys
Date: Sat, 23 Oct 2021 19:13:59 +0800
Message-ID: <20211023111409.30463-4-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_041456_031537_2E6E9610 
X-CRM114-Status: GOOD (  14.42  )
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

Add new document for APU tinysys.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 .../soc/mediatek/mediatek,apu-rv.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml
new file mode 100644
index 000000000000..ee0ff5d656e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/mediatek,apu-rv.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek APU Power
+
+description: |
+  APU integrated subsystem having MD32RV33 (MD32) that runs tinysys
+  The tinsys is running on a micro processor in APU.
+  Its firmware is load and boot from Kernel side. Kernel and tinysys use
+  IPI to tx/rx messages.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8192-apusys-rv
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
+  mediatek,apusys-power:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the apusys-power handle.
+
+  apu_ctrl:
+    description: handle the ipi state, time sync and deep idle message.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apu-ctrl-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  apu_pwr_tx:
+    description: handle the message trigger from AP side to tinysys.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apupwr-tx-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  apu_pwr_rx:
+    description: handle the message trigger from tinysys to AP side.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apupwr-rx-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  apu_mdw_rpmsg:
+    description: handle the middleware messages.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apu-mdw-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - interrupts
+  - mediatek,apusys-power
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+
+    apusys_rv@19001000 {
+      compatible = "mediatek,mt8192-apusys-rv";
+      reg = <0x19000000 0x1000>,
+            <0x19001000 0x1000>;
+      reg-names = "apu_mbox",
+                  "md32_sysctrl";
+      mediatek,apusys-power = <&apusys_power>;
+      power-domains = <&apuspm 0>;
+      iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+      interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
+      interrupt-names = "apu_wdt",
+                        "mbox0_irq";
+      apu_ctrl {
+        compatible = "mediatek,apu-ctrl-rpmsg";
+      };
+      apu_pwr_tx {
+        compatible = "mediatek,apupwr-tx-rpmsg";
+      };
+      apu_pwr_rx {
+        compatible = "mediatek,apupwr-rx-rpmsg";
+      };
+      apu_mdw_rpmsg {
+        compatible = "mediatek,apu-mdw-rpmsg";
+      };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
