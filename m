Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C167C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:02:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F64C206D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wXcee77j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e1BCbpsX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F64C206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yqJ7H0keJEFzAISw78VIAYi+BHpEQlFLmjnW1GQ9rrk=; b=wXcee77j/0tBd16AKUV95E2Pz
	G6NRFY/5iOSG06AuhG/VEtTWNFQCPOiPjLKgkN1Kjb83Qvu3SDLVVDjUi3C/S4rgqDmirtXtiudZE
	Wz46WnIOl/Vg4DoERR6Wa1BSdaxzXeTTAEpFZvcbHrRRpvSy5H6aG8XaxRfNRdE30QCOR/QbiEVgW
	SZlON6dzz7HsrYseQ+xlQCaKI1B11QA9SAxUEHrWrX68GUNUcpHbEVKYQ1Wo3V4V5Bjx/+y53qgAX
	+spfyIZBr2CxZPwB35KswOiscfJNLCgG1pwQzbdwwx+isXPfa5Pg8ow4hh394h1OStmGOaFX29wH5
	poqOpKlqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGMD1-0000jO-Oa; Thu, 10 Sep 2020 13:01:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGMCq-0000dZ-Vi
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 13:01:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id z4so6628405wrr.4
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRs7Uzub0zJIby8weUidtFyGgxBuDRRReFxv1hE4uO8=;
 b=e1BCbpsXv9QwCCYq522KpmcV/gk6T8ibKbGXusxUOfAfP2F3CYIxea926Q3rOONKiI
 Rzl8B7GGIANojnTkvRGBr2uu72MpTHHDCNtHhD4yyD+b7SSDXbAYdCN+ImfUBrfmPAWg
 EnOxs50Im1TZFZVUxvBrJYQTIGujYBUAw6TypR8XcDTWN8Gvaq503Urh22FAiPblCx1k
 PS3Zc0optxM7KKJMz86JCliv8SH1QyDsfCON0rUiTTChG5yW+3AomEktH6Lxa7h1xT+3
 sbl6e6D5fbYtDpWmLKX7lyqsY2U970qtVw/X5OfLyjWjVVyvSgRQj0O1XdCwuFCNVIhb
 RWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pRs7Uzub0zJIby8weUidtFyGgxBuDRRReFxv1hE4uO8=;
 b=S0w7nswBvSHxRiv37cntzwZ9pGJn/Tj/cQrGfV5j6bRR5+MetoG8MPJjK9Vht7adlA
 xd3sEWcpG/TGQWR29bb0KIZkytU97b+CjJRfetehoeQc16e91Ku1ewUMjeOIQH+hcaml
 posq1erbmYBZJhBqhIbf9lz518iKuwYxB8Nl6m5LBHm1KHVe5y8RW/q7ZRyct6+PDJMY
 9MFccGXb7VU6z6haO927ygSyFoT12mmyDQUdqsOqKquRMOIwxH9bJNUty2Bku/AsUSK5
 WueH4Voq82+zD7+F5X24Kt/6hoh1FMU5QJw6SPv5kp/ywH4pU8ptlmfGuskOrr1qVsqw
 fBlg==
X-Gm-Message-State: AOAM531mwgHkWW4mebX7Xg2EzRQ92oCYrw/xOmCf8gTafUl590l1XZdi
 GEJI8ZtMHfTYWxJIsJoGb+VMzQ==
X-Google-Smtp-Source: ABdhPJx4KLaMhKr7HdhOjKyG9sCQC8O62DGqMbs3kGQb1cIb++035zPL1Wso7SB/gY7s9bimrlrhXA==
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr8886654wrm.346.1599742898647; 
 Thu, 10 Sep 2020 06:01:38 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y1sm9488269wru.87.2020.09.10.06.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:01:37 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, mathieu.poirier@linaro.org
Subject: [PATCH v2 1/4] dt bindings: remoteproc: Add bindings for MT8183 APU
Date: Thu, 10 Sep 2020 15:01:45 +0200
Message-Id: <20200910130148.8734-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910130148.8734-1-abailon@baylibre.com>
References: <20200910130148.8734-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_090141_041647_12209A7C 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: devicetree@vger.kernel.org, stephane.leprovost@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 gpain@baylibre.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds dt bindings for the APU present in the MT8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
new file mode 100644
index 000000000000..7a71d2f5c4e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -0,0 +1,107 @@
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
+    maxItems: 1
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
+      apu_ram: apu_ram@0x60000000 {
+        compatible = "shared-dma-pool";
+        reg = <0x60000000 0x040000000>;
+        no-map;
+        linux,cma-default;
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
+      memory-region = <&apu_ram>;
+    };
+...
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
