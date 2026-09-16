Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3CBC88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=; b=a7Ytrzt91sRXUrlWPgTB70OyVJ
	6FG05Pzil9BtAQ6S+tk8MjJlXcMpJ42+tQowK58FETW6nf4a7vOdrzMwRm+nN6RFRFTCGR4Z4QGRY
	ha2dN+tH2LKIVWOWkn19pOtESjaE/rF49vQ/+/QSmv1ixEq6I5/rqIs8OTqpeyJGHu1B7Qa+KVDs+
	9SYJ4xKHDIrwpZCdX2i1dYJRaj7a756XraACkf/Ma5oTmII9y7ySD41LmFfMFjEYsQKhTAEvsacu8
	L09jjLw8OSXfiD1wkJoqrQxAXTtmodP+3UgHS8UJAQlGSabNp4PqOO4abu4MNn4IhGRkEIn2cFcsJ
	QWJfbAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZT-00000008f5J-2LGr;
	Wed, 16 Sep 2026 08:00:47 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYK-00000008ePl-3ZDQ
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:38 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1442723a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545576; x=1790150376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=TIva9R0e/PPmkYVZY9spuU6js4RmKWtzqqLDvh0Ct5ATIpG1Fk1EFVmPfjGazXCz0L
         7bfo3RnIQjlDafJo3LcAmElwlq1Iu3NeseRxSI02QPIEHWBipSkvGeBBTVNCnB7OMS9k
         aK28RQJCV7wP2aZ3UIenYA6N4m5a2SM1HL0pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545576; x=1790150376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=qMJFQj5k3fa3w8VM1115Aij4obD1gCbUsi7g3S7bzQvQu8/mPVKsdU1WvEo7RoV+YU
         uQQ6PtdmVgalmkOGg2wUfwqiZpdOjVg7aFCO0rbDhm60IWh39gD4o6sk7gunM/2S2rJ6
         fwd6G7anfDd9JXA8REPuwpqLJKV73vEBoXUey6G9ypzFL4vlEB7Z2Y4uYYgjmG9ND7cf
         F5TRAy1R0KFfz31Pfi4EeqdRFYwg/Wzu9jP5c1cZnErU+vTARr0HyvjrY41wUb8Faz34
         91zuh93UFjDEevyegZi/Snj70dcFUU0VA/ZafWzM5RIDZlHF3GyGoxXOX7Xpl9maIvqn
         kiog==
X-Forwarded-Encrypted: i=1; AKwUvBz1hmZkqROXnSNaCe6OefBW2Vnz5ndIQD0ry8nikoCGlxpQdkwWj2xtStdc0Tfr8x9awuWKpbJlTPNijYb1Qg==@lists.infradead.org
X-Gm-Message-State: AFuF++n96yHgmtdEuku7yaTIidxb2NqD68Hq9axt5EeyvTv7HCI/Y4Tr
	oauXF7bjmCFBiaqt3RJZF2TGEnCzbiJQmKY9ZtY2dARbo8VFW87Hp4cWEmoShImVokgIb1eQdly
	9Fnc=
X-Gm-Gg: AYBFou1vEfSD50uph5IAz6jnAmkLIC7u9+CGj+PbkWm2Dgudx8k87blfjG8VuX0q5C4
	DHzLFlH9LnezRNeOrHI6fM2q5S1QwKuHHcECITf+VhVCtti0PACI6kTVmgu4ls2xJRyxtqgeVY1
	GAxYATadljmnt73OKh0swu2BdX1+diWPtqm//bUNv0o1eAvhOKk1wSatheRF8y5CBMKCcZoRky9
	8c5ySgAZqqNzPbJVLqixy3lpODiW6cn5KIC5G69oETaVd32NIteM9Ycv8mVvIomUQQN5tqy88Cs
	gFsZzzlaAFUZqZkPU4M0Ezo57NKevlslJghTcotMD7gJ+nN6smNt6iOwio93P+cZV43FN3D+57S
	uCIyUZTdOb4Qw7Y4354Wp9Z143fdMP8iDubDkGsauiJj54oFLbs5AMbRJ6XalBEtdiF66VOsIHY
	1qbkpEVnSBLrvB2jdlr8ZFNq+ufp5L9+8pOl9kVD603gDsB40oSJZ9rjwtya1jr7mg92iJbarx9
	jjp9gP9GXckmdfNXCFYK0t+zDT9imcpvhXdyiybAllarYgr+6xUfW2eRy8j10jKbrFS
X-Received: by 2002:a17:90b:3c08:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e0fe9c653mr6440889a91.10.1789545575967;
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
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
Subject: [PATCH v9 14/15] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 16 Sep 2026 15:57:40 +0800
Message-ID: <20260916075745.3549953-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_005937_653145_B57B18C2 
X-CRM114-Status: GOOD (  14.40  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f06ca2bc165d..5d65f4554c6e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -271,6 +271,47 @@ tboard_thermistor2: thermal-sensor-t2 {
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
@@ -796,14 +837,14 @@ pcie@0 {
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
@@ -1090,6 +1131,13 @@ pins-bus {
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
@@ -1642,9 +1690,24 @@ &xhci2 {
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
2.55.0.1032.g73a4cd73de-goog


