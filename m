Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F962C48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVSavdKTB9rxViiEWDK7HmxRwaFJHQQYZIR+PUJCcaY=; b=eT8s0D6zFezWWxoe1OEB2RrlXn
	PdumI4wybsq2G+q3/JkAT9myXm9jyr+oTSSKjoEVGm9sIqpEnc3/c/oI7D8sE085MxoZXYqjkSi4C
	qLJdQPgvleO/b8bZ9Ht4bmhuuivxsDyo6akpcDzTRUKs1qarKgAUo6J145t/G6o5DPxtyvn0FUkxE
	X80jwXz3pKG6h4V4fclVHOUdmDkTLQvbP6MpdKzmztNJbr6f8JMPrfIhD5qrRKQaVR3LeTg8gUonJ
	oEEMUgMa0ZVX5laCVFQ+fHcPB685cFGDBIE2yy/d/eBaiE9JbrDJRSnw3jn6Yjr5b2Ao4IbvAN5tb
	zM829Udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04r-00000009qVK-2mzI;
	Mon, 19 Feb 2024 09:36:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04a-00000009qMa-2Zbp;
	Mon, 19 Feb 2024 09:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC4F7CE0EEB;
	Mon, 19 Feb 2024 09:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C11DEC43394;
	Mon, 19 Feb 2024 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708335385;
	bh=DPs7xzTtibskM7IfcNZHafi1s4OR/BO95p3ospi+tMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Aq+fezDuLAyoeKI+WScEoKL9At4VrcFdBdBIHrH0JGJcYMyrdWAjcbL6SJ3bIJNs1
	 ePqg3zNAgYm4O2mYtkbBss1aIoFzfGiDcRTvg6C5dKUvmOkbXc3Va/MVjp/SVTkpbC
	 uZlvQm1PjooyzOYY1h7e9e3dhjj3quHc2QlpsKthvSDQY+WudwS61KK2UqoR4qvA8Z
	 srG2czF0IR8ymL9tMckWJuX7r9nYoZvBtiv1xMpOK1irFPnySvfZzGsEAAyFB7NXGt
	 RbHQTJRxKGwnIYfLSVqc/0YKrenJmW2Xt4d/1MRXHsRKqs0wbylvU0Jb6c3ufLuSxh
	 gZXC9ES3p5KjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6E2C54787;
	Mon, 19 Feb 2024 09:36:25 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 19 Feb 2024 12:36:14 +0300
Subject: [PATCH 2/2] arm64: dts: mt7986: add port@5 as CPU port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240219-for-mediatek-v1-2-7078f23eab82@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708335384; l=2158;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=58182oTWmYdN/H9gOxWBaCjBXGKyd/UkxWiwHahp3Xo=;
 b=8ixGoZdtLfMIYfLLr7jnFfKQiIaoNd41jekDYSA4+3eH7gG17EnPXLUZKqLWTyNpHq5tzSDDq
 OLuyHKPxO4SCQd7MBszzXTj/H/1sT7bqFSPjNa2ZliffoymFdSh5C6Z
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013629_029530_EC550D22 
X-CRM114-Status: UNSURE (   9.78  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On MediaTek MT7986b RFB and MediaTek MT7986a RFB, port 5 of the MT7531
switch is connected to the second MAC of the SoC as a CPU port. Add the
port and set up the second MAC on the bindings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 24 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 2f884c24f1eb..5d8e3d3f6c20 100644
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
@@ -288,6 +300,18 @@ port@4 {
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
index 57dcaeef31d7..58f77d932429 100644
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
2.40.1


