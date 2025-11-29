Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CFBD116EA
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Nov 2025 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=; b=lOcXEO8NewgVrZADQibbn56GPQ
	QOASF9960MyV6erBcTEuMjeA8Dukez8BHKEYQXsLhql8dMQojLg4v+gr2zv1YEYgkeCWiKJhYRXrQ
	y6618orWqNa8j+DfKpVDRgysJlsUFZWf9rXSO2s80AsHUa2D/6EnIyBk8xHsErndj0BB4oQPMojSA
	BpVZXH9sG/wIn1yrTY55Mz9joy+aHq0L4n46XEHsg31Eo8u52CwEFUjsQEZffMBX8QFLlV22DJXvB
	ohUhLrGKMeYfKz+iuXNvuUdtukUGqqxaK0Sr0p4PrraOHReHD5TXBDsQBK7y/oj5KVF/6sbRTbshv
	ZEejxuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUe3-00000001sMK-1SUb;
	Sat, 29 Nov 2025 23:46:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUe0-00000001sLa-1YfM
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Nov 2025 23:46:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so2613433b3a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Nov 2025 15:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764459983; x=1765064783; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=b4/2Dv4djcFAn1+V/1AWo5FjhZ5VOjlnHFEZ7J9F8TXSAn4q6Jc7L3Et9AsWEyJO2h
         Lv95YdFQWV0/BbRmGrNuM78EdPdaz7wSRmqHC/Yl68TbwjhJswI0qwi1wJ+3KQ+mP8jL
         0ueWaHNXSfWs0FJlBzADk/7Pi+PS88bYTlctUXlidwKN8StnWmw2+UNUGWx2nwBrX5S0
         BhonbmgPM9W1F0UgZEFca8Jx7flvWt1KIu9qB9bP8ppxkcsw/EgJZBiPP2EzkIWssKgK
         BfLNl4WpHfbwlacHdU7p/dQQGfLV1LJiLZ5kEhe80Fq99aOIhR9PjZyx9wyKasK/T7Gy
         Dudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764459983; x=1765064783;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=bbQ/hyC6qX7RBbzd59ef5QAj6HTTyUEEqRWAW5gZhPgxTVZKLk2y/cwPoAHa+l9J52
         sMf3PD2guTomS/CizIYJi16fipYF84N52dgJVqb7PqLWXLrmz1CKgoCsT+vbAxjFqw+u
         O/FA3iAlyxYZ/2t7IhgTfMr7X0tUf/pXpertJJegtv/RZzz0aDewtB3G5u8LzBHQCPow
         ecqSFJiho3jis5WncK0PeHDKSNiZRYOZc1HpmH3bL5Qp4cOx5tF5LTTiOK3GfLq97omf
         CRW/gu60CJmK5btYfwVYd7CBlbalI9imKNXQNn2r/9iqgQ+ZgxbNCp4ezMFxSJTbNVBG
         VM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUaRSQMPj+BGYrTlcbmyJsC5gEe0/t8GTqYEOZ14co1bPjhsElLURrCUM47RvubcM62EfOCb86l9BVevmQ9FA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAg0Piu97gwoy9arnJ4BjH9mMTjA/ZiUDhHPXVn+Jr8vICf7I9
	R57Mg/1Z2HP9DiHpkow2m2DmJHPKv63i27OFrZwV1slPRTtYfMpDbp25jhnAtOI5yucfdQ==
X-Gm-Gg: ASbGncs/MZo3WJRITOEvLK3W9xjmMnx5ZqrJGve/ODUEkrDQqx8Qr9v5Q/jFi63PLQ+
	bUSr9iQaBqpIKQEwTNOssGD5SmY+wxpJKGRF7RMDzu202MAR5BoEVdXXrcXSz7IPI1d/vsRUx8I
	b9fWJrGcPJO6j01rDPYvAz5/2pYOs39lJTMgYSyzDMhIGUcrFbtECh4pKoK8bz0UFMFHGYoIxdD
	49kakMgAAz3X30EnOB7yWlckNOMF2wmj7uhYoR0b+eDhDAoUKZ3AQw+9BTZvCqMq5dFY/D757PB
	6wnQjMld9l3oO6Qew0ZxYfwgIjfOur8WiQ4awC9JVSMs5zCuqWL1EDAll3BivTqWwl5ab2xCFfL
	Xu/f0m+17JUa2HDdushiKMMxZUAJ1sdOyDzTf0eHRnhi08X0ztk0ES+uDwCVw9cMhpwJcVer4pw
	rCYN2Y11HSCPzuLwDK8grZispaDg==
X-Google-Smtp-Source: AGHT+IG1ssiyNwGsFp5F+wk0jylpdPRdZeUSnJ9+OhyOhmGPlt2Dzx5MOnNqeZxTuc6PCZk9MVCk1w==
X-Received: by 2002:a05:6a00:2389:b0:7aa:bd80:f4db with SMTP id d2e1a72fcca58-7ca8740ec4cmr18933879b3a.5.1764459982924;
        Sat, 29 Nov 2025 15:46:22 -0800 (PST)
Received: from SC-GAME.lan ([104.28.201.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fc08bd1sm8921049b3a.63.2025.11.29.15.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 15:46:22 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v3 1/2] ARM64: dts: mediatek: fix MT7531 reset GPIO polarity on multiple boards
Date: Sun, 30 Nov 2025 07:46:02 +0800
Message-Id: <20251129234603.2544-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_154624_421607_92B648E2 
X-CRM114-Status: GOOD (  12.75  )
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

The MT7531 reset pin is active-low, but several DTS files configured the
reset-gpios property without GPIO_ACTIVE_LOW. This causes the reset GPIO
to behave as active-high and prevents the switch from being properly reset.

Update all affected DTS files to correctly use GPIO_ACTIVE_LOW so that
the reset polarity matches the hardware design.

Boards fixed:
 - mt7622-bananapi-bpi-r64
 - mt7622-rfb1
 - mt7986a-bananapi-bpi-r3
 - mt7986a-rfb
 - mt7986b-rfb

Note: the previous DTS description used the wrong polarity but the
driver also assumed the opposite polarity, resulting in a matched pair
of bugs that worked together. Updating the DTS requires updating the
driver at the same time; old kernels will not reset the switch correctly
when used with this DTS.

Compatibility
-------------

Correcting the polarity creates intentional incompatibility:

 * New kernel + old DTS:
   The driver now expects active-low, but out-of-tree DTS still marks
   active-high, causing the reset sequence to invert.

 * Old kernel + new DTS:
   The old driver toggles reset assuming active-high, which now
   conflicts with the corrected active-low DTS.

This was unavoidable because the original DTS was factually wrong.
Out-of-tree DTS users must update their DTS together with the kernel.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 9f100b18a676..6f29ce828fdb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -155,7 +155,7 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupts-extended = <&pio 53 IRQ_TYPE_LEVEL_HIGH>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..6600f06ccebf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -137,7 +137,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <0>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index e7654dc9a1c9..8ec2ec78ee46 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -203,7 +203,7 @@
 		interrupt-parent = <&pio>;
 		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..958ce291336b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -87,7 +87,7 @@
 	switch: switch@0 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
-		reset-gpios = <&pio 5 0>;
+		reset-gpios = <&pio 5 1>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 58f77d932429..0780b5a36259 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -64,7 +64,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <31>;
-			reset-gpios = <&pio 5 0>;
+			reset-gpios = <&pio 5 1>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.17.1


