Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DEEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms7l+f1aBYtKZlreosYjk8AhbttkmPQETu8VR7sMC44=; b=GGh/l2a2HheE+m
	BiU6aGlIFm/5CCE56uiqY1nfaFvHgoPfM/El4c/FrnABIU9moEdijClNVhubq3oIfEQ9hvS9aihuH
	yfu3ZH+mu0uATv6wr8a7IyFiN/tUtFojqHNDcUL4CQ0I+QcHgkjY0ir8+0CVlNIDlBIwaBRWrE1OM
	3hUmP8G1z1DTuyRhHjCX8ash6N/FQZKqZ6eP3EkKScaYXxoUZ7++xo/BKETNnMl0guS7AGEXfdgOC
	tumRpD3Z/Tp+fIvqQKHrREyNRDFvTovxcmaJJ4r6ULqrbUVepb4T/hlAdwDhaC3XVMNKgWobusaS8
	yfSpl7uqm6r3yuNz1/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAid-00B15v-GA; Fri, 04 Mar 2022 16:23:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAaW-00AxmH-VB
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 16:15:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j17so13493291wrc.0
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Mar 2022 08:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Nqj3Wj2afL4vH+AWQbMmnZZbmdqpSeJYR5BS2/Kv0Y=;
 b=OOS1o/jw7tYZCPMkqoGNeane3XqwRqfkrZVcw7gh/2d4grjXT+DEjE7qawH3IEvUOS
 KjJIsANa0cft/ebHmTMCPxTg0ND7PA5GXVbZpkAe9fWpLNJfkhz6iIBNBFMXYmLaNMfo
 fonMddZ/xVAAAyHlU1wySfS63mLMTTTK6gZ3mCbX4nmmBeaccJd6X2bsfzS2nYoP1EbR
 GrTAnaJ3qvyV9Y4woTsVIZsMYMF/znKif6xNvdbWnqb6M8tvluHkNcrdL1SUlDv1ODmP
 bRXLomEr0uYQBtlHOnZnz4TdVhWoqzw0Q8fn9jyOvof+Sk/VHY0zASNZJSABovJTPT19
 F2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Nqj3Wj2afL4vH+AWQbMmnZZbmdqpSeJYR5BS2/Kv0Y=;
 b=Nsz2KkNpzcP1A3X+ix1BfYOPaRQslebLHQX5Eh7NdU4r9wt7onfMwkRjfTTenLiaiI
 5eTvRywweKHWDmEqG872to+XuOUNorUlvcmraf7OhZA9pfoHm0np9Gu3umCoDA76PWEh
 9VUdps+xwypjL6YzAJAbyRWL2rux4LgfXWDvIC7H498CstF9aDGrnk++6H04s50Hd4rZ
 7IXhNREb4ePRly/0+qwK6THEovkUHTxXoq8o53uNsvnEFCjj1L3XJaUAK416BfnsVsQa
 OW9Wa6D5NSvPjqpj/XOjRFkruIsXENOcPnhSlaG64mIyn4uMAqeUSbRTaFATqfA3oOEe
 MnUQ==
X-Gm-Message-State: AOAM533CXxFOF9wsza1FlSy0Qsco4nOOlXlTnDki7hqCtDmrH+Mcs3I+
 AAzaxAqVCBPrK8NRH7UnY6FM3g==
X-Google-Smtp-Source: ABdhPJzNkPllUg3CGamJ/9qQ6VEA0o7v+Nic7Ku68JBY2CRMOsrZPqCMPRFONhuaEBXE9kW5K1f9Fw==
X-Received: by 2002:a05:6000:186d:b0:1e8:49fc:69ce with SMTP id
 d13-20020a056000186d00b001e849fc69cemr30513168wri.80.1646410526620; 
 Fri, 04 Mar 2022 08:15:26 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:15:26 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 1/7] dt bindings: remoteproc: Add bindings for the MT8183
 APU
Date: Fri,  4 Mar 2022 17:15:08 +0100
Message-Id: <20220304161514.994128-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304161514.994128-1-abailon@baylibre.com>
References: <20220304161514.994128-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_081529_087239_4B814390 
X-CRM114-Status: GOOD (  12.93  )
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

This adds dt bindings for the APU present in the MT8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
new file mode 100644
index 000000000000..b640aa96d678
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek AI Processor Unit (APU)
+
+description:
+  This document defines the binding for the APU, a co-processor that could
+  offload the CPU for machine learning and neural network.
+
+maintainers:
+  - Alexandre Bailon <abailon@bayLibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8183-apu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ipu
+      - const: jtag
+
+  iommus:
+    maxItems: 3
+
+  memory-region:
+    maxItems: 3
+
+  memory-region-da:
+    description:
+      Array of APU device address. This is used to map the APU device address
+      to a physical address.
+    maxItems: 3
+
+  power-domains:
+    maxItems: 1
+
+  pinctrl:
+    description: pinctrl handles, required to configure pins for JTAG.
+
+  pinctrl-names:
+    items:
+      - const: jtag
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - memory-region-da
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+    #include <dt-bindings/power/mt8183-power.h>
+
+    reserved-memory {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      vdev0buffer: vdev0buffer@52900000 {
+        compatible = "shared-dma-pool";
+        reg = <0x52900000 0x4000>;
+        no-map;
+      };
+
+      vdev0vring0: vdev0vring0@52904000 {
+        compatible = "shared-dma-pool";
+        reg = <0x52904000 0x2000>;
+        no-map;
+      };
+
+      vdev0vring1: vdev0vring1@52906000 {
+        compatible = "shared-dma-pool";
+        reg = <0x52906000 0x2000>;
+        no-map;
+      };
+    };
+
+    apu0: apu@19100000 {
+      compatible = "mediatek,mt8183-apu";
+      reg = <0x19180000 0x14000>;
+      interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+      iommus = <&iommu M4U_PORT_IMG_IPUO>,
+         <&iommu M4U_PORT_IMG_IPU3O>,
+         <&iommu M4U_PORT_IMG_IPUI>;
+
+      clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+         <&ipu_core0 CLK_IPU_CORE0_IPU>,
+         <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+      clock-names = "axi", "ipu", "jtag";
+
+      power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+      memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>;
+      memory-region-da = <0x6fff8000>, <0x6fffc000>, <0x6fffe000>;
+    };
+...
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
