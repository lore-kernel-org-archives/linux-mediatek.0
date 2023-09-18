Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B05C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4o9b0EdEagI/FVxfPGBCEgC2OjH+6DvLWQZYPHDD6DU=; b=n02ZUHctkMBV4mDfBmeNXyBdZD
	bndU781Jg1fUGZx4zhdKx1nnvfignXlzya6KQp5YEliqFyhC7Ph3AYPMgzsWw+T/srpWVaHqSlikG
	BemNg3vLtGDAJi/lHMJP/rqYSyzD6GhU+4qNHOFBDYy7JhZex3cyUz/q5m+YGT1VuYFkfXUID9P8d
	I/A2s1QJx2lv/KDqivVIUB4yn3ulJYTh3R8WLVc2B5P6J2MK5kKJsF9kdYfQhFmaq7XbZQvpO3y+s
	hmRaIyORIbxaefneDdm377wFP3kL/sabgqu/ukLEkY93kcwlTgcFJq/2HuBNOsJ/jzZaanhTT8i0I
	IXvjlfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8uk-00ElWL-2N;
	Mon, 18 Sep 2023 07:43:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8ue-00ElU4-1B;
	Mon, 18 Sep 2023 07:43:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90B2624000D;
	Mon, 18 Sep 2023 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695022997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4o9b0EdEagI/FVxfPGBCEgC2OjH+6DvLWQZYPHDD6DU=;
	b=UXqvSR9xSpiieP1etH1Vyl2cSN/ENa0irafGLBjjr8QSsr1PCkGhBMiU19eEQsmi7wjGlS
	JSrBrFRbzCmWrMaDy4xQTUlu3HRYtpwxStzFt5QMYzy3Cgk0jsthfGcxsfEH6kbXCzkKED
	DLtadljofsB8byIw7Ckm3wr8e5HSVSGZ/g0mvnqawmsXO/qGOFhQldKwQ++yAVsA/1PNBU
	Na8JGAVAQ15ySbgTuWyDPqv0M2tNjtlXkCPaWgo5VM73rw/MFxpy0ga/jXzOUo0LNoBXDR
	6SkQ5Esi68A82g2pQCH0pgdUVgS/Mjq5M8oBEZqc0iK2R9w5e1foPk6merh1GQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	David Heidelberg <david@ixit.cz>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alex Riabchenko <d3adme4t@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: replace Bananapi with Banana Pi
Date: Mon, 18 Sep 2023 10:43:01 +0300
Message-Id: <20230918074301.74528-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_004320_538131_1C341E7E 
X-CRM114-Status: UNSURE (   9.61  )
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

The brand name is Banana Pi. Replace any mention of Bananapi with Banana
Pi.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index f2cc95d4a343..6b4e39c600af 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -14,7 +14,7 @@
 #include "mt6380.dtsi"
 
 / {
-	model = "Bananapi BPI-R64";
+	model = "Banana Pi BPI-R64";
 	chassis-type = "embedded";
 	compatible = "bananapi,bpi-r64", "mediatek,mt7622";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index af4a4309bda4..d739eb0c7e56 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -15,7 +15,7 @@
 #include "mt7986a.dtsi"
 
 / {
-	model = "Bananapi BPI-R3";
+	model = "Banana Pi BPI-R3";
 	chassis-type = "embedded";
 	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index f9127ddfbb7d..a74db03a8698 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -12,7 +12,7 @@
 #include "rk3568.dtsi"
 
 / {
-	model = "Bananapi-R2 Pro (RK3568) DDR4 Board";
+	model = "Banana Pi BPI-R2 Pro (RK3568) DDR4 Board";
 	compatible = "rockchip,rk3568-bpi-r2pro", "rockchip,rk3568";
 
 	aliases {
-- 
2.39.2


