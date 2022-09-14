Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28290ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYuadvYwRoufJELqxg3IBnXQhwEEDyuwwHMx2BKxeC4=; b=o9HKxOOCBoCf+vBwp6zS8OSc43
	Sc6GMtBbXhkNGgc1iGipL0a/gBqbCe/Oe8kU7mD5uI9vXd85RUXiDdKjwi2Cg4tpTxeBEMieUtIXI
	RBwWyecLzwNz3io2DGmNK9X9wdKAKQneIRhAILWQ5uoFM7uOV9Y8nCEEm8EQCLR9UTgFzYqTfEqzW
	Gfxz9dQ2Siw2ktY00dpKBd0o84cVjRzfsbQuJHQyZV4jfOaLAX+WtFLUv+kHtOoZV7sFT+wCT6IXz
	EkE3uT5IBZaitimg+xXoFEPw+VtgarM5V/sYykaonXW7+4KJtnsGUWYzCZBZWazptvw7HQzERVdI1
	g49oDUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOXb-00E5Vu-N9; Wed, 14 Sep 2022 09:18:43 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOBz-00DlIv-IT; Wed, 14 Sep 2022 08:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nZqifLZ/aXwKwsRNtbTiOD0tRfbk/Jo2ZiU+Ara/YqJ+GtgHiTANuipj4valKISwtuFoObgJxnvDST9IastTACE8w6j1ItD9TcpsCccIhYw3ozBCI/NI31y3uYmWLrIFBB8TefS2l25FXX/iiyd5JOgnp6AJEneVoUrajoqQ3OE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145761; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=OYuadvYwRoufJELqxg3IBnXQhwEEDyuwwHMx2BKxeC4=; 
	b=CS2h+QmHaYqWaBTeWLeMsIShjn3h0TKJ2RnK79J2WkMVGuyw5NQOFxbQcsHjnYx+er73fwBgW/4n/cRTxvUOj8KtruApup9l1GL66RZ8p2Yi+yrJkCgOaSNkxnHttgwwaBN/fUaNyjyxGpGKhXa+gPbmbthba55dPb8nDvny8KM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145761;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=OYuadvYwRoufJELqxg3IBnXQhwEEDyuwwHMx2BKxeC4=;
	b=OMlMOcK9l+h0geJ+/xhKCHDTFQU2x8tACsSPg/voz8Aq9/9JjDK9KRFH32MzLzrs
	LI1f4ljxr5eFofm3e86RPKrskYI0Qzg6hMl4JFlg4RxajtRdGTX8vYJcR+qZ8AgAISw
	IylcbphHclwU1aWTPrDcpXGlkFVCw4RRGYEtwE0Q=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663145759484287.7612353661906; Wed, 14 Sep 2022 01:55:59 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Petr Louda <petr.louda@outlook.cz>
Subject: [PATCH 10/10] mips: dts: ralink: mt7621: add GB-PC2 LEDs
Date: Wed, 14 Sep 2022 11:54:51 +0300
Message-Id: <20220914085451.11723-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914085451.11723-1-arinc.unal@arinc9.com>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015623_703001_E9E924E2 
X-CRM114-Status: GOOD (  11.44  )
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

Add the missing LEDs for GB-PC2. The ethblack-green, ethblue-green, power
and system LEDs weren't added previously, because they don't exist on the
device schematics. Tests on a GB-PC2 by me and Petr proved otherwise.

The i2c bus cannot be used on GB-PC2 as its pins are wired to LEDs instead,
and GB-PC1 does not use it. Therefore, do not enable it on both devices.

Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC2_V1.1_schematic.pdf
Tested-by: Petr Louda <petr.louda@outlook.cz>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  6 ---
 .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  | 42 ++++++++++++++++---
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 6ecb8165efe8..0128bd8fa7ed 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -20,12 +20,6 @@ chosen {
 		bootargs = "console=ttyS0,57600";
 	};
 
-	palmbus: palmbus@1e000000 {
-		i2c@900 {
-			status = "okay";
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index 5f52193a4c37..7515555388ae 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -20,12 +20,6 @@ chosen {
 		bootargs = "console=ttyS0,57600";
 	};
 
-	palmbus: palmbus@1e000000 {
-		i2c@900 {
-			status = "okay";
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -35,6 +29,42 @@ key-reset {
 			linux,code = <KEY_RESTART>;
 		};
 	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		ethblack-green {
+			label = "green:ethblack";
+			gpios = <&gpio 3 GPIO_ACTIVE_LOW>;
+		};
+
+		ethblue-green {
+			label = "green:ethblue";
+			gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+		};
+
+		ethyellow-green {
+			label = "green:ethyellow";
+			gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
+		};
+
+		ethyellow-orange {
+			label = "orange:ethyellow";
+			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			label = "green:power";
+			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		system {
+			label = "green:system";
+			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "disk-activity";
+		};
+	};
 };
 
 &mmc {
-- 
2.34.1


