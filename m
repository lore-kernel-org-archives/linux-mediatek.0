Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E0C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/vaPDanA3j6zkOBVwes5rnF9vpdWJpKDteNb10H5RQ=; b=GmC6y9R1j/jn9zuEo/Em+U15eT
	96esrwDsZ0ibvlyYK6khhXkF/ntlQHJv2qSe+z+BGPwaWaQU9RGWA9MPNsfaBLTQeWrpom6Ix0kWk
	88IzXF94QVv81U2jSddhJhWlbZu4QjA3eVfYEdjgeeYybmbBz0tZWCbrtPH5kfXXLear1sZU/zgUS
	XslflHENeTLmDHt0InjKEYgF2R9iS1R/91m1wOzgn82aHHD84P3kHs6R0Dq8Gs/63lP/dGnAZDLq7
	eOR5W8yHjQysTZpBK5f3gi3bfLAvsbTd9z/Y7sCZ8pTvCLoINOaEurBugKb8KqIvlNn9YFKn4x+U1
	CYjuT4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZT-00000008f6L-3uYK;
	Wed, 16 Sep 2026 08:00:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYT-00000008eZV-2y7r
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R/vaPDanA3j6zkOBVwes5rnF9vpdWJpKDteNb10H5RQ=; b=gTDbd0GFeo79t817y8SVTFRds2
	vS2R0Jm9xyU/WTQFow5Jf7I4VsreoNYIEPiimAeIumOk8LgnfSeDUxUs9tGPYETk19MzrmnWvyrfH
	j4X/xdMNM6uHF7sTDDxY/cvwJF2AbP2nt2y1ALbWKOlySdK8p9wD8lKaqV/IjAImBsUBGA5y06GQf
	mBtTk4ZonM6gbHidyEJxoz9tlKI9q3RrWHtpLolcNvX56bIWIQyOz8HnFxQpbQM5Pq4qjEq0VoOC4
	wUp3x59FPVGG9SbeS5tRsd+iMY8ANIKosj59LybwOWDDcJ6wx2G0q/N5OYeYflQQaDQnrJFch524R
	l768F1Pg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kYQ-00000007bfS-2t4q
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:44 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398cb5615deso607619a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545581; x=1790150381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/vaPDanA3j6zkOBVwes5rnF9vpdWJpKDteNb10H5RQ=;
        b=mwmemuoLgqZQcG7ZcQoFGlnq1jLpU6uw+PZz0AaaQBDcC5pj9gMjIVTKMJHa1EPTSh
         Vfjg0aaLls4SZtIKDBmZ6E1moI6TFu/bh5/gpTguy7U5yoNJhhWnnjnZCw9XU2h8M1bN
         BiYIaJka0rBVqTsQ0S3y/esllk9NfOJ4AKul8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545581; x=1790150381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/vaPDanA3j6zkOBVwes5rnF9vpdWJpKDteNb10H5RQ=;
        b=0AyiObJU/6kDvKFSD1OEwx9ZVDIcSPmNat2lTNeEfUbvppxTsT5Q+VhIt5+D5/HWVm
         OHE7iKWXb7QQfkVmgyzx7Kdt1KFvChGSqcwFldtX//C6Q6lGSyaTYbptsT/Wg2AS8M8e
         9fdlaWByDqasTwWv1i/UV/xfx0cyVvGjvPMn6yJZu05oQN9g2I5JWvxhXccEIGNZ01pH
         2zbmYtysLizIkjr1zblyq61NGETt3XsRSsVoLWb27uaCc9LbV/XtRetL6eFyHrDY9q2G
         shP0/qA2Aavfw0KhJJClyzY/CCjN9CmY8hZYMB/P7dVzmOiuZoLrfNkfCk3wCCHCOpmJ
         hvFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGbo2znpNgBYWu2ez5kKIPeLkURNv/WU2mCwRYHgSIAjMOCTgd25QQWEvI7uU1nfY/ObV9aJ9GSSrqxBuWXg==@lists.infradead.org
X-Gm-Message-State: AFuF++nQTUUynpZ5WuLG7fLDi6q0AxJDUCBe8ZRkX66Qa0oAgZCDeaYu
	lychJkNIeGs93uOlE0gtzeih4C/yQkBRJs0hP/pWPYIUcglcw7CxJJkNR/sRrPTZ3A==
X-Gm-Gg: AYBFou2Js6aLwQ+9i7AwlvRAJeaNv71z7cdhglm9hZsf+4qj/P4na4rnRQSr5ta+As0
	N2YokL5xPFdrM7rF9630Ff93RvoQQly2vLxJPX/MdU2hCtTzyNG2giGxNvb/eNqoYs6x/50jdiK
	H3550tuJnICFhjGaQXYXdlJuQM/z52Tbg0mzW//iRpON6nh4hFn08FJClGCsg75ZZNOhm6tcxut
	mDJ1u4TU1re8/NBOK/6BbKz3KugdF+QBZb+TlGKTa/MJ9UO/HQHQyOsf8LOEZMdskxJ7pfhSgjo
	fEftrGViD5IPSNBAj81UTY1eiVO338a91N8xNAjfF71XIF7Pf+WLIZ33oCkZaybMcH8DSAQVpgZ
	ySLBE/RNHWFUkbhIWpAWkujdqThoCTWW9HAibkrQkBvS7T2typxYytvOnWg0NsBTJ5S97Ycui3m
	L6G2icW7te1T0DBaiKe4LmTYwRop9lVIPRpu4nSRhlwn2Eg8IGdC9K35iXMbEqQE69aekuu/k8y
	0pTnsT+4nixyn3VpkvqJ/qQ70n9PohuRphdRZ4CCP3DW8BhPPuMyWMptSY=
X-Received: by 2002:a17:90b:33c9:b0:39e:1bff:b383 with SMTP id 98e67ed59e1d1-39e1e51bdf8mr4030101a91.24.1789545580791;
        Wed, 16 Sep 2026 00:59:40 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:40 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 15/15] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Wed, 16 Sep 2026 15:57:41 +0800
Message-ID: <20260916075745.3549953-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085943_037853_95C23A02 
X-CRM114-Status: GOOD (  16.60  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index ba3dcfc50956..4704abaebcf8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -93,13 +93,11 @@ pp3300_z1: regulator-pp3300-z1 {
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
 
@@ -166,6 +164,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
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
@@ -200,6 +209,39 @@ adsp_dma_mem: memory@61000000 {
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
@@ -664,6 +706,22 @@ &pcie {
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
@@ -1007,6 +1065,13 @@ pins-bus {
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
@@ -1179,6 +1244,13 @@ pins-bus {
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
@@ -1422,10 +1494,22 @@ vdosys1_ep_ext: endpoint@1 {
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
2.55.0.1032.g73a4cd73de-goog


