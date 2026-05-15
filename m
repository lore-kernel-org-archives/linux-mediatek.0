Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B4ACD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=; b=umDsZCcYtcNATYspDbkaqc+RGl
	YlmgQr0i10cBXf+l6JnxTLD+OTJWFtJlF0e+Jr4yOUI0xHM405LPtd2vudDdQCnsr68A+SR+GMXHh
	gLwH23ew06/BXqPAymL676ffcFBs+BfchXcO4Pok9IFU5j1dEkcljXJQjkjEVGNMonogi1kmLhfcN
	GjD+XMJ2Zvnb3kDpxj8vJXS/rstdHjqTuzhGi5xRmxtDEF9eOgrI8CyzuA9hVASa97YRoeaAqxhuS
	OFfZgOEz0TEn9eWLei9AQb/vkM9JYPncuoqrWgRv0bFxftNkTQN9H0PsyIHf8hz/G6Fj3SwYWps9x
	niXpTPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRX-00000007pGP-3wDY;
	Fri, 15 May 2026 09:02:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRV-00000007pCj-28wQ
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-365cae89bf5so3974388a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835769; x=1779440569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=;
        b=FxsxY2L6p+ZAAi6Uo7qzZJ+2mJEoGurfMx+E8NLAlNnIhjr1yW4SvTOjUxLYj1JjXi
         khS3UmDE3CUbjLrbXRwmVedV5sRIqJdlt8UalLfGvGfzUpLI+9mjjQIxcXlfxak/s9M2
         GS9S1btFVuGrPbzETkpNmdl5dtiLUfHDFjcK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835769; x=1779440569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=;
        b=XmrZH0os+rm1VWy9g25XSipEVY6tZI1VbdI4vWHBOWnk6CqsoxuVt0ZOM0qkW5V6Do
         Q94YNh14glEFJCMY4iEzH0x54LoNqHVGnVeZ6dS33sUxOxRdxbDXNIO4Z5PBEvCohKjl
         3/LcHlZnuer4nRKkZbY9j4++F/xoNWwMaNkm3ERIbsQq+b5jlikM4NWlNA0dj43ipMsU
         SQGWCdZ6mgDWFPlZ/+cDQf8NBjKDYFM7sBOCnx8V+7t5WDu07dajcrZvDFeRU/4sP4o9
         iMuv5YTeADIuGfdndMmJFP/GhjwYLwasPrSK+rd2WN5jUk5MKu+H7uIvsLR3zMjArrjN
         kZeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JJs44FiXjsmfeu+0jj4zwMqzysscj059r5Gj7pQ6Ah3tmRQ1ijkM3PLt8eJfh+Op1V4vOJ0fOGglGjdh6cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysjWuF18659XnZSXUlyxwC6EB8S4QqqbTNiO6jyT8lTB9EGR3F
	RoRwqFk9PgRjfTDKIuX98vnVabjYGSYlW/3jwbZhsUq6jlQBXQLIbh5vBJzbWeMpZg==
X-Gm-Gg: Acq92OHQcOxRlhscQ4tMIwC+T00hlAz7qB/fwYhQ6g2lw+PIEvNoGVwSVm1BqZVDb2R
	qnvVAPLseo6tzSbF/uugYl/LdjDx5cJgi7h5Lf/OVL/Tgn/0uk/G0Q6xNdMsY/ER2MGz2BgZqvD
	lm+zAvdvqe1C67mfQiUiP0EbRc5xpA5JiBzwb4dLDOFd0KziNUn9mXXDFguYASWYpSbH5x8LUfj
	UeqS1oF31bg9kJRvKcPbswKmde51PjEELPi3OrFpQ3O7dmVlSBtwa2Ktl/RKpgj7E9lMwpgCpDV
	HUSvmW+lP3TN7iYtZM4aQoo+DzjdK2qI+A3DAfiJc+/V1FL9a6Sq7tz8ZKypVnAjs5QdQmeKu/F
	QAUSL4CMgFkQNR+i0hL1tsd0G0SZLlKkICz4kmJ4M1be4AW5OrUd//Rk70au0bXM4RLwdiN5hsd
	uWZf61yD96Ebmy7JEQZBm+c6dABWmx2RPhuQBv6G3D59nn1K9YFSMLkXxBGhOcmt2KgnlsEmTXZ
	rxuxzpA
X-Received: by 2002:a17:90b:1344:b0:366:4782:138c with SMTP id 98e67ed59e1d1-36951b971ccmr3221579a91.17.1778835768758;
        Fri, 15 May 2026 02:02:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 12/12] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Fri, 15 May 2026 17:01:48 +0800
Message-ID: <20260515090149.3169406-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020249_566691_FAE90A06 
X-CRM114-Status: GOOD (  15.70  )
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

The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
design. The connections to the rest of the board are almost the same as
if it were a separate M.2 card. The only addition is the PMU_EN pin on
the chip; on M.2 cards this would be tied to the primary power source.

Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
USB and auxiliary signals. The PMU_EN pin, which enables the internal
power controls and regulators, is modeled as a regulator fed by the
pp3300_wlan regulator. Since power sequencing is now correctly modeled
using the M.2 E-key slot, drop the "regulator-always-on" property one
pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
power is controlled by PCIe".

Also drop the voltage range on the pp3300_wlan regulator. This
"regulator" is just a load switch and does not provide any regulation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 93 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 4cb23595d17b..d7b5eb95ba0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -86,13 +86,11 @@ pp3300_z1: regulator-pp3300-z1 {
 	pp3300_wlan: regulator-pp3300-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_wlan";
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wlan_en>;
 		pinctrl-names = "default";
+		/* load switch */
 		vin-supply = <&pp3300_z1>;
 	};
 
@@ -159,6 +157,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
 		vin-supply = <&pp5000_z1>;
 	};
 
+	/* PMU_EN pin controls internal regulators and power sequence */
+	wlan_pmu: regulator-wlan-pmu {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-pmu";
+		enable-active-high;
+		gpio = <&pio 145 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wlan_pmu_en>;
+		pinctrl-names = "default";
+		vin-supply = <&pp3300_wlan>;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -193,6 +202,39 @@ adsp_dma_mem: memory@61000000 {
 			no-map;
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie1v8-supply = <&mt6359_vcn18_ldo_reg>;
+		vpcie3v3-supply = <&wlan_pmu>;
+		w-disable1-gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &adsp {
@@ -656,6 +698,22 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
@@ -999,6 +1057,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+			output-high;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1163,6 +1229,13 @@ pins-bus {
 		};
 	};
 
+	wlan_pmu_en: wlan-pmu-en-pins {
+		pins-wlan-pmu-en {
+			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>;
+			output-low;
+		};
+	};
+
 	wlan_en: wlan-en-pins {
 		pins-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
@@ -1342,10 +1415,22 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci2 {
-	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
 	usb2-lpm-disable;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb2_ep: endpoint {
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


