Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bh8UBYjGCwQj7x8ihMzIjP9ohvfSM67HhC7udi0j+Ns=; b=WJBwlPTflN4nTX
	y9b88YaVBMBUQS564JeqJIEb5hvMaItinSeu0M1/DVWQMIr0JS+FfAi8Qaz7xfi5fc4x6WCf9eHTs
	oiA9CfvSBesE1bURUeSxGDX26viwD0q1vkhsc0liAS9wVipBto7GpkpF72mGz28rv4JaGuKBseGi/
	r8cwhPszhWhNWg0mxUq7JsQWPMrhLfsSUU7oIMRFZa8SIfJ2F7yRELSQnnEBARpIinZE2Y3gFAril
	mngptLXwXHoJxZgiWPj9eXFHUBxdXbBCwwc9yuXq5uW1Tmk76rDMwqyFrZRawfVDBWnpFi9+p2/Ze
	D+qGipNw0/qj6LEt/sLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQorH-00EX65-L4; Sun, 06 Mar 2022 11:15:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQooJ-00EV67-O9
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:12:25 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3E3443F61C
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565112;
 bh=XXqgQ+cuaWzLih+IxYNjcqnJP94TLIhig/Ow2N98IAk=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=AVU6NQtFezq9rbIvzKbrVdpvb9QHrCv5SSapf6JIEr0bXdrD5WOZdbqTrqc4MDiBH
 6ou8tsjYHSXVSSFgdIiZ+LcqtUIvQnehBbh0cfT65sXKh8BJwFeZhVYqEYWNusOSxA
 jVtr6AFLrZxXKqyTlnmTuU20eGgzYzK08a0nm7fCnWVVtlrcnenLBhk6RuT4fvroKD
 ZqB+u+Hw0ExMpOn7w68R5o/pfsij0R9RszPM/K4FI3iqlxGsw0yJFFiWCBCuiE4nJH
 gUVHem2aWzicqu8aSECa8bS0CBpOOlmsjmKzno7XoXLscZ5h5MoCx1DjrimDHBW2r3
 44vus5v/bcCLg==
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a056402054500b00415ce7443f4so5815471edx.12
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXqgQ+cuaWzLih+IxYNjcqnJP94TLIhig/Ow2N98IAk=;
 b=RdbNE0mSacG1wLRS839+FW5YSER+y7wcD5h2NRJcE/pEPu3zfKvWg0l8MY2BOu441X
 YOgE+TVhZOPOam0v2urmb778yl1FRg8qK0QkkaklzpkWQFILKA/Lvap58wSfEegU4noD
 RvDZViR7LXw0UweW2OCYOlUnF4mUhefhAwqXILAzHg/+nzuppSat7zx1xBwB/r2cO7W5
 LFXRgCfV+i2XGWPDg7OnuUAz69mLcQldcg+dDIBTTrMe+O6WuL7ncZ6DOrgVJlBbDx0Z
 JXDhvI4p/thkY5KLSurlMZhpUgRA445NPofwPFF7f7lsdDwW+ej4/5X2CCaNsqGtEOqu
 clRw==
X-Gm-Message-State: AOAM531LaV9cXPFkWZlLy/I8rviXLynno8cdqT4Gnkn1FcjFwN2+ven4
 DZOuo6Mb2BDQtmbQ/bYc4n+R3BhN6rAl7T+LEitxaoHDLPuyKpC39OWJ5EXKR/jmiam2ricxGN9
 2zjrH3QzN9/iuE1/9rz0WpV99HpdW1sLm9oo44PtidjCCdcu4bQ==
X-Received: by 2002:a05:6402:424b:b0:40f:1386:5fa6 with SMTP id
 g11-20020a056402424b00b0040f13865fa6mr6352594edb.268.1646565094788; 
 Sun, 06 Mar 2022 03:11:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXebW2FRHxJVYm8J3fXHmnRdTAf7ZamehBdj0d6YMfLqjOEMT1nQnh5DIuu0Stinsuh9xtgw==
X-Received: by 2002:a05:6402:424b:b0:40f:1386:5fa6 with SMTP id
 g11-20020a056402424b00b0040f13865fa6mr6352563edb.268.1646565094576; 
 Sun, 06 Mar 2022 03:11:34 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/12] dt-bindings: ufs: cdns,ufshc: convert to dtschema
Date: Sun,  6 Mar 2022 12:11:16 +0100
Message-Id: <20220306111125.116455-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031223_953657_F96AD169 
X-CRM114-Status: GOOD (  18.85  )
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

Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
 3 files changed, 71 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt b/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
deleted file mode 100644
index 02347b017abd..000000000000
--- a/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Cadence Universal Flash Storage (UFS) Controller
-
-UFS nodes are defined to describe on-chip UFS host controllers.
-Each UFS controller instance should have its own node.
-Please see the ufshcd-pltfrm.txt for a list of all available properties.
-
-Required properties:
-- compatible	: Compatible list, contains one of the following controllers:
-			"cdns,ufshc" - Generic CDNS HCI,
-			"cdns,ufshc-m31-16nm" - CDNS UFS HC + M31 16nm PHY
-		  complemented with the JEDEC version:
-			"jedec,ufs-2.0"
-
-- reg		: Address and length of the UFS register set.
-- interrupts	: One interrupt mapping.
-- freq-table-hz	: Clock frequency table.
-		  See the ufshcd-pltfrm.txt for details.
-- clocks	: List of phandle and clock specifier pairs.
-- clock-names	: List of clock input name strings sorted in the same
-		  order as the clocks property. "core_clk" is mandatory.
-		  Depending on a type of a PHY,
-		  the "phy_clk" clock can also be added, if needed.
-
-Example:
-	ufs@fd030000 {
-		compatible = "cdns,ufshc", "jedec,ufs-2.0";
-		reg = <0xfd030000 0x10000>;
-		interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
-		freq-table-hz = <0 0>, <0 0>;
-		clocks = <&ufs_core_clk>, <&ufs_phy_clk>;
-		clock-names = "core_clk", "phy_clk";
-	};
diff --git a/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml b/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
new file mode 100644
index 000000000000..d227dea368be
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/cdns,ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+# Select only our matches, not all jedec,ufs-2.0
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - cdns,ufshc
+          - cdns,ufshc-m31-16nm
+  required:
+    - compatible
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - cdns,ufshc
+            # CDNS UFS HC + M31 16nm PHY
+          - cdns,ufshc-m31-16nm
+      - const: jedec,ufs-2.0
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core_clk
+      - const: phy_clk
+      - const: ref_clk
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufs@fd030000 {
+        compatible = "cdns,ufshc", "jedec,ufs-2.0";
+        reg = <0xfd030000 0x10000>;
+        interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+        freq-table-hz = <0 0>, <0 0>;
+        clocks = <&ufs_core_clk>, <&ufs_phy_clk>;
+        clock-names = "core_clk", "phy_clk";
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
index 4d13e6bc1c50..c5eca7735f76 100644
--- a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
@@ -47,11 +47,10 @@ required:
 
 patternProperties:
   "^ufs@[0-9a-f]+$":
-    type: object
+    $ref: cdns,ufshc.yaml
     description: |
-      Cadence UFS controller node must be the child node. Refer
-      Documentation/devicetree/bindings/ufs/cdns,ufshc.txt for binding
-      documentation of child node
+      Cadence UFS controller node must be the child node.
+    unevaluatedProperties: false
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
