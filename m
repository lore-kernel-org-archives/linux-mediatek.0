Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35084C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:13:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E4060200
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0E4060200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmByI9f2SuiGBPFwUXn1kVSFUwxqL96h87C9xpq1OuM=; b=l6xXQuxmS2u+4r
	LOw1m0HZSub/r6v4cEc2fdHRyfyw5zKJV0s3okXpGxSKJoE+3siAO/h5CT4PWzNqRdXDSb8fboWoV
	7gn7J3+3smD6Wmjnsro4/U8g16NB1AKnotsNCO8qug1uOTinef/8hAWd+a8ZS6aGK0tRCnbQ1ksmq
	aETIdFmsbICkL12SRtcZo6di+Hj1oDbPb45GvQpjTIr0D6biffBNyN0ccD9ChzTffsMiAWRMxurxG
	bpmwa7RjXDQ2it/rdWmj4hLFwciElQCPyPOjv43PpOjoVPd/RuveWI7djX94c6s1aA0RAHaNhHnN5
	xHCCv3CFJo32ZDyFVxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjj3-008kZO-N3; Thu, 19 Aug 2021 15:13:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGji9-008kCQ-Fw
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 15:12:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id x10so9629792wrt.8
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfmux6GbWpn+VVXwtphpKIQmrZ/1kSy6Z3ImiMnN0Vs=;
 b=lcrAdC4OCKjmyR31VaQQFRKzwChBAkCfFWMkE0MAk2DfBx/PEY4yq6AguEujOhfmGB
 GgJLswHgOOdbTwe4nKJLbK+BW26/cqHhkn515aEdgjvXwKYvQauIl4Y+U/N2qwGFxjWQ
 VHFWanf1ruuGk/6cWgJvpvBSsZ0DZ9cuv13JJdFTh0CA7Iv2UzjZWKvVjB+AJDWzkWGh
 cqayulxEPXRE7KKDFR6+GAr/i7KMotMmTVTGEVWk1tRuQkYvkpwDgu3zIa0TAhT+ucXp
 Gygyz3zYsq5iylKXQCz14eLv84ASVt41wthP3N99qON3iczcDBqVNUospE/wv3my8gV/
 0rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfmux6GbWpn+VVXwtphpKIQmrZ/1kSy6Z3ImiMnN0Vs=;
 b=R0sBBZJ328XGN+iEiJShUpeHzwCiERLK3+9dYj5G0PtwE3HsdfveENL5EIQDHKOaOp
 lpM9lydAMUUO4ThhJ3D2oYboMgDb3w9pvqtbPYgpM1vA6S8XqKCJrN6FS04G3g21s/cL
 xrgoSx8/Z3Atk5u1CXUcP9T05NbjshIKOWtXWdR3JCTpqgj/IJBDRslhw6Puah4eb3Cr
 TT4tAbaGlmNXxkDA/0p5KshamV4e4YIxRpxMPSYAHROgEDJexGbl1NxZHe/0AF/V8D7M
 HbPAKbgtv8u+OY7Bw3YjEUdJS81H6A+AkWMT6AQ5fH9jznbxQ3/bjA4Dlzxq7nfNJ1QW
 N+Fg==
X-Gm-Message-State: AOAM5323j1VQdCTLKtgLvyOb5uIo0fwJeVM5fQh7S1ZiNkEjngg8h3kr
 KbGZ3/v8pLj3f6RX72RDk06f0A==
X-Google-Smtp-Source: ABdhPJx2N0q5v4rzhnN/p1JmrlgjdcQCVDLdFnedbIjSQmrnlyco9hMsvsCBJZpTRLBPR2NMskz3Lw==
X-Received: by 2002:adf:d227:: with SMTP id k7mr4458318wrh.285.1629385923673; 
 Thu, 19 Aug 2021 08:12:03 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:12:03 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.org
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, gpain@baylibre.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 1/4] dt bindings: remoteproc: Add bindings for MT8183 APU
Date: Thu, 19 Aug 2021 17:13:37 +0200
Message-Id: <20210819151340.741565-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819151340.741565-1-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_081205_606635_B6ED2CF9 
X-CRM114-Status: GOOD (  14.05  )
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
 .../bindings/remoteproc/mtk,apu.yaml          | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
new file mode 100644
index 0000000000000..d5da6be66610c
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MT8183 AI Processor Unit (APU) a.k.a. Vision Processor Unit (VPU)
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
+    description:
+      Three clocks are expected for AXI, IPU and JTAG.
+      The JTAG clock seems to be required to run the DSP,
+      even when JTAG is not in use."
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
+    maxItems: 1
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
+      vdev0vring0: vdev0vring0 {
+        compatible = "shared-dma-pool";
+        size = <0 0x00008000>;
+        no-map;
+      };
+
+      vdev0vring1: vdev0vring1 {
+        compatible = "shared-dma-pool";
+        size = <0 0x00008000>;
+        no-map;
+      };
+
+      vdev0buffer: vdev0buffer {
+        compatible = "shared-dma-pool";
+        size = <0 0x00100000>;
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
+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1";
+    };
+...
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
