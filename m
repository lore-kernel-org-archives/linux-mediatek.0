Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121B2C5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fu6H5/1Zk4E3jrGYDkZq3cMNTeE/AJhwTKas1rB5Nzg=; b=YnQekMRx6Xy2gbyIO/do3X5V1R
	UPgryBeby8UvKRkCHKlvUiIePdnnry+mnYBXsmmZsNcfYP/DQ2bCZiFzEWL1CX6iZnZJDSDVfqtnt
	7Gn1MVYJb9xDjAwICNTIkVnhT5c+N5E+DxB32JCY6xdSGpX8efDh+tjluj1pTAWjxvwETjh/6Uc5x
	FaXMcmchWbO0ouTz/J1U07VsMEyFvO8HAsGbYPeb4vLNXVg4yfZsc9a5IaIrXud2Kc+VnZY0iYzZr
	daehfZPjf1/9QoEBSZQsizf4Lm2E9B4Q7+/DzmHRWO87W7iuNkpii/M2KEx/7WCznvUFufq50ZbFB
	xB5p0nGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkk4g-0000000EDPV-2ah0;
	Thu, 14 Mar 2024 12:20:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkk4Y-0000000EDLH-3p7s;
	Thu, 14 Mar 2024 12:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C21026163E;
	Thu, 14 Mar 2024 12:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68B0AC433F1;
	Thu, 14 Mar 2024 12:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710418833;
	bh=IXwjfXG0qJTi6SvXy2YJc8p2iUQs4kEjF2r+M9G6w38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ilWTQOqJCS0XZl06YmEiYlkl0uVFfItkJRPuN48+KseuhrBHloWj+8uvs2g3sch9N
	 zARb4qqxkcwwlkGtAmbfPr9KblhESLYIFhEgD7ZXQlQr5r6ig2qIlDAMt8yUO/8GXS
	 bSt5IGnSsDvJXQMWi1EIg3lTNXbTAnVxO5fUHmD0w/DaLxppbYvvQ9XEKmbLrMqkgG
	 xX4ntIwCzCiZKzhnv6EXtK1C86W2YOtsncAmDEfMKq70fVya6+XxwIBeQPTmP6dGfU
	 9bhfpFLOSKiGcbddJalArV0WRqWRM8zsRRJdK7UUjr3mSm0j05D2+GQlrCJS1UTlFA
	 Jdnn9QOrHhfQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8B0C54E67;
	Thu, 14 Mar 2024 12:20:33 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Thu, 14 Mar 2024 15:20:04 +0300
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7622: set PHY address of
 MT7531 switch to 0x1f
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com>
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
In-Reply-To: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710418818; l=1766;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=MsMYU0TxWWTBU66KZyBJipAujGDLpPEL4caKiInP0uA=;
 b=bE8w4jzb7bYQAt6bDoKuVeYIQ298ZArPNyXnvaNKtmYEAdgOepcrRbnjuiqj8FRr3Uk/rrmyL
 geOZd1Sbuj9A8Ea0iWmdUuG4z5fEyLd8BsvREEhr7/BDP1N9ij0SF5X
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_052035_144184_660ECCAE 
X-CRM114-Status: GOOD (  12.45  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The MT7531 switch listens on PHY address 0x1f on an MDIO bus. I've got two
findings that support this. There's no bootstrapping option to change the
PHY address of the switch. The Linux driver hardcodes 0x1f as the PHY
address of the switch. So the reg property on the device tree is currently
ignored by the Linux driver.

Therefore, describe the correct PHY address on boards that have this
switch.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 224bb289660c..811b227d6f50 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -149,9 +149,9 @@ mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7531";
-			reg = <0>;
+			reg = <0x1f>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupts-extended = <&pio 53 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 41629769bdc8..3c2423cb38fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -134,9 +134,9 @@ mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7531";
-			reg = <0>;
+			reg = <0x1f>;
 			reset-gpios = <&pio 54 0>;
 
 			ports {

-- 
2.40.1


