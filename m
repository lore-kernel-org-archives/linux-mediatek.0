Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C22AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:45:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DEEC60F21
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DEEC60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onsxQd9msZpR3r7mucUTfhjiOnWG3J9kV1nLwVGReDQ=; b=mu438IdPbGBR65
	YlPRUT3gz5XHj5QCOZnvHrzGV42Lovvf4U7HoQszvIbpNXnzSWVrx4zdBaxfomh9cQNI4e9zxlacV
	Pt1HUUtL5ODnJEhvJqgqn7cIKgsDMicl+4Ek4I1FjSPQsGZY/sjATcZABdHRjxD7kuozJ43gxKCgJ
	55iY8WcvoDuQHQf4r0Iur4ILLy5Ca7DkBlGAUr4Mw5UuMEK26DzrjqpIxtjJewGgl2Ni6PGDzSIRM
	g2HWtuSqEIcsi0HI9mNf94bI5LRZYkJwqBmNp7nV073lWIkbunt7z/lcZAu+WwM6EJ3L2tCOPd8nU
	i7mqz5Nc1+4VJ4UTZ//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEul-000wm8-A8; Mon, 20 Sep 2021 08:44:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEuh-000wiO-2A
 for linux-mediatek@lists.infradead.org; Mon, 20 Sep 2021 08:44:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id t8so20446593wri.1
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=A4d/I44K6lQ6dPZEnJvXJKA1Z3hxMVVIFQcJThznHU31hRTdglsoln/Cc/mKRkkkZk
 CLWYXAGJ42glBBh9KHCvt4oZT/3UNbhPbubTZ1vbjFhVG7iUx30tv1/NK1okqLExFMCw
 b5UgibW/li5i0UVxqXRAHP0xsOs+rHiZt3ECN+KfLYGqpyGXYKG2RVVdyMwfBHU9CwLj
 1yamxcgub3sIbbBYJNXsBD/DsPwXBTbt1RhvNccAAPnxFwm2kcgm2VkfrjLmpAzwgewk
 weXHgYwfvZ4cn/QySHbSxnVDQB1WmhKhJnCniXYKqlNLdygfdu3VF9KteWp7QQDjNsEm
 Jsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=ThJU8CX2BzmtpkfLj1m6kTg+yyo7GDuJ8zzO7B0G4FvuNxaFqY8cs63Rk98TKp+GwI
 BAvXqnpQuG+krPSFjWNaBCbUGolWmG2RWu7rozdKcxGsnTWZfSBXxzPH+2joKaUUNgiv
 wY7+hdGKnZ/vUYPoJfV7HGQnNN4xsGHh6pGL0gWWtT75rZ8cfz6DgkNb4B2V4ebWgjup
 bfd9lqzMS7/kg+mAtM1tK49FFuDiX+4NGlOASRNpedQlZwEqBt3UYDCZZvELF0/1OZwt
 meWtfMwZBvx9yqzO25hlUSEYGdbIEOZnj9VInd+ITF803hewMMmpelUPEfqysihtTQaX
 MNsw==
X-Gm-Message-State: AOAM533ak01tvSBTUbYlOERj84kmoBMvLiXDsI7XUXN+4k93gmPBALv/
 J0o9eMdPYcRXAy8p0+9xZ+Y+MQ==
X-Google-Smtp-Source: ABdhPJxEjT/FkHYZDr/KKJS0+xo13JuDyY3JItw9t1b4157gltxSWW/8wLcz5iaSs7PLtSl+Ztvqwg==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr26881846wrx.244.1632127473574; 
 Mon, 20 Sep 2021 01:44:33 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w1sm18433911wmc.19.2021.09.20.01.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:44:33 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 1/6] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Date: Mon, 20 Sep 2021 10:44:19 +0200
Message-Id: <20210920084424.231825-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920084424.231825-1-msp@baylibre.com>
References: <20210920084424.231825-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_014435_154017_9FAE5E25 
X-CRM114-Status: GOOD (  13.85  )
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

DP_INTF is a similar functional block to mediatek,dpi but is different
in that it serves the DisplayPort controller on mediatek SoCs and uses
different clocks. Therefore this patch creates a new binding file for
this functional block.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes v1 -> v2:
    - Move the devicetree binding from mediatek,dpi into its own binding file.

 .../display/mediatek/mediatek,dpintf.yaml     | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
new file mode 100644
index 000000000000..ac1fd93327e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpintf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek DP_INTF Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek DP_INTF function block is a sink of the display subsystem
+  connected to the display port controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dpintf
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: hf_fmm Clock
+      - description: hf_fdp Clock
+      - description: Pixel Clock
+      - description: DP_INTF PLL
+
+  clock-names:
+    items:
+      - const: hf_fmm
+      - const: hf_fdp
+      - const: pixel
+      - const: pll
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port should be connected to the input port of an
+      attached display port controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+
+	dp_intf1: dp_intf1@1c113000 {
+		compatible = "mediatek,mt8195-dpintf";
+		reg = <0 0x1c113000 0 0x1000>;
+		interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
+			 <&vdosys1 CLK_VDO1_DPINTF>,
+			 <&topckgen CLK_TOP_DP_SEL>,
+			 <&topckgen CLK_TOP_TVDPLL2>;
+		clock-names = "hf_fmm",
+			      "hf_fdp",
+			      "pixel",
+			      "pll";
+	};
+
+...
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
