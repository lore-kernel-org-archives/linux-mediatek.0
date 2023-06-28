Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6018CEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpxKkOH7gRTDC4QodDjR2wwv58iUFQUpm2dZjJmE7Cs=; b=4VcOckWDfaP44FtVH3yGCTu0N9
	fZag8GJJTtdQold1LpYCectbtwE8FO9JoRwTAn6eXmp+RoM3iBn3lXUZLxF6xGyAMHYGQ+OMmdR1A
	7ytVe/c2x3F839DTlJ8XHIgtzF3o9Y2owy5vhYtKut+o0ViAQFd9iQfWgqE8R+2MAMHwnp2Q0gcFM
	YgnKjCyHFW9WRspkbxxXqGlunU2hL7JY4sVUtu/l7yJL79q13W5GHyLwe7aooU7cgfIuir9dpG10N
	mRx8W0WderVkQE7KI1R515s1pNMp4/PRM3T3qI5jSHW+hdkvujm2QSFDaOg6CL2lVTl9I3oOZkLpO
	UhBuMuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWZT-00FuFa-2s;
	Wed, 28 Jun 2023 14:55:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWZO-00FuCY-39
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 14:55:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ad3so33298625e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687964097; x=1690556097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpxKkOH7gRTDC4QodDjR2wwv58iUFQUpm2dZjJmE7Cs=;
        b=Sc2VKBypeamq/KpzUYYqaXbpP8+zkQyaEAE+49/cvje7GbP404GZiQ/kSLDIib3AM4
         H/iwv23if4IkDjbxUN53YrJKApEusUQclUtgy5uiw/+XtKjxb7RXVaL2Bp2tidBWePZa
         KKPbiWvs7Yi/WL/abPgdhLHdLqlJoUz7zkPHqP9ynGF++2xysI65eAPLLV1cDmhkcfqw
         pKOokruMWryIeg/lZQ0lIeO+XGQ7GKlGePrGnm3Ei9xYTBDPNUOoKUfHg/Il9VhpdC+1
         /GdVbYdgXbqF/qGntRgRKK2NlpJ9Wnl3ncFidOM2v8sAfYywOXMgcvZ+NsxcNwuN3TZm
         3h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964097; x=1690556097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpxKkOH7gRTDC4QodDjR2wwv58iUFQUpm2dZjJmE7Cs=;
        b=aDoFoCZUWjJGi6WCEsMgh0cUmkali9LXFRdJvcah+7ihURMLqSL644gwK0//zE5vab
         fq5q2PGxRIaKApPjYJgTbL772AL94aRHcGX8TUsIU4ut3rQ37qbLBZHaI5GvuOrAxrfo
         b66XncrQmPOdN7C6vlIvttyC7P6j1NuqFK0Dfbur+txpISMqzTnM2Z4X9rNz1z01gIj/
         eu9Nj91xIgH9Tl/XEY2akD8ZSpBjJeCyiSYfQVSwsXrbGNo2kchlC7GuUbl+5b6/Q85q
         d/Lg05HMYV+LwrckM9B7EBMfkqD82L1ulXaLVcmIMvHrdBpVVpuwYkrBnLAGMPXFXgTc
         3lwg==
X-Gm-Message-State: AC+VfDw2ZGqImIW0aM/oU7cKpiGwf2zDeo/m4puY9vrzDg6gYEh3I76C
	S3ReCByJ7WHFXT+IT+FH+idkkg==
X-Google-Smtp-Source: ACHHUZ6YpTtwVp8ACUoY4uDm9mxJgfRSQalAzH7hr8F5SqjU+Do45aNRMWAHUJ84pt7tZydoecseVg==
X-Received: by 2002:a7b:ce94:0:b0:3fa:99d6:4798 with SMTP id q20-20020a7bce94000000b003fa99d64798mr6450489wmj.37.1687964097784;
        Wed, 28 Jun 2023 07:54:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k16-20020a05600c0b5000b003fba6709c68sm4846278wmr.47.2023.06.28.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:54:57 -0700 (PDT)
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
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
Subject: [PATCH 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Wed, 28 Jun 2023 16:52:54 +0200
Message-ID: <20230628145412.1610260-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628145412.1610260-1-jstephan@baylibre.com>
References: <20230628145412.1610260-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_075459_014252_1ABC1878 
X-CRM114-Status: GOOD (  17.04  )
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
index 000000000000..e8ef6e0fd4bf
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
+        patternProperties:
+          endpoint:
+            $ref: video-interfaces.yaml#
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
index 4f83682732e6..2256ddcc4ca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13261,6 +13261,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 F:	drivers/media/platform/mediatek/isp/isp_30/seninf/*
 
-- 
2.41.0


