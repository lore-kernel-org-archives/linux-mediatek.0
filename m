Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC96CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcGRlTaKYDkfXNoRcAUD1m5ovtQF7PHFJp6QIfdTBfg=; b=E22AeAOk16UzM3
	zWXnIzwicgcg2lP6NddDKWefix8O5YzGd0zx0IY5DoOcKSDVXW+8m/kre6iW0R6wap5esg991OghQ
	onLQlS6FpgLiluu6m4I8IIIPgmVHK0Akf4qu3GJqjDuTb1pKkWPGCb6CggRKnrKSGGOyxd4Fu82Sw
	8g1Mdm+2vJqwrAO4Y8dBOOesv20JwpFyhrjmAMK0ml3dnBwez+85vM0/f05wdiKrfHTF/B2T5xY9C
	8s6Yam2nQ870qCwxVwK2NMg3kVNxDLzBTd60zRL9PXOYbR7hAKUxk4EzBu/ThxxOCv3Gaf7CWMDpH
	XBs4fMUuY8vZcKFoL69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niyGJ-009Zly-Rk; Mon, 25 Apr 2022 12:56:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niyG0-009ZhK-UZ; Mon, 25 Apr 2022 12:56:02 +0000
X-UUID: 4e813abde8054da3a784cb357a756f49-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:082b8607-c79b-49d7-9186-7abbec392e1c, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:5f3409f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4e813abde8054da3a784cb357a756f49-20220425
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 610739235; Mon, 25 Apr 2022 05:55:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 05:55:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Apr 2022 20:55:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Apr 2022 20:55:49 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI dt-bindings
Date: Mon, 25 Apr 2022 20:55:45 +0800
Message-ID: <20220425125546.4129-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220425125546.4129-1-johnson.wang@mediatek.com>
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_055601_051470_EB6C1F31 
X-CRM114-Status: GOOD (  14.07  )
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

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 .../bindings/interconnect/mediatek,cci.yaml   | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
new file mode 100644
index 000000000000..e5221e17d11b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
@@ -0,0 +1,139 @@
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
+          The multiplexer for clock input of CPU cluster.
+      - description:
+          A parent of "cpu" clock which is used as an intermediate clock source
+          when the original CPU is under transition and not stable yet.
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
+      voltage. When it presents, the cci devfreq driver needs to do
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
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
