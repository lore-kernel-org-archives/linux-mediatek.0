Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98716C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=; b=A0uynb+Vk0/0KSnxjrXjsD5gI6
	qHzZ0fqhIYLhtTKsNn7kbd3nNloN1WBxZbdA52p7u/v5CwooOrJvMJ1zzlxim5pFatB6EyDoPZHhC
	iHuOPL9G9rKe2gjk9Q+4T1RYqIIbIweD5uRCSwKqKX8aXG0h2EdHbpFeSsXxlGa0zxoLcO/NuXetn
	RT38gM2Mg4ZOZsntMy/XgnJaLmAo+agtCFdMux6qGjOaVFYUstHQ/pcuruGHwrD6+PrxkyxoYshxm
	/er3OhsMcbfQDQTTNV58O9Hp0klGXGy+fhilSswikR4wRfPyLBhAlltGFcxVf8R7voCTHTfDlIhlv
	pZz8cjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbhE-00000006lzy-2Ibh;
	Fri, 03 Jul 2026 11:04:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbhD-00000006lwX-03QN
	for linux-mediatek@bombadil.infradead.org;
	Fri, 03 Jul 2026 11:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=; b=oQDN6JONzFZ/WmxsQFd4LTdh+g
	zZ/lLngqZl/UgqRNEoipddf1RNU74KnXN8NQidnF6XRdsteRtDflfEq4aN/T4FfGWz+LQOrcNNCFX
	wt5M84MObsf667OdxDW1HODa99F+icvprkvJXW26D6h4vX6aPFgJ/8Gm1qXZw+ixrBJT/uUbsSq4/
	H6d4PdgZ2KOr2D2L2bGaL9z6Z7af/SX7BgnSofHSWAIKmPhwiAZF+4PQEV9/ll1R/JaQU4YYHlgEr
	sG2pDdG/AaU8DErjAqJvAh9nqXETWix2xmTdHAV5d0rCtFmXGth/waBGyr8NUKfyZi2bulQpj65hS
	shy3ItEg==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfbh9-00000004jhR-4AFQ
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cacf197759so6079535ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076669; x=1783681469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=GjBseLXFdMknKp+OngGjPULrK01erKWsSbmg7K6mri1bFaGLBwZBC9pbl11CF4iQAC
         hAxDnxGVtwtTqXBRyz8iybFnfqalSOokqwy16QR/0Gg8lKCLkCBIIVTy7giJKbJO3siM
         HRexnk2KzNMHgvYacamHHFuEdQG06Cmqa2FgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076669; x=1783681469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=l7Ow6VThAi8gHnA6Ysj/bGJSAkWHeQLuaI+VV+v6qBpurju21osSk5ZPAhKaCkWthd
         vaF+Stteui8BR97mjRH/SfcFG+PgDZfKHvmyVA0ZRzv8W0GLWAXrJ09DLT+SplV3/PT6
         qlGhbV/8GP67B5rUY5PwdzhS66drHNj2MFwf1+pcspiPhStihT3f6ZRJ2VmnGkNlssle
         7IIEzoMsIRBsWqiCwqad/SI7cG8mDo3BbSpvvWoUwRl9R90hIz1AXu21BlJRMvSZ5PoL
         qd4Cfhp82/wHOYmJVSe4bNsGbIC/H+g9+MfzczUVWoPydnqsNF73Y0WuKqEBfdi+niJs
         4pvg==
X-Forwarded-Encrypted: i=1; AHgh+RoU2NyQx6PV1tpNZL0xjjx4gHmr+//8RdOyo/UgbbMetbQm+OlzkWPk9qDTMNMdzvGFVvqi6bZkLLli6u/51A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6r8NU3QZR8p/jmM2gu0zZPhGLWAytXYPzQay+QJ5o2z1ShMwe
	SowsR72CYXkkLnyxZTuzHieyWFHDufLmySSlcJAMLwmedqMoh/LAn2m/Xs4l1OCxDg==
X-Gm-Gg: AfdE7clxdlWsjwI5O4oEds3+stpA8cAFwjBjd3+4qOr7lo9mF96qjZ8qw8+vjgcgJo6
	c1ZPs9+cBD5EIFsAzCH5sCCaNQD+IUUh2IwQqZOln721tnmwNSjziRt1htO06fn7ORbprZZt/IW
	C97i0i6xI7ff6OHW6HmMCpHlY2xLNYkU6WB4PoXli9Dd1hznegNSMUlv15g+aymf515nZmI8kc7
	aSMBL2jVilWu/F5IC3xKg7etA0V6Ibh7lpyxCd/cnmXsDKl0mnw2q02iOD2i2erDrZMF7lHnJC/
	4dZgiHwmnebEE8Q/TUkSwt355CLWjP08dSR7KFk70xPihmOdVScbL3eWQL8MVjUpP55pItAeSn0
	FZl3JMb0oIj2YDkc09xVP9xAgv1jwGGpY2E+hg4tJodzS5qLemr/c/Cf3MIK8YG+nary1r/dj3Y
	H8P/qkwtwzWSnUvFnp3rIIxKDdW/zhQAFrUZXTJVkB2+QF8JGohHXe7WvWr3BW0mOqRZIo6iLU7
	4CYP+k6
X-Received: by 2002:a17:903:19cc:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ca911ddec4mr103561175ad.30.1783076668529;
        Fri, 03 Jul 2026 04:04:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:27 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri,  3 Jul 2026 19:03:13 +0800
Message-ID: <20260703110317.1283411-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_120432_344972_18DD0B51 
X-CRM114-Status: GOOD (  13.98  )
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..8d4cc30d91e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1685,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.rc0.799.gd6f94ed593-goog


