Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN7u4cSSGwFsHwVNx3x5nbFe83hpCw1I+j3eVQQz4Ks=; b=HFBju1yTcQwWFT
	18wJqbCNIcaJRzgmxcGQRRjs9tkt5yxi9wak2rAR9tcNA9i2lp+GyYdop1iqJfsf3Mh2l4BCJ2OPI
	D7nDBa4IMN/kE6nEoTP5AonWTmi5dogPCbB03MaOzV6iyQOIfDtAS5hnIxDgK5/0MobPsLT4YiyQx
	YBG+l5NVhp0/89MNBZMCELjJv+ukYuSe8ravkMGF0zjteWUfwDFdrnXBOy3fK9TabS4C5/xWEIhe+
	R29zfDUboZD6NIhnjxPWaplp7y/lACtfzfF+g6mMnrhOYNV5/eALT30kIT+8B9zaJZmdm92dM4ocS
	ffcvgcSZP7ZGGJk72hSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuXiK-00HR4H-4m; Fri, 27 May 2022 11:01:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuXi5-00HQzM-UR; Fri, 27 May 2022 11:00:54 +0000
X-UUID: 0fefc0c8d5384d349d1913861cf4ab4c-20220527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:48c0aeeb-c250-4741-890b-4cc454ff5bac,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:2a19b09,CLOUDID:68aabb47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 0fefc0c8d5384d349d1913861cf4ab4c-20220527
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 813711524; Fri, 27 May 2022 04:00:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 May 2022 04:00:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 May 2022 19:00:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 May 2022 19:00:38 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
	<kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<jia-wei.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH v6 1/2] dt-bindings: interconnect: Add MediaTek CCI dt-bindings
Date: Fri, 27 May 2022 19:00:35 +0800
Message-ID: <20220527110036.8810-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220527110036.8810-1-johnson.wang@mediatek.com>
References: <20220527110036.8810-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_040050_024512_561AEC2C 
X-CRM114-Status: GOOD (  17.13  )
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

Add devicetree binding of MediaTek CCI on MT8183 and MT8186.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/interconnect/mediatek,cci.yaml   | 141 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
new file mode 100644
index 000000000000..449c7c988229
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Cache Coherent Interconnect (CCI) frequency and voltage scaling
+
+maintainers:
+  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
+  - Johnson Wang <johnson.wang@mediatek.com>
+
+description: |
+  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine used by
+  MT8183 and MT8186 SoCs to scale the frequency and adjust the voltage in
+  hardware. It can also optimize the voltage to reduce the power consumption.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-cci
+      - mediatek,mt8186-cci
+
+  clocks:
+    items:
+      - description:
+          The multiplexer for clock input of the bus.
+      - description:
+          A parent of "bus" clock which is used as an intermediate clock source
+          when the original clock source (PLL) is under transition and not
+          stable yet.
+
+  clock-names:
+    items:
+      - const: cci
+      - const: intermediate
+
+  operating-points-v2: true
+  opp-table: true
+
+  proc-supply:
+    description:
+      Phandle of the regulator for CCI that provides the supply voltage.
+
+  sram-supply:
+    description:
+      Phandle of the regulator for sram of CCI that provides the supply
+      voltage. When it is present, the implementation needs to do
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
+    #include <dt-bindings/clock/mt8183-clk.h>
+    cci: cci {
+        compatible = "mediatek,mt8183-cci";
+        clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+                 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+        clock-names = "cci", "intermediate";
+        operating-points-v2 = <&cci_opp>;
+        proc-supply = <&mt6358_vproc12_reg>;
+    };
+
+    cci_opp: opp-table-cci {
+        compatible = "operating-points-v2";
+        opp-shared;
+        opp2_00: opp-273000000 {
+            opp-hz = /bits/ 64 <273000000>;
+            opp-microvolt = <650000>;
+        };
+        opp2_01: opp-338000000 {
+            opp-hz = /bits/ 64 <338000000>;
+            opp-microvolt = <687500>;
+        };
+        opp2_02: opp-403000000 {
+            opp-hz = /bits/ 64 <403000000>;
+            opp-microvolt = <718750>;
+        };
+        opp2_03: opp-463000000 {
+            opp-hz = /bits/ 64 <463000000>;
+            opp-microvolt = <756250>;
+        };
+        opp2_04: opp-546000000 {
+            opp-hz = /bits/ 64 <546000000>;
+            opp-microvolt = <800000>;
+        };
+        opp2_05: opp-624000000 {
+            opp-hz = /bits/ 64 <624000000>;
+            opp-microvolt = <818750>;
+        };
+        opp2_06: opp-689000000 {
+            opp-hz = /bits/ 64 <689000000>;
+            opp-microvolt = <850000>;
+        };
+        opp2_07: opp-767000000 {
+            opp-hz = /bits/ 64 <767000000>;
+            opp-microvolt = <868750>;
+        };
+        opp2_08: opp-845000000 {
+            opp-hz = /bits/ 64 <845000000>;
+            opp-microvolt = <893750>;
+        };
+        opp2_09: opp-871000000 {
+            opp-hz = /bits/ 64 <871000000>;
+            opp-microvolt = <906250>;
+        };
+        opp2_10: opp-923000000 {
+            opp-hz = /bits/ 64 <923000000>;
+            opp-microvolt = <931250>;
+        };
+        opp2_11: opp-962000000 {
+            opp-hz = /bits/ 64 <962000000>;
+            opp-microvolt = <943750>;
+        };
+        opp2_12: opp-1027000000 {
+            opp-hz = /bits/ 64 <1027000000>;
+            opp-microvolt = <975000>;
+        };
+        opp2_13: opp-1092000000 {
+            opp-hz = /bits/ 64 <1092000000>;
+            opp-microvolt = <1000000>;
+        };
+        opp2_14: opp-1144000000 {
+            opp-hz = /bits/ 64 <1144000000>;
+            opp-microvolt = <1025000>;
+        };
+        opp2_15: opp-1196000000 {
+            opp-hz = /bits/ 64 <1196000000>;
+            opp-microvolt = <1050000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 41c9c8f2b96d..7239f0e0c47b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5735,6 +5735,7 @@ L:	linux-pm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
 F:	Documentation/devicetree/bindings/devfreq/
+F:	Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
 F:	drivers/devfreq/
 F:	include/linux/devfreq.h
 F:	include/trace/events/devfreq.h
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
