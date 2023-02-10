Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AB2C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuwRMKnXVYShc3P97jDcb26qSE0+haHJPdzfJ4jdlqw=; b=NL3Ru87VLCCC0x
	pD4SGRhi2mVSRYwGS8gGbB4SvsGGsR+ivCP0Q2vsGKB7SMwNQwgF0gpBhvZeNZpuqB8yXv/XCm+tI
	35EjOE3cuPPu5MOj0i9x3j0JEtdGL7FznZ2FemVBgneotnkjIB49n4bOETL3A1DQmygKlWsCpDK+T
	eS4S0oMTAMZhNcE71ntO59f3kgIqnVoGgutUqyM0ClJllafQDZj2t0Y1GqiUqZg0mh0SkLDS15KD/
	QR8peKZagOH03THYUaWdp3v2y3Xq8NWT2lmCxZdQ6WyAQHUBUdeoytkOTq+N33jGoMsBFrW7D8YX8
	1XK2DBReJ+brWf4GRalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5r-006us1-P3; Fri, 10 Feb 2023 18:25:55 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5K-006ucm-8f; Fri, 10 Feb 2023 18:25:23 +0000
Received: by mail-ej1-x62c.google.com with SMTP id rp23so18152124ejb.7;
        Fri, 10 Feb 2023 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuwRMKnXVYShc3P97jDcb26qSE0+haHJPdzfJ4jdlqw=;
        b=pSxAbA2+FG3gPP+UFueQU6KD/r1XwB9gdLl8GEWhj8qXxrmwgi3uvSkTVkH2nln/98
         S2mpguECWVgHXrevhaIPbW7+EYm2lldR0Mw0FtvHEq6AaDQ7ZWIkEKYHLKrEzFZV2jBR
         nK3gotcHYrlLlpFLHHLOexSFRXeYddRXrTRCm/yqf3cGgY3OE/GrxeYHmvw3TfUoFw35
         oLDMWekqp7TVLaruIbyrgQq4tmjlylboR0mvANrkypIHHirNVdCtIU59GIZopjJ9wL+C
         ++76MeI37cuDyqFHG2xG8wUB9GN9XogSgK80HhAHu1bcA6HOX+RKigT6iRUaLKM9sbXj
         QRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuwRMKnXVYShc3P97jDcb26qSE0+haHJPdzfJ4jdlqw=;
        b=BtCdxpgaUUnngA5dlSZoCpdLj7kizsv43lxm9moPjNOoZ1BHR4fL2JL3RhUU2QYSNU
         LOOz27L7+bjwr4JpfRcWejjRtPkr+CD7Ea/G28cp0sSCsjLPY9VRDlHx2jTIzi/I+jmu
         oLa2ZlwPppockaDCCAVN4l1ub7A9IIuQKvDBuZbo1HJJo7i+8K/49gjrPD1CIvy3ItD6
         2lT8u/F3k48FzUWue48QjSybQ7jY6OfAqB5w0mhGEQTDCE6QMZj6C+aue5loAP71PUWj
         z+tVj00G4TCgOnZdr5IxkRSGzWbUQ+EvYu815nWTFpz5RsrQN3xSmHug5BKP1OQYpHVL
         I2Bw==
X-Gm-Message-State: AO0yUKVY5ci+M8BeZPph6OrX+CIi10xoCel7aXV81XOw4dFjAktxyTt6
	dQfNF8p6Q9dN6C0DMapQfFk=
X-Google-Smtp-Source: AK7set9KKmd/XMoxaSFG+41MnGmoEWfK0335H5K/dBcod/4BoKwJVmS9dtDaVS/wURUS+y5HMR0jXw==
X-Received: by 2002:a17:907:20cb:b0:87f:89f2:c012 with SMTP id qq11-20020a17090720cb00b0087f89f2c012mr17409171ejb.24.1676053518552;
        Fri, 10 Feb 2023 10:25:18 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906024400b008aef19f678asm2708966ejl.165.2023.02.10.10.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:25:18 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/5] arm: dts: mt7623: add gmacs to mt7623.dtsi
Date: Fri, 10 Feb 2023 21:25:01 +0300
Message-Id: <20230210182505.24597-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230210182505.24597-1-arinc.unal@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102522_334180_9827213B 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There are two gigabit MACs on the MT7623AI and MT7623NI SoCs. Add them to
mt7623.dtsi and adjust the DTs that call mt7623.dtsi.

Now that there are labels for the MACs, remove them from under &eth on the
DTs that call mt7623.dtsi. Remove the unnecessary mdio label from Bananapi
BPI-R2.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623.dtsi                 | 12 +++++++
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 21 ++++++------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 21 ++++++------
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 23 +++++++------
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 32 +++++++++----------
 5 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 25d31e40a553..2bc3c49dc3df 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -981,6 +981,18 @@ eth: ethernet@1b100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		status = "disabled";
+
+		gmac0: mac@0 {
+			compatible = "mediatek,eth-mac";
+			reg = <0>;
+			status = "disabled";
+		};
+
+		gmac1: mac@1 {
+			compatible = "mediatek,eth-mac";
+			reg = <1>;
+			status = "disabled";
+		};
 	};
 
 	crypto: crypto@1b240000 {
diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
index e8b4b6d30d19..a64d68b6e165 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
@@ -112,20 +112,19 @@ &crypto {
 	status = "okay";
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
+
+&eth {
+	status = "okay";
 
 	mdio-bus {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
index 61f5da68d4b0..fac3ca0322c8 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
@@ -116,20 +116,19 @@ &crypto {
 	status = "okay";
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
+
+&eth {
+	status = "okay";
 
 	mdio-bus {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 5008115d2494..1e03a3de654f 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -171,22 +171,21 @@ dpi0_out: endpoint {
 	};
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
+
+&eth {
+	status = "okay";
 
-	mdio: mdio-bus {
+	mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index bf67a8e9be59..5e328c2a6a6e 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -156,27 +156,25 @@ dpi0_out: endpoint {
 	};
 };
 
-&eth {
+&gmac0 {
 	status = "okay";
+	phy-mode = "trgmii";
 
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
 	};
+};
 
-	mac@1 {
-		compatible = "mediatek,eth-mac";
-		reg = <1>;
-		phy-mode = "rgmii";
-		phy-handle = <&phy5>;
-	};
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&phy5>;
+};
+
+&eth {
+	status = "okay";
 
 	mdio-bus {
 		#address-cells = <1>;
-- 
2.37.2


