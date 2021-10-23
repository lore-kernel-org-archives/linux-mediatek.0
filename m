Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0801C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47FD60FE7
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B47FD60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DanF9M0T2bApMSWilJTOnfwnTXGnHxeqeMgn6rU7Ns=; b=gDCLBf/C295aVU
	YS+YP+aPJmN6YJ0pLuV//jFeVO+qoDWDEgp91D8uPIgTgwyeEtlIP35mSXuU1goi4nmp/VKGj8/PT
	iqjz8dipy335lrHhAKfSt77psf04s31TQpNitXZ7Od6mZKjYcah/uVHWdtmPFK/P0G6DY8A6JbmvD
	kg/v9HRKa1t2W+6JbvKhAf80SOd4NtXktRI9dHqvzEs6f04iB4o4AhtHFTaua1Wf21J4Lx5uaPCBl
	NZ7BrYIgbxs0CP5ATCp+Vt7OwOYL2RCsxuraQhzHZMRv3rdPV7a/uiqtvuijVjUhC6UvdZWrY1+DH
	u4S5HhiKEb05D2rrLVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meF05-00CcjY-Ch; Sat, 23 Oct 2021 11:15:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meEzI-00CcLi-UE; Sat, 23 Oct 2021 11:14:58 +0000
X-UUID: 3c479e071452475896d1b2e76669081d-20211023
X-UUID: 3c479e071452475896d1b2e76669081d-20211023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 13240990; Sat, 23 Oct 2021 04:14:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 04:14:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 23 Oct 2021 19:14:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:50 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 02/13] dt-bindings: soc: mediatek: apusys: Add new document for
 APU power
Date: Sat, 23 Oct 2021 19:13:58 +0800
Message-ID: <20211023111409.30463-3-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_041457_010305_665F7750 
X-CRM114-Status: GOOD (  13.24  )
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

Add new document for APU power controller.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 .../soc/mediatek/mediatek,apu-pwr.yaml        | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
new file mode 100644
index 000000000000..0fd5af5138e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pwr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek APU Power
+
+description: |
+  Mediatek AI Process Unit (APU) power driver support for subsys clock and
+  regulator controller. It will has device link to iommu-apu and apusys-rv
+  tinysys driver to ensure the power state is ready for hardware
+  in sub modules.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,apusys-power
+      - items:
+          - const: mediatek,apusys-power
+          - const: mediatek,mt8192-apu-power
+
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
+  - clocks
+  - clock-names
+  - vvpu-supply
+  - vmdla-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    apusys_power: apusys_power@190f1000 {
+      compatible = "mediatek,apusys-power",
+                   "mediatek,mt8192-apu-power";
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
