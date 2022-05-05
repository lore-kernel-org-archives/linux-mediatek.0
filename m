Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EMjAb+q0GenXJHjudkWZAenfNd6FieGzB1VhYPt6Go=; b=10Iaqhy9Yy43vs
	0FQ8yv1vqN0VTaa0tc9LECxfcUzR2c7PMElIzjGDv5dpC4TtPLZAljJlnkLmMGFzPCNnZhjuonZNf
	WcGqfEAB11L5QZbnsKYBR+6fU+cz9XE+nwMR6Czn64cDoSF6s3ANI6qrnJPyI+CEUCthFq4woia64
	yNLJP4UXtvuR5fjvtgvosx5Pi4eBOVeMmhB5GtEtbWeWKtjBPrgtvtQQS30POzEtjt7XngPiePwoY
	B/f4CzeHsi2TO8EaH/+XQKTM6HdT2h8cbBlLSbZbyaTsCIqmYwDjt5s29sVPCrOOs6fJmaYPQbO/U
	eTfBvB6sfM3zqrUAIwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaG6-00FgNn-Oo; Thu, 05 May 2022 12:07:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaC5-00FdoG-BK; Thu, 05 May 2022 12:02:55 +0000
X-UUID: d878f520e0a04f689d20d0c41e58d368-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9cc63de6-dc30-480f-baaf-c1ef86734655, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:bfc8b1b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d878f520e0a04f689d20d0c41e58d368-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 876271624; Thu, 05 May 2022 05:02:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 04:52:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 19:52:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 May 2022 19:52:35 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>
Subject: [PATCH v6 08/10] arm64: dts: mediatek: Add opp table and clock
 property for MT8183 cpufreq
Date: Thu, 5 May 2022 19:52:24 +0800
Message-ID: <20220505115226.20130-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_050253_420056_ED4B24AA 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

- Add cpufreq opp table.
- Add MediaTek cci opp table.
- Add property of opp table and clock fro cpufreq.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  32 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 270 ++++++++++++++++++++
 2 files changed, 302 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index f3fd3cca23e9..8953dbf84f3e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -412,6 +412,38 @@
 
 };
 
+&cpu0 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu4 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu5 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu6 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu7 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 01e650251928..cecf96b628b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -42,6 +42,244 @@
 		rdma1 = &rdma1;
 	};
 
+	cluster0_opp: opp-table-cluster0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp0-793000000 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <650000>;
+			required-opps = <&opp2_00>;
+		};
+		opp0-910000000 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <687500>;
+			required-opps = <&opp2_01>;
+		};
+		opp0-1014000000 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <718750>;
+			required-opps = <&opp2_02>;
+		};
+		opp0-1131000000 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <756250>;
+			required-opps = <&opp2_03>;
+		};
+		opp0-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <800000>;
+			required-opps = <&opp2_04>;
+		};
+		opp0-1326000000 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <818750>;
+			required-opps = <&opp2_05>;
+		};
+		opp0-1417000000 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <850000>;
+			required-opps = <&opp2_06>;
+		};
+		opp0-1508000000 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <868750>;
+			required-opps = <&opp2_07>;
+		};
+		opp0-1586000000 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <893750>;
+			required-opps = <&opp2_08>;
+		};
+		opp0-1625000000 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <906250>;
+			required-opps = <&opp2_09>;
+		};
+		opp0-1677000000 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <931250>;
+			required-opps = <&opp2_10>;
+		};
+		opp0-1716000000 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <943750>;
+			required-opps = <&opp2_11>;
+		};
+		opp0-1781000000 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <975000>;
+			required-opps = <&opp2_12>;
+		};
+		opp0-1846000000 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <1000000>;
+			required-opps = <&opp2_13>;
+		};
+		opp0-1924000000 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <1025000>;
+			required-opps = <&opp2_14>;
+		};
+		opp0-1989000000 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1050000>;
+			required-opps = <&opp2_15>;
+		};	};
+
+	cluster1_opp: opp-table-cluster1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp1-793000000 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <700000>;
+			required-opps = <&opp2_00>;
+		};
+		opp1-910000000 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <725000>;
+			required-opps = <&opp2_01>;
+		};
+		opp1-1014000000 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <750000>;
+			required-opps = <&opp2_02>;
+		};
+		opp1-1131000000 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <775000>;
+			required-opps = <&opp2_03>;
+		};
+		opp1-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <800000>;
+			required-opps = <&opp2_04>;
+		};
+		opp1-1326000000 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <825000>;
+			required-opps = <&opp2_05>;
+		};
+		opp1-1417000000 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <850000>;
+			required-opps = <&opp2_06>;
+		};
+		opp1-1508000000 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <875000>;
+			required-opps = <&opp2_07>;
+		};
+		opp1-1586000000 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <900000>;
+			required-opps = <&opp2_08>;
+		};
+		opp1-1625000000 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <912500>;
+			required-opps = <&opp2_09>;
+		};
+		opp1-1677000000 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <931250>;
+			required-opps = <&opp2_10>;
+		};
+		opp1-1716000000 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <950000>;
+			required-opps = <&opp2_11>;
+		};
+		opp1-1781000000 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <975000>;
+			required-opps = <&opp2_12>;
+		};
+		opp1-1846000000 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <1000000>;
+			required-opps = <&opp2_13>;
+		};
+		opp1-1924000000 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <1025000>;
+			required-opps = <&opp2_14>;
+		};
+		opp1-1989000000 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1050000>;
+			required-opps = <&opp2_15>;
+		};
+	};
+
+	cci_opp: opp-table-cci {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp2_00: opp-273000000 {
+			opp-hz = /bits/ 64 <273000000>;
+			opp-microvolt = <650000>;
+		};
+		opp2_01: opp-338000000 {
+			opp-hz = /bits/ 64 <338000000>;
+			opp-microvolt = <687500>;
+		};
+		opp2_02: opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>;
+			opp-microvolt = <718750>;
+		};
+		opp2_03: opp-463000000 {
+			opp-hz = /bits/ 64 <463000000>;
+			opp-microvolt = <756250>;
+		};
+		opp2_04: opp-546000000 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <800000>;
+		};
+		opp2_05: opp-624000000 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-microvolt = <818750>;
+		};
+		opp2_06: opp-689000000 {
+			opp-hz = /bits/ 64 <689000000>;
+			opp-microvolt = <850000>;
+		};
+		opp2_07: opp-767000000 {
+			opp-hz = /bits/ 64 <767000000>;
+			opp-microvolt = <868750>;
+		};
+		opp2_08: opp-845000000 {
+			opp-hz = /bits/ 64 <845000000>;
+			opp-microvolt = <893750>;
+		};
+		opp2_09: opp-871000000 {
+			opp-hz = /bits/ 64 <871000000>;
+			opp-microvolt = <906250>;
+		};
+		opp2_10: opp-923000000 {
+			opp-hz = /bits/ 64 <923000000>;
+			opp-microvolt = <931250>;
+		};
+		opp2_11: opp-962000000 {
+			opp-hz = /bits/ 64 <962000000>;
+			opp-microvolt = <943750>;
+		};
+		opp2_12: opp-1027000000 {
+			opp-hz = /bits/ 64 <1027000000>;
+			opp-microvolt = <975000>;
+		};
+		opp2_13: opp-1092000000 {
+			opp-hz = /bits/ 64 <1092000000>;
+			opp-microvolt = <1000000>;
+		};
+		opp2_14: opp-1144000000 {
+			opp-hz = /bits/ 64 <1144000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp2_15: opp-1196000000 {
+			opp-hz = /bits/ 64 <1196000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -85,6 +323,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
 		};
@@ -96,6 +338,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
 		};
@@ -107,6 +353,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
 		};
@@ -118,6 +368,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
 		};
@@ -129,6 +383,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
 		};
@@ -140,6 +398,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
 		};
@@ -151,6 +413,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
 		};
@@ -162,6 +428,10 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
 		};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
