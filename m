Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E63BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bgK81zYJJlKzJwC/YpUVSKkmte5LSImvMG9blyHL8w=; b=CchekWC16wBhxJx4H4qRGvUync
	9t1xBYcdzmHm0zgIX9DnKeEl0VrsJRfWrf1jAmMT6gGRzMXLBFGg528Q3JsH0f+peA/wRDCtEKQI6
	gMin7XJJy01RzDvYjuCm6I1iHkVxC0Z2UP99KGSYp+TDHhC1r/u4U44vGvXMPXMMaihNqV4bvPj4H
	Iio8Y5xKnYl1245+UhZ5ZPB5l2FUOZ9jc8pmo0YN3OkkjuvQB1nAF2BIn7cYvekUfWZFK2MFYKz/5
	NHbjeE9CkNM/s2yG93lJg2WktHhZG12wM1y6gbKBir/QoRnYjWU5B2KjnUsOvuPzZVbQ+M4AClCXG
	FLoZQmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jvf-00CnNM-1E;
	Wed, 24 May 2023 08:33:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jvd-00CnLO-0n
	for linux-mediatek@bombadil.infradead.org;
	Wed, 24 May 2023 08:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1bgK81zYJJlKzJwC/YpUVSKkmte5LSImvMG9blyHL8w=; b=oLka9Q2uEVDYgTJNz+1IZ3xdxR
	FaOXTm5dY8lO6hHM3+4zr8DcXdDKt/kzd++BpFbnbAey/iA2IyH8rs2z9XU8O60apVUvvR1VKNyLL
	AmptQ95/Ozdn4sTUCBFdzNDB2T63VFEQpGI7AKB20gV9wqcHPFa0nfu+pp2MS+15VPCpQhgdWlyKI
	BFLRsVdKUXSutfhRRdZHeP2E3z/sPugbSGDSZHwnl0cch5zIWis97YCmUGSnDKwIp996b5IwnYfrW
	xk1XqMJICPV4A2TRooaGZQwTJiSjyMElapQqFlrTOdZYxA1fJhqfFUR5RtBLs/CnBXmWRrA2LREAm
	D2ylBflQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jtW-004wSu-2Y
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 08:33:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso481836f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684917051; x=1687509051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bgK81zYJJlKzJwC/YpUVSKkmte5LSImvMG9blyHL8w=;
        b=q3rlhiN1dqBA2GKz3Baz0KFqAEsTk9Qe+RSwPRNOe/jjZ3ukXTwBxzpVyKlxqS3oJk
         BikGg2jYUATGzhaIdGoeT/DrFEkG8IDjhW5p65ywpyai0QXsEH/hv9LzF2PVM4/bcUpG
         TTPCH9s57Yp/5jPz1TCf1SW3gnCEo7w06js9iutJCPnpdnSOnHnlFs+313+Apq9cJgtu
         7x8RzeXcP/ArERx4Vg6UdoEjNUjJRmhy7qgCR6GzK4SfoMuE23SG8pbo594k6H1c6JXs
         DCsfmjLYVxHZO73M52cFGNZJDtdjFM3Dh+RRbIpvlR4UfYU5xv0YmViBPjducNXwgp0U
         j8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684917051; x=1687509051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bgK81zYJJlKzJwC/YpUVSKkmte5LSImvMG9blyHL8w=;
        b=OH0J64SOkKg4aHseYy4DUXuLgRVreKeKIgz6SXbWPKqspZDcewjSM75l/7xEhDd/+5
         JJWng9q6S6qt85p5dWMLm1ga0kKnSF/pmisPluA93HmLhjN2LMylt2Gw8bhU2AU0fgjl
         r5sJ4OnmLn8wkDvRQGR4KZTIKtfjA5+J47CRnXCwcALnBJU7JWd3xglRrDlyZL3Yq+Fu
         5afuVNmj1qCWTWL3Nivc/X/p/ZVgxgj3g2UtukF9R67cFJy0/bGAMUZxOfo7YdPOt6cC
         EsP3B20c8Rvz8BdaurSM4diPiUGSy17UEyCKWO1c2pW5/JYS8U8eeQ/Pr8EMKsUdwGBF
         K1qw==
X-Gm-Message-State: AC+VfDxx7OUU1uj6AJRD/p9bsrOAf1jB6ttHmRtkzdpho7xdgY4Y9t1s
	wiQLWxc+Xj0oI9q7oQD+DDTc2A==
X-Google-Smtp-Source: ACHHUZ4rg9xDTlc33OxE5pi3GZwUh53PWH0eMhBen5R9zYe/bMYwZfbseDecOPk9Jj73PjeMwBppWg==
X-Received: by 2002:adf:ef42:0:b0:301:8551:446a with SMTP id c2-20020adfef42000000b003018551446amr12446568wrp.2.1684917050983;
        Wed, 24 May 2023 01:30:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b00307c0afc030sm13871832wrs.4.2023.05.24.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:30:50 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: mkorpershoek@baylibre.com,
	khilman@baylibre.com,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
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
Subject: [PATCH v3 2/3] dt-bindings: phy: add mediatek MIPI CD-PHY module v0.5
Date: Wed, 24 May 2023 10:30:31 +0200
Message-Id: <20230524083033.486490-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083033.486490-1-jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_093256_456708_6A152628 
X-CRM114-Status: GOOD (  16.53  )
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
---
 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
new file mode 100644
index 000000000000..a1bd96a98051
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
@@ -0,0 +1,67 @@
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
+  '#phy-cells':
+    const: 0
+
+  mediatek,phy-type:
+    description:
+      Specify the phy type. Supported phy are D-PHY only or CD-PHY capable phys.
+      See include/dt-bindings/phy/phy.h for constants.
+    enum: [10, 13]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - mediatek,phy-type
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
+        mediatek,phy-type = <PHY_TYPE_CDPHY>;
+        #phy-cells = <0>;
+      };
+
+      csi1_rx: phy@11c12000 {
+        compatible = "mediatek,mt8365-csi-rx";
+        reg = <0 0x11c12000 0 0x2000>;
+        mediatek,phy-type = <PHY_TYPE_DPHY>;
+        #phy-cells = <0>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b81e9fcc66cb..5da594fbb761 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13184,6 +13184,12 @@ F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
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
2.40.1


