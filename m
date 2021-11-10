Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821B4611F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 821B4611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRNyeZ0EvCOHXclX6cHKxavkiK1SWP3n0p8jZpGFiBk=; b=YF7mkPf/mwjn/M
	vw29jUmFyW/jsjVsrP5WJI2+WM09KhJT20J/i+Lei7+JHGe9hGMguov+02m+pngNPJm95GffPCf11
	GA844B032qCJMv1eh3sHPjPynaCleS73is37s7vl4zqGJSOzcUsro8g75LVmq5MoH8je2HUVSPB04
	+EMdLUq9CkDwlrETDqR6nYhsvhhv2iM87S7BZo/qprKZ5AU2qU7fSWWEkWEMxrGZmxSOE3SPvJwBw
	mOOt/UohGjdNko8O2XhOyfyhJ4+CenswmzD5l1i3kqtgmXEEATY3Hjp1QRcakU5Y77qLg2voBUg/P
	hBQcYlcO00DXr2c8xPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mknJU-005Vvw-5Y; Wed, 10 Nov 2021 13:06:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mknJF-005Vnh-Sw
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 13:06:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id s13so3942282wrb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cA5Bx+I+AGs2RfGY4hpgrqrPI8r6zTFIuO5ZwQf2Zak=;
 b=fdGqVZ8C9sj0YrVbLfS4xU1lFVmL0RgzIYcDRVdbsvtXLOI0qdM91nPNn/4pf9sSVK
 Fzt5m+d8l8EJw7GX5O995sZcKmqcEJOikc/+kZG7NAfA2NBmvJiE5XOl84xdkJJFI850
 WY5O+AptZj/+SufH1qlSGqJsrrAA2VXi5pZGezYvUw9sNtXWSoZr0nmc2RzIWKD5BlZ2
 eXw9gJ+D75YZ6P5Rsry9eXEZ0gsb6KCKLNIqJF/F3RhnJU73/a9M5wjsf1jWS6368RLZ
 +WgeKT9olnJGVQxYYZ5HhkoDQvMa0c1SKYM3d5h/7pB/Dte1ftxMhzgMVEOn3R3R+Ssd
 CDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cA5Bx+I+AGs2RfGY4hpgrqrPI8r6zTFIuO5ZwQf2Zak=;
 b=FZeJCoCsSeKi2uWhpm5IEYla1IZVkNQv0oblFTbo/nXESnYKe8+7BFHNd3akxlVhmP
 9Yibnm4iTYNCQFokbFQpauNcdWzSi5AUm5sl2/vwAx+q9gC+ZXh48I0uZEjZ1GYAA8rA
 q7w8aD7omiizpd2meAriPf9R29gWzAfLo8UOtpv1c43Un9cahJiz5sxtoOvm9/MXbE04
 7ISxOtvA2xZZI4yT3ChQ7Z57H7gNc213sDQ6rBPN5LmypJWGkYrG50zkddXdbx3A9GSx
 w9CIXXmg0IAEJvrH7SWyIxlY6PhYRAqATg9M0CLavHdzm/ldO6ZQA3Br0kwIylzcw58a
 6hvw==
X-Gm-Message-State: AOAM531JeT0+VK0S5yg2PuVKw5AfnrRtksZwYG3MZW84BE8JW7YK/BbD
 G5MU880Ur2aXRHicwpBotMYERA==
X-Google-Smtp-Source: ABdhPJwXoWWM9ZafT/EZtRONxNpg+gfpTPXDrROqPVfAAiWeoayF8ip582addgnnS/1foYtrAwzV5w==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr19270769wrh.330.1636549595402; 
 Wed, 10 Nov 2021 05:06:35 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id i17sm5952175wmq.48.2021.11.10.05.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:06:34 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/7] dt-bindings: mediatek,dp: Add Display Port binding
Date: Wed, 10 Nov 2021 14:06:18 +0100
Message-Id: <20211110130623.20553-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211110130623.20553-1-granquet@baylibre.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_050637_978641_93FB462E 
X-CRM114-Status: GOOD (  14.46  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 0000000000000..068b11d766e21
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,87 @@
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
+      - mediatek,mt8195-dp-tx
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
+    edp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-dp-tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
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
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
