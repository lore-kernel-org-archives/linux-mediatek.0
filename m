Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2AFC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1360F6105A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1360F6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYdpT4ZwrcY63om1WeZgGeLboa+CoSEqZC2GKYeZ6zI=; b=sCaXZRaIZ6XDEG
	iPttSLj6ANvJkm1z04xLDC96925NxLleUsZn7mAspHZDdJHrceKVRirHZ3ObD7cb6F8pLX4YGNRJJ
	I3H1M1N6wTKaB543UVDMmprkGCSro+IYXaXKHtuAbdXQOxvZYIp8ohR2QBqo6Ncs+HW1Ft95ceLjD
	BANIxCMEsQdcX5dReE+SjXI8tSGAttnvRSFANfO+HAltPIR43p5mth/mKA2ag893UEvXBxkGh7iVG
	9V8mLHNE/NvMPwHfiYwgSRICDrWw8dWVlizqOYxbgBfIGI+uWT0w6qRFFk4aUmIXTLotqvFu8FFtX
	29+AkcrZpHE8zGNUkpxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNWec-002trn-Sf; Tue, 07 Sep 2021 08:40:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNWdo-002tRm-6f
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 08:39:43 +0000
Received: by mail-wr1-x443.google.com with SMTP id d6so12584703wrc.11
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Sep 2021 01:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmdXYabHBlH0lzTR2aGEg4jjkPTidI1mG07cS/MQyTc=;
 b=b3dS4AUF3x8YJP0MHj9VQNJzu+5FaEBv2n1zRCv3YXmTXTkGkm+SQIVEeNELn0Ckbi
 S6aAexEhIXCCSetvenP4sRLVOQiZZPluj+9Tojdmc/XdQPToUkLX+WhtHtZqAsVToK9R
 PKS1wKnI7TIigejl8kDKT2AWgebp9s5WaMQTkWEHQRfGdtdh4UcGYFD4jHuJ1p71coHa
 El4whTjb3Qj8bHoRpMKmQp7CWpUgqYCHlI+wSwN/zANsgburryHCFv55vYf0q0eEqDjp
 rl/pSLdm4qvpRm9QMmkWJvbHVa00DnEaeRUnLyeeARI7qWzXs+uKnJIZxrxC9dxXW99j
 qnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmdXYabHBlH0lzTR2aGEg4jjkPTidI1mG07cS/MQyTc=;
 b=ovD0ML0z3KOuOAAjW87g//cTe4KrmAboLQBZbVS4ciiZ8tYLjcmwuPqIccNOALNPFe
 tqS+Y9RK6fM9q2iWLCobOCaJoKwN/t5sTyfvHvGeF25zQb5ayaAqg4KzMbHspLto2FpY
 T7m/s2xbyFwrXtyBnlQOjjR9aaDQ8HypFz19gu15ImpnD7GCRWcxWQ/mLiejH9UGGC6l
 9mL80c8Ry986TutXy3X0zCNRKleuIf3RuR6chtZYqkC60wlyKFqyrZ4LiIz4+BEblnin
 A1IK5TNYYtH+lGiCcXX8q2bX9iOdUil3PwAT33RENwOggZVTuHuXRCUc+MMkuav6Svxw
 5TeQ==
X-Gm-Message-State: AOAM530ggWMkaMc+BLBWy/vuLgVk4UJB2yp2Vhcr1zdPrX33oArUA5hH
 iRC5jC0LphV2IF8f6OegjjW+hQ==
X-Google-Smtp-Source: ABdhPJyDgiMvPKHxYxRk/TRfiki81RSVnZoaBVGMlrlfdZYclA0TZPFkDpfqZUikhceozNhYswoUCA==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr17418975wre.26.1631003979019; 
 Tue, 07 Sep 2021 01:39:39 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-3317-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6141:3317:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id m186sm1737027wme.48.2021.09.07.01.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:38 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi bindings
Date: Tue,  7 Sep 2021 10:37:21 +0200
Message-Id: <20210907083723.7725-5-granquet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907083723.7725-1-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_013940_331938_5772EC85 
X-CRM114-Status: GOOD (  15.29  )
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

Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 46 +++++++++
 .../mediatek/mediatek,mt8195-hdmi.yaml        | 99 +++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..ae3cc0ae457f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC Device Tree Bindings for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ddc-i2c
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmiddc0: ddc_i2c {
+      compatible = "mediatek,mt8195-hdmi-ddc";
+      clocks = <&clk26m>;
+      clock-names = "ddc-i2c";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
new file mode 100644
index 000000000000..b5d5f7f79c71
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI Encoder Device Tree Bindings for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
+  its parallel input.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL divider
+      - description: PLL divider
+      - description: HDCP engine clock
+      - description: PLL divider
+      - description: HDCP engine clock
+      - description: Bus clock
+      - description: HDMI clock for vpp_split module
+
+  clock-names:
+    items:
+      - const: univpll_d6_d4
+      - const: msdcpll_d2
+      - const: hdmi_apb_sel
+      - const: univpll_d4_d8
+      - const: hdcp_sel
+      - const: hdcp24_sel
+      - const: split_hdmi
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi0: hdmi@1c300000 {
+      compatible = "mediatek,mt8195-hdmi";
+      reg = <0 0x1c300000 0 0x1000>;
+      power-domains = <&spm MT8195_POWER_DOMAIN_HDMI_TX>;
+      clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D4>,
+             <&topckgen CLK_TOP_MSDCPLL_D2>,
+             <&topckgen CLK_TOP_HDMI_APB>,
+             <&topckgen CLK_TOP_UNIVPLL_D4_D8>,
+             <&topckgen CLK_TOP_HDCP>,
+             <&topckgen CLK_TOP_HDCP_24M>,
+             <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
+      clock-names = "univpll_d6_d4",
+        "msdcpll_d2",
+        "hdmi_apb_sel",
+        "univpll_d4_d8",
+        "hdcp_sel",
+        "hdcp24_sel",
+        "split_hdmi";
+      interrupts = <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_pin>;
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi";
+      cec = <&cec>;
+      ddc-i2c-bus = <&hdmiddc0>;
+      status = "disabled";
+    };
+
+...
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
