Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778DCD1296
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwMVX8nXGR7G4+mZdwTLKL5GcVQpmgj1c5em2QOYGBc=; b=kNpabpEi4Uu9FrnHqFCmxE6tqM
	GYUWzgRPdUSpUhsJq0e7YBcfviQYKRMhQ/KunXs12vikyc/HS/zyk+rsE1OHc6ss5mLFWyZwQ5R1d
	I89hs6exOEw28JJZ0BN5+4mg4hPFFs/Yum8o0hEN9ORa8Oc9NCvOXxNqynYL8NuaPpNG3u3qwe4Go
	ywPvWlJDWbQbOXB7S11et6/kOuvVwPGoQu9I3wDDE0JcAeTh21gEkW8jnPWBRABHjqY7aLZL2jK/6
	gCxIfEcFdRcQ7u5fRuMjZ3O3os19cHVEu0cmBzoKUi0LczSaDqs05Z2JNCeU+rNDGz+IPAG4zLTwo
	m2dO4pdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9s9-00000001koR-3Kl1;
	Tue, 09 Apr 2024 11:42:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9rv-00000001ket-43VT;
	Tue, 09 Apr 2024 11:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662946;
	bh=v4vUCuSjUww6FJAfXwVkRyRenCihx6Rkh72bQi4n8MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h15vBCMvFNJEepnXxpT1jZtNp37p8f03FkdXhLd6AzvvZzYAyBdNIQe0ud6IUbmO0
	 4b8wLG80kk1IO6NjPAPdt+zDxDJjUJwyFExAjOndiHRuvqUoTgZbUinholQ6qOREcP
	 A+jcnFPaC9ybm48SJI0490KddvghK4WSXzl6yfveRumMB+bwqrY9QCL2kTTswpW6WY
	 OcUFE44wOpTEAay1FNyiIrpgvLA7YmrxD7UFM/QS+njM1IRuqc7NvIt4ZgGK7TuPcl
	 henBVapu+v0hMtt/owY6KG70Ws24yHsvLw3ReFrBJhBbLU+xlrW8TJ1CuRXXv87vjf
	 M6R8dzWKUYntw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4F2837820F8;
	Tue,  9 Apr 2024 11:42:25 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8395-nio-12l: Fix MT6360 regulator nodes names
Date: Tue,  9 Apr 2024 13:42:07 +0200
Message-ID: <20240409114211.310462-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044228_153001_48B9B580 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

The regulators' node names for mt6360-regulator are supposed to be
uppercase. Also, drop "-regulator" from the usb-otg-vbus node name
to make all vregs to probe correctly.

The alternative would've been to use regulator-compatible, but that's
a deprecated property.
Now all regulators are probing fine.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index e5d9b671a405..18182cf073fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -216,7 +216,7 @@ charger {
 			compatible = "mediatek,mt6360-chg";
 			richtek,vinovp-microvolt = <14500000>;
 
-			otg_vbus_regulator: usb-otg-vbus-regulator {
+			otg_vbus_regulator: usb-otg-vbus {
 				regulator-name = "usb-otg-vbus";
 				regulator-min-microvolt = <4425000>;
 				regulator-max-microvolt = <5825000>;
@@ -228,7 +228,7 @@ regulator {
 			LDO_VIN1-supply = <&vsys_buck>;
 			LDO_VIN3-supply = <&mt6360_buck2>;
 
-			mt6360_buck1: buck1 {
+			mt6360_buck1: BUCK1 {
 				regulator-name = "emi_vdd2";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1300000>;
@@ -238,7 +238,7 @@ MT6360_OPMODE_LP
 				regulator-always-on;
 			};
 
-			mt6360_buck2: buck2 {
+			mt6360_buck2: BUCK2 {
 				regulator-name = "emi_vddq";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1300000>;
@@ -248,7 +248,7 @@ MT6360_OPMODE_LP
 				regulator-always-on;
 			};
 
-			mt6360_ldo1: ldo1 {
+			mt6360_ldo1: LDO1 {
 				regulator-name = "ext_lcd_3v3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -257,7 +257,7 @@ mt6360_ldo1: ldo1 {
 				regulator-always-on;
 			};
 
-			mt6360_ldo2: ldo2 {
+			mt6360_ldo2: LDO2 {
 				regulator-name = "panel1_p1v8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -265,7 +265,7 @@ mt6360_ldo2: ldo2 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo3: ldo3 {
+			mt6360_ldo3: LDO3 {
 				regulator-name = "vmc_pmu";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3600000>;
@@ -273,7 +273,7 @@ mt6360_ldo3: ldo3 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo5: ldo5 {
+			mt6360_ldo5: LDO5 {
 				regulator-name = "vmch_pmu";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -282,7 +282,7 @@ mt6360_ldo5: ldo5 {
 				regulator-always-on;
 			};
 
-			mt6360_ldo6: ldo6 {
+			mt6360_ldo6: LDO6 {
 				regulator-name = "mt6360_ldo6"; /* Test point */
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2100000>;
@@ -290,7 +290,7 @@ mt6360_ldo6: ldo6 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo7: ldo7 {
+			mt6360_ldo7: LDO7 {
 				regulator-name = "emi_vmddr_en";
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2100000>;
-- 
2.44.0


