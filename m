Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0990C43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=; b=vlqTmqZpATJ2UWETDn/Sue4D36
	o4zZZnLV/vPvO+QerjXRKdz52mOR1vaYs9iya6s1m/Nqk7TSM6ZNtDrlCOIsxF5vOAlQrSxkgCgiE
	I07eCC314Zy/X6D6ECpH2sCxbVH36YEjSKC1IENl6QLvlSIqlGxJAMElrlRLESTgf8F7BQD0BlPYV
	7o7Qfr68U9XpwD/ZhuAcZeuWWA8MY2kgJ+a62zTzemEj3hR+gwd93UlUO/lverzAZIi4o7Eu8MB1u
	Ywlkbt6dpjO8LSwj7j6o+lnHWPwzIJY/J4N2Hgi/sXjZPIPWd+OEbRrcdbjzggOLkm9be6z9TzthT
	+3COkWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3I5-0000000Emjb-2EjG;
	Tue, 07 Jul 2026 10:44:37 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3I2-0000000EmiH-0YMy
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 10:44:36 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso2590430a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783421073; x=1784025873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=;
        b=V1Mx3k8mVqBo5a3zPVuclUr9L3qXnqXdnqOK88FCCCygtGm4BKj5hS9DeAuTkHlb3I
         gjE2rspsUuRG720N6hZhXAw/9QJwM4tKDSJf7vhuwMcuX2+i2P0fYTFemR7tUjJCcAwl
         5UU8PZNGf8Z7q9VzkEtye+2KCVu9j+fuKaVPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421073; x=1784025873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=;
        b=e6macJfrb8AEJp9BZY83BXuId+hNHX/JrtZM3cd2D6Mw1wf5A7UKrU+gqU0Q8n6vXm
         COkepCoTm+WrWs/a/TC+ak/+RtcIHy3WVl39auZixVDLoD77d4ztLKNlSuHHdRbPDWmW
         X0D/RNci26rMXOVGoZA66aLffHWkYS3XCbgncXGUCTCjlJ2qjokpcGpy/L8GAqQviM/Z
         GutP4QB99u+iqUfbpXtVbeg0m6Bx8QKn1CJX1/Bot9/zWdTStG7UiSMq4kbV0AnSHNNS
         ZLI+I178WjN/NLh/nS0WQ77iHweE6fPv0Y44WocRralbKrg+B9nefLqvhWY52uD6yL9Z
         pwNw==
X-Forwarded-Encrypted: i=1; AHgh+RrbhhsCS5HeiOt0w2h2G97+rtSWmwLXlRv9QHtD2pLCbqnSx5C+9v1KtxiFNti5sD6/jyt0BrRDxGjX2aPwZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFLnFiKkY9rlvNbdRzIY0Fn0JjLJI4WQ/8ao7V95hb5VRN6RC
	yGsu5YnqllqStsw6sKHkf+CyXTA0T38utemLcwISj5rxZng2A/QYZJ64f3f+4vKFfg==
X-Gm-Gg: AfdE7cn1kRrxFO7zpMXKxQIbRn4r26yu36kf0EudATFLaQM3Kb6ZMQL7IC0TYEV55b5
	bpQGlrdOFcv6FlE/cXT9UP1tugPKps/UCwYgPeVaE6Vfe6AO5NhbXScX9LXhfNbfO1SFNXORUlh
	XbwIpC9V+UDq9s4m4fqxEgFLD8VFfGCMlUBIOTJ+15vlQkjEXHmPPXCLzVkhBru0QNTddqG4LXl
	B+xB1u9YkVaEmezVy5tbPjgHHKPA6nclu3eGyxzZh/zf7zaAisKyQ7nzFaSTS0UX9uE873psTVl
	ecyJHR7++ffmjzWJy8cNng2dDmGIO96xyKYFiHhAESYyxndF/Ig7X93mc217Urqut7WNjlKPKzZ
	ssv4pEj7mIdGUgz2yG9+t4V1vXD1isX5plI7h7JYdD8+43/ZNB3l75EUAEU655NwJn7n0rVAjJA
	8D9bEdf7louLh9giRySJfNwHPVz4PqIFFRbiad0gaaNt3DzL9n283WaVOIO+hBeTMdSgZr5g==
X-Received: by 2002:a05:6a21:3204:b0:3c0:9c18:d5a7 with SMTP id adf61e73a8af0-3c09c18d6f0mr2745290637.68.1783421072707;
        Tue, 07 Jul 2026 03:44:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:cfca:cfe0:c982:e981])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5b95sm790980a12.3.2026.07.07.03.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:44:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
Date: Tue,  7 Jul 2026 18:44:25 +0800
Message-ID: <20260707104427.3409290-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_034434_224468_8948985D 
X-CRM114-Status: GOOD (  13.77  )
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

The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
DRAM.

Add a device node for it and hook up all the supplies.

This change requires a firmware fix for the SPMI bus to read back
correctly. The required firmware version is 15842.175.0. This is
included in ChromeOS releases R150-16700.22.0 (available in Beta
channel as of writing or stable channel in mid-July) or
R151-16721.0.0 and later.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..fea52c377d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/spmi/spmi.h>
+
 #include "mt8188.dtsi"
 #include "mt6359.dtsi"
 
@@ -241,6 +243,14 @@ &cpu5 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
 
+&cpu6 {
+	cpu-supply = <&mt6319_buck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6319_buck1>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
@@ -1156,6 +1166,14 @@ pins-bus {
 		};
 	};
 
+	spmi_pins: spmi-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
+				 <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
@@ -1267,6 +1285,54 @@ &spi2 {
 	status = "okay";
 };
 
+&spmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spmi_pins>;
+	#address-cells = <2>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@6 {
+		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_s5>;
+		pvdd2-supply = <&pp4200_s5>;
+		pvdd3-supply = <&pp4200_s5>;
+		pvdd4-supply = <&pp4200_s5>;
+
+		regulators {
+			mt6319_buck1: vbuck1 {
+					regulator-name = "ppvar_dvdd_proc_bc";
+					regulator-min-microvolt = <520000>;
+					regulator-max-microvolt = <1155000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+
+			/* vbuck2 is ganged with vbuck1 */
+
+			mt6319_buck3: vbuck3 {
+					regulator-name = "pp1125_emi_vdd2";
+					regulator-min-microvolt = <1060000>;
+					regulator-max-microvolt = <1170000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+
+			mt6319_buck4: vbuck4 {
+					regulator-name = "pp0600_emi_vddq";
+					regulator-min-microvolt = <570000>;
+					regulator-max-microvolt = <650000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


