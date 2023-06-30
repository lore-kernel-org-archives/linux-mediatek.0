Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F4AEB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gzj7Am8v4sZKcg6oYAmAbL82yLixQgxMAE5EK9pmGUE=; b=hPS8bbvaZ4keIZcwZK7TZYwR65
	amrCTj+GRT05vpn6zilPs/jma/9kSoyv22lCqJQ65emKdls5C0KtOk3ttpR73DiTkUrcQHj2uC1as
	fSi7vJH/gCQy+8wvrQrAg7f5RbqufvWzv2UB6S7DTOZmu/IkgHg5uYsmi5z2LB1kTrxMudma99fIl
	g1ZwIgMVktmJxHZOjetcRFpo0o+8dP1ge3c5dcjWX6NxGKRFYALmHxmmYROWm0ZksWoT/WavLsGiH
	4TTYvZrZS+ZK2dZVBk5/vK+j8++3D1K2UWblm0GS1p0C/gzRrjlL6hgUgpCurlHfNOzJj2jJVIxv4
	euuOeu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFB0f-003LCi-2Y;
	Fri, 30 Jun 2023 10:05:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFB0d-003LB8-0j
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Jun 2023 10:05:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-313e23d0a28so2028453f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Jun 2023 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688119545; x=1690711545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gzj7Am8v4sZKcg6oYAmAbL82yLixQgxMAE5EK9pmGUE=;
        b=ekSSAvTlH34GW44/04/BA4CRpWDR0LXvvZaNYIK20v6VsXywPrE3zEL2jml/xM+6x0
         PNWwJ7XayPWkcfKRmastUp3jVDqYQMhMtdeWRvqY732q0EKWRJhjOiYegnwEgQAp+HzO
         rTPaSA94hHV6/RUum5+abNHP6zrTAybSE8zNbdX41I4vBpv1k4a3aML2Yfhd0xkylZuy
         eJX9brYcPYG8V2BltMBLAL3WCO074ZijbxsGacm3oaNocSXtwqituFo+YX3FcQg7q/ik
         ephs0L0t9o03MnRaDcVsZbGiFAjum0R3J3JCQLTFBsdC3wMpn3nusVwilIdPzCIT3fn0
         GDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688119545; x=1690711545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gzj7Am8v4sZKcg6oYAmAbL82yLixQgxMAE5EK9pmGUE=;
        b=DU2X0/J3bwGPnRiHDc81otY4RGlsNPu7wKms896YiqF8QVM6iJB6e5KgWX9FUhnEIN
         IoP8LZ/0emFz/cOwb+WHgEb9mx1aIMPgWHafLmq56ZCm7YIqgAG+9Bw3rFugvtqu1kv/
         wWTNxj4AFl4yaQvp40O7ndMAQ1MVsjSjXz/CboTns3PuaD1tbB99JFdMVP1bF/5yCM+4
         IsSACJU4iOLgBsGyBLb6DWN0Tq6+3IyG/mrQjsVdEyce7/kEACoTodBBUEgobhJayAwb
         I9HnQhtk7WxZfMj81+6rhq1lTmuWNhE9yvPPjx9J9KO7PdNp2wKK17lmuijhn4pJH6o7
         HMqA==
X-Gm-Message-State: ABy/qLY6CmjRHTbwVs0mYNsc5T4Rkw/Y/JWmq0QdYqC6AFB3s/YoW1Dq
	y6uwel2glTmJB2pbPkYFzgHWog==
X-Google-Smtp-Source: APBJJlGCTtGhTaneaRHfpnSSBpufd80KQLhpdGgirs5GF9QNXCoE0tA/fwfVE/z7C7u35GwNkjGYAw==
X-Received: by 2002:a5d:49d1:0:b0:314:172b:a75a with SMTP id t17-20020a5d49d1000000b00314172ba75amr2033659wrs.26.1688119545073;
        Fri, 30 Jun 2023 03:05:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0031424f4ef1dsm743280wro.19.2023.06.30.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:05:44 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v2 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Fri, 30 Jun 2023 12:01:52 +0200
Message-ID: <20230630100321.1951138-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100321.1951138-1-jstephan@baylibre.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_030547_282409_44507C75 
X-CRM114-Status: GOOD (  16.50  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This adds the bindings, for the ISP3.0 camsv module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml | 113 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..d81fa5d6db74
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSV 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
+  receivers. The number of CAMSVs depend on the SoC model.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-camsv
+
+  reg:
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: cam clock
+      - description: camtg clock
+      - description: camsv clock
+
+  clock-names:
+    items:
+      - const: camsys_cam_cgpdn
+      - const: camsys_camtg_cgpdn
+      - const: camsys_camsv
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: connection point for camsv0
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camsv1: camsv@15050000 {
+            compatible = "mediatek,mt8365-camsv";
+            reg = <0 0x15050000 0 0x0040>,
+            <0 0x15050208 0 0x0020>,
+            <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+            <&camsys CLK_CAMTG>,
+            <&camsys CLK_CAMSV0>;
+            clock-names = "camsys_cam_cgpdn", "camsys_camtg_cgpdn",
+            "camsys_camsv";
+            iommus = <&iommu M4U_PORT_CAM_IMGO>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    camsv1_endpoint: endpoint {
+                        remote-endpoint = <&seninf_camsv1_endpoint>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9fda342ad331..60b2bceca584 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13355,6 +13355,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 F:	drivers/media/platform/mediatek/isp/isp_30/seninf/*
 
-- 
2.41.0


