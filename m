Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE495C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7562080C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W7W55a8K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SicIgIJF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7562080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j36vEHa02cmHphV031hWFFO1CIoyFhqeXQRUO6JsnPU=; b=W7W55a8KIexhTf0DgTOTNUO5W
	PqUOpJIbtAgS0HkTT7z4PTL/Kn8GXHMsxW1elNjngyiUyHvAdW70BvUELqGmDPOvB8zpBlJvb1Iab
	JqsIpUQFJ0ZbluesPDb7jt6mTrvBXBN4dTsCeRoC1gb9Qa+ZzIy8aHHw89PC2GgSbPjZRQ5/T4U1p
	NMwiaygcUZKLvBqZDSKotmC/iVLwBCPe4JVGrDkOLnPYow111JzfChyylI7nd8QSA1HFc+XIvygM+
	isp8mpEA++Oom3Al40f+AJCnJ9Q2Fwd99iKVb/pH7NFHa/HTE3JhAXeZSBYJ6EAv+P24uWelmDWdL
	v1HVC7H8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDfrK-000468-Ql; Thu, 03 Sep 2020 03:24:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDfqg-0003hq-5d; Thu, 03 Sep 2020 03:23:44 +0000
X-UUID: b050328510084212b106aa7623caff92-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SuVfNNgws7WNnAB3N380H4VUO8zkXKIzgzKfC1S8vxk=; 
 b=SicIgIJF6j6sDsTxgDxUzRrc0x7YJUO6IiAmtmlzyEvn9qDj4fCfMpEmOzp36uj9vcvWVhLlZRLCIIMqbzmMaH6oXocsYaLkjOFBSXiddPQd6na8FP8tFYDoQNc96uAww256n58hw2UBQPj4nOnY6g+JfDpGy/Yd+TwXJ4sOdFY=;
X-UUID: b050328510084212b106aa7623caff92-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1103018802; Wed, 02 Sep 2020 19:23:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:23:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:23:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Sep 2020 11:23:23 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v3 1/9] dt-bindings: ARM: Mediatek: Document bindings for
 MT8192 BSP
Date: Thu, 3 Sep 2020 11:22:52 +0800
Message-ID: <1599103380-4155-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A1D0353343BFDC419B3F36B9B6227D0C15AF7C5FBEF07525CAB6E028144821E32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_232342_426394_D797CDC3 
X-CRM114-Status: GOOD (  15.82  )
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

This patch adds the binding documentation of apmixedsys, imp_iic_wrap,
infracfg, msdc, pericfg and topckgen for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |  1 +
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml        | 78 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |  1 +
 .../bindings/arm/mediatek/mediatek,msdc.yaml       | 46 +++++++++++++
 .../bindings/arm/mediatek/mediatek,pericfg.yaml    |  1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |  1 +
 6 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index bd7a0fa..6942ad4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
@@ -17,6 +17,7 @@ Required Properties:
 	- "mediatek,mt8135-apmixedsys"
 	- "mediatek,mt8173-apmixedsys"
 	- "mediatek,mt8183-apmixedsys", "syscon"
+	- "mediatek,mt8192-apmixedsys", "syscon"
 	- "mediatek,mt8516-apmixedsys"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
new file mode 100644
index 0000000..5d0cf37
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek IMP I2C Wrapper Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek imp i2c wrapper controller provides functional configurations and clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-imp_iic_wrap_c
+          - mediatek,mt8192-imp_iic_wrap_e
+          - mediatek,mt8192-imp_iic_wrap_s
+          - mediatek,mt8192-imp_iic_wrap_ws
+          - mediatek,mt8192-imp_iic_wrap_w
+          - mediatek,mt8192-imp_iic_wrap_n
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
+    imp_iic_wrap_c: syscon@11007000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
+        reg = <0 0x11007000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_e: syscon@11cb1000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
+        reg = <0 0x11cb1000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_s: syscon@11d03000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
+        reg = <0 0x11d03000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_ws: syscon@11d23000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
+        reg = <0 0x11d23000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_w: syscon@11e01000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
+        reg = <0 0x11e01000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_n: syscon@11f02000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
+        reg = <0 0x11f02000 0 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
index 49a968b..ba5e781 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
@@ -18,6 +18,7 @@ Required Properties:
 	- "mediatek,mt8135-infracfg", "syscon"
 	- "mediatek,mt8173-infracfg", "syscon"
 	- "mediatek,mt8183-infracfg", "syscon"
+	- "mediatek,mt8192-infracfg", "syscon"
 	- "mediatek,mt8516-infracfg", "syscon"
 - #clock-cells: Must be 1
 - #reset-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
new file mode 100644
index 0000000..5aa9536
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,msdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MSDC Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek msdc controller provides functional configurations and clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-msdc
+          - mediatek,mt8192-msdc_top
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
+    msdc: syscon@11f60000 {
+        compatible = "mediatek,mt8192-msdc", "syscon";
+        reg = <0 0x11f60000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    msdc_top: syscon@11f10000 {
+        compatible = "mediatek,mt8192-msdc_top", "syscon";
+        reg = <0 0x11f10000 0 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 1af30174..b672c91 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -26,6 +26,7 @@ properties:
               - mediatek,mt8135-pericfg
               - mediatek,mt8173-pericfg
               - mediatek,mt8183-pericfg
+              - mediatek,mt8192-pericfg
               - mediatek,mt8516-pericfg
           - const: syscon
       - items:
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
index 9b0394c..c480278 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
@@ -17,6 +17,7 @@ Required Properties:
 	- "mediatek,mt8135-topckgen"
 	- "mediatek,mt8173-topckgen"
 	- "mediatek,mt8183-topckgen", "syscon"
+	- "mediatek,mt8192-topckgen", "syscon"
 	- "mediatek,mt8516-topckgen"
 - #clock-cells: Must be 1
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
