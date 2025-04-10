Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72880C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i8ye0TgbRGta61NxSluRETGX8vYSDrQ9Wn0mCSRWNo=; b=XuLVIN6WcrTkuQ8R2qz/ZFpynG
	LfMNRIzEjRMpbZ56M8vi92yxBOoqwcZVhCEGViXJ9Cg4ya+Q3hPRX06MqYl1BVt5UjkrKN98dnnhG
	aRTZu5BmIhmBcUpI15lLUWDXpMsqxkhrt9rspAchMqozMDd8I9RzID7p20ko66ODS69ASECncPYh2
	cRwiR2HOBiMhTrpngfapIFAV9GtdW8T1/0ztHZaUjMMCDKlJoZ5Dg2nStRp4vpAxGRyeGh8PFsmv4
	ahXLhIvU5WixxdJJo/e2nWeljMOoew4JXyiS7gz26ehuycv2tIQHYNDgEI2x1WT+MWiG6WHZgBEj5
	7yzTEqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vPV-0000000BKFF-17bR;
	Thu, 10 Apr 2025 17:09:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8T-0000000B57F-0EpN;
	Thu, 10 Apr 2025 15:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3AD15C5B9B;
	Thu, 10 Apr 2025 15:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FF4C4CEDD;
	Thu, 10 Apr 2025 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300090;
	bh=8tfaaNZ4HrH7opoaFMg4/Qd0jHKomOYwuo5NwUKhvx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F07Lc4bpt+yN+th4lZJNLUif9Vsbs8jnsVA6h1SEMAAxVrX+FL4/Au5KWenw+1DH9
	 BH6yiYIZmka6TMCrTmOJ6M1rp46sGn4toqpLPa+fzTNNn8OBVUk5tm+MrmGeLGtp4v
	 0t08uUIYAhHkGvs4IpQOEZEHXIojnzNcl2f+3yHjgP0JTy6xYRjxiWwtaTjbg95rz7
	 /uEl+E10tBzh5CvL3m6w6qy/ck4AJQjiwbobS6qZG66/NYkbJ1QRHlGCA8SAlCgNUE
	 Ud/S2sHTPErUfalr4V9fg1m5v0/lTQklRsHgcL77c5S3/NmmfVOtoujb6pTEDjlGaj
	 WsGZ5T9YPKZbQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:38 -0500
Subject: [PATCH v2 17/17] dt-bindings: cpufreq: Drop redundant Mediatek
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-17-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084813_221845_285DB32E 
X-CRM114-Status: GOOD (  13.52  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Mediatek CPUFreq binding document just describes properties from
the CPU node which the driver uses. This is redundant as all the
properties are described in the arm/cpus.yaml schema.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
 1 file changed, 250 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
deleted file mode 100644
index e0a4ba599abc..000000000000
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
+++ /dev/null
@@ -1,250 +0,0 @@
-Binding for MediaTek's CPUFreq driver
-=====================================
-
-Required properties:
-- clocks: A list of phandle + clock-specifier pairs for the clocks listed in clock names.
-- clock-names: Should contain the following:
-	"cpu"		- The multiplexer for clock input of CPU cluster.
-	"intermediate"	- A parent of "cpu" clock which is used as "intermediate" clock
-			  source (usually MAINPLL) when the original CPU PLL is under
-			  transition and not stable yet.
-	Please refer to Documentation/devicetree/bindings/clock/clock-bindings.txt for
-	generic clock consumer properties.
-- operating-points-v2: Please refer to Documentation/devicetree/bindings/opp/opp-v2.yaml
-	for detail.
-- proc-supply: Regulator for Vproc of CPU cluster.
-
-Optional properties:
-- sram-supply: Regulator for Vsram of CPU cluster. When present, the cpufreq driver
-	       needs to do "voltage tracking" to step by step scale up/down Vproc and
-	       Vsram to fit SoC specific needs. When absent, the voltage scaling
-	       flow is handled by hardware, hence no software "voltage tracking" is
-	       needed.
-- mediatek,cci:
-	Used to confirm the link status between cpufreq and mediatek cci. Because
-	cpufreq and mediatek cci could share the same regulator in some MediaTek SoCs.
-	To prevent the issue of high frequency and low voltage, we need to use this
-	property to make sure mediatek cci is ready.
-	For details of mediatek cci, please refer to
-	Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
-- #cooling-cells:
-	For details, please refer to
-	Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
-
-Example 1 (MT7623 SoC):
-
-	cpu_opp_table: opp_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-598000000 {
-			opp-hz = /bits/ 64 <598000000>;
-			opp-microvolt = <1050000>;
-		};
-
-		opp-747500000 {
-			opp-hz = /bits/ 64 <747500000>;
-			opp-microvolt = <1050000>;
-		};
-
-		opp-1040000000 {
-			opp-hz = /bits/ 64 <1040000000>;
-			opp-microvolt = <1150000>;
-		};
-
-		opp-1196000000 {
-			opp-hz = /bits/ 64 <1196000000>;
-			opp-microvolt = <1200000>;
-		};
-
-		opp-1300000000 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1300000>;
-		};
-	};
-
-	cpu0: cpu@0 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x0>;
-		clocks = <&infracfg CLK_INFRA_CPUSEL>,
-			 <&apmixedsys CLK_APMIXED_MAINPLL>;
-		clock-names = "cpu", "intermediate";
-		operating-points-v2 = <&cpu_opp_table>;
-		#cooling-cells = <2>;
-	};
-	cpu@1 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x1>;
-		operating-points-v2 = <&cpu_opp_table>;
-	};
-	cpu@2 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x2>;
-		operating-points-v2 = <&cpu_opp_table>;
-	};
-	cpu@3 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a7";
-		reg = <0x3>;
-		operating-points-v2 = <&cpu_opp_table>;
-	};
-
-Example 2 (MT8173 SoC):
-	cpu_opp_table_a: opp_table_a {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-507000000 {
-			opp-hz = /bits/ 64 <507000000>;
-			opp-microvolt = <859000>;
-		};
-
-		opp-702000000 {
-			opp-hz = /bits/ 64 <702000000>;
-			opp-microvolt = <908000>;
-		};
-
-		opp-1001000000 {
-			opp-hz = /bits/ 64 <1001000000>;
-			opp-microvolt = <983000>;
-		};
-
-		opp-1105000000 {
-			opp-hz = /bits/ 64 <1105000000>;
-			opp-microvolt = <1009000>;
-		};
-
-		opp-1183000000 {
-			opp-hz = /bits/ 64 <1183000000>;
-			opp-microvolt = <1028000>;
-		};
-
-		opp-1404000000 {
-			opp-hz = /bits/ 64 <1404000000>;
-			opp-microvolt = <1083000>;
-		};
-
-		opp-1508000000 {
-			opp-hz = /bits/ 64 <1508000000>;
-			opp-microvolt = <1109000>;
-		};
-
-		opp-1573000000 {
-			opp-hz = /bits/ 64 <1573000000>;
-			opp-microvolt = <1125000>;
-		};
-	};
-
-	cpu_opp_table_b: opp_table_b {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-507000000 {
-			opp-hz = /bits/ 64 <507000000>;
-			opp-microvolt = <828000>;
-		};
-
-		opp-702000000 {
-			opp-hz = /bits/ 64 <702000000>;
-			opp-microvolt = <867000>;
-		};
-
-		opp-1001000000 {
-			opp-hz = /bits/ 64 <1001000000>;
-			opp-microvolt = <927000>;
-		};
-
-		opp-1209000000 {
-			opp-hz = /bits/ 64 <1209000000>;
-			opp-microvolt = <968000>;
-		};
-
-		opp-1404000000 {
-			opp-hz = /bits/ 64 <1007000000>;
-			opp-microvolt = <1028000>;
-		};
-
-		opp-1612000000 {
-			opp-hz = /bits/ 64 <1612000000>;
-			opp-microvolt = <1049000>;
-		};
-
-		opp-1807000000 {
-			opp-hz = /bits/ 64 <1807000000>;
-			opp-microvolt = <1089000>;
-		};
-
-		opp-1989000000 {
-			opp-hz = /bits/ 64 <1989000000>;
-			opp-microvolt = <1125000>;
-		};
-	};
-
-	cpu0: cpu@0 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x000>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_SLEEP_0>;
-		clocks = <&infracfg CLK_INFRA_CA53SEL>,
-			 <&apmixedsys CLK_APMIXED_MAINPLL>;
-		clock-names = "cpu", "intermediate";
-		operating-points-v2 = <&cpu_opp_table_a>;
-	};
-
-	cpu1: cpu@1 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a53";
-		reg = <0x001>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_SLEEP_0>;
-		clocks = <&infracfg CLK_INFRA_CA53SEL>,
-			 <&apmixedsys CLK_APMIXED_MAINPLL>;
-		clock-names = "cpu", "intermediate";
-		operating-points-v2 = <&cpu_opp_table_a>;
-	};
-
-	cpu2: cpu@100 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a72";
-		reg = <0x100>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_SLEEP_0>;
-		clocks = <&infracfg CLK_INFRA_CA72SEL>,
-			 <&apmixedsys CLK_APMIXED_MAINPLL>;
-		clock-names = "cpu", "intermediate";
-		operating-points-v2 = <&cpu_opp_table_b>;
-	};
-
-	cpu3: cpu@101 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a72";
-		reg = <0x101>;
-		enable-method = "psci";
-		cpu-idle-states = <&CPU_SLEEP_0>;
-		clocks = <&infracfg CLK_INFRA_CA72SEL>,
-			 <&apmixedsys CLK_APMIXED_MAINPLL>;
-		clock-names = "cpu", "intermediate";
-		operating-points-v2 = <&cpu_opp_table_b>;
-	};
-
-	&cpu0 {
-		proc-supply = <&mt6397_vpca15_reg>;
-	};
-
-	&cpu1 {
-		proc-supply = <&mt6397_vpca15_reg>;
-	};
-
-	&cpu2 {
-		proc-supply = <&da9211_vcpu_reg>;
-		sram-supply = <&mt6397_vsramca7_reg>;
-	};
-
-	&cpu3 {
-		proc-supply = <&da9211_vcpu_reg>;
-		sram-supply = <&mt6397_vsramca7_reg>;
-	};

-- 
2.47.2


