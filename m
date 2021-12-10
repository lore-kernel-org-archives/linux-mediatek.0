Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE75C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wF3lbBvSmrT79S2chaL6gduouzqKtO5rLrjrBGW4mY=; b=QlH1ON0nK5WxMZ
	MeLDvR/sPf4ZoG0UnzHK3KqMXICqSAhpkXHulTMeWp1XLjyH9BWTdyd+aSag57X6hnzoYPYLCH8qD
	2KYGACzdFwvHG7rE/dhCUv5NFfSQ2XT7yl0emQD0BaRRb/nyYRfBTkiz+JbCa2ueY4KswxWvIWnL6
	Kw8EjVuHOniDyRedO6VVkfI3sQfnebTOe5jQJlVsuk8p30qU9cefXN+8NkydCLXVRmSUaL8lMo3DY
	9PftGBXfoCIJGU3sZyrtUAG/WR4KMo4im0PzaYOEhtaVXddGeempayIO33y539P7Cil/YC3FW3Ioh
	MJ9RDlVXAl2EJNe8tjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjgQ-002pR7-JV; Fri, 10 Dec 2021 17:27:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjfS-002opP-SG; Fri, 10 Dec 2021 17:26:48 +0000
X-UUID: b1f28f2451fd48ca9eed933e14b44da8-20211210
X-UUID: b1f28f2451fd48ca9eed933e14b44da8-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2062058557; Fri, 10 Dec 2021 10:26:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:26:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:40 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 04/17] dt-bindings: soc: mediatek: apu: Add APU power
 compatible
Date: Sat, 11 Dec 2021 01:25:52 +0800
Message-ID: <20211210172605.30618-5-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_092646_953013_3468FB01 
X-CRM114-Status: GOOD (  12.35  )
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

Add new document for APU power compatible.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../soc/mediatek/mediatek,apu-pwr.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
new file mode 100644
index 000000000000..00f67dddb162
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 (C) MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pwr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU Power driver bindings
+
+description: |
+  MediaTek AI Process Unit (APU) power driver supports for subsys clock and
+  regulator controller.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apu-power
+  reg:
+    minItems: 1
+
+  reg-names:
+    minItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  vvpu-supply:
+    description: apu vpu regulator supply.
+
+  vmdla-supply:
+    description: apu mdla regulator supply.
+
+  clocks:
+    description: Contains module clock source and clock names
+
+  clock-names:
+    description: Names of the clocks list in clocks property
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vvpu-supply
+  - vmdla-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    apusys_power: apusys_power@190f1000 {
+      compatible = "mediatek,mt8192-apu-power";
+      reg = <0x190f1000 0x1000>;
+      reg-names = "apu_pcu";
+      power-domains = <&apuspm 0>;
+      vvpu-supply = <&mt6359_vproc1_buck_reg>;
+      vmdla-supply = <&mt6359_vproc2_buck_reg>;
+      clocks = <&topckgen CLK_TOP_DSP_SEL>,
+               <&topckgen CLK_TOP_DSP1_SEL>,
+               <&topckgen CLK_TOP_DSP1_NPUPLL_SEL>,
+               <&topckgen CLK_TOP_DSP2_SEL>,
+               <&topckgen CLK_TOP_DSP2_NPUPLL_SEL>,
+               <&topckgen CLK_TOP_DSP5_SEL>,
+               <&topckgen CLK_TOP_DSP5_APUPLL_SEL>,
+               <&topckgen CLK_TOP_IPU_IF_SEL>,
+               <&clk26m>;
+      clock-names = "clk_top_dsp_sel",
+                    "clk_top_dsp1_sel",
+                    "clk_top_dsp1_npupll_sel",
+                    "clk_top_dsp2_sel",
+                    "clk_top_dsp2_npupll_sel",
+                    "clk_top_dsp5_sel",
+                    "clk_top_dsp5_apupll_sel",
+                    "clk_top_ipu_if_sel",
+                    "clk_top_clk26m";
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
