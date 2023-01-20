Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD28C27C76
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 20:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo0XtEtZuaBqdua1qIZ1sK0YUF6ygLe9GsQG9g8NAj8=; b=XCIbTwMaqc4SPJ
	gE+ieHATjok1zFjYMQLiu9jUai+Gdbi4GQOqYbhenqhfoGsNL+KeBp33txrnSBi7P0WSbsjS3JPTd
	H1n0xysvRFEuryAs5VobbLI2AWzgPkpN1V5KqnF+GcsAnVep3/yUhnzf/DU1B7PfvNGntc9MY7nOs
	0vxwLRC41d0hvmsuyCNXY+v1sf92JliHNAtWD66Q+V3GCJgmMkZHibKJ5sOn751jBuKwif8DzKDDb
	lD2RKZuSUg6YVXtakuVpdCnig5rHzUfJh0Xr93KVcSMW8UKUqu4yO7PJssBeA/ePXwEWLs9ZFhs33
	8fNLN9XL9xXXfgJa183w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOX-00CLGu-7V; Fri, 20 Jan 2023 20:53:53 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOR-00CLF9-1U; Fri, 20 Jan 2023 20:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674248023; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=as2IOHIY22MlZCGk7lYm3DC6A+OgTgYg+EACAXiwQzR7PMhM6ynXN/B8z5OnO4UxhkUpSfgx2G1oeOaRaoELcpzcZ3844X1SCuh96ptXMHwfM7Wm8uxwmbZEPUdLV3Ix5z0yNvlh7rKcbdlpO79D0kheunr3Od214eSiwHtEYuI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674248023; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=mo0XtEtZuaBqdua1qIZ1sK0YUF6ygLe9GsQG9g8NAj8=; 
	b=kWCf3utaoKDeHL6u6xwNwbRtU6/HGP1IpZVEza9T8HceDEwdI29+/StuWsLdvVwUGuE0tAaAjeU9M4tex1trmiQfOkQovq8QWZseSri7g2y5uMw+181zq4KSpEatE/QonyBwlFCbbYaiLaMPT6BTEi0tOjUo/mZrZmuurciQtxc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674248023;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=mo0XtEtZuaBqdua1qIZ1sK0YUF6ygLe9GsQG9g8NAj8=;
	b=ZirWshWvkEHInpvKM4YIncotZj7BnPOW/CZSQLRQSgzI9oyH4oTmbIfKi/pmzAtu
	Lo6e494W4Sj02vX6NuBWCteKuOLW/cvR1PUEB7x7Q7pWTTpHDnbUtF9s84v1rmQU5dM
	eR4KG9Yv86sUXq2vUQmIKdA2mgCBXFMj9VWAz07Q=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674248021604362.0248329748873; Fri, 20 Jan 2023 12:53:41 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/5] arm: dts: mt7623: add gmacs to mt7623.dtsi
Date: Fri, 20 Jan 2023 23:53:14 +0300
Message-Id: <20230120205318.519493-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120205318.519493-1-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125347_184428_1621B456 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two gigabit MACs on the MT7623AI and MT7623NI SoCs. Add them to
mt7623.dtsi and adjust the DTs that call mt7623.dtsi.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623.dtsi                 | 14 ++++++++++++++
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        |  4 +---
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        |  4 +---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  4 +---
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  8 ++------
 5 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 25d31e40a553..5eb698a90d34 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -981,6 +981,20 @@ eth: ethernet@1b100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		status = "disabled";
+
+		gmac0: mac@0 {
+			compatible = "mediatek,eth-mac";
+			reg = <0>;
+			phy-mode = "trgmii";
+			status = "disabled";
+		};
+
+		gmac1: mac@1 {
+			compatible = "mediatek,eth-mac";
+			reg = <1>;
+			phy-mode = "rgmii";
+			status = "disabled";
+		};
 	};
 
 	crypto: crypto@1b240000 {
diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
index e8b4b6d30d19..8297123f9d09 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
@@ -116,9 +116,7 @@ &eth {
 	status = "okay";
 
 	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
+		status = "okay";
 
 		fixed-link {
 			speed = <1000>;
diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
index 61f5da68d4b0..9ee859b8eea7 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
@@ -120,9 +120,7 @@ &eth {
 	status = "okay";
 
 	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
+		status = "okay";
 
 		fixed-link {
 			speed = <1000>;
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 5008115d2494..a5800a524302 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -175,9 +175,7 @@ &eth {
 	status = "okay";
 
 	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
+		status = "okay";
 
 		fixed-link {
 			speed = <1000>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index bf67a8e9be59..2a869a6476eb 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -160,9 +160,7 @@ &eth {
 	status = "okay";
 
 	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "trgmii";
+		status = "okay";
 
 		fixed-link {
 			speed = <1000>;
@@ -172,9 +170,7 @@ fixed-link {
 	};
 
 	mac@1 {
-		compatible = "mediatek,eth-mac";
-		reg = <1>;
-		phy-mode = "rgmii";
+		status = "okay";
 		phy-handle = <&phy5>;
 	};
 
-- 
2.37.2


