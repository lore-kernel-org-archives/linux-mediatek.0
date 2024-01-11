Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B32C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/hW0eMP0R26bZoJ7D3kVMQU+mn9+CNKwNbl/G0tADY=; b=qwBTFgt6kxRpFo8SPCYYjlhvdq
	u9cCKclhVxiS+at/1d2evmR6cnP/831czqG9Tbf8zXGE/3uAkFFj3ilDquOdLJkB8GRc9AORtr4WO
	KOV2hiMFaH2/NQsU9eb/zgWFW+WdK0z++fU2TxEfeq7iTfn+1bpMf0nZXFeXV5v+FkXiTtXbmkJ1g
	UytcmV9I7S94c+LSYLGVMgy02oqB5KCgbZm8veZyl5d7wCf9k2E1FhF/ZCcX7KeZEqS/TufRIg5rJ
	uzBBneSqO7i5XdaMTK2jXiWRS/e9PKFKjhhHu2WD6/NTyCj/pMhj5pOEM0k5+yd9Dqs0qYEiJDE+G
	EesF2nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNs5p-00Gw8R-1s;
	Thu, 11 Jan 2024 10:15:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNs5i-00Gw0D-1W
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jan 2024 10:15:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40e60958d7aso1716815e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 02:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704968113; x=1705572913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/hW0eMP0R26bZoJ7D3kVMQU+mn9+CNKwNbl/G0tADY=;
        b=He/2mT6KWkFiFmNM8ptEQysYqnJDip2Q3/2IsWgCbF6Jin+uytEG/uS54jgzMgDqfQ
         mPGJp9ucx1afN8YEi6A8j31uhMk4S8flFHmYK3tRMw5b7fQhXmlN5Ahk4FNXkG3r86Tl
         3pH32X0Y1S6363nAnmNxS+6cfgHz/XvmvzuC0aPe8tJrgMYoHsJR+FZ03ypapKpvc+C6
         uQtecwCbmJP+hXWlXJKvn1semc3qwDN69gK0u/kz6Ol9aHI19ReGls5YRdwO12uV9b5O
         WP6uVwNOSfrXrHtHgDmWoMSZ3rUGlaUVsx/xkojC9XBDbFkoCZ4M6zGTMbgzerKdh0e6
         YRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704968113; x=1705572913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/hW0eMP0R26bZoJ7D3kVMQU+mn9+CNKwNbl/G0tADY=;
        b=vL7Wa8slQVFc3gqF7cG295g+XEBn2S5V/bgyxI1AsZTAEtjOnWpNWLbyDy+8vvIGfB
         CPgnZhpx3Yrpb3RSGrkOjULZ2Omor9kKfwOC3jjgTkKZ5CRLoeSLgks31J7vLFuhgVu6
         F3yn+k5MdhZ+T7+9KwYQSMzTSYd/R3KlWfbsdDmdu3Q734EI5PolhPYsQVjdE5sa2ZrW
         PFUyzidw6mRnfxdzMdeVfN5HpcyVwYfXfW9PkEgCwdHNv/hQYmC1N2eJ/C1NY1VrXciq
         vyIRp1fdaGM3dRqF0Vt+GsBBblJaBXjt5YAp5CgMKikdbVruAU1VOJbQ01HuXKaMSxW1
         8pCQ==
X-Gm-Message-State: AOJu0YyQMC9O6/Jj1uhoHXXlezV3CVUrJVw+VUiYJX6SU1BS5y2H3khH
	X8roLAWiFjOz6q168s82qMFef1It9EouQg==
X-Google-Smtp-Source: AGHT+IFyvfnJPRwTsXpGb2dr4GW0LFIBK0jrx5pf/pI5bprzOQBwjVWroWaZz6UXvbjD6JidFSNScQ==
X-Received: by 2002:a05:600c:3ba0:b0:40e:5b66:f4d9 with SMTP id n32-20020a05600c3ba000b0040e5b66f4d9mr300477wms.79.1704968112988;
        Thu, 11 Jan 2024 02:15:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm5157758wmq.29.2024.01.11.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:15:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: phy: add mediatek MIPI CD-PHY module v0.5
Date: Thu, 11 Jan 2024 11:14:50 +0100
Message-ID: <20240111101504.468169-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111101504.468169-1-jstephan@baylibre.com>
References: <20240111101504.468169-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_021514_520211_214A94E5 
X-CRM114-Status: GOOD (  17.74  )
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

This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
some Mediatek soc, such as the mt8365

Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 79 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
new file mode 100644
index 000000000000..2127a5732f73
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,mt8365-csi-rx.yaml#
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
+  Depending on the SoC model, each PHYs can be either CD-PHY or D-PHY only
+  capable.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8365-csi-rx
+
+  reg:
+    maxItems: 1
+
+  num-lanes:
+    enum: [2, 3, 4]
+
+  '#phy-cells':
+    enum: [0, 1]
+    description: |
+      If the PHY doesn't support mode selection then #phy-cells must be 0 and
+      PHY mode is described using phy-type property.
+      If the PHY supports mode selection, then #phy-cells must be 1 and mode
+      is set in the PHY cells. Supported modes are:
+        - PHY_TYPE_DPHY
+        - PHY_TYPE_CPHY
+      See include/dt-bindings/phy/phy.h for constants.
+
+  phy-type:
+    description:
+      If the PHY doesn't support mode selection then this set the operating mode.
+      See include/dt-bindings/phy/phy.h for constants.
+    const: 10
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - num-lanes
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      csi0_rx: phy@11c10000 {
+        compatible = "mediatek,mt8365-csi-rx";
+        reg = <0 0x11c10000 0 0x2000>;
+        num-lanes = <2>;
+        #phy-cells = <1>;
+      };
+
+      csi1_rx: phy@11c12000 {
+        compatible = "mediatek,mt8365-csi-rx";
+        reg = <0 0x11c12000 0 0x2000>;
+        phy-type = <PHY_TYPE_DPHY>;
+        num-lanes = <2>;
+        #phy-cells = <0>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc92b10a4cad..37dfa99b0eb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13569,6 +13569,12 @@ F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
 F:	drivers/media/platform/mediatek/vcodec/
 F:	drivers/media/platform/mediatek/vpu/
 
+MEDIATEK MIPI-CSI CDPHY DRIVER
+M:	Julien Stephan <jstephan@baylibre.com>
+M:	Andy Hsieh <andy.hsieh@mediatek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
+
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
 S:	Maintained
-- 
2.43.0


