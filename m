Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A949BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E52260F6D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E52260F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQVTvaZ0qQ/ialiXkRXR8VVzaHlyuQhxKTVL0bQp4Sw=; b=sU6oqWHU7cyHuK
	jzLRpoHs5hlgXqzq6TEFG5DaIZbPq1ASd02NO0zix7yeTYmN58fwKVWZPbAKLyr8y+7emTBiKN4FV
	HhfRzL+mXIY+w5QYCj7H4NifK6Jx3JA6/XipzIIMkLN49VMbqAH8jXOlvsSZPNixrUDMRcYsP+HRj
	k0JDvuIvWhChyYpfN5PpQfJiisS5wptl+HnQykqSkiZ9WbwxkWLoKUvs0el3pE6Yr8IERhsteBxJl
	8Yq97FMTQFAZbrWMOH8jh1pm3dF5TX1u610w9FhYUL7Gltnnw8H3CPncLb6DHZeEgHK30HpWo7cGJ
	EuZuJWnypjvVth+35VDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEvL-000x04-Kb; Mon, 20 Sep 2021 08:45:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEuh-000wiR-DU
 for linux-mediatek@lists.infradead.org; Mon, 20 Sep 2021 08:44:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t8so27451485wrq.4
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Sep 2021 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=lT+IhCDzJsEcKLLiInu/mXARIMetYf0FATSWAn5MhnHVmnWeRexL3jJyFidYdtxs56
 dGQaQhoqLqvUx873O0zRj5+ri17ShSKomavf42h7vjH4f+3WnM2oHatJZ5OgnpKE+R/N
 1wWb0Obvvzba5FROFe4ACL5wWPHpncEvivT42lGwvmY0nnwtGn7V3XwOHfdgAHNRmtFu
 XJRkCKz9834prT5ZFmtwnqO93+8zbMc0tt1+3/FHXZZjj3BHSb6Z2Olfg+p3P82J8wxg
 SPehuOlu9hqt3mTeabG6aqQDB3qS4YQ6IEbD2pOHMjdBGCJHTupOgd5XuQhAN90cZyZJ
 IF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=p0Sluki38O6gsFozX9RMv/FQVDartBt68xAkAlx03gGxzOnDC8WEM06vq0MSxj3PEY
 vJXk5jk1/ovO5ht+LkccCaYWbb3si7x58S2vVPme+JSManbccB8kQuchpyNl+mWIFODK
 Okxfuw0YXCl8nmb8LdZwRDsF7f9Z+iS+OvIyWfTVAQP730TFuqHKHANfefagJWDO2Y6E
 Ys7dJ4mJnFevFC8W2JK8DX5rvyvwHPJplmrbQyONx6TxehgNAUyBokFsmgQ1TQyBfJYr
 dz8yN1TiqW6O45YY359SjBg9lR1A8UzcZEtW15uYS8G5hRtvS6MA6LfxW6ql43i2Ij7F
 TSfg==
X-Gm-Message-State: AOAM531iIRPd1UzD9gZjpmPO1mYHeL21egJP3YV5NU38BhzFL/hYTDao
 qKTbGw0MajX7NOwCaznn2/p1qg==
X-Google-Smtp-Source: ABdhPJx2a1IiahlQLTD//57YF74jpgee7rjghXsx4th+o6EmScTYpqXmG8X9Q+AuPcPrsR4PDlc+fA==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr18391639wrj.352.1632127474210; 
 Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w1sm18433911wmc.19.2021.09.20.01.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 2/6] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon, 20 Sep 2021 10:44:20 +0200
Message-Id: <20210920084424.231825-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920084424.231825-1-msp@baylibre.com>
References: <20210920084424.231825-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_014435_462748_73A84969 
X-CRM114-Status: GOOD (  12.30  )
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
