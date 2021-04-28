Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D16C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 06:59:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF8861154
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 06:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF8861154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tBi1Lvs+C5V3flsxBpDweW8CNsVGRCH+IXl/JcBr030=; b=jlh16YoJW6Rrm63C4aj43BLrR
	sz2bXR/HNTusgaR1TMg5xfR4rfZY4rkAbDjAaLqV7ltrdnfb0h4W3gdC4gUcgzQAiOQXkLHKAs7PN
	nCnaa4mqZaEAl1zBjNNxBtd/6lfYpLpfJI+lojH1jkj6mSQLNdxhEmHKBKXtXwuVwWZbI2d7zfw78
	7mc3AyiozhDVAi07l7Ab1PUDTR8BosnjGfEm9Ph6R+FLpt9cvUaZSgNnwUmwB6AJqBvNjMARKYTS5
	IiLPDGHpgwjxr1Wh/si1sKaSa+ni9Vdtd+nB8HBF83TohGTCx6RxvwakHroQbHuPMQNetMKSAqEGX
	SypDewxuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbeA5-00300F-To; Wed, 28 Apr 2021 06:59:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbe8z-002ziB-3S; Wed, 28 Apr 2021 06:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=fj4vv7ZOvppbF++JOtpzDzNxksfEbL62GBpi431CYzs=; b=KX6ap+xInzPy9j59IQA96V0eUC
 CQPREsdV3gmisYQ5gmQt6XF5noqTko5jWz3I8FWXrWpl4gOiMnMnhy3KJEdtLOQFTjHfFNtdwY544
 hIpuWKenGN9n3tVdyaLi3d4efT/hjoFIGyWYvvxz9eTzKtbYv2vEvFnMo/1XjkFKJPa8tgm5NCFGK
 SVJHVukOxIYarktFaujF/R0hKLAgpEQZ6aKXkc+ifvv9IBXU+9J9vzJMNaGsyNr8Kr4Q4c3vvhUIe
 3vF7JkBXznMqw12N91aJhbSVXoUKpnC7UKlpCmeMQdcTNng3jKYZcddycg/feQPXvXCrfmwfXj/tB
 vg0xKp4w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbe8w-00HENA-7R; Wed, 28 Apr 2021 06:57:55 +0000
X-UUID: 3f6c29d48273481b81e6b022264ba5b3-20210427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fj4vv7ZOvppbF++JOtpzDzNxksfEbL62GBpi431CYzs=; 
 b=KhWdshECsjQPQxsoAQ2N2kRxQMbS0h9j9qGF0ayD5EJNXa5wfRL5ArCpPP4X/X6mmfF3p5agMOKwMsX1usHUuy+07/ibFocVQt2lUV7dFV4YgPQuriNMAC5+OKByLU/Y3YWyrKYupkMAnhQJhlMW43ERpkIr73LNs4FjcfsOvBk=;
X-UUID: 3f6c29d48273481b81e6b022264ba5b3-20210427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 645230190; Tue, 27 Apr 2021 23:57:44 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Apr 2021 23:54:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 14:54:42 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Apr 2021 14:54:42 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v16 1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
Date: Wed, 28 Apr 2021 14:54:34 +0800
Message-ID: <20210428065440.3704-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210428065440.3704-1-roger.lu@mediatek.com>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_235754_293673_38387D3D 
X-CRM114-Status: GOOD (  13.67  )
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

Document the binding for enabling mtk svs on MediaTek SoC.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/mediatek/mtk-svs.yaml        | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
new file mode 100644
index 000000000000..a855ced410f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mtk-svs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Smart Voltage Scaling (SVS) Device Tree Bindings
+
+maintainers:
+  - Roger Lu <roger.lu@mediatek.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Kevin Hilman <khilman@kernel.org>
+
+description: |+
+  The SVS engine is a piece of hardware which has several
+  controllers(banks) for calculating suitable voltage to
+  different power domains(CPU/GPU/CCI) according to
+  chip process corner, temperatures and other factors. Then DVFS
+  driver could apply SVS bank voltage to PMIC/Buck.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-svs
+
+  reg:
+    maxItems: 1
+    description: Address range of the MTK SVS controller.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Main clock for MTK SVS controller to work.
+
+  clock-names:
+    const: main
+
+  nvmem-cells:
+    minItems: 1
+    maxItems: 2
+    description:
+      Phandle to the calibration data provided by a nvmem device.
+    items:
+      - description: SVS efuse for SVS controller
+      - description: Thermal efuse for SVS controller
+
+  nvmem-cell-names:
+    items:
+      - const: svs-calibration-data
+      - const: t-calibration-data
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        svs@1100b000 {
+            compatible = "mediatek,mt8183-svs";
+            reg = <0 0x1100b000 0 0x1000>;
+            interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&infracfg CLK_INFRA_THERM>;
+            clock-names = "main";
+            nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
+            nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
