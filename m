Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E39C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29F620867
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lAOxPyz4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J/y1B1KH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C29F620867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pz3HygLkMBVR9kypEpDvuhNChuASH/H4/EmmrYyYzMk=; b=lAOxPyz4G/8Td7ZHBx5ECIEfd
	Z+GKTFo18qUDDdMEJSPUXjWMOUbufBXLAqHYdcUK4zlKk8UuPMdBCaJwWiUlDjNZEHx8mXc5cReQk
	EuA9PDKnPjkDt8nvFIyIExcPk3mdjZ10e0T7IyGKKNOK58Y27LijliteWdQ+uzEHkby5eXuu2KIgH
	AHvZ5FeruDZFhUJZ8s6H4beXbD2kwCTt2LYeuJ1WuV2rjKnuAtLDylz13pZr2iKaiUug5HMge5KXN
	MWztac93IZzLvPXKkBp/EqmZ+qjYgNZvaYqlrAqgqJuWTm91dGSSUE/8vTdV4qQtBx01zNSvOZYAw
	v3Vv/jidA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfImj-0000yg-5s; Wed, 18 Nov 2020 08:25:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfImU-0000rA-RU; Wed, 18 Nov 2020 08:25:36 +0000
X-UUID: 2c9455d3dc44422c83635f3ea8b90b72-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x3OZkTeMneH3ug/2tg4HC/tBuVKt1WyK8wqQfXEWq0Q=; 
 b=J/y1B1KHRN1HJqgjB2nclVGG2aI6krqnOFUBi4XcBV0pq67+MRCwIAQ9p+AwY6s5GPlu9Qs2Zhi9JZEQzs4wEWMH5Egc37HnFIawBxDZdbOS2nZ1HH8RiNknj9Lcxt0oQLJawiMYaRrcve9sub9aPRPualEhYcS5R2xa2lT1684=;
X-UUID: 2c9455d3dc44422c83635f3ea8b90b72-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1543762143; Wed, 18 Nov 2020 00:25:27 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 00:21:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 16:21:45 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Nov 2020 16:21:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 05/11] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Date: Wed, 18 Nov 2020 16:21:20 +0800
Message-ID: <20201118082126.42701-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_032535_112828_E22F46B6 
X-CRM114-Status: GOOD (  19.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod
 Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml

Cc: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3: add Reviewed-by Rob
v2: fix binding check warning of reg in example
---
 .../bindings/phy/mediatek,ufs-phy.yaml        | 64 +++++++++++++++++++
 .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 38 -----------
 2 files changed, 64 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt

diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
new file mode 100644
index 000000000000..3a9be82e7f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,ufs-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Universal Flash Storage (UFS) M-PHY binding
+
+maintainers:
+  - Stanley Chu <stanley.chu@mediatek.com>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  UFS M-PHY nodes are defined to describe on-chip UFS M-PHY hardware macro.
+  Each UFS M-PHY node should have its own node.
+  To bind UFS M-PHY with UFS host controller, the controller node should
+  contain a phandle reference to UFS M-PHY node.
+
+properties:
+  $nodename:
+    pattern: "^ufs-phy@[0-9a-f]+$"
+
+  compatible:
+    const: mediatek,mt8183-ufsphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Unipro core control clock.
+      - description: M-PHY core control clock.
+
+  clock-names:
+    items:
+      - const: unipro
+      - const: mp
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    ufsphy: ufs-phy@11fa0000 {
+        compatible = "mediatek,mt8183-ufsphy";
+        reg = <0x11fa0000 0xc000>;
+        clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
+                 <&infracfg CLK_INFRA_UFS_MP_SAP_BCLK>;
+        clock-names = "unipro", "mp";
+        #phy-cells = <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt b/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
deleted file mode 100644
index 5789029a1d42..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-MediaTek Universal Flash Storage (UFS) M-PHY binding
---------------------------------------------------------
-
-UFS M-PHY nodes are defined to describe on-chip UFS M-PHY hardware macro.
-Each UFS M-PHY node should have its own node.
-
-To bind UFS M-PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS M-PHY node.
-
-Required properties for UFS M-PHY nodes:
-- compatible         : Compatible list, contains the following controller:
-                       "mediatek,mt8183-ufsphy" for ufs phy
-                       persent on MT81xx chipsets.
-- reg                : Address and length of the UFS M-PHY register set.
-- #phy-cells         : This property shall be set to 0.
-- clocks             : List of phandle and clock specifier pairs.
-- clock-names        : List of clock input name strings sorted in the same
-                       order as the clocks property. Following clocks are
-                       mandatory.
-                       "unipro": Unipro core control clock.
-                       "mp": M-PHY core control clock.
-
-Example:
-
-	ufsphy: phy@11fa0000 {
-		compatible = "mediatek,mt8183-ufsphy";
-		reg = <0 0x11fa0000 0 0xc000>;
-		#phy-cells = <0>;
-
-		clocks = <&infracfg_ao INFRACFG_AO_UNIPRO_SCK_CG>,
-			 <&infracfg_ao INFRACFG_AO_UFS_MP_SAP_BCLK_CG>;
-		clock-names = "unipro", "mp";
-	};
-
-	ufshci@11270000 {
-		...
-		phys = <&ufsphy>;
-	};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
