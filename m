Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B634C369A9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRjHimDlIXSPIYVEew/Whoc3CKHITs/d4vaDxcqI9pM=; b=gEZwmajvLQlsM4
	MG264ym+LuNZwcyXx55IGfcDE/J/0ZvHgJ4iUanvdw7RLoeoQWmcg2At8HEw1Fk6+6iB6oVAqvXbs
	313yrBeIwWsIO+CGMi1QWUG01u6APL/thZ1OFiqnaEaHzbXnAPYjI0XKH/AOizHpl1xMlilDzGwvZ
	kO4Fejc/2i3BdCfxaX7WUj9cIoPrDOu6HDgXefCUzIswRNEnaqBh1fMBkaovVg/VB00HmBI+j71Aa
	qxJ3vl+SthAiXUjyGeAPg/pwjClSm2NMd6m/bFyc962ykCr571CnPRLljOABnmh7VzNYOyeFXvPYM
	ZsOVp1JcELOLmR5sjCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2v3y-0000000BG41-2NnO;
	Thu, 10 Apr 2025 16:47:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u83-0000000B4xE-0znX;
	Thu, 10 Apr 2025 15:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABAF8A4A8D9;
	Thu, 10 Apr 2025 15:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0FEC4CEDD;
	Thu, 10 Apr 2025 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300065;
	bh=2mdsfkUrMw7toePmD1v5/yrWX5YIRl5Nl5Vw/xMU/bw=;
	h=From:Subject:Date:To:Cc:From;
	b=L5+nLP7pd0oYgpafFrGoh0LoKCQ7lZ4hWRGZn8JABxcQWp3JDeYtvBix05xdM46Zh
	 XpnLYthUadlqId0gsGWKaxqhLe/29kANzcoWa+rQrClokZLIPB3QGnmMNjmDMO2iql
	 ltjul4+3LYS+YE+T6+FAIEe6+CmxqlNXD/zCQ1ZarWRoln8g/OplEPGkzty5mR23AK
	 u/l1eF6ElFcEFQf1jOnx73ArjmRIf/wmr/xqbAtIF/9m7RfrBF+Y4Z6RPxU9Ml3e4Q
	 B2frUcAk9HQfXVGsc1xqTnTMcK3l7Re3GEafraAraVMynKyonxEgKoKm0+R+VwL4jE
	 f5+7zRNE93dhg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 00/17] Arm cpu schema clean-ups
Date: Thu, 10 Apr 2025 10:47:21 -0500
Message-Id: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAro92cC/3XMQQ7CIBCF4as0s3YMYAu1K+9hukA6LUSFBmqja
 bi72L3L/yXv2yBRdJSgqzaItLrkgi8hDhUYq/1E6IbSIJhoWM1OOCxo5hcmY+mpsW5JSqNGqc8
 MymeONLr37l370talJcTPzq/8t/6TVo4MmZI3Ulxx3TaXO0VPj2OIE/Q55y8lONpOqwAAAA==
X-Change-ID: 20250403-dt-cpu-schema-48e66c7f6a90
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
 Andre Przywara <andre.przywara@arm.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084747_411740_4C0EEF3E 
X-CRM114-Status: GOOD (  13.58  )
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

The Arm cpu.yaml schema fails to restrict allowed properties in 'cpu' 
nodes. The result, not surprisely, is a number of additional properties 
and errors in .dts files. This series resolves those issues.

There's still more properties in arm32 DTS files which I have not 
documented. Mostly yet more supply names and "fsl,soc-operating-points". 
What's a few more warnings on the 10000s of warnings...

The .dts files can be taken by the respective SoC maintainers. I will 
take the binding changes.

---
v2:
 - Drop applied "arm64: dts: morello: Fix-up cache nodes"
 - Rework enable-method schema
 - Drop "arm: dts: qcom: msm8916: Move "qcom,acc" and "qcom,saw" to 32-bit .dtsi"
 - Keep qcom,saw and qcom,acc properties on msm8939
 - Fix qcom,saw2.yaml example
 - Fix power-domain-names to be "perf" on qcom sdx55/65

Link to v1: 
https://lore.kernel.org/all/20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org/

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Conor Dooley <conor@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Steen Hegelund <Steen.Hegelund@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
To: UNGLinuxDriver@microchip.com
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Andy Gross <agross@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Viresh Kumar <vireshk@kernel.org>
To: Nishanth Menon <nm@ti.com>
To: Stephen Boyd <sboyd@kernel.org>
To: zhouyanjie@wanyeetech.com
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 
To: Stephan Gerhold <stephan.gerhold@linaro.org> 
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-rockchip@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org

---
Rob Herring (Arm) (17):
      arm64: dts: allwinner: h5/h6: Drop spurious 'clock-latency-ns' properties
      arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node names
      arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies
      arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
      arm64: dts: qcom: msm8939: Fix CPU node "enable-method" property dependencies
      arm64: dts: qcom: msm8992-lg-h815: Fix CPU node "enable-method" property dependencies
      arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
      arm/arm64: dts: imx: Drop redundant CPU "clock-latency"
      arm: dts: qcom: ipq4019: Drop redundant CPU "clock-latency"
      arm: dts: rockchip: Drop redundant CPU "clock-latency"
      arm64: dts: amlogic: Drop redundant CPU "clock-latency"
      dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
      dt-bindings: arm/cpus: Re-wrap 'description' entries
      dt-bindings: Reference opp-v1 schema in CPU schemas
      dt-bindings: arm/cpus: Add missing properties
      dt-bindings: arm/cpus: Add power-domains constraints
      dt-bindings: cpufreq: Drop redundant Mediatek binding

 Documentation/devicetree/bindings/arm/cpus.yaml    | 229 +++++++++++--------
 .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
 Documentation/devicetree/bindings/mips/cpus.yaml   |   3 +-
 Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml    |   3 +-
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   1 -
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   4 -
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |   2 +-
 arch/arm/boot/dts/rockchip/rk3128.dtsi             |   8 +-
 arch/arm/boot/dts/rockchip/rk3188.dtsi             |   1 -
 arch/arm/boot/dts/rockchip/rk322x.dtsi             |   1 -
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |   5 +-
 arch/arm/boot/dts/rockchip/rv1108.dtsi             |   1 -
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |   4 -
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   4 -
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   1 +
 .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |   6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |   2 +
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   6 -
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   6 -
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   6 -
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |   6 -
 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |   6 -
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   4 -
 .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   4 -
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   4 -
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   4 -
 .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   4 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   4 -
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   1 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   8 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   4 -
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   4 -
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   4 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   4 -
 .../boot/dts/microchip/sparx5_pcb_common.dtsi      |   2 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   8 +
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |   6 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   8 +-
 48 files changed, 202 insertions(+), 480 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250403-dt-cpu-schema-48e66c7f6a90

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


