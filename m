Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D9FC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:58:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C5E360241
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C5E360241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rYnvg4XBHyD07HgOHkJZnsMrcg2/4ZuPNd6g7BrzYo=; b=l/0msLImA3QWCU
	GamZf+sSVvl/9EAbzcMzd0kXou8KsrZifqq0M9/dJeFL2H0XIcUB51/t5nIswvgUZUe8Mi6lkAkmr
	0lSrjFWyUQ9tp99lcFn7g8JTC35rn/XqLA6KJIFbMRKk5/z+o5OdIEfvMswbKB6hQgn/gE0SQ7L2X
	rUBTm0YqPhgLTgpjmDGGqEXCR902rJlxTBqsNDzWJxKtl7ZazkW7vAnqEk5cVrgbY+GkBWAUnX+J/
	X5ZitLtcO1GCSWziM97bdrW481WoMAQwI9Fc/X5mBqgUyFmzRoXvagXQ4F39zX8r++pv51SKv5F8y
	ijFmsUQ/oF1rHIddArag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7yJ4-00AoZ8-VA; Mon, 26 Jul 2021 10:57:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7yIy-00AoNe-F4; Mon, 26 Jul 2021 10:57:54 +0000
X-UUID: 5fc34cabdadd4ba282209ee1b541944f-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PaACLjqWYhwfh01sMhPGZoFLRPLKaZGrGHWP1KcgW6E=; 
 b=A9UZqZt7eluOQvxsim23sX6g7vvkQZParBZRQSrDRaG+tnH+q3VSas3dnATQf2w7MpRoOw6jOhO/PUP2uKcUMKV5XEdCQprIiTYe811FCYF7cFI/igDKiQ2YRCfR22WFcAvzkTjICr2FmFlzdDQS5dMy3Fy9STjA+BmW9AHBrqw=;
X-UUID: 5fc34cabdadd4ba282209ee1b541944f-20210726
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 855309134; Mon, 26 Jul 2021 03:57:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 03:57:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 18:57:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Jul 2021 18:57:42 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v14 01/21] dt-bindings: ARM: Mediatek: Add new document bindings of
 MT8192 clock
Date: Mon, 26 Jul 2021 18:56:59 +0800
Message-ID: <20210726105719.15793-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_035752_580975_FAA5CA30 
X-CRM114-Status: GOOD (  14.83  )
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

This patch adds the new binding documentation for system clock
and functional clock on Mediatek MT8192.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../arm/mediatek/mediatek,mt8192-clock.yaml   | 199 ++++++++++++++++++
 .../mediatek/mediatek,mt8192-sys-clock.yaml   |  65 ++++++
 2 files changed, 264 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
new file mode 100644
index 000000000000..c8c67c033f8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Functional Clock Controller for MT8192
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek functional clock controller provides various clocks on MT8192.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-scp_adsp
+          - mediatek,mt8192-imp_iic_wrap_c
+          - mediatek,mt8192-imp_iic_wrap_e
+          - mediatek,mt8192-imp_iic_wrap_s
+          - mediatek,mt8192-imp_iic_wrap_ws
+          - mediatek,mt8192-imp_iic_wrap_w
+          - mediatek,mt8192-imp_iic_wrap_n
+          - mediatek,mt8192-msdc_top
+          - mediatek,mt8192-msdc
+          - mediatek,mt8192-mfgcfg
+          - mediatek,mt8192-imgsys
+          - mediatek,mt8192-imgsys2
+          - mediatek,mt8192-vdecsys_soc
+          - mediatek,mt8192-vdecsys
+          - mediatek,mt8192-vencsys
+          - mediatek,mt8192-camsys
+          - mediatek,mt8192-camsys_rawa
+          - mediatek,mt8192-camsys_rawb
+          - mediatek,mt8192-camsys_rawc
+          - mediatek,mt8192-ipesys
+          - mediatek,mt8192-mdpsys
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
+additionalProperties: false
+
+examples:
+  - |
+    scp_adsp: clock-controller@10720000 {
+        compatible = "mediatek,mt8192-scp_adsp";
+        reg = <0x10720000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_c: clock-controller@11007000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_c";
+        reg = <0x11007000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_e: clock-controller@11cb1000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_e";
+        reg = <0x11cb1000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_s: clock-controller@11d03000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_s";
+        reg = <0x11d03000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_ws: clock-controller@11d23000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_ws";
+        reg = <0x11d23000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_w: clock-controller@11e01000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_w";
+        reg = <0x11e01000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_n: clock-controller@11f02000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_n";
+        reg = <0x11f02000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    msdc_top: clock-controller@11f10000 {
+        compatible = "mediatek,mt8192-msdc_top";
+        reg = <0x11f10000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    msdc: clock-controller@11f60000 {
+        compatible = "mediatek,mt8192-msdc";
+        reg = <0x11f60000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    mfgcfg: clock-controller@13fbf000 {
+        compatible = "mediatek,mt8192-mfgcfg";
+        reg = <0x13fbf000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys: clock-controller@15020000 {
+        compatible = "mediatek,mt8192-imgsys";
+        reg = <0x15020000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys2: clock-controller@15820000 {
+        compatible = "mediatek,mt8192-imgsys2";
+        reg = <0x15820000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys_soc: clock-controller@1600f000 {
+        compatible = "mediatek,mt8192-vdecsys_soc";
+        reg = <0x1600f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys: clock-controller@1602f000 {
+        compatible = "mediatek,mt8192-vdecsys";
+        reg = <0x1602f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vencsys: clock-controller@17000000 {
+        compatible = "mediatek,mt8192-vencsys";
+        reg = <0x17000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys: clock-controller@1a000000 {
+        compatible = "mediatek,mt8192-camsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawa: clock-controller@1a04f000 {
+        compatible = "mediatek,mt8192-camsys_rawa";
+        reg = <0x1a04f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawb: clock-controller@1a06f000 {
+        compatible = "mediatek,mt8192-camsys_rawb";
+        reg = <0x1a06f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawc: clock-controller@1a08f000 {
+        compatible = "mediatek,mt8192-camsys_rawc";
+        reg = <0x1a08f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    ipesys: clock-controller@1b000000 {
+        compatible = "mediatek,mt8192-ipesys";
+        reg = <0x1b000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    mdpsys: clock-controller@1f000000 {
+        compatible = "mediatek,mt8192-mdpsys";
+        reg = <0x1f000000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
new file mode 100644
index 000000000000..5705bcf1fe47
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek System Clock Controller for MT8192
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek system clock controller provides various clocks and system configuration
+  like reset and bus protection on MT8192.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-topckgen
+          - mediatek,mt8192-infracfg
+          - mediatek,mt8192-pericfg
+          - mediatek,mt8192-apmixedsys
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
+additionalProperties: false
+
+examples:
+  - |
+    topckgen: syscon@10000000 {
+        compatible = "mediatek,mt8192-topckgen", "syscon";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    infracfg: syscon@10001000 {
+        compatible = "mediatek,mt8192-infracfg", "syscon";
+        reg = <0x10001000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    pericfg: syscon@10003000 {
+        compatible = "mediatek,mt8192-pericfg", "syscon";
+        reg = <0x10003000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    apmixedsys: syscon@1000c000 {
+        compatible = "mediatek,mt8192-apmixedsys", "syscon";
+        reg = <0x1000c000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
