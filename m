Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1Rve8LgEg9y9ohsQOyhCMXF0kBZ6C++xNyY5Ap4DNU=; b=0XAJTMnDTnJa9t
	SOTUNjqeY6RheKwyNO/o2x0Gw6Jt463RRSoEL3GKrn51oratsEKDFJ07LFQF9lo2lU7rDsvYLGhZV
	UcgqF8tm4U7Ls9vbrpLqOhhqvtwEb+igjxe9EDAP9AkA1DDHRxOMzF+sNuauw2kHWmXIBX7s1wHxZ
	rSMlLM5t5ua+/gudf9RIcmZcjl2qUpcH0gGxqzIpI5sBZ/EcPExFjwM5mGbFgy6vWY6pD5oupFekD
	AR5lt0s5XtSo1ox+e4HonSJLlNI5wShOygNMdmFOnLBWg0fgTjcIzyI9OYHe0AHRv7mUGvnXYICj7
	H/oxnowThsjuX0OTw8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTFd-00CQNe-Pl; Thu, 07 Apr 2022 14:36:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTCZ-00COlJ-QD
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 14:33:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id dr20so11197864ejc.6
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jOfGY2aWB6ytElc3A8TYe1lFhh8rzUDtI1qb0xPNWc=;
 b=TN89JKEfl9AxOmTFv7RkLldl9yUqbqq288C1keYFmxd40sY3RW0quDl9ywjD9PjL/Y
 agKVab8ZUTrbszOKkNKg0lLp7N1XEENxL7mQwobdcPRQWDAUn/BMg8H6vnBLFi0zAVRM
 LuL0f61r0sFD0A6b342d469AsYsfbXat52/eg4TVEIEPcSjUASf0RGN5MKJbvFYzx2J1
 aKEyTSaMoRX3nd1drizcBQmdzFo1CwC94A+zx2Bqbs/TWLG4UjhZheZInK/OV2U6ITE5
 XfeN5zBiwOD1KP8k0tbu0ZL9VnJElePg/mY7wLl6+KOiea+vcus6rH/w807vQ2D/j/a+
 fZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jOfGY2aWB6ytElc3A8TYe1lFhh8rzUDtI1qb0xPNWc=;
 b=dYcastqX/pfRH8FFHDDA9kQ8zEy9vmB9/MXIWidG3h013pzaCgcdG+C/7RWecfHbpo
 nOXh5CYwbVStVWzHrs4T03DhMYmfJdkoENDQgS5BLryQ+GGldlCURvioBl0xAXKf+kDM
 tEi2XcC5RsisTj+HdWKQUZh0Zm9KDz0CCZUgFWaNsbj6UxPL+4CWRTID0qrzxaC+YcgD
 02yj2KUe+9XWI1tMo67dUerGlDCiUP9llok4PEL/rJoZ3IpfkbPsuOc+PIGOsSrNhe1V
 ksl5gdW8+ZJqVXWMc6jlwgiQBBSBJXj1IeWGu0AnSgoEVt1C37DNiLoVY0LORm/dgs5F
 KoCA==
X-Gm-Message-State: AOAM533DUI3n4FA7BQnopu0gYmpjgW9+4FUnzw6BWjlClx26h7fPuOYq
 Dkf2+g/Ag4siZC9r7DY/GzPF5Q==
X-Google-Smtp-Source: ABdhPJw3RYZO7ZNQxKKRlLqoHhj3X3DBP2V/Sm5elqCPxW4lwfL1OHoBjDOdMAM81b2iiTLvHXEfmg==
X-Received: by 2002:a17:906:7056:b0:6d6:dd99:f2a4 with SMTP id
 r22-20020a170906705600b006d6dd99f2a4mr13357831ejj.43.1649342010386; 
 Thu, 07 Apr 2022 07:33:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe4d1edc6sm7624054ejc.61.2022.04.07.07.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:33:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
Date: Thu,  7 Apr 2022 16:33:28 +0200
Message-Id: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_073335_862928_A3F3BA99 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/mips/boot/dts/brcm/bcm97358svmb.dts                   | 2 +-
 arch/mips/boot/dts/brcm/bcm97360svmb.dts                   | 2 +-
 arch/mips/boot/dts/brcm/bcm97425svmb.dts                   | 2 +-
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 522f2c40d6e6..c17fc14d4899 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -78,7 +78,7 @@ &nand {
 &qspi {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "m25p80";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 01f215b08dba..c9b76f41e7a6 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -81,7 +81,7 @@ &sdhci0 {
 &qspi {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "m25p80";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index f38934934349..289a57b912ef 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -116,7 +116,7 @@ &sdhci1 {
 &qspi {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "m25p80";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 6069b33cf09f..826e91b840a3 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -129,7 +129,7 @@ &spi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinmux_spi_spi>, <&pinmux_spi_cs1_cs>;
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 5892bcf71595..db961d61cfde 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -60,7 +60,7 @@ &sdhci {
 &spi0 {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index a7fce8de6147..224383a30ce3 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -44,7 +44,7 @@ &sdhci {
 &spi0 {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
