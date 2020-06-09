Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CC1C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A9720814
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f6a9cgRD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ixbh/pRi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A9720814
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLE9vGtNXmyzvgWpL8qsCz9rew9pisS0Ks6Vpu1aoWE=; b=f6a9cgRD9X8LZV
	0C9gaTHE/e/xx9Qj6rOPZbeXGama5mkTj2Xt3q39yDZOE8bIzUgruhqGHw8OzAJmObdsOXTl/25gf
	SGvgHgeqSCsuezqF07rKGEcAFSXf7ivjJfh9uasmZns4YISHBl0BB1Lrirs3TNdvl4hvpOdqKJ5Nf
	B6E332edHKEj0xmG3pGIS0mlRu595bHQUxxFqUpNe5kg5yrNnwx+KM5syYKXTtjOtXXF1FESBbOfL
	eyL34UEed4gXMuVgFaLVu5bACXXAiKsAsRbol0QhO2KAr2ylEQGNTaXei2nE+1U1DVXOZZtbAjr7W
	Roza6tmrGjsTkxOzaz+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jibll-0001qb-3n; Tue, 09 Jun 2020 10:46:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiblP-0001Xp-CT; Tue, 09 Jun 2020 10:45:53 +0000
X-UUID: e98503162cbb4d2585ac5277e67a0188-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eY5MvzczwNbrwtKhGEVAhCGRBXkqAd3J0N4ihq/a/Eg=; 
 b=Ixbh/pRi2qVt4/u18b6/pZ6JYYn7wksjI/N+YKre+mLy3rJVXv/8QRu6uKffChwppnwMGrutMzgpt9fAKXVe76sjN8gLYTQ/x+U0h0q0x4v3wfgG3e91o3fKUHSAFWEFPuQXlCLLvR6KzoiGG/0RMVVOri53w8AHZQuzOxYQ7fc=;
X-UUID: e98503162cbb4d2585ac5277e67a0188-20200609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 455011840; Tue, 09 Jun 2020 02:45:50 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 03:45:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 18:45:36 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 18:45:34 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v9 1/4] dt-bindings: power: avs: add mtk svs dt-bindings
Date: Tue, 9 Jun 2020 18:45:31 +0800
Message-ID: <20200609104534.29314-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200609104534.29314-1-roger.lu@mediatek.com>
References: <20200609104534.29314-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_034551_433192_2073138B 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 Angus Lin <Angus.Lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Roger Lu <roger.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the binding for enabling mtk svs on MediaTek SoC.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 .../bindings/power/avs/mtk_svs.yaml           | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/avs/mtk_svs.yaml

diff --git a/Documentation/devicetree/bindings/power/avs/mtk_svs.yaml b/Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
new file mode 100644
index 000000000000..f16f4eb56ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/avs/mtk_svs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Introduce SVS engine
+
+maintainers:
+  - Kevin Hilman <khilman@kernel.org>
+  - Nishanth Menon <nm@ti.com>
+
+description: |+
+  The Smart Voltage Scaling(SVS) engine is a piece of hardware
+  which has several controllers(banks) for calculating suitable
+  voltage to different power domains(CPU/GPU/CCI) according to
+  chip process corner, temperatures and other factors. Then DVFS
+  driver could apply SVS bank voltage to PMIC/Buck.
+
+properties:
+  compatible:
+    const: mediatek,mt8183-svs
+
+  reg:
+    description: Address range of the MTK SVS controller.
+    maxItems: 1
+
+  interrupts:
+    description: IRQ for the MTK SVS controller.
+    maxItems: 1
+
+  clocks:
+    description: Main clock for svs controller to work.
+
+  clock-names:
+    const: main
+
+  nvmem-cells:
+    maxItems: 2
+    description:
+      Phandle to the calibration data provided by a nvmem device.
+
+  nvmem-cell-names:
+    items:
+      - const: svs-calibration-data
+      - const: calibration-data
+
+patternProperties:
+  "^svs-(cpu-little|cpu-big|cci|gpu)$":
+    type: object
+    description:
+      Each subnode represents one SVS bank.
+        - svs-cpu-little (SVS bank device node of little CPU)
+        - svs-cpu-big (SVS bank device node of big CPU)
+        - svs-cci (SVS bank device node of CCI)
+        - svs-gpu (SVS bank device node of GPU)
+
+    properties:
+      compatible:
+       enum:
+         - mediatek,mt8183-svs-cpu-little
+         - mediatek,mt8183-svs-cpu-big
+         - mediatek,mt8183-svs-cci
+         - mediatek,mt8183-svs-gpu
+
+      power-domains:
+        description: Phandle to the associated power domain
+        maxItems: 1
+
+      operating-points-v2: true
+
+      vcpu-little-supply:
+        description: PMIC buck of little CPU
+
+      vcpu-big-supply:
+        description: PMIC buck of big CPU
+
+      vcci-supply:
+        description: PMIC buck of CCI
+
+      vgpu-spply:
+        description: PMIC buck of GPU
+
+    required:
+      - compatible
+      - operating-points-v2
+
+    additionalProperties: false
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
+    #include <dt-bindings/power/mt8183-power.h>
+
+    svs: svs@1100b000 {
+        compatible = "mediatek,mt8183-svs";
+        reg = <0 0x1100b000 0 0x1000>;
+        interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&infracfg CLK_INFRA_THERM>;
+        clock-names = "main";
+        nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
+        nvmem-cell-names = "svs-calibration-data", "calibration-data";
+
+        svs_cpu_little: svs-cpu-little {
+            compatible = "mediatek,mt8183-svs-cpu-little";
+            operating-points-v2 = <&cluster0_opp>;
+            vcpu-little-supply = <&mt6358_vproc12_reg>;
+        };
+
+        svs_cpu_big: svs-cpu-big {
+            compatible = "mediatek,mt8183-svs-cpu-big";
+            operating-points-v2 = <&cluster1_opp>;
+            vcpu-big-supply = <&mt6358_vproc11_reg>;
+        };
+
+        svs_cci: svs-cci {
+            compatible = "mediatek,mt8183-svs-cci";
+            operating-points-v2 = <&cci_opp>;
+            vcci-supply = <&mt6358_vproc12_reg>;
+        };
+
+        svs_gpu: svs-gpu {
+            compatible = "mediatek,mt8183-svs-gpu";
+            power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
+            operating-points-v2 = <&gpu_opp_table>;
+            vgpu-spply = <&mt6358_vgpu_reg>;
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
