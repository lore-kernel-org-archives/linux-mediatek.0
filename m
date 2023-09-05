Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CF1CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tEAS+zhuJZqy9YEXOFIwd5Zd3TGAnGPPmgPEQUq7uA=; b=jeGr5DfVKCbXPyJG67CXH8pswQ
	EK2xlShtTE0xegJ8GDUjd5zTYQfePCp7+ZvllBlu1BEg8ezcqaoSrL+cFs++RzgRmGtpFTIKZcyEO
	nmLPtqxwWhIFnxkzNT4F7edeLZXQ9/MSC8oEF3USHYebpLaV58o87UV7coNzevAmuZLFXkHJJ+Lmv
	dN3+ZrIDhqzwgjGdhQ7I/gjVEV3mOImHVXMp4RM7d7VshWArB1Z9rvHidxnE14uivNtlrKiEw29CI
	pSQL/36u6zag8gqsM9LO1KUr0Jj0aJHNKJJwenq4jG2Cn++tvEMMj/v6OAz9cX1YEN5qL/3IvgyBo
	sOcNnGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfWY-006u7w-1h;
	Tue, 05 Sep 2023 23:31:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfWU-006u5x-2W;
	Tue, 05 Sep 2023 23:31:56 +0000
Received: from pyrite.hamster-moth.ts.net (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA7631ACC;
	Wed,  6 Sep 2023 01:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1693956626;
	bh=BPO71p8AqRtLtS8dabPfc4dQV/aaP8xfQttAS5gWd7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IOAK2S+NZRbIIi66BiWObcgJFTvKoLqvxI7qdpTiSWVIWh13Q2iiQcuBTmrNuuObI
	 GOi4HfwTJph8yqtQ5c9Hr2Afn7IWuZBv9D8U6V//UdCw0L1cz0WcKuFnHXFohbeeXf
	 slkKIil4/wN2wO4ydU6Ri8opR0lD1L+7fnwB02OU=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays for thp7312 cameras
Date: Wed,  6 Sep 2023 08:31:18 +0900
Message-Id: <20230905233118.183140-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905233118.183140-1-paul.elder@ideasonboard.com>
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_163154_967725_D09CF9CB 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add overlays for the Pumpkin i350 to support THP7312 cameras.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  4 +
 .../mt8365-pumpkin-common-thp7312.dtsi        | 23 ++++++
 .../mt8365-pumpkin-csi0-thp7312-imx258.dtso   | 73 +++++++++++++++++++
 .../mt8365-pumpkin-csi1-thp7312-imx258.dtso   | 73 +++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 20570bc40de8..ceaf24105001 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -56,4 +56,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
 
+mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi0-thp7312-imx258.dtbo
+mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi1-thp7312-imx258.dtbo
 mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo
+
+dtb-$(CONFIG_ARCH_MEDIATEK) += mtk-mt8365-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
new file mode 100644
index 000000000000..478697552617
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Ideas on Board
+ * Author: Paul Elder <paul.elder@ideasonboard.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	vsys_v4p2: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys-v4p2";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
+	camera61_clk: cam_clk24m {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		#clock-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
new file mode 100644
index 000000000000..740d14a19d75
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Ideas on Board
+ * Author: Paul Elder <paul.elder@ideasonboard.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
+#include "mt8365-pumpkin-common-thp7312.dtsi"
+
+&i2c3 {
+	camera@61 {
+		compatible = "thine,thp7312";
+		reg = <0x61>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_pins_default>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
+		clocks = <&camera61_clk>;
+
+		vddcore-supply = <&vsys_v4p2>;
+		vhtermrx-supply = <&vsys_v4p2>;
+		vddtx-supply = <&vsys_v4p2>;
+		vddhost-supply = <&vsys_v4p2>;
+		vddcmos-supply = <&vsys_v4p2>;
+		vddgpio_0-supply = <&vsys_v4p2>;
+		vddgpio_1-supply = <&vsys_v4p2>;
+		DOVDD-supply = <&vsys_v4p2>;
+		AVDD-supply = <&vsys_v4p2>;
+		DVDD-supply = <&vsys_v4p2>;
+
+		orientation = <0>;
+		rotation = <0>;
+
+		thine,rx,data-lanes = <4 1 3 2>;
+
+		port {
+			isp1_out: endpoint {
+				remote-endpoint = <&seninf_in1>;
+				data-lanes = <4 2 1 3>;
+			};
+		};
+	};
+};
+
+&pio {
+	cam0_pins_default: cam0_pins_default {
+		pins_rst {
+			pinmux = <MT8365_PIN_118_DMIC0_DAT0__FUNC_GPIO118>;
+		};
+	};
+};
+
+&seninf {
+	status = "okay";
+
+	ports {
+		port@0 {
+			seninf_in1: endpoint {
+				remote-endpoint = <&isp1_out>;
+				clock-lanes = <2>;
+				data-lanes = <1 3 0 4>;
+			};
+		};
+	};
+};
+
+&camsv1 {
+	status = "okay";
+};
+
+&mipi_csi0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
new file mode 100644
index 000000000000..2ebe4e9b56fa
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Ideas on Board
+ * Author: Paul Elder <paul.elder@ideasonboard.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
+#include "mt8365-pumpkin-common-thp7312.dtsi"
+
+&i2c2 {
+	camera@61 {
+		compatible = "thine,thp7312";
+		reg = <0x61>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_pins_default>;
+		reset-gpios = <&pio 119 GPIO_ACTIVE_LOW>;
+		clocks = <&camera61_clk>;
+
+		vddcore-supply = <&vsys_v4p2>;
+		vhtermrx-supply = <&vsys_v4p2>;
+		vddtx-supply = <&vsys_v4p2>;
+		vddhost-supply = <&vsys_v4p2>;
+		vddcmos-supply = <&vsys_v4p2>;
+		vddgpio_0-supply = <&vsys_v4p2>;
+		vddgpio_1-supply = <&vsys_v4p2>;
+		DOVDD-supply = <&vsys_v4p2>;
+		AVDD-supply = <&vsys_v4p2>;
+		DVDD-supply = <&vsys_v4p2>;
+
+		orientation = <0>;
+		rotation = <0>;
+
+		thine,rx,data-lanes = <4 1 3 2>;
+
+		port {
+			isp2_out: endpoint {
+				remote-endpoint = <&seninf_in2>;
+				data-lanes = <4 2 1 3>;
+			};
+		};
+	};
+};
+
+&pio {
+	cam1_pins_default: cam1_pins_default {
+		pins_rst {
+			pinmux = <MT8365_PIN_119_DMIC0_DAT1__FUNC_GPIO119>;
+		};
+	};
+};
+
+&seninf {
+	status = "okay";
+
+	ports {
+		port@1 {
+			seninf_in2: endpoint {
+				remote-endpoint = <&isp2_out>;
+				clock-lanes = <2>;
+				data-lanes = <1 3 0 4>;
+			};
+		};
+	};
+};
+
+&camsv2 {
+	status = "okay";
+};
+
+&mipi_csi1 {
+	status = "okay";
+};
-- 
2.39.2


