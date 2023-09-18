Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FDECD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ay9z8iCgn/QbbcXOHhzU2eHu2INYQIkvsbpXhE3QZ/c=; b=WMbLVZ4572H7eX
	8ZqhB3YGUfObhQjJq0lzDT54FjFsyLS05YWNLkPgUj4DiF4er4Wg6wS1HqFwoLhjQRTrpKzGxdoUH
	AvRhYVUT3ijQNvOeZWg9e15yVPsyNNAfQqhGg4ghd2XdRHGpoCkl0qDTTdQnRqDdLXxOQ061DRGnr
	ft7CrqColmhipaEKqg4E7xSWfFTkExahehu8eitrZ/v1CUK7Z1Xe6sxV32LMJMrM7V0gXnPgWDKbr
	4lviN2tysUbd2H32SHJBNavuDrMsQLPFL9QXHMufA8m3b1jnTrYAHGErP8zb5R8YZXkmihzY2FpGO
	u0bqLucTXHsVr3jp9XDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi911-00EmHB-2y;
	Mon, 18 Sep 2023 07:49:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi90y-00EmGJ-2H;
	Mon, 18 Sep 2023 07:49:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 604401BF203;
	Mon, 18 Sep 2023 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695023390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ay9z8iCgn/QbbcXOHhzU2eHu2INYQIkvsbpXhE3QZ/c=;
	b=eg7QVZ51CDJsCQNwbIDmlAyAOx6jXVk4bEaLQZ2OGn5oknpL2Dn6JZ6BVJurC35IsCncRZ
	PEpjRdWqhKPNzJRmQVOH6z+W7OZ0SNF21p8VoVAOepcZ+KdMpzV/ASMt++au0CiOgBk1oo
	xaJdDqwC9bZz2ZcdBUfaXs7yIJmffOZC6wSj0VQLIHz02KbiwviVGSJ3wPVmZwfi3cmtzl
	wb8ToQaq8kAIWfI3XgOqUV+4P3gJVZ9MH+jOoCR0AmHZovO2X+6blnqcOzQOKR6kiaCNqP
	nehlSUg6SDnOvGCL3UUwbDnyyosAiEfRqkO84VYTmSE6kWXihPs/kur32ipC3w==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: {mt7622,mt7986}: add port@5 as CPU port
Date: Mon, 18 Sep 2023 10:49:38 +0300
Message-Id: <20230918074938.79796-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_004953_019373_67B5B10D 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: devicetree@vger.kernel.org, mithat.guner@xeront.com, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Banana Pi BPI-R64, MediaTek MT7622 RFB1 board, MediaTek MT7986b RFB, and
MediaTek MT7986a RFB, port 5 of the MT7531 switch is connected to the
second MAC of the SoC as a CPU port. Add the port and set up the second MAC
on the bindings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 12 ++++++++++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  | 24 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 24 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  | 24 +++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 86cedb0bf1a9..f2cc95d4a343 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -186,6 +186,18 @@ port@4 {
 					label = "lan3";
 				};
 
+				port@5 {
+					reg = <5>;
+					ethernet = <&gmac1>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+
 				port@6 {
 					reg = <6>;
 					label = "cpu";
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index dad8e683aac5..018912964b32 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -117,6 +117,18 @@ fixed-link {
 		};
 	};
 
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
 	mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -155,6 +167,18 @@ port@4 {
 					label = "wan";
 				};
 
+				port@5 {
+					reg = <5>;
+					ethernet = <&gmac1>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+
 				port@6 {
 					reg = <6>;
 					label = "cpu";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 3ef371ca254e..3aba067f56b6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -65,6 +65,18 @@ fixed-link {
 		};
 	};
 
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
 	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -287,6 +299,18 @@ port@4 {
 			label = "lan4";
 		};
 
+		port@5 {
+			reg = <5>;
+			ethernet = <&gmac1>;
+			phy-mode = "rgmii";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+				pause;
+			};
+		};
+
 		port@6 {
 			reg = <6>;
 			label = "cpu";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index dde190442e38..89ca852a9854 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -45,6 +45,18 @@ fixed-link {
 		};
 	};
 
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
 	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -83,6 +95,18 @@ port@4 {
 					label = "lan4";
 				};
 
+				port@5 {
+					reg = <5>;
+					ethernet = <&gmac1>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+
 				port@6 {
 					reg = <6>;
 					label = "cpu";
-- 
2.39.2


