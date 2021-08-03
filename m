Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F4C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9353760EC0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9353760EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5a9FmVqjmvycy8HiKnqe7b8l0wft8I0UfeAx1jSkAYE=; b=IWgIfyfPwpDd5i
	feyAOzAuk7q6RvCHwgAfU5XR4KP7hwxjVfefyqwiCcTs5BIqDcHzs+hBaUjQZE5w3LaZltjHc2xHb
	mDc07iMYoLWnWWTeKtvR/2OvrsneLBgb8pIgviKMHs+RUDqSbszdaBfmPaB+Lpx0HhCGTyAfQD2IM
	HJSfcO3lkMFQbUSOdpUbFApyhWHTzbHw4tn3a2O/6cdBaSpcHiHqmuqRWug5inx9BKQUXbvpmgHQQ
	DdmPTVyHfBCaf6OiVt0BShNjc6A+LzsEuOEpVKW7Os2JApjDCw+n1qGCX8/evHAFDcJbZ04JLb0xR
	svMu14EQQDWmYo6iif4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApLE-001UpZ-5o; Tue, 03 Aug 2021 08:00:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mApKo-001Ugx-Jo; Tue, 03 Aug 2021 07:59:36 +0000
X-UUID: bbfb4eaa547a4f9fa2a2863cf009e536-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DAXrl9IgrN9/ZLMFJYkoh0q8YVrNw66rZPB7GLqsowI=; 
 b=FeXr6IDdyPCa9xMa0pGkVPHLloOF4DmCjvRD5BA17CNtc40C+PqLbO+OSHKHqpVnMseOQWlZT90XrT4aZkVSJJpCXBBF4RDIE8uEbLY3UU15WKtai7iEZ1d+oXN5nPuilbCJcEbyRA8GQVFtyTcAng6UHBYKezfEUSFuY1cb+1A=;
X-UUID: bbfb4eaa547a4f9fa2a2863cf009e536-20210803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1969521655; Tue, 03 Aug 2021 00:59:27 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 00:59:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 15:59:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 3 Aug 2021 15:59:24 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, 
 <krzysztof.kozlowski@canonical.com>, <shawnguo@kernel.org>,
 <sam@ravnborg.org>, <linux@rempel-privat.de>, <daniel@0x0f.com>,
 <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>, <fanghao11@huawei.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v5 4/5] dt-bindings: remoteproc: mediatek: Convert mtk,
 scp to json-schema
Date: Tue, 3 Aug 2021 15:59:21 +0800
Message-ID: <20210803075922.11611-5-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210803075922.11611-1-tinghan.shen@mediatek.com>
References: <20210803075922.11611-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_005934_689038_DF0D4230 
X-CRM114-Status: GOOD (  18.48  )
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

Convert the mtk,scp binding to DT schema format using json-schema.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
 .../bindings/remoteproc/mtk,scp.yaml          | 92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
deleted file mode 100644
index 88f37dee7bca..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Mediatek SCP Bindings
-----------------------------------------
-
-This binding provides support for ARM Cortex M4 Co-processor found on some
-Mediatek SoCs.
-
-Required properties:
-- compatible		Should be one of:
-				"mediatek,mt8183-scp"
-				"mediatek,mt8192-scp"
-				"mediatek,mt8195-scp"
-- reg			Should contain the address ranges for memory regions:
-			SRAM, CFG, and L1TCM.
-- reg-names		Contains the corresponding names for the memory regions:
-			"sram", "cfg", and "l1tcm".
-- clocks		Required by mt8183 and mt8192. Clock for co-processor
-			(See: ../clock/clock-bindings.txt)
-- clock-names		Required by mt8183 and mt8192. Contains the
-			corresponding name for the clock. This should be
-			named "main".
-
-Subnodes
---------
-
-Subnodes of the SCP represent rpmsg devices. The names of the devices are not
-important. The properties of these nodes are defined by the individual bindings
-for the rpmsg devices - but must contain the following property:
-
-- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
-			the subnode to rpmsg device announced by SCP.
-
-Example:
-
-	scp: scp@10500000 {
-		compatible = "mediatek,mt8183-scp";
-		reg = <0 0x10500000 0 0x80000>,
-		      <0 0x105c0000 0 0x5000>;
-		reg-names = "sram", "cfg";
-		clocks = <&infracfg CLK_INFRA_SCPSYS>;
-		clock-names = "main";
-	};
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
new file mode 100644
index 000000000000..f57f1518fe13
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SCP Bindings
+
+maintainers:
+  - Tinghan Shen <tinghan.shen@mediatek.com>
+
+description:
+  This binding provides support for ARM Cortex M4 Co-processor found on some
+  Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-scp
+      - mediatek,mt8192-scp
+      - mediatek,mt8195-scp
+
+  reg:
+    description:
+      Should contain the address ranges for memory regions SRAM, CFG, and
+      L1TCM.
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: l1tcm
+
+  clocks:
+    description:
+      Clock for co-processor (see ../clock/clock-bindings.txt).
+      Required by mt8183 and mt8192.
+    maxItems: 1
+
+  clock-names:
+    const: main
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+if:
+  properties:
+    compatible:
+      enum:
+        - mediatek,mt8183-scp
+        - mediatek,mt8192-scp
+then:
+  required:
+    - clocks
+    - clock-names
+
+additionalProperties:
+  type: object
+  description:
+    Subnodes of the SCP represent rpmsg devices. The names of the devices
+    are not important. The properties of these nodes are defined by the
+    individual bindings for the rpmsg devices.
+  properties:
+    mtk,rpmsg-name:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        Contains the name for the rpmsg device. Used to match
+        the subnode to rpmsg device announced by SCP.
+
+  required:
+    - mtk,rpmsg-name
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+
+    scp@10500000 {
+        compatible = "mediatek,mt8183-scp";
+        reg = <0x10500000 0x80000>,
+              <0x10700000 0x8000>,
+              <0x10720000 0xe0000>;
+        reg-names = "sram", "cfg", "l1tcm";
+        clocks = <&infracfg CLK_INFRA_SCPSYS>;
+        clock-names = "main";
+
+        cros_ec {
+            mtk,rpmsg-name = "cros-ec-rpmsg";
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
