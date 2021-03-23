Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E7C433E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87901619D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87901619D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VnX0LGn3ZwJz5LFUqz3sptOIQZqocm6zzsAiiDG7fYo=; b=YWHKqnsvr0IgWG6pEjKWON/8w
	kFL7s9cP2zjmetqQNhxVcbGjyBJobtLKLhf9VzFoOR9xKbOdiH/D+xFhRJD/9jztrdOoSN7tg3faF
	fpIg6NXIo+6Kv0r+VMYdyQmf3l1XMh9XvcwLI31dhoHBg27Jx6e2WjdvybnNXofkEgeQV+uQZTVFl
	WZKU0Fc8PWjlacXKpirao+PDsfARVfRGGmfTvjn+aMcy4oOwikpUbvKFy4LFQC3MQa53FxOKEbhjb
	j0HD9OAZNEa/kvEOGDPdL8RvixV2fuv3u6LKx8wWx+CUI1Yt5Rz5S6Qahnozc7WVQAKCCtsOcj2Lw
	xbhWS6fwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfJm-00Eimw-M3; Tue, 23 Mar 2021 11:35:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfIj-00EiXq-M1; Tue, 23 Mar 2021 11:34:24 +0000
X-UUID: 6a86d5f25a284c4aa288a9557bce4af9-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7nRolbf/uE7+oGndsQgM2sfn5f8F5sGAlhCF9LTA76M=; 
 b=ZnpmXrugJsT9fqmekbPmURG4i9ttf/F3+neyXk0PUFEDO7UzT5ptaIB5rN8AdyDmAB8DM0He3XRrsOo4+tMsYyQR4ZURacs7g0M3WU1TymUGO5788xqkr4UhyyAKBRwkBseNgEj42H1K944WkT5TZKkPnS5uBzt8aqe+/5tAF+Y=;
X-UUID: 6a86d5f25a284c4aa288a9557bce4af9-20210323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 379055333; Tue, 23 Mar 2021 03:34:11 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:34:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:34:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:34:09 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Subject: [PATCH V8 8/8] arm64: dts: mediatek: add cpufreq and cci devfreq
 nodes for mt8183
Date: Tue, 23 Mar 2021 19:34:01 +0800
Message-ID: <1616499241-4906-9-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_113422_805825_E7B224F9 
X-CRM114-Status: GOOD (  10.19  )
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

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

add cpufreq and cci devfreq nodes for mt8183

base on regulator node
https://patchwork.kernel.org/patch/11500339/
Now queued for v5.7-next/dts64

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts    |  36 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 277 +++++++++++++++++++++++++
 3 files changed, 317 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 3249c959f76f..77a591cc09a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -395,6 +395,42 @@
 
 };
 
+&cci {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..b1c3b88c4ac4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -217,6 +217,10 @@
 	status = "okay";
 };
 
+&cci {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
 &cpu0 {
 	proc-supply = <&mt6358_vproc12_reg>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a145f13..c3dc87b01067 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -41,6 +41,251 @@
 		rdma1 = &rdma1;
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp0_00 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <650000>;
+			required-opps = <&opp2_00>;
+		};
+		opp0_01 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <687500>;
+			required-opps = <&opp2_01>;
+		};
+		opp0_02 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <718750>;
+			required-opps = <&opp2_02>;
+		};
+		opp0_03 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <756250>;
+			required-opps = <&opp2_03>;
+		};
+		opp0_04 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <800000>;
+			required-opps = <&opp2_04>;
+		};
+		opp0_05 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <818750>;
+			required-opps = <&opp2_05>;
+		};
+		opp0_06 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <850000>;
+			required-opps = <&opp2_06>;
+		};
+		opp0_07 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <868750>;
+			required-opps = <&opp2_07>;
+		};
+		opp0_08 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <893750>;
+			required-opps = <&opp2_08>;
+		};
+		opp0_09 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <906250>;
+			required-opps = <&opp2_09>;
+		};
+		opp0_10 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <931250>;
+			required-opps = <&opp2_10>;
+		};
+		opp0_11 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <943750>;
+			required-opps = <&opp2_11>;
+		};
+		opp0_12 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <975000>;
+			required-opps = <&opp2_12>;
+		};
+		opp0_13 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <1000000>;
+			required-opps = <&opp2_13>;
+		};
+		opp0_14 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <1025000>;
+			required-opps = <&opp2_14>;
+		};
+		opp0_15 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1050000>;
+			required-opps = <&opp2_15>;
+		};	};
+
+	cluster1_opp: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp1_00 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <700000>;
+			required-opps = <&opp2_00>;
+		};
+		opp1_01 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <725000>;
+			required-opps = <&opp2_01>;
+		};
+		opp1_02 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <750000>;
+			required-opps = <&opp2_02>;
+		};
+		opp1_03 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <775000>;
+			required-opps = <&opp2_03>;
+		};
+		opp1_04 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <800000>;
+			required-opps = <&opp2_04>;
+		};
+		opp1_05 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <825000>;
+			required-opps = <&opp2_05>;
+		};
+		opp1_06 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <850000>;
+			required-opps = <&opp2_06>;
+		};
+		opp1_07 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <875000>;
+			required-opps = <&opp2_07>;
+		};
+		opp1_08 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <900000>;
+			required-opps = <&opp2_08>;
+		};
+		opp1_09 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <912500>;
+			required-opps = <&opp2_09>;
+		};
+		opp1_10 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <931250>;
+			required-opps = <&opp2_10>;
+		};
+		opp1_11 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <950000>;
+			required-opps = <&opp2_11>;
+		};
+		opp1_12 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <975000>;
+			required-opps = <&opp2_12>;
+		};
+		opp1_13 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <1000000>;
+			required-opps = <&opp2_13>;
+		};
+		opp1_14 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <1025000>;
+			required-opps = <&opp2_14>;
+		};
+		opp1_15 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1050000>;
+			required-opps = <&opp2_15>;
+		};
+	};
+
+	cci_opp: opp_table2 {
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
+	cci: cci {
+		compatible = "mediatek,mt8183-cci";
+		clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
+		clock-names = "cci_clock";
+		operating-points-v2 = <&cci_opp>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -84,6 +329,10 @@
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
@@ -95,6 +344,10 @@
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
@@ -106,6 +359,10 @@
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
@@ -117,6 +374,10 @@
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
@@ -128,6 +389,10 @@
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
@@ -139,6 +404,10 @@
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
@@ -150,6 +419,10 @@
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
@@ -161,6 +434,10 @@
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
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
