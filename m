Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRNyeZ0EvCOHXclX6cHKxavkiK1SWP3n0p8jZpGFiBk=; b=OJ3S+hRbrGQ4E6
	PGjFj8X/nC7p8AVhviilddRA3UDyATj8BqlqDnujlaAVIMwUuJf9alRHkVk5Hn5WnRUy9PivnEAy/
	Gl6wsuc29rWDoHEqbqOtkamqA2ii5JUtJHju4qQyinGpDhk0lFGZZ3LXUEuzHkiEwTcPIhVubYMwC
	otUzni7+k6uRDLOMnxsodGKlyntBwx9D0rynOdZb9AUbeZULzaIdp0BLN6x3c95c0AVdcYYdv9v2r
	Xb53SnQmMyZEqQ/ks2zcHrFG3fsAZqHx+FpbFhp8Z9qs8VM0BZkvZd8vy0n5PGtdKkj4dAOiaUGbS
	OLRWbfQ99NtAHARGCe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEsA-00AoxK-VO; Fri, 17 Dec 2021 15:10:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myErK-00AoYP-Vb
 for linux-mediatek@lists.infradead.org; Fri, 17 Dec 2021 15:09:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id t18so4594524wrg.11
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Dec 2021 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cA5Bx+I+AGs2RfGY4hpgrqrPI8r6zTFIuO5ZwQf2Zak=;
 b=toL2v1mg/OkMSznV2NPL+e6xhb1dTHXYjRr/KURTTyUhKGpWlGy4psR4aVyUZ6TR4/
 HNXEur/I9Xev153quDM4MQq8RtmSmF8YDw7pGBPz/OjEsiyoOI+BHoZBgx/YCZBB25xE
 01BSlpSB4+3ndaRsjlYMZz7FYUY9lfZDftPLJSK11BLauq6ZsMs3VBh8xFRYz5zc+s8K
 nrAQkfRWSVfJYGqpZTV11mU7RsfB0+AzYlCdVWZyT9JTQtHv1cl5D/OO2PCVa36winm6
 lFsxMXVmhYA4+x8xuZKijkbmNX/LZA14U5SkWYVkYyT/HiC5vPaJX/bXZt/v6w0qRbEJ
 MRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cA5Bx+I+AGs2RfGY4hpgrqrPI8r6zTFIuO5ZwQf2Zak=;
 b=gQXcyCGzkyCMxVhiBWkSEzjWai1hD1Or+cQGEf7am9Yb4VMU2fUUdO3GvGTbn6ilVE
 ryjXdZ9s4RJH5D8H5wgFZ1gimcOKUhN9jUkBQLW2dIzUfdvELuWw3B7r3buyS09iohsS
 DRsHR8YBXzzV6CbDFwI8tEbP93vXL9ifjC2+MXRe452n5GwKhpse/L6aNU7zyaq7kiL9
 rnFCoHalu0WqAlDiKAsq7oNs/ByegteOIYQXqkC9hilBwqTexG8H9wGHLTCES5a8dUTL
 zOlsOsSeURu1lPvY2YoXNar5yO3sKZgh31HPsI6B4JIyfcesd/G/hTU8q2muDMr2i3m8
 sKtQ==
X-Gm-Message-State: AOAM533wR1/45zG8eH9IR3WCGPQUX0902yQ2G1WaPkd8U1+kR07yOkNh
 u0qe8DjLRZa8rsozpB7l8t7MZA==
X-Google-Smtp-Source: ABdhPJw2QIwL+JN1BE/ytNuThS3hvqjbyhJk1gG3get4Uk4bFSMW9drCtD5/xxhsEnmjYhGJnW27og==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr2832923wrx.569.1639753761014; 
 Fri, 17 Dec 2021 07:09:21 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:20 -0800 (PST)
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
Subject: [PATCH v7 2/8] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 17 Dec 2021 16:08:48 +0100
Message-Id: <20211217150854.2081-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_070923_064692_0CCC5136 
X-CRM114-Status: GOOD (  13.47  )
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
