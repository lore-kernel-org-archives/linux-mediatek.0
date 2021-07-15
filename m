Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F85FC636C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B7861285
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7B7861285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hg7rJdsCBJRVt0BC++jXzont6AYjxHEXEd0UT1we2o=; b=cKb/EiknlxJzqh
	9fUjr4q1daafRxqGzIligYIMP2+nR8WD2zOamxQhLexOFAJwHoXdw083/mhXQjezys3CqHvKsuHBI
	zowc3cs/6FlruJOZe86WDukW7zyilSEZChLvRcJ9lLFuZDACGASeNclUTfUpbXRMcfW1OviLiEZed
	M3SkvDJTX4F49GKUud1pjMFfIANQzIf2Fq6WMGR1n+H9HU8Cd0ouEmjru7pJ60ZhBC2CFUzxVEF2x
	XnE3ef+g4Q22+yZBW3SGNMtnjTPw4UqS6fFQTyXtNkUJ6czznIcuAsFEQEAz1YNfcfKC9RizCbQzz
	CnwjfkkOfIbZxq4bC17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45Uj-001rm0-PQ; Thu, 15 Jul 2021 17:49:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45T9-001r6v-W8; Thu, 15 Jul 2021 17:48:24 +0000
X-UUID: 62ef84c7de1749eba72dc808a5c0e425-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xg0SHZ1uSzNWaxQpYBchHc0d1AIkJu70/euoFqMlCmI=; 
 b=IdMnzrq16IioyORUHXOzRSZgVjApH17SQU89M1AsowtDmGe1onOkRWOTqpYu+CZEQUcy9Yys/1FbR2VW3G18jAd+u1oULI/0fNf2iJ4/aKEAXWqO18Ng0PvQpJ4XYGpTPubdIEhxQfDrUXam7IhOh5IXpnZY4lskDOsRs8dtlvE=;
X-UUID: 62ef84c7de1749eba72dc808a5c0e425-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 168248502; Thu, 15 Jul 2021 10:48:11 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:38:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:52 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 05/12] dt-bindings: arm: mediatek: change mmsys txt to yaml
 file
Date: Fri, 16 Jul 2021 01:37:43 +0800
Message-ID: <20210715173750.10852-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_104820_205595_60936D5C 
X-CRM114-Status: GOOD (  16.46  )
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

Change mediatek,mmsys.txt to mediatek,mmsys.yaml

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.txt  |  32 ------
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 102 ++++++++++++++++++
 2 files changed, 102 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
deleted file mode 100644
index 9712a6831fab..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Mediatek mmsys controller
-============================
-
-The Mediatek mmsys system controller provides clock control, routing control,
-and miscellaneous control in mmsys partition.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt2712-mmsys", "syscon"
-	- "mediatek,mt6765-mmsys", "syscon"
-	- "mediatek,mt6779-mmsys", "syscon"
-	- "mediatek,mt6797-mmsys", "syscon"
-	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt8167-mmsys", "syscon"
-	- "mediatek,mt8173-mmsys", "syscon"
-	- "mediatek,mt8183-mmsys", "syscon"
-	- "mediatek,mt8192-mmsys", "syscon"
-- #clock-cells: Must be 1
-
-For the clock control, the mmsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-mmsys: syscon@14000000 {
-	compatible = "mediatek,mt8173-mmsys", "syscon";
-	reg = <0 0x14000000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
new file mode 100644
index 000000000000..ea31c7c2792c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek mmsys Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jason-JH Lin <jason-jh.lin@mediatek.com>
+
+description: |
+  The Mediatek mmsys system controller provides clock control, routing control,
+  and miscellaneous control in mmsys partition.
+
+properties:
+  compatible:
+    description: |
+      If the mmsys controller of different soc have the same function,
+      you can use the same compatible name after it.
+      For example, if the function of mt2701 mmsys controller is the same as syscon,
+      then the compatible property could be set as:
+      compatible = "mediatek,mt2701-mmsys", "syscon";
+    oneOf:
+      - items:
+          - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt2701-mmsys
+              - mediatek,mt7623-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt2712-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt6779-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt6797-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt8167-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt8173-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt8183-mmsys
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt8192-mmsys
+          - enum:
+              - syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    description: |
+      For the clock control, the mmsys controller uses the common clk binding from
+      Documentation/devicetree/bindings/clock/clock-bindings.txt
+      The available clocks are defined in dt-bindings/clock/mt*-clk.h
+    const: 1
+
+  mboxes:
+    description: |
+      Client use mailbox to communicate with GCE, it should have this
+      property and list of phandle with mailbox specifiers as defined in
+      Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+
+required:
+  - compatible
+  - reg
+  - '#clocks-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+
+    mmsys: syscon@14000000 {
+        compatible = "mediatek,mt8173-mmsys", "syscon";
+        reg = <0 0x14000000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
