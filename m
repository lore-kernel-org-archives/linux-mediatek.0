Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A470C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTOPP+o88VWkb8bpp8Y96c4/97TqS6hM51V5JviFgiY=; b=Ijo92jj+2kSNaSgtNqm2FZqpjG
	FWayHaDuMcoXxYzdau9QM2+JJbzvl28rKM96DI9fLLv3rvL50+B8+pwoHcYcC3JXxBHGoHfAeaJTJ
	WPoZ51DO6xITQ8JQNsOOP7k81uIN89E3nMcozBRQ79l4VhN/kDCYIf0ztgWkSE5NqQQVJK0xwp594
	Af7HcB7IFcB6uuELh89j24PeVR5VWULW6dd+optSBywZtvOYr7Uq/jDOy7DtI2/3uw/RTf+bLgB3r
	D8yf4nxrw2hsZZhm1NLdRJXZaNWhPIoecTeIKXovMfehV5S19bD8O9JZLQff8/X+iOliqCjHEN6lb
	EOqLdG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjyv-00000001OvI-0FoR;
	Thu, 09 Jul 2026 08:19:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjyr-00000001Otc-05iI
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 08:19:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8485b80f8f0so307996b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585175; x=1784189975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTOPP+o88VWkb8bpp8Y96c4/97TqS6hM51V5JviFgiY=;
        b=YJ43AJG7sziSGRQEXnU8n0FapmVKdSEwq6vKU63BwjZlDFmBRV6bDE8LOY0uOPQy2V
         FgAgwWmQKRX5QvlgTtQxd/xFBnZUiLlp3/osrQJWV591BhdKgFLyj713vTmdFUrzepJp
         rhjNx3URZM1hp/CLNzKDY6A0j4Jy5E3cs6h8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585175; x=1784189975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTOPP+o88VWkb8bpp8Y96c4/97TqS6hM51V5JviFgiY=;
        b=aILP12J3mAFdcNEudaviWAbPScIVWcQBg+pCpaN7gYDCwKX7hZD7A1wHYjINCf1N5u
         RRUfzqX9tjjjnaWkXDWlbmVbHX6cnY2MGGduIq+wvfruYxEi8g1/UnHPpC6F6w5vLloS
         Ef6+68mdfA+2MGJ7t74Fim0IZfdNC2z+7L7kzbqd3HLTMSJHtoUlbOU5tVbV/8J6av1f
         HiTak56iJJvPP2p4MipFHxUX++vHW+Ouxf6tXCR7/dGV4W/1Wu+hCox7jSY2LQPK/psX
         /33cTmMwTOhtP3X0YPKA0yZfru4uDo2Ljr2uIJv6q2i9qaaIHArbpnl1UUf9Ndo++qKN
         AKeg==
X-Forwarded-Encrypted: i=1; AHgh+RriP79ZUr1qbdpwBPFO3JGKCjmeal90ueQUP+EbuqQgPMkcSyZTv/T1Hi40HFbtsc9GjBFcW0HzC8LeSoPaqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/57bFgzHk0TaPZQZ4uK8MgRvdR13JWVU2SQUZ8c2ZZrJCf+M1
	mFCAVmeHhxZxCVvsYqTqUcGMNJNcjBTCkoTNKyJ9wzFPoHlzXctvsjywHsZX7Ik3CA==
X-Gm-Gg: AfdE7cmHb5io7XERYlwE50DHpdK3/TjA1S5bNP03KC+1Fs9pO5YnqKGbmenmuTlTUaZ
	F2j9u9x4MUXYg3ihWvshSwA50jlDCaa0YhJKGSYSMFON/4iMiRYo0cw5VGHxx2viRnJq+cKtWpF
	2nkijnzO6o+pP3Dh7M2pRBgGi/Og60fgl/12C6PzujYWf6GsamriNd7e7NtH33j6FyrskSzM3qj
	30JJbHHIczWJe5bk1e6o01hxa7xxoeiE0rvHKrK817fUch9D+/Xf0GDhuRk4a4FMvk9H3Ajaadh
	AHpmEQOGIEsi+GUpygMqm3nDZmsJ7065TDraLk7nocaiI0f7wTNjbABwRZ2eFAIqA0kotro8p/5
	G45lHyqG2/TMdZKp8iIbIbLvfi4nBX5BBjzTECJuhTtoGvTZp3pnFNTApgJxf/D0gJmplLQyQcU
	2Rg9LFcXOlgITBpJzqEPXR2s2UTuaXbZ5HKa5LDShkDQd4MNlwj/C8Us4Kcca4qLDxYMaXXg==
X-Received: by 2002:a05:6a00:2450:b0:848:2b8f:c9d7 with SMTP id d2e1a72fcca58-84843027f6emr5831170b3a.18.1783585175251;
        Thu, 09 Jul 2026 01:19:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm8211863b3a.55.2026.07.09.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:19:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
Date: Thu,  9 Jul 2026 16:19:27 +0800
Message-ID: <20260709081928.612294-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_011937_059245_970B0561 
X-CRM114-Status: GOOD (  15.60  )
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

Add a device node for it and hook up all the supplies. However do not
add cpu-supply properties for the big cores. Adding them without the
firmware fix mentioned below will likely cause CPU DVFS to stop working.

This change requires a firmware fix for the SPMI bus to read back
correctly. The required firmware version is 15842.175.0. This is
included in ChromeOS releases R150-16700.22.0 (available in Beta
channel as of writing or stable channel in mid-July) or
R151-16721.0.0 and later.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped cpu-supply on CPU6 and CPU7
- Added comment about broken firmware and upgrade versions
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..dee946309121 100644
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
 
@@ -1156,6 +1158,14 @@ pins-bus {
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
@@ -1267,6 +1277,70 @@ &spi2 {
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
+			/*
+			 * vbuck1 is the cpu-supply for CPU6 and CPU7.
+			 *
+			 * However, this device originally shipped with a broken
+			 * firmware that causes register reads over SPMI fail.
+			 * This is fixed in firmware version 15842.175.0, which
+			 * is included in ChromeOS releases R150-16700.22.0 or
+			 * R151-16721.0.0 and later.
+			 *
+			 * Assigning the cpu-supply properties for CPU6 and CPU7
+			 * without the fix will likely cause CPU DVFS to stop
+			 * working. Hence the assignment is left out to avoid a
+			 * regression of the function. If the user is confident
+			 * that their system has the fix, they can added the
+			 * property themselves.
+			 */
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
2.55.0.795.g602f6c329a-goog


