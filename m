Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151BCC433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D623320656
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vh9IXmCZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PrmHEa5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D623320656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8tuOX6AxeWqXgFIkmyJywQdu539XKM/ZE1eDUsJpQvs=; b=vh9IXmCZC8kn8YR19T2MtghQi
	rLUhwr1Anfjz0bZkekQkWaWi4c6EYsBeraSX9rw6IpLRaj3CgXRV0jXyQ6gKR1WWzkD0n1vgGBh4a
	8dBJl5ERe4dqfOUr8NRTTBmmkY28oy5JpxqjWD0sKijTmoSCASaSs5ZvvWZHslwWFdT9p++MgWyds
	912N/R5XCAYj0/uFk/gqhXHujMSsXKfX+jD4fs3XI/J8KnyZFkhJkBqp7bLRqV8rfvH07FdzNgvy0
	fe4cc8brdtQU5RwWpnjPA4BL5eGaMRXavX2ri+Pk5CM6kaFffQU6uTlOW9GdwmBz+K9q/MFobh7Ij
	F5AdZ+Tow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyXK-0000CW-CQ; Mon, 13 Jul 2020 13:30:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyWd-0008Ik-Eb
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 13:29:47 +0000
Received: by mail-wr1-x443.google.com with SMTP id a6so16550185wrm.4
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ku9aM1vtf8T+FGw4lj5ZIPzjxBiChVO0/pPdJg2fBGw=;
 b=PrmHEa5FPW0LpbYElEyKRcYnhJi5XmlC36lx5TSUk0I4eKD5oBsz61WrgLwaHWBGIX
 Ut63kpeIUoPgm/Iugy6CdW2TIR25zGavB/guDK5USe1uzqHhQIzZmP4SybSuqPzcYscF
 EpwVxFYP4NgYDzzlW7/wtUOdb6KvFamYq/rsjAhy7Pv/QfGSzORPzVUZLWXXKh3oBHXM
 kmLBRJzeMfEs2EaHJlYuyMfD0K6LX8k2KCDF1nSPRFMgYE8kZN4eCxgtwF15LSmpbSGc
 lpjY8R1Mjpf7JpeZjWoq/AMQ4feht55IcICbLW8Zw9qNxbusSYWa6dd9BuiEWOSp9Q0t
 n3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ku9aM1vtf8T+FGw4lj5ZIPzjxBiChVO0/pPdJg2fBGw=;
 b=JPyAhbE1svSCu31cvUZYh6B008iKRHpQtaiQEcGvkygPily+r04XaPcYUvG9LozxVC
 UpnCXMO4o7ZiMV9WJbEymCi84r0taSolHjODWxuDVoOlA7BMOu7v1tYeYOJK//Kp7Mry
 vqp+Jk6rNkyGOMhbRjUzYJ/aOeYqC1N9Fhet6Ch7W/ENcYJBJBMapEIYavx9H6fy5pDc
 jcXq2t4xtp1C74dTY1hOfufLXAxvFb1S1EuwuJlrLasQC4Yb59fzYHW+ppnjeP3tYm2Q
 VoTe314lwit8fsGVlQ0KACcD1v2bIKLGx3Lqh2DdbooP3HKJcPiMzIDZAkegsRWfmI+Q
 ctZA==
X-Gm-Message-State: AOAM5308w3BbcfV53JeVe5wMbdOQJQnoOow6gtPYeHSUi2l/34FFt+OK
 ab21g+zksTNu0OdGsPvh+mBjrQ==
X-Google-Smtp-Source: ABdhPJw27IwpFadhq+5bRv4bzXdsWZ8YmL639ivQFIAbVn7c+uDln0qheLOT9j1ytM6vhX/7UJNMeg==
X-Received: by 2002:adf:de12:: with SMTP id b18mr85726204wrm.390.1594646980907; 
 Mon, 13 Jul 2020 06:29:40 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:29:40 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH 1/6] dt bindings: remoteproc: Add bindings for MT8183 APU
Date: Mon, 13 Jul 2020 15:29:22 +0200
Message-Id: <20200713132927.24925-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092943_621063_3F972809 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds dt bindings for the APU present in the MT8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
new file mode 100644
index 000000000000..1d5fcc135617
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MT8183 Vision Processor Unit (VPU) devices
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
+    description:
+      Address ranges of the APU MMIO.
+    maxItems: 1
+
+  interrupts:
+    description:
+      The interrupt number used to receive the interrupts from the DSP.
+    maxItems: 1
+
+  clocks:
+    description:
+      "Clocks for co-processor (See: ../clock/clock-bindings.txt)
+      Three clocks are expected for AXI, IPU and JTAG.
+      The JTAG clock seems to be required to run the DSP,
+      even when JTAG is not in use."
+    maxItems: 3
+  clock-names:
+    description:
+      The name of clocks, must be ipu, axi and jtag
+    items:
+      - const: ipu
+      - const: axi
+      - const: jtag
+
+  iommu:
+    description: "IOMMU (See: ../iommu/iommu.txt)"
+    maxItems: 3
+
+  memory-region:
+    description: "Reserved memory (See: ../reserved-memory/reserved-memory.txt)"
+    maxItems: 1
+
+  power-domains:
+    description: "Power domain (see: ../power/power_domain.txt)"
+    maxItems: 1
+
+  pinctrl:
+    description: pinctrl handles, required to configure pins for JTAG.
+    maxItems: 2
+
+  pinctrl-names:
+    description:
+      pinctrl name, must be "default", "jtag".
+      "default" must configure the pins when JTAG is disabled.
+      "jtag" must configure the pins for JTAG operations.
+    items:
+      - const: default
+      - const: jtag
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommu
+  - memory-region
+  - power-domains
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
+      vpu_ram: vpu_ram@0x60000000 {
+        compatible = "shared-dma-pool";
+        reg = <0 0x60000000 0 0x040000000>;
+        no-map;
+        linux,cma-default;
+      };
+    };
+
+    vpu0: vpu@0x19100000 {
+      compatible = "mediatek,mt8183-apu";
+      reg = <0 0x19180000 0 0x14000>;
+      reg-names = "mmio";
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
+      memory-region = <&vpu_ram>;
+    };
+...
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
