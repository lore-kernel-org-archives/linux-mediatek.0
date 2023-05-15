Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB167C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1U5d4MLxOVRGxYrIG94ORc3atBG6AwDIhORaNjU7E8=; b=ng3yYJzLyHlAWMhQGBFWfNArOm
	974sUSmbimH2YYcFq2O4CrvnUnAsPLZZTFTPXDplpKY51eItjy3XzbAnwffX7hW9H4KaKbPukgM4A
	28YZFELOGx/sFLsMqACHtS/9cCXv4qDnV3aW6nZ92MsDVfeIWm1Qdv8QLQXeirbJ/XbLfq+J7ZUji
	AA//2P02aOHk+Arb9jWR5qp93SGzWFTTP7skcuc6bt19BaL8+YyXXMzJAFtw8xVEOILkISyRPh8M+
	s+YABDeXwD0rBP7odyJkrsENO/Y3LIiAnB1HyANWLomXvi2w2ZXf8a67q2ZBwZe8zOAR/1ivBwSRL
	RnBJ25gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUcZ-001Zxk-1U;
	Mon, 15 May 2023 09:35:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUcW-001ZvA-0X
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 09:35:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f427118644so80923675e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 02:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684143355; x=1686735355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1U5d4MLxOVRGxYrIG94ORc3atBG6AwDIhORaNjU7E8=;
        b=0I7No2h2vVPxZmELHElkO+DCMmo/7h06fCuFCt9VWkpo8/xiz0U4nvQr+oP9mcYZtf
         FX4pXi+9qn6fWaFgnuy9ee8GlUrAvc8uOIPfMUmMy7ACNpBV4nfERAdFfCntOoJ20RN9
         zoQsNqlbnxRL3Gg+Kxjq+LQr44RsWRr1z+XR6KwIl47cS1kUp2xFQg0lQLdiHdPsWGRR
         eAA0GQQjkW/1ExWten9k75ga4J8zLaqeB3zjT9+EgCjfS4qgaI50Zsg4keJHUZPEA3V1
         XL1tbgpzyYuCd+brFvK8S14n9y8WsypZnjmYhBHTwpgto1VIDsbN7OmbxQm3QCNaUEas
         mfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143355; x=1686735355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1U5d4MLxOVRGxYrIG94ORc3atBG6AwDIhORaNjU7E8=;
        b=TKPMNwEeNJCvrQWs2diovqapDDG+ZZ1smH0nBx51qu29C18OlQ8de7abmuSGP8215c
         caH++Su1ZotiMKlJCJ0EUi4m+UPLp+FnmELByIC5yStFEnrxAUzMGfQnRduMBkHzsaIC
         vJyk/6Hb4IEWHNwKFPBFf6DyD3pPWYvWEoFEPm7MA773WEOUi63rGlSLgLTci3e36GS1
         dg9yQ2RKJLNwwKxo134D2b09k1Ox9cRGgF3OUYUpo5uCqiqHsFhUV8Gt045s4qlUkf41
         WF3hQc2aup/mP4bwDBrIbG5VgtiDGxEMfbegFkHSbiSPVRmAVBYdoxJ3JfYWi7+z4KPF
         sEkw==
X-Gm-Message-State: AC+VfDxnAPwFHgfaYTRP4PYBsKvemntJiwZNaXnrPALvd+h1AIx0f7fA
	IIKQ6Se4SxAEBqpQwQW2XjFsqlBxIlN/8YKimZO3P2UZ
X-Google-Smtp-Source: ACHHUZ7+Cb+vH+WpGUTIuorFy/U4TAkpqUMxuly4awYN+dmnigKVjCrRjrsxKfKFu1bnpDBzyacmPA==
X-Received: by 2002:a1c:cc0e:0:b0:3ef:622c:26d3 with SMTP id h14-20020a1ccc0e000000b003ef622c26d3mr26682092wmb.35.1684143354910;
        Mon, 15 May 2023 02:35:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id z22-20020a7bc7d6000000b003f42813b315sm21035451wmk.32.2023.05.15.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:35:54 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: krzysztof.kozlowski@linaro.org,
	robh@kernel.org,
	chunkuang.hu@kernel.org,
	linux-mediatek@lists.infradead.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: phy: add  mediatek mipi csi driver v 0.5
Date: Mon, 15 May 2023 11:05:50 +0200
Message-Id: <20230515090551.1251389-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230515090551.1251389-1-jstephan@baylibre.com>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_023556_208102_EEE99B12 
X-CRM114-Status: GOOD (  16.88  )
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

From: Florian Sylvestre <fsylvestre@baylibre.com>

This adds the bindings, for the MIPI CD-PHY module v 0.5 embedded in
some Mediatek soc, such as the mt8365

Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../phy/mediatek,phy-mipi-csi-0-5.yaml        | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
new file mode 100644
index 000000000000..5aa8c0b41cdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-Only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,phy-mipi-csi-0-5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Sensor Interface MIPI CSI CD-PHY
+
+maintainers:
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
+  receivers. The number of PHYs depends on the SoC model.
+  Depending on the soc model, each PHYs can support CDPHY or DPHY only
+
+properties:
+  compatible:
+    enum:
+      - mediatek,phy-mipi-csi-0-5
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+  mediatek,is_cdphy:
+    description:
+      Specify if the current phy support CDPHY configuration
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mipi_rx_csi0: mipi_rx_csi0@11c10000 {
+        compatible = "mediatek,phy-mipi-csi-0-5";
+        reg = <0 0x11C10000 0 0x2000>;
+        status = "okay";
+        mediatek,is_cdphy;
+        #phy-cells = <0>;
+      };
+
+      mipi_rx_csi1: mipi-rx-csi1@11c12000 {
+        compatible = "mediatek,phy-mipi-csi-0-5";
+        reg = <0 0x11C12000 0 0x2000>;
+        status = "disabled";
+        #phy-cells = <0>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6d54f3193075..44f0ff11e984 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13098,6 +13098,12 @@ F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
 F:	drivers/media/platform/mediatek/vcodec/
 F:	drivers/media/platform/mediatek/vpu/
 
+MEDIATEK MIPI-CSI CDPHY DRIVER
+M:	Julien Stephan <jstephan@baylibre.com>
+M:	Andy Hsieh <andy.hsieh@mediatek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
+
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
 S:	Maintained
-- 
2.40.0


