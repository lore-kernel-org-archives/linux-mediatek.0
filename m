Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD2ECD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=; b=OyRPVgF0kaaeVOYUZX7GlOU+ce
	21FXX1yOaSDcQA41QZTDGYHF4FECEnGIMiaKmsmhpCGY7TNUe4s6rYzHt8Ui/gX1aeSW7qW96pDl+
	BCJ0Z81CU/QjuigAtJUgsqrL7UO3BBi6qoDL76sSFvGm0QbrMNGOzs0FBtwbfSm1kOLuS++gdd6mW
	sTjYVo43Xy0isW8uwoTmgTwUV3Q86cgahJVPuKS7H+gCoh05lHWSEWuEu5CDPc1HqISLE20xz84/V
	AcegHA8tDspM9pHGC8WqizLtvA/a2j8oTkxx6YStm+jTKGQIZGLrCihlMBIhw63c+tB0hK+cqipJe
	dbeakMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVx-000000076Rv-0ka7;
	Wed, 10 Jun 2026 08:42:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVt-000000076N7-03rr
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso44742955ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080936; x=1781685736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=;
        b=A64xsGHvpJQ6S7yh6dlk+FKoPdeJGjV5xxC7Nh3vdKrA1eZXSO2KQ8Y8JmWPUmT8Yg
         R5TE1thvd6GSmaChje2cXLmydkwsatGAyp4EJn98sWcK4zKQplIpcl4IytZU/4dayl5m
         OUyobX7K5E3cNsuXufbASe5aJ3qSTH3IFMUEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080936; x=1781685736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=;
        b=nPB1wxrmdLxN/a2jpTY0NK7IgLeBpMqXgifKLrTwV7zsMp5Nl17SDh7rcmgybvUy9t
         ZXP6enepQr+fqXMVCp9OelxDU43PZM69aoBsWLAEGYTaEDQCQbm+n+mUN2UIYdHcj1ee
         nHotDGdA1Mcz8t938LDyI56a6Kufd0It8O4CrlDyDZM3dX+2RRJlGV2gmrkvQLfnGKkm
         HgGvqRTjJUj0o3DDrk14l/9QJ0yXxSfVEmNM1bqtUZfTp1VSOePij5RUetGIqwXvOEbC
         YukE15abvgoVZeD4/i6PlOQsJ8VfUxF3skpcFqAqx6rXN+VPNRj4paK0f9v8rvNMgruy
         0qnA==
X-Forwarded-Encrypted: i=1; AFNElJ8JI4IkoVF/uSATllda/3FG1kJAFOu9d/IJFWU4JG59Q3Ng2BDPcZrdq1yVXw8jJuPcEsMGojhqnZ/D5FqLrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hSrtHy+0BYeoiejHAP1dLNlPKa7EohKO+TkT4LK5Pk4DY30A
	9xy2h2cTrNRLH9C+PYV6JG+7N6YVLERqt/wVDmbLWAbeZMirKIP87sQqxxNZJWVm6g==
X-Gm-Gg: Acq92OERPGQH4yYu6lExm9rIoXPog2z46D/6PDbH1y2VSh5Vt1W8JtvABL9XYB48p19
	gyj88RM7bSlxUZZDqkp7Bn5WuMrR5GliwRqp5LgvZlDvbDSxIm2MU4mkV0MKBgwRu7Nb1OWZhwZ
	2FlnoTw+g71mJyIiiMZO4B3+/vqRgkaNEDqc2ij0mcI7ujyc3Pi2yQsijuAo4eazgQ3Qhxe7aEW
	R/vdCjmU/2GKunWcvi4VkYLCgPkOxkb3b3gOmEH4d6q2F/6hRjeNt7Kt3ELE6U86aOYoy5vwXPa
	+3Z28Mb6aiLzndnicckPHLkFOXZ7/+zyDRiuaKBFkS7Ft/ln7hefVklnC5strUlc7WWO9azSBFB
	Z4KNfkDnZCLLCTO1RVl+kZemvKpP61bpLq6PbMUyNIwXuco3egSxkiXjpSnB78rYEqDpqceIAf2
	k3c62nlRhDByFd3kwFxp3mA1sny3cOHDpR+Slx2/hqV/7epoHomsxCEB6b9NRSmLDKSt5rsVU4k
	MwMGjLErjgsJAEdAg==
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr261933095ad.19.1781080936358;
        Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 13/16] arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
Date: Wed, 10 Jun 2026 16:40:47 +0800
Message-ID: <20260610084053.2059858-14-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014217_076844_BC56604B 
X-CRM114-Status: GOOD (  13.20  )
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

The MT8192 Asurada design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller. Also clean up the
pcie controller node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 65 +++++++++++++++++--
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fb4d92750770..901240384a4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -318,6 +318,41 @@ usb_a_u3_ep: endpoint {
 			};
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
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
+					remote-endpoint = <&usb2_hub_p4_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &afe {
@@ -671,19 +706,19 @@ &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	memory-region = <&wifi_restricted_dma_region>;
 
-	pcie0: pcie@0,0 {
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
 		device_type = "pci";
-		reg = <0x0000 0 0 0 0>;
 		num-lanes = <1>;
-		bus-range = <0x1 0x1>;
-
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi: wifi@0,0 {
-			reg = <0x10000 0 0 0 0x100000>,
-			      <0x10000 0 0x100000 0 0x100000>;
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1206,6 +1241,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
@@ -1773,6 +1816,14 @@ usb2_hub_p3_ep: endpoint {
 					remote-endpoint = <&usb_a_u2_ep>;
 				};
 			};
+
+			port@4 {
+				reg = <4>;
+
+				usb2_hub_p4_ep: endpoint {
+					remote-endpoint = <&bt_ep>;
+				};
+			};
 		};
 	};
 };
-- 
2.54.0.1099.g489fc7bff1-goog


