Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1377C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHbYPq/h+v4flSJokaAuA/cakf8tYhXsyBD00AeipyA=; b=Y1Fb6IM2EEKDlW
	lKD9dtGYSSk1+/jrPTdR24gudTVCKjg0hRs1UcVL/IlRD9gjvnNPNKwu4xPv8JPqgaN69tnsjIcPn
	GYJY0pNIwXvrLz3MMXmUzAI7E+VO+wrroxZjObC3K3fFiJQ7BZ7DDNogk5A+yvocmEVG1fQUbhvN3
	LPQznnUhVKG9pAwvCrtwYpAvfO1ve6hDeCwdB+tYTJLaKdf8u3AWB2skIi6vf+3kMctakhA8I0Gp+
	UKSZfFpyjq5acSNN2r+GblTBCIEpNP0qQbCIJQCedrWbuxG1p4rMjsO6YHFJGEu5cGSdMBXPp7FI/
	USd1T6Ay86FYZ4R+n2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzjm-00000004Iyt-3HrL;
	Fri, 16 May 2025 18:24:50 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNk-00000004FMt-3iGt;
	Fri, 16 May 2025 18:02:06 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id E1AF540772;
	Fri, 16 May 2025 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHbYPq/h+v4flSJokaAuA/cakf8tYhXsyBD00AeipyA=;
	b=E8iqsaXjKJ/qJZ+Ipt0fdEhrky4FrF6JIXdOk5YxZEHaJvlUiWsbyIpmJpmbcWg1Cd8/j5
	0Zj1uYhlTD7oPoYMRykR3hn4vvR5owojmXyuU9p9Ugh6hrTjtivaDYPdC+bzPO9gYJ2JIj
	ZjlGgm4U38p0gwJ5uyRIZz5HNfMroqg=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 96BA31226C1;
	Fri, 16 May 2025 18:01:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 13/14] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
Date: Fri, 16 May 2025 20:01:44 +0200
Message-ID: <20250516180147.10416-15-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110205_070464_91FF515A 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add SFP cages to Bananapi-R4 board. The 2.5g phy variant only contains the
wan-SFP, so add this to common dtsi and the lan-sfp only to the dual-SFP
variant.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   | 11 +++++++++++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 ++++++++++++++++++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 18 ++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
index 53de9c113f60..574ac1b853a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
@@ -9,3 +9,14 @@ / {
 	model = "Banana Pi BPI-R4 (1x SFP+, 1x 2.5GbE)";
 	chassis-type = "embedded";
 };
+
+&gmac1 {
+	phy-mode = "internal";
+	phy-connection-type = "internal";
+	phy = <&int_2p5g_phy>;
+};
+
+&int_2p5g_phy {
+	pinctrl-names = "i2p5gbe-led";
+	pinctrl-0 = <&i2p5gbe_led0_pins>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 36bd1ef2efab..3136dc4ba4cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -8,6 +8,24 @@ / {
 	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
 	model = "Banana Pi BPI-R4 (2x SFP+)";
 	chassis-type = "embedded";
+
+	/* SFP2 cage (LAN) */
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp2>;
+		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
+		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
+		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
+		maximum-power-milliwatt = <3000>;
+	};
+};
+
+&gmac1 {
+	sfp = <&sfp2>;
+	managed = "in-band-status";
+	phy-mode = "usxgmii";
 };
 
 &pca9545 {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index afa9e3b2b16a..d40c8dbcd18e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -38,6 +38,18 @@ reg_3p3v: regulator-3p3v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	/* SFP1 cage (WAN) */
+	sfp1: sfp1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp1>;
+		los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
+		tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
+		rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
+		maximum-power-milliwatt = <3000>;
+	};
 };
 
 &cci {
@@ -108,6 +120,12 @@ map-cpu-active-low {
 	};
 };
 
+&gmac2 {
+	sfp = <&sfp1>;
+	managed = "in-band-status";
+	phy-mode = "usxgmii";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
-- 
2.43.0


