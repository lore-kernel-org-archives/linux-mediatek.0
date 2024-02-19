Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC83FC54764
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oCIXFlkqyeCALzXwK5N/G4IDpZ9xAOp9wrFXq9xNpU=; b=B170gDb8dNOK0fCEdgcXyXSEOJ
	dH4WaBKN9d0t/HP5Kl4cPFl9+KZX/5vgJmPEwmfyl6dglZwjHAzTgyiGNhGxd4Wd7cTpzznIC0NUr
	HdUez12pwWTxbFZ3kOohEBK5JYE0X0qt4l/dk7ZHWxzky17m043F3IW8bwq9ZyIO3tYgd4j8lCNQc
	eV1UrgxF3er5owAMoEB6Nqh/cRHK1n+zXMAs54XBNwV7RkG8q3ltFaV+OJaa1GIKziCBIdHe8HsKZ
	+PfoOdtFJSZbuneDjojofRkrEGcnL+kkVdZttX/LSuSHLvqlS6t2E7AEHHR30tLPwNtTGKBhioj2A
	o88M/qxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04c-00000009qNt-1S98;
	Mon, 19 Feb 2024 09:36:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04Y-00000009qM2-3im2;
	Mon, 19 Feb 2024 09:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17D2660C67;
	Mon, 19 Feb 2024 09:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B69B1C433C7;
	Mon, 19 Feb 2024 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708335385;
	bh=JRPmrEv9gjNSe3XKa/1/hoE+552uSlwY7LJEpBHT2NY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tuGSa5PkhnxfWj8GauWyd8CyEDeyka7bRVYv94Xemy74DhPEGCagusutiAM92D3Fg
	 v2PqOQuMCzYLEhYaBspD3NYz4KtMFZPXfCGx8eb3YcnYkcWfJwDixTUH9sgIpYlNEc
	 a1VFrlIXdnwRNyZGtSQsCGzAw80kW6pNIR7IfP9rKl+OrXy3ebl0J/bKmUSpB2J1ub
	 diZv3AD6qkf+CCSFRKRudvj8w1XWUIieabV3fpwa1vpLksgSqUVp6z39UJdV2YkuZs
	 LPs/4+MUHIPW9H13IbA6o2gJSwe7gyWwIlUVVrczIMp9Jm+Ou7oGzUdWw2+Hj7DzwU
	 UcFIu7erN6QmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A831C48BC3;
	Mon, 19 Feb 2024 09:36:25 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 19 Feb 2024 12:36:13 +0300
Subject: [PATCH 1/2] arm64: dts: mt7622: add port@5 as CPU port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240219-for-mediatek-v1-1-7078f23eab82@arinc9.com>
References: <20240219-for-mediatek-v1-0-7078f23eab82@arinc9.com>
In-Reply-To: <20240219-for-mediatek-v1-0-7078f23eab82@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: erkin.bozoglu@xeront.com, mithat.guner@xeront.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708335384; l=1934;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=Dyf6RoFzaYd8gc3DOMB65qzJ0IGXiSBDbE/B8hL5EUk=;
 b=GRe/NnYvt1hIheDRqi/7Mopy1KSIqZfbYDKDWSl7bvsU2LCMGywswlvBQ98vQU6C4KmQscnEf
 wRGauX6MqEMBnFwuS4FzSGyeARFjYw+MJXrvd9qeWyYfrtdh/kcN16B
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013627_041078_B5441795 
X-CRM114-Status: GOOD (  10.49  )
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

On Banana Pi BPI-R64 and MediaTek MT7622 RFB1 board, port 5 of the MT7531
switch is connected to the second MAC of the SoC as a CPU port. Add the
port and set up the second MAC on the bindings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 12 +++++++++++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       | 24 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 850b3e277368..224bb289660c 100644
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
index 5c26021fc4cf..41629769bdc8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -118,6 +118,18 @@ fixed-link {
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
@@ -156,6 +168,18 @@ port@4 {
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

-- 
2.40.1


