Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A227CFA446
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=; b=0fQ2X/15+e4TOLs3nRqCdRCYm0
	HAKBzcML8XR4qQbqoYkbEBr5A612IrrdYWOUCaO3EvNeSHHDWrXgjkFUBteHNcEglvMwhRilCN6hV
	8ti6nCIWSTlOkgN24l8c3e5pRv7dA99IPRCQKk4suYIyTE9u+FKBZBi6xUB4Q9yWs6mE0C3D6tn+O
	FR46KCKjpT+Dsu/w+8S8G0vx1Be4Pl9QMZQ8/oWFeHrHuiv7fPuEttdXb6LUbPSjDVB7lbGTWeblq
	rf8n1u3kwRD51/Z/mQAT04lOJCHfOUzs+soJl5vD7R8M6Yis+a6pqdKsHcBZVhRmcoXznXPW2Yzw+
	e+uY81YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMT-00000007TZT-48Z0;
	Thu, 20 Nov 2025 21:38:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMQ-00000007TWS-203o
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 21:38:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so1565089a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 13:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763674718; x=1764279518; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=dC4B3ecuYEAVhvsMnnKBxzUp4LBfuvO9BCOVbpKqzP8esaZt/AkcOohuIKiM3cOSS5
         m3Z/Mj0Q8exKhTj+PVrd+yeUMlCMxR1LoaBiii+xCd7cFGxrNuoqlgP83GPiL8ZsDFEa
         3SErqFwM0MPIi7Hi6Fr/Xuxx6ijbuIRKaTke9aZzglQNP+e7RerKLoP8NAM16fXVPf0C
         97aaNjQw9NWajFBarDzZLrpUGECy6U5S81K1BPCjGtGqXocDCG+U7WCA6KMpI1n6Yqu4
         QCrq/Lz+zqy0Q68rptLHnKpoTB7ppbj1/rGaO15vnynHwl14VD8ceB5yn8y2+Wv8cNIM
         n24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763674718; x=1764279518;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=YB5ZblOZcd8ws0SaMBlJz2pG7oXgC0DzwAeJcxxyAQLaeg47CqMLvL1bSSoic8vAvD
         mVHllIgl0vFpsQK9V0O+xjbQj6imK4oP9hNp2h8q4BEjlGnChFaJ+xXilHlIDXb68k5F
         4fjZfAvnrEuOWZZ2NVXCewomAMLwM8VWo2nixznj0cSXkOrR2pxSFHLSLI+Kz5/N+8Rj
         B/9neN+Zu+TEvErg6qSnu0UMOWFaKD4TYBNlO5m5MmnJ/y19H0CiEnoHlE/G5pt9gk5H
         mDcw+sl47CDksRcW0u4dymynIYA8hOQfnsqPMcjG68j91lWNrj2i5m6fkU5SRnZroVtS
         YEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeCHj2R77Z/HcnSlMfCfUjg8I9hqn901BajAQhuC13SYzxq9xS5bkWIGelOd2E0OJsL+XqE0nCH5GSYZnV+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXNTZs7Xda5NSLUW+KDpm1pmq0baq/RgxCFgeIBYUPe/evi1i
	ztJk6lsR8/iMRMlEdgSo/2BAqX820LpGit2ih6upGpRRNI0OBZ4e0w+a
X-Gm-Gg: ASbGnct2muGvG4eawnflw1VpT8ZOFe45oM3rQdIGkPfYMqpSaTi6zHxMYGJ5OLXsEPa
	z/Na+BDKZGqb091bSGRqxTp2J0wOO9FXrw2wbPqay6iKQlMZfGu5qqnbOmRIRJ1/BME3y9Af5mJ
	F4fIHDexNHt0xgSUVloH+9tnWHAjuhAoWmYa0N/7Sd4EA00P4rqOCYbn0qqmm/R0To6a/2QqYVM
	4idRv6j/mEt1cg+8rffeQGtscNzWlP5zVEhFATt0QlAExcyL9urOq5we7079w3r+q19YZURceAp
	pwyYdbUPDa1cSzXEOEk2/YEBYKuZ7FOi4m9kjIspSJZG3Cex5m2g3coixMiGBDGHZeCPSE/V9Hh
	NJE3fzyDBu6LILawgKTINYHE2hDPvpx67WmmMzZ94jigxyFyjJ+xxWGceD5GNnLQXWcbmO5Zolg
	gCiKz4y9XIGmPYsra9
X-Google-Smtp-Source: AGHT+IGMJrKF9L1itrJx5jS2bFV3lpyInnC8nIidIwze7pM5BA5o2s2GqhwLJOqjTqB9hc+kWslwdw==
X-Received: by 2002:a17:90b:5251:b0:340:bc90:d9ad with SMTP id 98e67ed59e1d1-34727be88f5mr4852259a91.10.1763674717587;
        Thu, 20 Nov 2025 13:38:37 -0800 (PST)
Received: from SC-GAME.lan ([104.28.206.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d6f48bsm3325479a91.17.2025.11.20.13.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:38:36 -0800 (PST)
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
Subject: [PATCH v2 1/2] ARM64: dts: mediatek: fix MT7531 reset GPIO polarity on multiple boards
Date: Fri, 21 Nov 2025 05:38:04 +0800
Message-Id: <20251120213805.4135-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_133838_528202_03CB85C7 
X-CRM114-Status: GOOD (  12.78  )
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


