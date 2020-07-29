Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC77EC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:54:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD0E2075D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WAWaFDUQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tGy+Mhx8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CD0E2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b/o1uyc2xC/PJLZWZ5Y4Ri8Ic6/GJSemfuGQo8nkHZw=; b=WAWaFDUQb4JB1gxiGbRs+xyPF
	DRiwoTDz+TTwtmK1RBEdruUD1qifQxgBEZyof3jxTqKv1oDrThzKh3zrRLXl92lRAMjSvCtoSwqA8
	n/lOKo/B6tRrMHgt59Du/xrZ+SqG/R0IJAyAXmPQyBJX7kmLkVpY8laAm4tzbvHGIRV3cdk7r5fV+
	SY9q9xAujkv1NUObPC0RPlFFDyg40PDvu4rXG6kmubelbxlc8gBltVH3veQATi0BOmJmWb1heCJ6u
	dezOuBGidJEqFx+rmbX3Lis7/bd74CAaF/h84rCz3w9ddU3nbF2rHhM3U6Fl6fATH1ZuXP1RHVa9z
	TGIXNK1uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hqw-0002qP-SQ; Wed, 29 Jul 2020 08:54:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hqj-0002kl-Ak; Wed, 29 Jul 2020 08:54:11 +0000
X-UUID: ef7084738fd545cfaaf612ee179156be-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3Tmg1HFY0UCr3HAwCjzqdMY8MsLsgiqb36JxbD/BQmc=; 
 b=tGy+Mhx8rHaRgcIIKqwoJTM5rHFuoQ8pICAQVsd2NmT+wGcNePu7FrkBruYL8Cb2ITnnOChnJ063yZU5SFrbkIEGtOmRfYFNkOPlzwB0kGVrwvXOC2q5/UUg/rzyzNYMrWSujUos5nT3hmlv0iEbAfpLKxdkysCynQ5GGRkyHMU=;
X-UUID: ef7084738fd545cfaaf612ee179156be-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2112233795; Wed, 29 Jul 2020 00:45:50 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:44:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 16:44:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Jul 2020 16:44:46 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 1/5] dt-bindings: ARM: Mediatek: Document bindings for
 MT8192
Date: Wed, 29 Jul 2020 16:44:33 +0800
Message-ID: <1596012277-8448-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_045409_689190_AD923A7C 
X-CRM114-Status: GOOD (  17.59  )
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

This patch adds the binding documentation for apmixedsys, audsys,
camsys-raw, camsys, imgsys, imp_iic_wrap, infracfg, ipesys, mdpsys,
mfgcfg, mmsys, msdc, pericfg, scp-adsp, topckgen, vdecsys-soc,
vdecsys and vencsys for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |  1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,camsys-raw.yaml | 40 ++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,camsys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |  2 +
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml        | 43 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |  1 +
 .../bindings/arm/mediatek/mediatek,ipesys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,mdpsys.yaml     | 38 +++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
 .../bindings/arm/mediatek/mediatek,msdc.yaml       | 39 ++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,pericfg.yaml    |  1 +
 .../bindings/arm/mediatek/mediatek,scp-adsp.yaml   | 38 +++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |  1 +
 .../arm/mediatek/mediatek,vdecsys-soc.yaml         | 38 +++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |  1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |  1 +
 18 files changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml

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
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 38309db..fdcb267 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -12,6 +12,7 @@ Required Properties:
 	- "mediatek,mt7622-audsys", "syscon"
 	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
 	- "mediatek,mt8183-audiosys", "syscon"
+	- "mediatek,mt8192-audsys", "syscon"
 	- "mediatek,mt8516-audsys", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
new file mode 100644
index 0000000..db6f425
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
@@ -0,0 +1,40 @@
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
+  The Mediatek camsys raw controller provides various clocks to the system.
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
+    camsys_rawa: camsys_rawa@1a04f000 {
+        compatible = "mediatek,mt8192-camsys_rawa", "syscon";
+        reg = <0 0x1a04f000 0 0x1000>;
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
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
new file mode 100644
index 0000000..2af6f98
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
@@ -0,0 +1,43 @@
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
+  The Mediatek imp i2c wrapper controller provides various clocks to the system.
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
+    imp_iic_wrap_c@11007000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
+        reg = <0 0x11007000 0 0x1000>;
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
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
index 2ce889b..9cd1035 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt6779-ipesys", "syscon"
+	- "mediatek,mt8192-ipesys", "syscon"
 - #clock-cells: Must be 1
 
 The ipesys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
new file mode 100644
index 0000000..88698a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mdpsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MDPSYS Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek mdpsys controller provides various clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-mdpsys
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
+    mdpsys: mdpsys@1f000000 {
+        compatible = "mediatek,mt8192-mdpsys", "syscon";
+        reg = <0 0x1f000000 0 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
index ad5f9d2..fc1ce61 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt2712-mfgcfg", "syscon"
 	- "mediatek,mt6779-mfgcfg", "syscon"
 	- "mediatek,mt8183-mfgcfg", "syscon"
+	- "mediatek,mt8192-mfgcfg", "syscon"
 - #clock-cells: Must be 1
 
 The mfgcfg controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index d8c9108..81fa345 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -15,6 +15,7 @@ Required Properties:
 	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
 	- "mediatek,mt8173-mmsys", "syscon"
 	- "mediatek,mt8183-mmsys", "syscon"
+	- "mediatek,mt8192-mmsys", "syscon"
 - #clock-cells: Must be 1
 
 For the clock control, the mmsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
new file mode 100644
index 0000000..23ad419e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
@@ -0,0 +1,39 @@
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
+  The Mediatek msdc controller provides various clocks to the system.
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
+    msdc: msdc@11f60000 {
+        compatible = "mediatek,mt8192-msdc", "syscon";
+        reg = <0 0x11f60000 0 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index e271c46..c2e106c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt8135-pericfg
           - mediatek,mt8173-pericfg
           - mediatek,mt8183-pericfg
+          - mediatek,mt8192-pericfg
           - mediatek,mt8516-pericfg
         - const: syscon
       - items:
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
new file mode 100644
index 0000000..25cc59f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,scp-adsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SCP ADSP Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek scp adsp controller provides various clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-scp_adsp
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
+    scp_adsp: scp_adsp@10720000 {
+        compatible = "mediatek,mt8192-scp_adsp", "syscon";
+        reg = <0x10720000 0x1000>;
+        #clock-cells = <1>;
+    };
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
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml
new file mode 100644
index 0000000..5cb8740
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,vdecsys-soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek VDECSYS SOC Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek vdecsys soc controller provides various clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-vdecsys_soc
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
+    vdecsys_soc: vdecsys_soc@1600f000 {
+        compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
+        reg = <0 0x1600f000 0 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
index 7894558..ee679e0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
@@ -13,6 +13,7 @@ Required Properties:
 	- "mediatek,mt7623-vdecsys", "mediatek,mt2701-vdecsys", "syscon"
 	- "mediatek,mt8173-vdecsys", "syscon"
 	- "mediatek,mt8183-vdecsys", "syscon"
+	- "mediatek,mt8192-vdecsys", "syscon"
 - #clock-cells: Must be 1
 
 The vdecsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
index 6a6a14e..d22de01 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
@@ -11,6 +11,7 @@ Required Properties:
 	- "mediatek,mt6797-vencsys", "syscon"
 	- "mediatek,mt8173-vencsys", "syscon"
 	- "mediatek,mt8183-vencsys", "syscon"
+	- "mediatek,mt8192-vencsys", "syscon"
 - #clock-cells: Must be 1
 
 The vencsys controller uses the common clk binding from
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
