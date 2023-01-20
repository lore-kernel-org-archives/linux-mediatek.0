Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552D6C25B50
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKH2wn+0gz7vBfBaUG+NFMrHFQ5k4jFbG7iDREyDosg=; b=gvtKQWpVRXmaix
	dn32m+xRWqow4cyjU/kyr3QtD4vxFM1jPTj0iJ07sHmbs/f0aL1os3xgpg2sQwX14a6Bg/VfRU4ww
	mJ2DH1jJoK3Tqt4tiph+L+q4L/mBhivMG/WaXmTYSxtEAD5LXB2gY00FKDS7oIimwNpLyePHEo6Oz
	U99DbeAFZJtn+xNUhF0T71jX+DL3RVDbclbVHhnUKxjW3zgG4pi2JnO7mgTvw5PaU4Dj6rJNGCX1s
	RWf1dQVD5I2dyUCBHSxol4rr/FDG9Gj9i7UcvTKQnEItzZKqZBxvmTFGyErIAB9btIgKeiwu7es2z
	MkSFU1KJvR8vf1jDT8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOg-00CLLP-2n; Fri, 20 Jan 2023 20:54:02 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOc-00CLIu-7D; Fri, 20 Jan 2023 20:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674248031; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ln38ROi2fbT6ShQpnFVy/0nOzJsfavMPxDdkFM3Q90OZS8Kryrir8kNCEeAkEpY0zz1LKL6SOOi/rIemVefiNOxHTgOOBLwuC3h3rtZ3LpSL9LjbtjeT109J1eLtXMdhC5Cv2gJImBlnu8EsZU6txqSL7IZTwCJnG0m2ITSzuG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674248031; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dKH2wn+0gz7vBfBaUG+NFMrHFQ5k4jFbG7iDREyDosg=; 
	b=CoQFbOqvjjjewE70cP2d/vpWg/mnGd6dVRxxYa7wUtYrdEo4QhFDUNAxvW1dj0v/tSiIQ+t0Rp3ntTs9BzISIYTUBPaYzxgft3slsxwFK++7bPBFXIk5P0rHadTgHCLOBLE9TWKBC+ixVWzgVTagNRH+p0UhVOC8t0UwOwHSKQU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674248031;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=dKH2wn+0gz7vBfBaUG+NFMrHFQ5k4jFbG7iDREyDosg=;
	b=Y1WgMvKZhY6Erbdyi/+ICnWJQAgSPS5avuDzvznUpumel8OeGxidOB+KJGBgWQKb
	UJAFRaS3NNb0OZ73CH3pgmDVbLrxGXmUeCaW37gOSJveT0iv5Ou2A+n6R7wKs/UqLHf
	j3RFhlHzhL7aq45nrZ3qBdKmqYzPz5kL7kW3JhyA=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674248029220735.8863556192579; Fri, 20 Jan 2023 12:53:49 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/5] arm: dts: mt7623: change mt7530 switch address
Date: Fri, 20 Jan 2023 23:53:16 +0300
Message-Id: <20230120205318.519493-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120205318.519493-1-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125358_507790_D2798C40 
X-CRM114-Status: GOOD (  12.15  )
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

In the case of muxing phy0 of the MT7530 switch, the switch and the phy
will have the same address on the mdio bus, 0. This causes the ethernet
driver to fail since devices on the mdio bus cannot share an address.

Any address can be used for the switch, therefore, change the switch
address to 0x1f.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623a.dtsi                | 4 ++--
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 4 ++--
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index 5207e0183f3a..a1a393028629 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -35,9 +35,9 @@ mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch0: switch@0 {
+		switch0: switch@1f {
 			compatible = "mediatek,mt7530";
-			reg = <0>;
+			reg = <0x1f>;
 			mediatek,mcm;
 			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
 			reset-names = "mcm";
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index a5800a524302..94174cb2b7e1 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -188,9 +188,9 @@ mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7530";
-			reg = <0>;
+			reg = <0x1f>;
 			reset-gpios = <&pio 33 0>;
 			core-supply = <&mt6323_vpa_reg>;
 			io-supply = <&mt6323_vemc3v3_reg>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 2a869a6476eb..7c3298a92887 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -183,9 +183,9 @@ phy5: ethernet-phy@5 {
 			phy-mode = "rgmii-rxid";
 		};
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7530";
-			reg = <0>;
+			reg = <0x1f>;
 			reset-gpios = <&pio 33 0>;
 			core-supply = <&mt6323_vpa_reg>;
 			io-supply = <&mt6323_vemc3v3_reg>;
-- 
2.37.2


