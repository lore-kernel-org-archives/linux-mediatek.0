Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE7C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I+hNJ8egec9o+uP0G1/CTu9rHJU9k9FNHziIoURmA8I=; b=qFbF/4Q3mUKpNO9UZpz+dubHL+
	Pg+ub4zg5uNeZdLLTfStbMGDF5DEPe/lyQ0KaB8Sm7KfLlTcA6aGv0FvTXYnUneXcWUPjoaVZRAKI
	8JzCXRQsQI8Bsakn/Yj14bGRyqo3z4XQhndcDWJw6EkyQuxMYJMyDq6mS5CMhxiyArmb8ke27flnO
	E81ch1LFKx7ECzHvt8mFacGV/pzsH9uwyT84TgAxejcSF4JefeCc5Dhl7rkbXuYto6ovc4Ipm44ZH
	kIKj5DzxovmKIamTxegeauxspQvk5+ALCohM6MN9WNjt0m3/Z5GUjUsLacEtVNFFhornD8WMt9HiT
	L6LL9+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCI4c-000000041nO-24q3;
	Wed, 29 May 2024 12:06:30 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCI4Y-000000041kN-1bJJ
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 12:06:28 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by michel.telenet-ops.be with bizsmtp
	id V06J2C00H3VPV9V0606JRr; Wed, 29 May 2024 14:06:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCI3T-00GbKO-SF;
	Wed, 29 May 2024 14:06:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCI4Q-009XF6-73;
	Wed, 29 May 2024 14:06:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend v3] arm64: dts: mediatek: mt7986a: bpi-r3: Convert to sugar syntax
Date: Wed, 29 May 2024 14:06:14 +0200
Message-Id: <2fd900a30b5a0f7de4ea68f60bac250794b8cdb4.1716984213.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_050626_588575_846E2CAE 
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

Overlay syntactic sugar for generating target-path fragments is
supported by the version of dtc supplied with the kernel since commit
50aafd60898a8b3e ("scripts/dtc: Update to upstream version
v1.4.6-21-g84e414b0b5bc").  Hence convert the Bananapi R3 overlay
devicetree source files to sugar syntax, improving readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No changes in generated dtbo.

v3:
  - Fix SoC part number,

v2:
  - Rebase on top of commit e630c7b0b6a69f66 ("arm64: dts: mediatek:
    replace underscores in node names") in next-20240215 and later.
---
 .../mt7986a-bananapi-bpi-r3-emmc.dtso         | 28 +++---
 .../mt7986a-bananapi-bpi-r3-nand.dtso         | 74 ++++++++-------
 .../mediatek/mt7986a-bananapi-bpi-r3-nor.dtso | 90 +++++++++----------
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dtso  | 16 ++--
 4 files changed, 98 insertions(+), 110 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
index 779dc6782bb1986f..047a8388811eb9c0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
@@ -9,21 +9,17 @@
 
 / {
 	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
-
-	fragment@0 {
-		target-path = "/soc/mmc@11230000";
-		__overlay__ {
-			bus-width = <8>;
-			max-frequency = <200000000>;
-			cap-mmc-highspeed;
-			mmc-hs200-1_8v;
-			mmc-hs400-1_8v;
-			hs400-ds-delay = <0x14014>;
-			non-removable;
-			no-sd;
-			no-sdio;
-			status = "okay";
-		};
-	};
 };
 
+&{/soc/mmc@11230000} {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	hs400-ds-delay = <0x14014>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
index 7b97c5c91bd0264d..24398f8a7da4345c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
@@ -9,46 +9,44 @@
 
 / {
 	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
+};
+
+&{/soc/spi@1100a000} {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		spi-tx-buswidth = <4>;
+		spi-rx-buswidth = <4>;
 
-	fragment@0 {
-		target-path = "/soc/spi@1100a000";
-		__overlay__ {
+		partitions {
+			compatible = "fixed-partitions";
 			#address-cells = <1>;
-			#size-cells = <0>;
-			spi_nand: flash@0 {
-				compatible = "spi-nand";
-				reg = <0>;
-				spi-max-frequency = <10000000>;
-				spi-tx-buswidth = <4>;
-				spi-rx-buswidth = <4>;
-
-				partitions {
-					compatible = "fixed-partitions";
-					#address-cells = <1>;
-					#size-cells = <1>;
-
-					partition@0 {
-						label = "bl2";
-						reg = <0x0 0x100000>;
-						read-only;
-					};
-
-					partition@100000 {
-						label = "reserved";
-						reg = <0x100000 0x280000>;
-					};
-
-					partition@380000 {
-						label = "fip";
-						reg = <0x380000 0x200000>;
-						read-only;
-					};
-
-					partition@580000 {
-						label = "ubi";
-						reg = <0x580000 0x7a80000>;
-					};
-				};
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2";
+				reg = <0x0 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "reserved";
+				reg = <0x100000 0x280000>;
+			};
+
+			partition@380000 {
+				label = "fip";
+				reg = <0x380000 0x200000>;
+				read-only;
+			};
+
+			partition@580000 {
+				label = "ubi";
+				reg = <0x580000 0x7a80000>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
index e48881be4ed60c98..6a0d529b54aca5bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
@@ -9,54 +9,52 @@
 
 / {
 	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
+};
+
+&{/soc/spi@1100a000} {
+	#address-cells = <1>;
+	#size-cells = <0>;
 
-	fragment@0 {
-		target-path = "/soc/spi@1100a000";
-		__overlay__ {
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
 			#address-cells = <1>;
-			#size-cells = <0>;
-			flash@0 {
-				compatible = "jedec,spi-nor";
-				reg = <0>;
-				spi-max-frequency = <10000000>;
-
-				partitions {
-					compatible = "fixed-partitions";
-					#address-cells = <1>;
-					#size-cells = <1>;
-
-					partition@0 {
-						label = "bl2";
-						reg = <0x0 0x40000>;
-						read-only;
-					};
-
-					partition@40000 {
-						label = "u-boot-env";
-						reg = <0x40000 0x40000>;
-					};
-
-					partition@80000 {
-						label = "reserved2";
-						reg = <0x80000 0x80000>;
-					};
-
-					partition@100000 {
-						label = "fip";
-						reg = <0x100000 0x80000>;
-						read-only;
-					};
-
-					partition@180000 {
-						label = "recovery";
-						reg = <0x180000 0xa80000>;
-					};
-
-					partition@c00000 {
-						label = "fit";
-						reg = <0xc00000 0x1400000>;
-					};
-				};
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2";
+				reg = <0x0 0x40000>;
+				read-only;
+			};
+
+			partition@40000 {
+				label = "u-boot-env";
+				reg = <0x40000 0x40000>;
+			};
+
+			partition@80000 {
+				label = "reserved2";
+				reg = <0x80000 0x80000>;
+			};
+
+			partition@100000 {
+				label = "fip";
+				reg = <0x100000 0x80000>;
+				read-only;
+			};
+
+			partition@180000 {
+				label = "recovery";
+				reg = <0x180000 0xa80000>;
+			};
+
+			partition@c00000 {
+				label = "fit";
+				reg = <0xc00000 0x1400000>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
index f623bce075ce6ea4..d9e01967acc471b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
@@ -9,15 +9,11 @@
 
 / {
 	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
-
-	fragment@0 {
-		target-path = "/soc/mmc@11230000";
-		__overlay__ {
-			bus-width = <4>;
-			max-frequency = <52000000>;
-			cap-sd-highspeed;
-			status = "okay";
-		};
-	};
 };
 
+&{/soc/mmc@11230000} {
+	bus-width = <4>;
+	max-frequency = <52000000>;
+	cap-sd-highspeed;
+	status = "okay";
+};
-- 
2.34.1


