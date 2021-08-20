Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3399AC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE8361040
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECE8361040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqBObUIchvJo2F7drBxsZYfLomg5vOyL3hHUnyGRE7Q=; b=sWKmLGoSbyVLOF
	hGmqGNi+npDfBZzMi/yz/+KfOdK92kBp8Ovd1Rv17n2L89p/qEi6L+wK7uEBPaZHPxNTSKFOWs+qO
	b4W0mN/yg8f9rv/qZYRRbhqsUD+aBC70PyiB3zI+0xO3QLmOXMACBDRiXqEgP1lQRQKrH0Wh0dPDl
	GL1vvSNDS3/hGvar9OWbr+DS/OpW5MS0FLjSajRQRIbxu7VCde1u85wgkRh2VG4/0LV3WgXZMyl98
	pvsTvM8G0ex4tvM8ozEPGN3dTAhuB2z6rSrbjOeDqxnkGn4gD3x5bznj778tjYhm8tAH/5e8+uvSY
	R1fvoEbeSBpeh3KIvj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2WE-00AluG-E1; Fri, 20 Aug 2021 11:17:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2W1-00Alpg-LQ; Fri, 20 Aug 2021 11:16:53 +0000
X-UUID: 94f35a450ab944aea53a0119287b3325-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QqHmfBRqTDlg1x7OPFSySC39+h4hyjYeVKeVtc2/eI8=; 
 b=fOzPucJUDl8kLn6x5IKfpecxS4MCCsMlUt2fSMgTaEYalnZ9eDsU5M7ooqU3zai4Kb17Z1UrsRkTBXMO1pRuItthG9QgH4AzASGBf3crNKp3SW3txPR2HgJq5sPclYYQbfVpgAjD9/vK/H2/NZaGl/dRwyugev+v4pEARtaGO74=;
X-UUID: 94f35a450ab944aea53a0119287b3325-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1659912235; Fri, 20 Aug 2021 04:16:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:16:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:16:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:16:40 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 01/24] dt-bindings: ARM: Mediatek: Add new document bindings of
 MT8195 clock
Date: Fri, 20 Aug 2021 19:14:41 +0800
Message-ID: <20210820111504.350-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041649_765988_DD085DDA 
X-CRM114-Status: GOOD (  14.56  )
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
and functional clock on Mediatek MT8195.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 254 ++++++++++++++++++
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |  73 +++++
 2 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
new file mode 100644
index 000000000000..17fcbb45d121
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
@@ -0,0 +1,254 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Functional Clock Controller for MT8195
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The clock architecture in Mediatek like below
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The devices except apusys_pll provide clock gate control in different IP blocks.
+  The apusys_pll provides Plls which generated from SoC 26m for AI Processing Unit.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8195-scp_adsp
+          - mediatek,mt8195-imp_iic_wrap_s
+          - mediatek,mt8195-imp_iic_wrap_w
+          - mediatek,mt8195-mfgcfg
+          - mediatek,mt8195-vppsys0
+          - mediatek,mt8195-wpesys
+          - mediatek,mt8195-wpesys_vpp0
+          - mediatek,mt8195-wpesys_vpp1
+          - mediatek,mt8195-vppsys1
+          - mediatek,mt8195-imgsys
+          - mediatek,mt8195-imgsys1_dip_top
+          - mediatek,mt8195-imgsys1_dip_nr
+          - mediatek,mt8195-imgsys1_wpe
+          - mediatek,mt8195-ipesys
+          - mediatek,mt8195-camsys
+          - mediatek,mt8195-camsys_rawa
+          - mediatek,mt8195-camsys_yuva
+          - mediatek,mt8195-camsys_rawb
+          - mediatek,mt8195-camsys_yuvb
+          - mediatek,mt8195-camsys_mraw
+          - mediatek,mt8195-ccusys
+          - mediatek,mt8195-vdecsys_soc
+          - mediatek,mt8195-vdecsys
+          - mediatek,mt8195-vdecsys_core1
+          - mediatek,mt8195-vencsys
+          - mediatek,mt8195-vencsys_core1
+          - mediatek,mt8195-apusys_pll
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
+        compatible = "mediatek,mt8195-scp_adsp";
+        reg = <0x10720000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_s: clock-controller@11d03000 {
+        compatible = "mediatek,mt8195-imp_iic_wrap_s";
+        reg = <0x11d03000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_w: clock-controller@11e05000 {
+        compatible = "mediatek,mt8195-imp_iic_wrap_w";
+        reg = <0x11e05000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    mfgcfg: clock-controller@13fbf000 {
+        compatible = "mediatek,mt8195-mfgcfg";
+        reg = <0x13fbf000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vppsys0: clock-controller@14000000 {
+        compatible = "mediatek,mt8195-vppsys0";
+        reg = <0x14000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    wpesys: clock-controller@14e00000 {
+        compatible = "mediatek,mt8195-wpesys";
+        reg = <0x14e00000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    wpesys_vpp0: clock-controller@14e02000 {
+        compatible = "mediatek,mt8195-wpesys_vpp0";
+        reg = <0x14e02000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    wpesys_vpp1: clock-controller@14e03000 {
+        compatible = "mediatek,mt8195-wpesys_vpp1";
+        reg = <0x14e03000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vppsys1: clock-controller@14f00000 {
+        compatible = "mediatek,mt8195-vppsys1";
+        reg = <0x14f00000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys: clock-controller@15000000 {
+        compatible = "mediatek,mt8195-imgsys";
+        reg = <0x15000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys1_dip_top: clock-controller@15110000 {
+        compatible = "mediatek,mt8195-imgsys1_dip_top";
+        reg = <0x15110000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys1_dip_nr: clock-controller@15130000 {
+        compatible = "mediatek,mt8195-imgsys1_dip_nr";
+        reg = <0x15130000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys1_wpe: clock-controller@15220000 {
+        compatible = "mediatek,mt8195-imgsys1_wpe";
+        reg = <0x15220000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    ipesys: clock-controller@15330000 {
+        compatible = "mediatek,mt8195-ipesys";
+        reg = <0x15330000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys: clock-controller@16000000 {
+        compatible = "mediatek,mt8195-camsys";
+        reg = <0x16000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawa: clock-controller@1604f000 {
+        compatible = "mediatek,mt8195-camsys_rawa";
+        reg = <0x1604f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_yuva: clock-controller@1606f000 {
+        compatible = "mediatek,mt8195-camsys_yuva";
+        reg = <0x1606f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawb: clock-controller@1608f000 {
+        compatible = "mediatek,mt8195-camsys_rawb";
+        reg = <0x1608f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_yuvb: clock-controller@160af000 {
+        compatible = "mediatek,mt8195-camsys_yuvb";
+        reg = <0x160af000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_mraw: clock-controller@16140000 {
+        compatible = "mediatek,mt8195-camsys_mraw";
+        reg = <0x16140000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    ccusys: clock-controller@17200000 {
+        compatible = "mediatek,mt8195-ccusys";
+        reg = <0x17200000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys_soc: clock-controller@1800f000 {
+        compatible = "mediatek,mt8195-vdecsys_soc";
+        reg = <0x1800f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys: clock-controller@1802f000 {
+        compatible = "mediatek,mt8195-vdecsys";
+        reg = <0x1802f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys_core1: clock-controller@1803f000 {
+        compatible = "mediatek,mt8195-vdecsys_core1";
+        reg = <0x1803f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vencsys: clock-controller@1a000000 {
+        compatible = "mediatek,mt8195-vencsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vencsys_core1: clock-controller@1b000000 {
+        compatible = "mediatek,mt8195-vencsys_core1";
+        reg = <0x1b000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    apusys_pll: clock-controller@190f3000 {
+        compatible = "mediatek,mt8195-apusys_pll";
+        reg = <0x190f3000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
new file mode 100644
index 000000000000..dbf33ea6cb9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek System Clock Controller for MT8195
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The clock architecture in Mediaek like below
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The apmixedsys provides most of PLLs which generated from SoC 26m.
+  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
+  The infracfg_ao and pericfg_ao provides clock gate in peripheral and infrastructure IP blocks.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8195-topckgen
+          - mediatek,mt8195-infracfg_ao
+          - mediatek,mt8195-apmixedsys
+          - mediatek,mt8195-pericfg_ao
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
+        compatible = "mediatek,mt8195-topckgen", "syscon";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    infracfg_ao: syscon@10001000 {
+        compatible = "mediatek,mt8195-infracfg_ao", "syscon";
+        reg = <0x10001000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    apmixedsys: syscon@1000c000 {
+        compatible = "mediatek,mt8195-apmixedsys", "syscon";
+        reg = <0x1000c000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    pericfg_ao: syscon@11003000 {
+        compatible = "mediatek,mt8195-pericfg_ao", "syscon";
+        reg = <0x11003000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
