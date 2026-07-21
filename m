Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B33C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD4jR5z3A5YuzPTTRZhT1+z9pUoFsNBk+NnZEFwJXQc=; b=KrOMtp2XanA2Uq/UGVyEnwh4P7
	Dzorv2uwFr23jehFWWPIU4FsnI94N2X1j55AQ+MaO64LkOeixW7Pzk7SuZJpdPrMto1YPV7tr+7tg
	0Yxud/wR5A0hcCtyMx+PoG0fA1pRgnrqbzRQHT26bLkIDwQ1l5gUXJ07zGEiiBU5izEI1mW/aoJ1W
	MTfyYHF81Uyu+lh328M6XTLJSHIic4iYSfuQYD9Fg25Tw7XmUcoBkd8t2Z9uT3ENwCSpO74ts/Jvj
	2NV1cee29SeMW//er1rLk2DkV/J9EwFuvlZ1KgliB26mfubEnrmY9BbWEr7DesLhd8pbuFojUgIAx
	4+VsK8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Oj-00000008bVL-3DD2;
	Tue, 21 Jul 2026 06:56:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4ON-00000008b72-1oON
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ccf2360620so68983905ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616951; x=1785221751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD4jR5z3A5YuzPTTRZhT1+z9pUoFsNBk+NnZEFwJXQc=;
        b=DnhmNCqOyZG/gR0vq7101fESQVehDzgqUW+1F20uKgGTKjfANql00b2hp6vRV+rylE
         1FDMT9lRouPpAYBE/QvzU5sPl/TYPx3G90TVvS2BxBSO2TXZ6Yd0PQvUUPJkwrB8WMx2
         4BceaHCNUjA1fvTJv9j8CBcvurcgVm40SfS1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616951; x=1785221751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD4jR5z3A5YuzPTTRZhT1+z9pUoFsNBk+NnZEFwJXQc=;
        b=hRQ0+qOckTL4Ni8AbcuC0nB9IVjdbc5xAqcx1bcB4vV21CIOOrfmVpat/Qxy64uIEj
         3p0B1zxubGIR6IGuXyvnvA/q0q7D6MU5QR6eRtk0uDQ9K4WU2LHOm97NurtP/d557ToL
         vJ6RaCoGnPUtuPOaRbwcJVjA+7VWI60Bz5XCgeaMHoqXHfIx4q9y/W2GLWquHyRuY7BR
         qAF3vEfyO5h0aWlXNRQVGwGtlexgnonN9tR5A0x6putES/cZfrgHnZ9jgbU61CcpkhJo
         Vpk/wVJFOvpXQbPM4m62kAzL/eOxktxVg8OuNQ0XP8HfhcYOS23+vkQC1Bhe9EFDzAji
         Jf0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrjCQnvtoZmr/bQhc0wXYm515IDhhR5G+v4RFDdpCD0AoeQD+AW2xAwIx1XMwYOdsc0z2wwUpljMU0lA1+f5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgJlY37Sxk6/49VShcKXwcTiO4CpXDvuackxfHIg+4DcOyFlXR
	9GfZsprg00LtaebyvXDp1J1/BRZgf35UJLzPSvR/VDuUYLnbLmzYRHlhH/NrhUR9cQ==
X-Gm-Gg: AfdE7cnuxm2o5vPnzoLns6SOS053DjfLeIcllHyBgpSoagX9XznEfB39k8fiok3vLbV
	NbThzLgM0DMMLBURb6bZkAc8eXoSue7y4aAqY3M76fI3vlaJUg7+U/+UZUYVU2vpwCsV/9Jw+KX
	v4ikbQY94QE1R55X7jKymaii0ZH73rHXR9WCRAJfILnPXgwI2a47wR6Jr+Mh9cykHDjK9kZX7zI
	tNE+k2yMmqOt5J16GchFR15TEZtn6jFKwndgs9onsPrv2BGBWYYpgjGfJ8lYVkqPK/ZqPwZ7I6j
	JcRf7YyjyNxIyTc9XZRpkHwJDweK+rFuWumh8EyPEDArtNcRkng5OI0J+8xxFi3Donsb5l0tosZ
	XEY7VAejJXKhNCzJ6F8O+ik+oOmnR9MzddCM72qQ5HmB228n2+XTzVKnstljtRvBeiFPgHhLdbQ
	ubduIuk8q04EoHPVwSRTnCczL+8c+nh1eE8A5DQySKlYNMggmZOcNQCz//T8wmVgHzt/mZxA==
X-Received: by 2002:a17:902:fc8e:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cf349cc532mr189795135ad.32.1784616950743;
        Mon, 20 Jul 2026 23:55:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 16/16] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Tue, 21 Jul 2026 14:54:11 +0800
Message-ID: <20260721065413.2306137-17-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235551_506771_2CC2720F 
X-CRM114-Status: GOOD (  16.67  )
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
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index dee946309121..73b5c0fdeae6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -88,13 +88,11 @@ pp3300_z1: regulator-pp3300-z1 {
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
 
@@ -161,6 +159,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
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
@@ -195,6 +204,39 @@ adsp_dma_mem: memory@61000000 {
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
@@ -659,6 +701,22 @@ &pcie {
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
@@ -1002,6 +1060,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1174,6 +1239,13 @@ pins-bus {
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
@@ -1417,10 +1489,22 @@ vdosys1_ep_ext: endpoint@1 {
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
2.55.0.229.g6434b31f56-goog


