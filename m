Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B36C41513
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBy/fPgo/hYXurWD6RnpLpdL4CrExU7MOBsmQrPWcBg=; b=HbZwYIg4yWDUruRt/2DB2kWg4x
	jKdKJl5EZ7RKIHLn9vYU+Qx79MR8fPQYUJu/l7ryD0lJgRHmWOVTnBlPUEzlyPwnfKA+OSnwUxe8R
	Qx0CcSRZ4hvPfDmGpglfnEZTHc+JsFJM6XiiPIsxmyiqn4ItubVSMKqSlMlErzNfht7O9O78C3DMc
	KqwkVqS1uOHOfcy69eXbcDWM1LsgLOcM6JCb0UhCEpPyo9Tb1QNf/S+8nUi6JFfiN5yOm3Op5HAL1
	u0S8qhOs8pWW6I5CxCQNOgFbqTIR6tW7kx5ZRHvsXME/a0jy94ZHwn/gj+fxqUA3KgoRAf4Pop5Ea
	dihfr0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwsh-00Gbj7-26;
	Mon, 07 Aug 2023 09:50:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwse-00GbhI-2y
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 09:50:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so26308625e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Aug 2023 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691401827; x=1692006627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBy/fPgo/hYXurWD6RnpLpdL4CrExU7MOBsmQrPWcBg=;
        b=dMTR42xfYtTt+sU0bumJxNZoyRyqDkQa9ifPRJ5EzIQPG7W4bYCJN4Yh5uzrmz1aT3
         hZX8lflQBTaCySJXplN6vG49E7bK6oueOKPM3NByNq/BMWe6cBOcu9Rr1DYWEXmzdb+B
         YeVDxGI2zbaX1m5sTlt3r8AVDPr6PipISUJtMPsk92VZiaXp9qhAhVxRX6f188Tbn4Ao
         d/YUFLhr88HaNZc+mv3Vgt2URfu1YbG2NNX2FgqnbFQ28B4hRN6e3QfXoeSFveU7ENk1
         8Pl6ka8YuY+LbPNjiHAtaMbMjdReKz1UtGel2ij9cMpA4UwRkUTF+RNbKKr/NzqR/27r
         iS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691401827; x=1692006627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBy/fPgo/hYXurWD6RnpLpdL4CrExU7MOBsmQrPWcBg=;
        b=TbRbNTtFEkfZ42/SxNSEMsUwDeXAMu8pY12RYbyZHtSlOSX5dIbW6o/DgP98oe67hC
         ZqzyP/q/c7ArZD2Rlsi5K6hZxYdIJzb+707jzaXksZpM9H7h212scKyzBDoOXL/iI9rC
         vudjq6QodvJj7kqh5Xv3TTP6acuBFHgGQWgD8Y4BInc8dvASOxfKfB+OcR622+U2aoXm
         wnwK/SUUfemS+R90EFlS1hnhWNocKXdBNhPDENEmfWRodz0h5S/MN1mlhKWEscDaqQLS
         VA4vYIsttsTt93hn8F/rRJkLzO8eCKn6VcSHbaVEmRnPDGifcZ5fk+WmlkXbVMhv7Nhr
         pYow==
X-Gm-Message-State: AOJu0YyWYsGxdqmCyau/nyTVj7zNeYq0KsMxw2sxc5O3lEEBqwvZG9F9
	yA+T8Kfuv5o0UI9KMaZp3ZpoAw==
X-Google-Smtp-Source: AGHT+IHEb1gwsP/mnI/AlQiOHgdrgLDb8eFf3CjDco0QSR1f6VCNeu6WWmn4kc1FX6you796r1Vvlg==
X-Received: by 2002:a5d:5101:0:b0:317:6129:a972 with SMTP id s1-20020a5d5101000000b003176129a972mr6419596wrt.37.1691401827316;
        Mon, 07 Aug 2023 02:50:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id i11-20020a05600c2d8b00b003fe5228b78dsm2752429wmg.1.2023.08.07.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 02:50:27 -0700 (PDT)
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
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Mon,  7 Aug 2023 11:48:12 +0200
Message-ID: <20230807094940.329165-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807094940.329165-1-jstephan@baylibre.com>
References: <20230807094940.329165-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_025028_958656_A30E857D 
X-CRM114-Status: GOOD (  16.38  )
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
 .../bindings/media/mediatek,mt8365-camsv.yaml | 109 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..097b1ab6bc72
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,109 @@
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
+    items:
+      - description: camsv base
+      - description: img0 base
+      - description: tg base
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
+      - const: cam
+      - const: camtg
+      - const: camsv
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
+        description: connection point for camsv0
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
+                  <0 0x15050208 0 0x0020>,
+                  <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+                     <&camsys CLK_CAMTG>,
+                     <&camsys CLK_CAMSV0>;
+            clock-names = "cam", "camtg", "camsv";
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
index c5a97f692422..fd192d3799b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13364,6 +13364,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 F:	drivers/media/platform/mediatek/isp/isp_30/seninf/*
 
-- 
2.41.0


