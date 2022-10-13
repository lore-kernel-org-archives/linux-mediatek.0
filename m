Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1624C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov420NLpC0YD+Qsl19uGAo67aWaxWZx+qIQbqcUwkiQ=; b=vUUOXPjBhEU0fxo+wxgQHDOmUb
	lmDTMochUa7WCbxGePPAVB7gL3R6AiS6uLtE/JoFqXrdR9KCXzlXdW0IdmMMI4rzwfCbrCF2DK9Ep
	MwhPNLlKIHpNd0xs0eGKSj7Nh4ZUwFDOIOgT+ozf4Ib5DKv4x1v37EOOhhh3cm36z0cyp4CdoqoUw
	ageXSltlxc2m8KndlqOXKMVxKP257/Jdwft9QX+qsb3m/AGwuLYygM3u0HIGEcTUSjir9xU6+foUX
	QYVsjYQb7EdWijwc052MoaSlGJC6ZTPeKwH9gpAjQ48KweVPRF8daExy2J0gq0U7iqOvjWcVyj1Dl
	4vRh2LEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj058-00CGvw-7o; Thu, 13 Oct 2022 15:25:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02V-00CFcl-5y; Thu, 13 Oct 2022 15:22:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA99A6602370;
	Thu, 13 Oct 2022 16:22:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674545;
	bh=OIVvm9eZZnDpMulbdkAjAXAZiIM5QtEjlxZKqlbUhN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnNC2aRr1CuewZByFW/jeStIoRR+cQKvdAc1e4Nr2itAlV18cP5mtMa9/jxqaXSCk
	 sgucXlPqmUQ47m2fAIT7AQdgdzJBYjEhSb6x2GSRHfIAT8lqfkvfvOWpWWnqNbOX5R
	 HLnmKQp34796JcP+uEprJMy9hi1xfJ7XAxHvejEe38Azb+Dy3I337s0zFX+7Cx7bQ5
	 Vjoa+sBjwjdt3ceInjCKF7zVfYwrKY4sokMPBiWCfs10FIMwfxtOX3P/wTsQNaa1ou
	 hx84eKrCmDIiZq4AiXSoZGCiEsU/VhmpBDvsJpqFuIQGLm/DnMboJA9tC+valF/VmF
	 7Y+up0VvDk0rg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sam.shih@mediatek.com,
	hanks.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	zhiyong.tao@mediatek.com,
	andrew-sh.cheng@mediatek.com,
	viresh.kumar@linaro.org,
	chunfeng.yun@mediatek.com,
	fparent@baylibre.com,
	mars.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/8] arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
Date: Thu, 13 Oct 2022 17:22:10 +0200
Message-Id: <20221013152212.416661-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082227_480578_5EBEFFEC 
X-CRM114-Status: UNSURE (   8.37  )
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

Update the names to regulator-usb-p{0-3}-vbus to fix unit_address_vs_reg
warnings for those.

Fixes: 1724f4cc5133 ("arm64: dts: Add USB3 related nodes for MT2712")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index 638908773706..d31a194124c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -50,7 +50,7 @@ extcon_usb1: extcon_iddig1 {
 		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
 	};
 
-	usb_p0_vbus: regulator@2 {
+	usb_p0_vbus: regulator-usb-p0-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "p0_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -59,7 +59,7 @@ usb_p0_vbus: regulator@2 {
 		enable-active-high;
 	};
 
-	usb_p1_vbus: regulator@3 {
+	usb_p1_vbus: regulator-usb-p1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "p1_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -68,7 +68,7 @@ usb_p1_vbus: regulator@3 {
 		enable-active-high;
 	};
 
-	usb_p2_vbus: regulator@4 {
+	usb_p2_vbus: regulator-usb-p2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "p2_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -77,7 +77,7 @@ usb_p2_vbus: regulator@4 {
 		enable-active-high;
 	};
 
-	usb_p3_vbus: regulator@5 {
+	usb_p3_vbus: regulator-usb-p3-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "p3_vbus";
 		regulator-min-microvolt = <5000000>;
-- 
2.37.2


