Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E71C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58E061A08
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D58E061A08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQVTvaZ0qQ/ialiXkRXR8VVzaHlyuQhxKTVL0bQp4Sw=; b=n/FfrlORlF4rqQ
	l/CdcIhtDfrEqSNolVDgoHEfq42UljDdAOHyEwe4DqOZIa6OdA31+ioYOBMDi78VpWuVDuu+V40O7
	FJw/HqmDR/alJpqHEc4c/InzR1Ge2DNbBhAcqzH4mryyNqJvqSt4avLmQQ6RlkC9RnRdkfE0WwSSk
	NruEC99mJsbyRO7HtiHkhW6ITqABhAJSllpQN+3WuIyjwfIm49YuQ6M0f9afuR3jz5N6l++d4hmhr
	qb+ZaZQHjlawlv6u7sh9vCtP+g+7TY9ys8fdgBijnHRTCh+uUQ5oR9ZH2W3xQtLZ2UAUDREIN0XaL
	GeJhIN4a1QrMf3I2t2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF82-00HJiT-Gc; Fri, 01 Oct 2021 09:46:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF67-00HIjx-FX
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:45:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so1095298wmd.2
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=jExCUMzU7hAdOlUFBrdoeVb86nCh/Uj+lX/7G7s5uWKszC8CkoslwlyT5izIcvfEsB
 uvZvqwbDVWtXS6IvQUo+dVu16w26iJCDZsBn/+Rr65rLl1bX7SYgzadnMf1U+YdwlOlA
 +rjAPDFwiM04JpMIaKmDr5rujt2C8bB+T3kIumpI05FpEwuRZjtEkv5QaA9EbQSG4nUl
 cX0OavcikC81jNaUdIPXitDurwZ97stvnlvkPjHHIKCzptNI4gs+iR63ZcMOzDCaqehX
 TtHjsS1Tdu/J16+c0gTG46Q8BAYNNZvPBTIDi9tKtWkniI3bgNCRxcsr1trfcjNbWtpa
 Iw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=TulHUOvY8tsAi/v/ImU6FJIS9Dq0Sx85xl61AKQiaPKZ7Yo3PC5Gc04wUmjk8dQu6O
 0zqkVSnDSHOUEyFCK1AkftFofbEOxCU0cvsC3F3GkmaAiiARGiK4nACI9fabDf9ajNa1
 FgfxuKwy+qzF1g1EZ7ckP5X2bodkcEOMLr0M4UVS4D5U3t2fc1CJA+OJlL2+PeEG7vCc
 Vgmn6qSROj7Rpqd50risL393iWaE5YiicbGzwgFivWd4UMyU7GhrmJlMsMlkOZ/Y2Gdf
 PpsFKPoz7ZpnOktpbOhp1ecZi4KWXxyzwJGnx5WLvzja6XKpc1zuntvNv8frdqUbE9TG
 /2DQ==
X-Gm-Message-State: AOAM530B8wmLuzkbAvgU6ORDjYx6mJvAYm5Q6iPliwVxxq3oNTJOUXfT
 rPgpRVVBr9Si3uhSGjYO+wyufQ==
X-Google-Smtp-Source: ABdhPJynhJ5tvWNcwbrDCLTEh/2isdLd4PaOeQlLkhAGw9TtmoRnGZYBFiXqXYka8TDjNgi8/sRXXg==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr3542115wmq.5.1633081493519; 
 Fri, 01 Oct 2021 02:44:53 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:53 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 2/6] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri,  1 Oct 2021 11:44:39 +0200
Message-Id: <20211001094443.2770169-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001094443.2770169-1-msp@baylibre.com>
References: <20211001094443.2770169-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024455_607541_2B420A39 
X-CRM114-Status: GOOD (  12.09  )
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

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..f7a35962c23b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Display Port Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port controller
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-edp_tx
+      - mediatek,mt8195-dp_tx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: faxi clock
+
+  clock-names:
+    items:
+      - const: faxi
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the controller, usually dp_intf
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    dp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-edp_tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
+        status = "okay";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                edp_in: endpoint {
+                    remote-endpoint = <&dp_intf0_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                edp_out: endpoint {
+                	remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
