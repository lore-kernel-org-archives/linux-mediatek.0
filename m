Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB721C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8N29E5c5rYUimRNsG4/CKhOGNAiQKYhQo9EOkj7Mygg=; b=S21pZwzH7lq+KY
	wi4VHHGNXMM+nNZuyrufZ1BxufTJl+ldT6eerD2hPJ8XdObTyKhXCT/8CtPkPT8QRznK6U+DyTDft
	eWlR7jsxMaHTSBLPR8kMeJK/S4VYjm5/vRX+sRDGiX7qXhKlZSNjy8ZdjHoDMDWvZjWbFby+9Yv86
	MhWjODrhFhJ8E+cK5WGbavIfJJYkRzCPGqhFx5p+EYc8WWHT+c2hFKW329nEXW5x7yIYM5nhCDnof
	r+KbA/1mq1yCE3pxBRHL9wTmk5psIREMUhkiYXze28E69fMNLHlwp92xsmlnZ1SqvRgyxCZYAGduq
	CWgLEokzPg59olrsksTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRChd-0004rn-31; Mon, 07 Mar 2022 12:43:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCX2-0000zD-9O; Mon, 07 Mar 2022 12:32:12 +0000
X-UUID: c5e8b51da50240e3b671da72fd53505d-20220307
X-UUID: c5e8b51da50240e3b671da72fd53505d-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 838399917; Mon, 07 Mar 2022 05:32:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 04:26:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 20:26:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 20:26:23 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jia-Wei
 Chang <jia-wei.chang@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
Date: Mon, 7 Mar 2022 20:25:11 +0800
Message-ID: <20220307122513.11822-2-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_043208_394298_123A98A8 
X-CRM114-Status: GOOD (  15.76  )
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

add devicetree binding of mtk cci devfreq on MediaTek SoC.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
---
 .../devicetree/bindings/devfreq/mtk-cci.yaml  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-cci.yaml

diff --git a/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
new file mode 100644
index 000000000000..e64ac4c56758
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/mtk-cci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Cache Coherent Interconnect (CCI) Devfreq driver Device Tree Bindings
+
+maintainers:
+  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
+
+description: |
+  This module is used to create CCI DEVFREQ.
+  The performance will depend on both CCI frequency and CPU frequency.
+  For MT8186, CCI co-buck with Little core.
+  Contain CCI opp table for voltage and frequency scaling.
+
+properties:
+  compatible:
+    const: "mediatek,mt8186-cci"
+
+  clocks:
+    items:
+      - description:
+          The first one is the multiplexer for clock input of CPU cluster.
+      - description:
+          The other is used as an intermediate clock source when the original
+          CPU is under transition and not stable yet.
+
+  clock-names:
+    items:
+      - const: "cci"
+      - const: "intermediate"
+
+  operating-points-v2:
+    description:
+      For details, please refer to
+      Documentation/devicetree/bindings/opp/opp-v2.yaml
+
+  opp-table: true
+
+  proc-supply:
+    description:
+      Phandle of the regulator for CCI that provides the supply voltage.
+
+  sram-supply:
+    description:
+      Phandle of the regulator for sram of CCI that provides the supply
+      voltage. When present, the cci devfreq driver needs to do
+      "voltage tracking" to step by step scale up/down Vproc and Vsram to fit
+      SoC specific needs. When absent, the voltage scaling flow is handled by
+      hardware, hence no software "voltage tracking" is needed.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - operating-points-v2
+  - proc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8186-clk.h>
+    cci: cci {
+      compatible = "mediatek,mt8186-cci";
+      clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>, <&apmixedsys CLK_APMIXED_MAINPLL>;
+      clock-names = "cci", "intermediate";
+      operating-points-v2 = <&cci_opp>;
+      proc-supply = <&mt6358_vproc12_reg>;
+      sram-supply = <&mt6358_vsram_proc12_reg>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
