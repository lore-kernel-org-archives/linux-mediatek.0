Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D1DC433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 01:52:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C2E21D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 01:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lYBN9S7+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T4rpHgSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96C2E21D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0N0/smFuLNfanFHVjKLeIGbeU1X/zsfkAEF6TH8RPl8=; b=lYBN9S7+UXIWq2C5R8QCXEQ1p
	CSSQ5+cDh+qVrkBVVWzH6RFw6fOCOhKTHhJth2IdCeTI1p1dnMBtraj2m68iBb5TDMSJ4AQ1UGoDx
	WHhau9h/G6nBSIgBzpKhgqohXGZmfLgjDVPRbl3V6BiQwK1cWijrN8iP9FthIdy4hUY/kP8dclkQL
	C2xZsTgv7AbHLRc2sOtvsziANcqMTVJzP5O3JTNgr9WcssLN9HyCnyyA+DB4WyWptdaMw70j54ShX
	8GBiVEqZdGxSEnBzLT2iOh74DlHQNg3KzUMelzT/+lA/fTuw/gU5MUL04lrBwX98dDRo9Kz6iUtae
	e7vVeMHPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSVxK-0008HF-AD; Wed, 14 Oct 2020 01:51:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSVxG-0008DP-Vy
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 01:51:52 +0000
X-UUID: 7cbd5cfdde7a4122870bd649af0b52ce-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yU/qMyuYQN6+jcF7wWybgjSPMFFe8LTU7oNijK5E7Ac=; 
 b=T4rpHgSZ4MV9lLZNXdhGZh4zKVF/uCFCoJql/eSqunEvych9DxWIm33EttEUWMWwNR+iFsQRIKpPKrGyIcgeKqWBzlZ497rp9mHtSKy6cy6W8PjjFLf3IKmOmF75/OHAWRZMvryudX3Qb/2qCFzLB5ohut/H7Vfgyu7qozG1W+k=;
X-UUID: 7cbd5cfdde7a4122870bd649af0b52ce-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1361678138; Tue, 13 Oct 2020 17:51:43 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 18:44:49 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 09:44:41 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Oct 2020 09:44:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 3/8] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Date: Wed, 14 Oct 2020 09:44:29 +0800
Message-ID: <20201014014434.62239-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014014434.62239-1-chunfeng.yun@mediatek.com>
References: <20201014014434.62239-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_215151_167761_57D33ECD 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
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
