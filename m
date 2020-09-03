Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89CBC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0D62080C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GMXGW1Ql";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iPX3XW+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB0D62080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBO2h6b5d6BHYuN0n7GmrCY9wj+fNRV35hTyGVzDdEE=; b=GMXGW1Ql6unWR3kxKvXBYbws7
	DoGnlo8XqEZOXvWmUoswsp5BOI5G0c8d3dSC5RD/VJIiSnUB/z4izHIUoBMZ4o5WwjI/1QJ4At9CH
	lZzTNDlnClnBXTA8UloFmaqjb4LXzv37q3cjVMP+pXJYle+SFvNRZ1M0kG+HE4zfdoL5fLfQ0PG2R
	q4sBO/gP07TQItwmZSvO6EML6nAtc3rgb+uToFuC6O3Ud7N6/vMSkRR+rwc2BZmoKnD5zc5BCWLcM
	KsmgYrrK25LQXtmAHbvl2xKJsh8UcfJH0My5CWL01RinDV4BX8KrME5170gNlnxpEbkMt1KuLzrTo
	lGKEh5Mjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDfqw-0003r8-Uk; Thu, 03 Sep 2020 03:23:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDfqa-0003hq-8k; Thu, 03 Sep 2020 03:23:37 +0000
X-UUID: ea1e9b23bdf0458b88d39cf45a37891e-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+yk96Z/qU4ICJoOFeZO6a1PuxPNlbXgUawAmlp06RSo=; 
 b=iPX3XW+OGUIvHy60a2iFRENXD5ywARJKPfwb7h1eXSDdHrXJ2zSpshltMUp8nAifIV9Fhk0Eb6uvCv3eUxOFbatH/8ZNXtMqaGrbLkXPYTRueyL6SOfaQewub8YDDpIcolUlPe6gHOc5WktdmTSHk99fFbK3XcHBzreg3LyFr6E=;
X-UUID: ea1e9b23bdf0458b88d39cf45a37891e-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 41499121; Wed, 02 Sep 2020 19:23:26 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:23:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:23:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Sep 2020 11:23:24 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v3 4/9] dt-bindings: ARM: Mediatek: Document bindings for
 MT8192 Camera
Date: Thu, 3 Sep 2020 11:22:55 +0800
Message-ID: <1599103380-4155-5-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_232336_500387_2622AA84 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Wendell Lin <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the binding documentation of camsys-raw,
camsys and imgsys for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,camsys-raw.yaml | 54 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,camsys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |  2 +
 3 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
new file mode 100644
index 0000000..eb395ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,camsys-raw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSYS RAW Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek camsys raw controller provides functional configurations and clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-camsys_rawa
+          - mediatek,mt8192-camsys_rawb
+          - mediatek,mt8192-camsys_rawc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    camsys_rawa: syscon@1a04f000 {
+        compatible = "mediatek,mt8192-camsys_rawa", "syscon";
+        reg = <0 0x1a04f000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawb: syscon@1a06f000 {
+        compatible = "mediatek,mt8192-camsys_rawb", "syscon";
+        reg = <0 0x1a06f000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawc: syscon@1a08f000 {
+        compatible = "mediatek,mt8192-camsys_rawc", "syscon";
+        reg = <0 0x1a08f000 0 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
index a0ce820..0082f21 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt6765-camsys", "syscon"
 	- "mediatek,mt6779-camsys", "syscon"
 	- "mediatek,mt8183-camsys", "syscon"
+	- "mediatek,mt8192-camsys", "syscon"
 - #clock-cells: Must be 1
 
 The camsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
index 1e1f007..b4312d1 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
@@ -14,6 +14,8 @@ Required Properties:
 	- "mediatek,mt7623-imgsys", "mediatek,mt2701-imgsys", "syscon"
 	- "mediatek,mt8173-imgsys", "syscon"
 	- "mediatek,mt8183-imgsys", "syscon"
+	- "mediatek,mt8192-imgsys", "syscon"
+	- "mediatek,mt8192-imgsys2", "syscon"
 - #clock-cells: Must be 1
 
 The imgsys controller uses the common clk binding from
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
