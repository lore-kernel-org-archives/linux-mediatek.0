Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4301C624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+z8Cwnd44tBSJzkmGNNNosSpCrM38d+qGnlF9iz0lg=; b=0jUSsXY7EY9cpPut529VrPWUDt
	MTLpAs8uymaqhgDOxej2fPUfAII5Qj/L6uA3VsclZU6IMnQHMsxld6ZUt+y5oNsqBFOjZRQ2iWLBj
	/vXadHk9ijJHVXXo7RsHGfH3lPMcqw80hIqiPfV7dRlZ6YYpEWt1DA2ucUhEuLzcn6wrUwAUqi7D1
	XeHSSP6hRQaA9yoU/65I+yNp82ZkX36ijGLCt8/SBcnnaYBPLhvaDl+eRDRW7+1nQid9X9tZqykE2
	6QZ2saR6LCsm7jE9ROrAMSUs2dXVqkMkujdI83Ejs5H681SUe+r+p51FOwQPfzbNR0N+8q9BUaYw0
	Gm4zngkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXO-00000001QvV-2wSM;
	Fri, 04 Sep 2026 08:44:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXL-00000001Qqu-1V8r
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso632414a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511479; x=1789116279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+z8Cwnd44tBSJzkmGNNNosSpCrM38d+qGnlF9iz0lg=;
        b=F3PKDaKoxQV0pRp6q8Bjbngc5w+dRUlT5tLivBiezCW4ItGrWB8IYJV+ugNX45XTnY
         C73jrXHMHfpH0fsvnPa7plAjlWWx6KS6Dxocd6apjqexwqrVcyUrJnZL0nDFIUJhD/gL
         A5WbkE7mAF+yoYsmLjYCC6Q7f/hyQqQ8jylhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511479; x=1789116279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+z8Cwnd44tBSJzkmGNNNosSpCrM38d+qGnlF9iz0lg=;
        b=SXT6zw0ebYEZVPOueGPd0iDdta1OSU+266KMxHeXJQ9REvlrN+bTH1m2vnY+uQ3t1C
         pa5AHe2TFcvfPc6fS8+d/72x4Kg0QPZoIXhcOahxh3iREjama2x710x0IHRu4h0TfxIS
         ous0AWg2pcoAC+zDHEpUhiGA4u/sZPT/pDPJx+C8wDNmsaAduqffW5LjDJ7qiJVKjfOV
         BMuJc6T/7cM6vw7LSWpxUjFtA/Nyej02hZGAYIcE6wHDYchU7Z938pTjoSxF+6QO2WCW
         Gqc2Scv2MSM/5DSElYaDRyjcX9QkiCm7HvbIqspPrTAfRD3omFY/onf63/iREi5/m1Lw
         aeVA==
X-Forwarded-Encrypted: i=1; AKwUvBz7mu86bmV9RejgSd0zkGfk/3ToaH8NG4X1rOOlQxhLX7gW1Gf78JvhU7DAaveXtgN/CYJQiuVGNpbKO9RtjQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mVT7UGtDzYY+VfRmNHomAvYuYua1fVetIrTA9Pyyi+twBSK6yw
	4ydIrVIp+Yfsf7hj6RbMUoCVko1ric92pUFJxrE9JgvOti511ki7A0J9ZWK3OuVWJA==
X-Gm-Gg: AYBFou3z3MC0WS+QcYM3Eq7GwD23ePijur2Ku5wVo6UUSHOz4ihi33GPPQnB9sfRuue
	Cy3qCIGSrEvDd/WStOSX2OU56ufym+B9UnFLPgi5n4RYeDAnRbBFqpgdkb1agUALUj0lljrGb5/
	L5Vr38XpbIV0a0hkk1Xnxa+UJQPY8t9MLnWWqnMXg3sI+IE9822D6eQj+3KPbwhffR4uKJCX/Kh
	WmSz8SkoUYrKHFsLZf1POXHYCv9YAhRFOcDicIF0NaxWthCFcJRCSavs1DSDbz/enn/kQpQPJ2l
	RCi3l59XJpHffxmSuwvsbBFd/vRpy9zvTnE1isfD6aQumMXT8PEmD1DG4H2q5t5xJ30iShj7Su1
	rnKqJUFNEGNSm/ABkJCSmBMd2DZ7XScgaZAxSVbnw2oOmxOCQHGPkXkiRfQYnhQEphZ+xtWWQcF
	jl26ZbspuJ08XJQXaUa0qMKfDTmgx+5O1e4unxNik6op8th4kQkhUdfnS7/sdqD/swXFLjBpgce
	tPBFahUkj1Wn8Ejdj+6Qt5Uuk5Q/+bvcZ2YWi0SuFkA
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr6897920a91.14.1788511478517;
        Fri, 04 Sep 2026 01:44:38 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:38 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v8 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri,  4 Sep 2026 16:41:54 +0800
Message-ID: <20260904084158.1341550-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014439_472701_B5A5FDAE 
X-CRM114-Status: GOOD (  14.26  )
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
2.55.0.979.g7e5102b832-goog


