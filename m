Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD29AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cemH/CgogjQSaCHCmabShBHQ6OTqCJPvHWrPG2x1/x8=; b=t+U4yGg54xH63K
	8EWBOFux9wUc2kO7rCOXEhDCv77Vnb9nwZk/IoZ21rPZQW4YA9brYwIZIiLIU/j3KS2zLQ4mHUiKS
	lA9Ea3K9HDfT8U6vGoh+1L4Pycg4CG1tlGUgVIK5bfBRmDVWSHOMlol1Q5MzqGkag2v+0fizemwwY
	Oui+M2tyfK5jFqPw9jZOlaXrVcjVzVc4XRtONmZxh++nm+8HCkfg9l3fx+mNKgAnDDuq3ik4baDda
	dGaskgWqAokj/2nQGdq5auXnFJNGTb75xh4TvcmupC9DqVN4STEyVI6LZewTG6Cvm/vp/wmDmMW/Z
	ly4Cv47QpqyPRLwzY5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCTR-00HaaH-0c; Mon, 07 Mar 2022 12:28:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCNV-00HXv4-Ih; Mon, 07 Mar 2022 12:22:20 +0000
X-UUID: 63081dfcaa04441ca3f75f5c44ae63b0-20220307
X-UUID: 63081dfcaa04441ca3f75f5c44ae63b0-20220307
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2026083264; Mon, 07 Mar 2022 05:22:09 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 04:22:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 20:21:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 20:21:59 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: [PATCH 1/4] dt-bindings: cpufreq: mediatek: transform
 cpufreq-mediatek into yaml
Date: Mon, 7 Mar 2022 20:21:48 +0800
Message-ID: <20220307122151.11666-2-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_042217_665707_6102FECA 
X-CRM114-Status: GOOD (  16.18  )
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

convert Mediatek cpufreq devicetree binding to YAML.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
---
 .../bindings/cpufreq/cpufreq-mediatek.yaml    | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
new file mode 100644
index 000000000000..584946eb3790
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek CPUFREQ driver Device Tree Bindings
+
+maintainers:
+  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
+
+description: |
+  CPUFREQ is used for scaling clock frequency of CPUs.
+  The module cooperates with CCI DEVFREQ to manage frequency for some Mediatek
+  SoCs.
+
+properties:
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
+      - const: "cpu"
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
+      Phandle of the regulator for CPU cluster that provides the supply
+      voltage.
+
+  sram-supply:
+    description:
+      Phandle of the regulator for sram of CPU cluster that provides the supply
+      voltage. When present, the cpufreq driver needs to do "voltage tracking"
+      to step by step scale up/down Vproc and Vsram to fit SoC specific needs.
+      When absent, the voltage scaling flow is handled by hardware, hence no
+      software "voltage tracking" is needed.
+
+  "#cooling-cells":
+    description:
+      For details, please refer to
+      Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
+
+required:
+  - clocks
+  - clock-names
+  - operating-points-v2
+  - proc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    /* Example 1 (MT7623 SoC) */
+    #include <dt-bindings/clock/mt2701-clk.h>
+    cpu_opp_table: opp-table-0 {
+      compatible = "operating-points-v2";
+      opp-shared;
+      opp-598000000 {
+        opp-hz = /bits/ 64 <598000000>;
+        opp-microvolt = <1050000>;
+      };
+
+      /* ... */
+
+    };
+
+    cpus {
+      #address-cells = <2>;
+      #size-cells = <0>;
+      cpu0: cpu@0 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a7";
+        reg = <0x0>;
+        clocks = <&infracfg CLK_INFRA_CPUSEL>, <&apmixedsys CLK_APMIXED_MAINPLL>;
+        clock-names = "cpu", "intermediate";
+        operating-points-v2 = <&cpu_opp_table>;
+        proc-supply = <&mt6380_vcpu_reg>;
+        #cooling-cells = <2>;
+      };
+
+      /* ... */
+
+    };
+
+  - |
+    /* Example 2 (MT8173 SoC) */
+    #include <dt-bindings/clock/mt8173-clk.h>
+    cluster1_opp: opp-table-1 {
+      compatible = "operating-points-v2";
+      opp-shared;
+      opp-507000000 {
+        opp-hz = /bits/ 64 <507000000>;
+        opp-microvolt = <828000>;
+      };
+
+      /* ... */
+
+    };
+
+    cpus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      cpu2: cpu@100 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a72";
+        reg = <0x100>;
+        enable-method = "psci";
+        cpu-idle-states = <&CPU_SLEEP_0>;
+        #cooling-cells = <2>;
+        clocks = <&infracfg CLK_INFRA_CA72SEL>, <&apmixedsys CLK_APMIXED_MAINPLL>;
+        clock-names = "cpu", "intermediate";
+        operating-points-v2 = <&cluster1_opp>;
+        proc-supply = <&mt6397_vpca15_reg>;
+      };
+
+      /* ... */
+
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
