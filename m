Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:54:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518066134F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 518066134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Yn0OaAh5IaU9lQUnNUd/wbGBHiEL9FMbC1p3RLl7ds=; b=BUnygU4vA9t6ai
	rnVt1ioOm0/Gm/RAS5HQGZnwH0QIgrYT9fuOaIMNriapW7efe4lKYu1dUy5OPNR59kPqjk6yc8URV
	RGNgU4HUcP0fknMPE8dypL2BpU25UDvaXj769DM2mxstYjFGELR19osfD6tghCKYRSnDuuFE8V1O1
	Kz5x2Xp+mMAEWsWTPgGCtzugVoK4oU1IDDx4Gmkl5qqdM2WSzz+P7xoM2pnVMuCQRwEVEyaGw0oFF
	NwUXe3ECFCajbVJRit0nCXMcbW/ats31rMLMtG9nMNTMwkMf2lhlxHMI9ZeTp0cE/TlvHOvnfGZfQ
	vj4GTNPj+BQdyz95wzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml26u-007E9j-4b; Thu, 11 Nov 2021 04:54:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml262-007DgF-1d; Thu, 11 Nov 2021 04:54:01 +0000
X-UUID: 3be1d3061c284e1a92cc1fdcef899cb8-20211110
X-UUID: 3be1d3061c284e1a92cc1fdcef899cb8-20211110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 391082492; Wed, 10 Nov 2021 21:53:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Nov 2021 20:53:49 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 11 Nov 2021 12:53:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 11 Nov 2021 12:53:47 +0800
From: James Lo <james.lo@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, James Lo
 <james.lo@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14 1/3] dt-bindings: spmi: modify the constraint of reg
 property
Date: Thu, 11 Nov 2021 12:53:42 +0800
Message-ID: <20211111045344.11664-2-james.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211111045344.11664-1-james.lo@mediatek.com>
References: <20211111045344.11664-1-james.lo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_205358_120777_A9F3B55C 
X-CRM114-Status: GOOD (  16.23  )
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

The constraint of reg may larger than 1, so we modify to
'minItem: 1' and 'maxItem: 2'.
And adds documentation for the SPMI controller found on
Mediatek SoCs.

Merge [RESEND,v13,2/4] into [RESEND,v13,1/4] for fix yaml
error.
[RESEND,v13,1/4] :
dt-bindings: spmi: modify the constraint of reg property
[RESEND,v13,2/4] :
dt-bindings: spmi: document binding for the Mediatek SPMI
controller

Signed-off-by: James Lo <james.lo@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
 .../devicetree/bindings/spmi/spmi.yaml        |  3 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
new file mode 100644
index 000000000000..2445c5e0b0ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SPMI Controller Device Tree Bindings
+
+maintainers:
+  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+
+description: |+
+  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
+  for multiple SoCs to control a single SPMI master.
+
+allOf:
+  - $ref: "spmi.yaml"
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6873-spmi
+      - mediatek,mt8195-spmi
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pmif
+      - const: spmimst
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: pmif_sys_ck
+      - const: pmif_tmr_ck
+      - const: spmimst_clk_mux
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+
+    spmi: spmi@10027000 {
+        compatible = "mediatek,mt6873-spmi";
+        reg = <0x10027000 0xe00>,
+              <0x10029000 0x100>;
+        reg-names = "pmif", "spmimst";
+        clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+                 <&infracfg CLK_INFRA_PMIC_TMR>,
+                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
+        clock-names = "pmif_sys_ck",
+                      "pmif_tmr_ck",
+                      "spmimst_clk_mux";
+        assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
index 1d243faef2f8..f29183a45adc 100644
--- a/Documentation/devicetree/bindings/spmi/spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
@@ -25,7 +25,8 @@ properties:
     pattern: "^spmi@.*"
 
   reg:
-    maxItems: 1
+    maxItems: 2
+    minItems: 1
 
   "#address-cells":
     const: 2
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
