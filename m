Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF653CD98CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=; b=Ku76nb14XSWxql9rP+I989sCM5
	PxY7Or983xwLcEAx1xJDpFhrqPQHtq9sHIvq43hGIRqxKpeG1jTzJQRhUPUVu8X+QlMlC0V7PfKe7
	LQX6wwM6jSel3P/TUUwoRuTGD1ZzPdRjtYG33bh40jIl+gnZvcxdtv5TrAsjebBn3r5bKM2BZpEvw
	iY4GqtiBCJmD/YfprpL1FVBXABmjjkmsZ+8NaX3t6hmqXZXUeIqFWmRxXem64c1Bm89CnaZ3XH9Rs
	YRwhwktcmqOuyNA3sKmojVnMZkKITgjwrsGhsoBI3UhpwE1lGvvYtVPptMKx/T+eLWcQb3210jErj
	PnSNIAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEW0-000000076XV-2jEr;
	Wed, 10 Jun 2026 08:42:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVx-000000076S0-27Xq
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso46762535ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080941; x=1781685741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=;
        b=Ic5rxYs5Z5ueHlbHGb8D4gnyO/27TrboqX8Vm/J7LvWn3Jl8SBxcDL/wVznvsGon7b
         jYt22YdpMLXH10sEQQcQmOfInRyL7eT0s4QUlLMZbGDk5pTIJKviHvZ/YsrWjnCUUEXm
         xUxVSbCvXCT/Uiugyc/BPYEQzGMSoFronYljQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080941; x=1781685741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=;
        b=g3F+r4jCFmlfy5iDgJEzk7xswZLAyJXrcnrN+7HTzCQLnFFjnLGipBWx8d317re0NA
         Xdg8BYr1ElnU2VX3SIOMtN0hUft3FvVjdlgorC4+uIvjopCVJ7JPGRA++Y12cluWi65N
         eNQkCPTvsR02IQUusDTK9lrNP/6lKEgBd7zS5d+T6bz2d6PUBMLeQlG7x7l47842Z2g3
         NBtf1lVFNhUb308tg9Xwc+IvsXPx/c3wTHeGh0Gp+uMq2mdEITmovLVKVamDLNTGHXsl
         12KR2s99NaVaIwjmiERSSJ9nfDgjXxGArBnJZLaZIMoriDWIVTQkda9wxkTEnK6SKLDq
         O2SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZjucgHmH6NoZzOUwh8huBeUZjKTH8d5vKpSd9QovfR9b23FYwE8RwKCxh8/9E+NaNbDzydm+RZpg+EE7XAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEcLqc5JocC00Hr49NmzshpaUZ1ToXZchmK3vvexhmKxlBJT0r
	bvB1JE6935V8HZk6TozzbjQllmgKiAi7bndmc65Vj1AGuINA8SFoCryOJVsf9zG+3A==
X-Gm-Gg: Acq92OEFlzMCYlCCNT4PZhkw3Jzo/5/ETGF4QjlSS/poR75j2b/jhEvDpkGAOn+G6qj
	y35bsz0Yu30au6lQZfAv5B3OHM2yP62nFIlKKlL+enveFPHYs6C8rDKIeCHy+7MUVtgGzYO93Ye
	VpdO+BhRcq7lpY1kIUFHjWRgytR2aQOQ8uBn+TiAifGbCjk9zxGBz9Au6TfbO3Zii8IKex7/xRX
	ODdIRdPmYt7wprXhS/TZYKtFozGhvDzFU+ic3HEmUFSXWNjZOmA3n1Io8dH2uI9uH7TfJU1NFYy
	/eaFlYet7LRDyYTUdXb8zK1mbaPTvSv5KuJp4RAKco4AcL+pbODft3fC58J288DmILe1PMkYP3Y
	FO1yPMftIOD4cCs6JXUgkuEpdzWxSaLQW3te49ke06eu+FMtHaRfpe5umHtL/z+d98sv6vCeTOY
	Usu/CNbnjOVfATmFY4AhzfApySvFqCMMvUraf924RFAmc/tYBFphC2cK7VjLbpA+Gt2Xo6ogJHV
	53kGapTYyb6PpZQng==
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr271721185ad.29.1781080940790;
        Wed, 10 Jun 2026 01:42:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:20 -0700 (PDT)
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
Subject: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 10 Jun 2026 16:40:48 +0800
Message-ID: <20260610084053.2059858-15-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014221_621424_19985E95 
X-CRM114-Status: GOOD (  14.20  )
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
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..c95a54de3567 100644
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
@@ -1085,6 +1126,14 @@ pins-bus {
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
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1686,24 @@ &xhci2 {
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
2.54.0.1099.g489fc7bff1-goog


