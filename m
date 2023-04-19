Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51843C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kx4ScIwodZZdp5YVes34mvncFAPh7iF0I6vBg8NkTqs=; b=YuxNMjAogY2TMuddfcADe8ohMF
	mbr67js8y+dCX/1J3cljTTA4ms+1PcAetni+9fetev7oyIZokiMEOLDw/ePU6Bn86JW3QJmDdKDKA
	EZcg9r3Vy/qF/en0E2ex4AVIH2UQVoiTBjAmHfpMc2yzTyqwVVCtru2AmJQNMSXLsIg3QVPIxP04I
	CRy7dPDKfgVtdtS8inrkwtLlyann81yk0AckZgQ5N5xjU8bRTpaJm+KzEkYy7RdzJPFkmHGGY8cbz
	cO5mxY2c72Pl3a35ku8QTL32FWWgcRZQQWrHpEU0Fh01rlS1Hqgz2BXLqtFzq9oSwRAJJ5LvgAE0R
	roOwUgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDHg-006EV7-2G;
	Wed, 19 Apr 2023 19:16:04 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDHd-006EUf-3D;
	Wed, 19 Apr 2023 19:16:03 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppDHa-0003rR-2a;
	Wed, 19 Apr 2023 21:15:58 +0200
Date: Wed, 19 Apr 2023 20:15:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] arm64: dts: mt7622: declare SPI-NAND present on BPI-R64
Message-ID: <ZEA96dmaXqTpk8u8@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_121602_056458_45B71493 
X-CRM114-Status: GOOD (  12.24  )
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

The SPI-NOR node in the device tree of the BananaPi R64 has most likely
been copied from the reference board's device tree even though the R64
comes with an SPI-NAND chip rather than SPI-NOR.

Setup the Serial NAND Flash Interface (SNFI) controller, enable
hardware BCH error detection and correction engine and add the SPI-NAND
chip including basic partitions,

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 39 ++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index af3fe61e40938..d583e816684cf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -248,14 +248,42 @@ &nandc {
 	status = "disabled";
 };
 
-&nor_flash {
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi_nor_pins>;
-	status = "disabled";
+&bch {
+	status = "okay";
+};
 
+&snfi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&serial_nand_pins>;
+	status = "okay";
 	flash@0 {
-		compatible = "jedec,spi-nor";
+		compatible = "spi-nand";
 		reg = <0>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		nand-ecc-engine = <&snfi>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2";
+				reg = <0x0 0x80000>;
+				read-only;
+			};
+
+			partition@80000 {
+				label = "fip";
+				reg = <0x80000 0x200000>;
+				read-only;
+			};
+
+			ubi: partition@280000 {
+				label = "ubi";
+				reg = <0x280000 0x7d80000>;
+			};
+		};
 	};
 };
 

base-commit: 13961ef828cbc254cc272221b7fc54851caa39a7
-- 
2.40.0


