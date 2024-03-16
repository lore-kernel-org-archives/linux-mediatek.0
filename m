Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE13C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 05:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLLKXiDuf/ZV7h8cTO2GqsnzYRx41EMWrLmnpm0TLqo=; b=zkkVm58Sn+EKu07Gh3sfTF6Lco
	/pHcjYmH01BbjhX10WQ+8vNPXm2q5q6IOgwbysOdU/eqbZq1kU2HHTJfeupVFZt6jpueCw66HuLGj
	Zu4sIAKL2suVcagvp99u8AGCvQSOY/+YoeHoIjEd+nP1cx4x8HfOOxwmfqCdzgxdOW2i1LiuebNTQ
	zRuF+qSl7C8vytuhghvmN//JiYkRMiNbK4Gp+ORHH4c3ccLnLqVAt6Wg6lhFJtQ6XAlandd45DJ/I
	VcI7pGmGQdVrwEQwr5PkWhi942F91JhuanKgSvIqaLBK/hS4U7GfuJTUHnTGUZZnVU/wtq5piiOok
	SQDz1Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlMAi-00000002N1O-1lLd;
	Sat, 16 Mar 2024 05:01:28 +0000
Received: from outgoing4.flk.host-h.net ([188.40.0.90])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlMAY-00000002Mwl-3JUi;
	Sat, 16 Mar 2024 05:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc
	:content-type; bh=ZLLKXiDuf/ZV7h8cTO2GqsnzYRx41EMWrLmnpm0TLqo=; b=CnmyI4Xks4x
	mVnG2ZzgYAdh/m+pnL2OiE0X6XJY6jRL2qGjKUYThqYBq7Hg9z3QMkQSCQlyLgPYTdBlEeUqAbUdD
	KOFDO4qwyWsG7U7FIX78MusTUuB3FIdypI4ySNtOAPayoDdA2fptUHsWIUET3duNz6kp1zDGEK04y
	mQeGuct0WI0y6DVWhSfIQotYryWUWRVinYrCIErMoviUViVz3KAY86bOaU0XgE1yxrZM1GYTm11dn
	CqPVtrN0HbNRRpwRBwvVyCdiP+Rgf6RdP6Bhjn6s969QzeKorAJKgbtArYoxiAh4wXkzaJP8xrLZf
	pRD/6ZeCBYCbZ2eILV4n51w==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam1-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlMAS-00C0SF-Lr; Sat, 16 Mar 2024 07:01:13 +0200
Received: from [41.144.0.193] (helo=localhost.localdomain)
	by www31.flk1.host-h.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlM4m-00048C-TN; Sat, 16 Mar 2024 06:55:21 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Justin Swartz <justin.swartz@risingedge.co.za>
Subject: [PATCH 12/14] mips: dts: ralink: mt7621: reorder pcie node attributes and children
Date: Sat, 16 Mar 2024 06:54:40 +0200
Message-Id: <20240316045442.31469-13-justin.swartz@risingedge.co.za>
In-Reply-To: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9pM7yBTW3/qtGz5nSS82YvPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wPY5yY5vX9MqMW2dd4bQescfggEolMHSR1Me+1tLQd/4/M
 684FXPwRt/ItN/QGHZWwYVP/cCt8Z7AC3QZraAAXGOt0uV2bCpZmMTDaVY6o43+4/UA7yKh3fsRx
 FRwz3BBjyk7zbazyOxi/UqYNqAkRRGBP0VCgd4sTxz5Nt/DkcKfPy9Occ20k9TJ7Nj73O0V9NPjB
 nDE1daoPH54M/DHR5hr5ConJQfcb9SHvDRICkaHkmqj+K0XGa5SFpMYJI0DpfOOu7mUz0fsyGD6a
 bRQ+0H7Q2OEpckvWJAOmdJd77Z9vwc+QHB+X+u7aTqYHtT1NFG5qXEfeIX239vWfI6H8t9z6MXWg
 ZYbrkExtRMjfc/Em1xUk+uitP3ztfVUM86oAc60fMGKzOErxxj0B+NXHNlDo60GNfZ2F/yvXF5fp
 0YCObyJslD58xugMMZCpQQvGifDpq5EYH46qR+vFm9wC7ren9RtRNyYim5e3GD8LGX4whxLggZ+w
 3rysbgAyUKjvL2J0djuO4juAaA0bvabgXwvUJUc3Xwu/zqbuNWtRwnE3XvkU7twVMm/5tv4KTanw
 bOl0qtP5EgfDRdSDhnwOLtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz308HFwsY4DWIzjhTYXUG8GBZhle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVAT1rE1/vP68Bb4z3v3h3gCdXrv2+9GnNX30LKqXb
 fwFKgm/rnYBl+Mj5KqOl6Jzub/f3QhLRbOgisvi5VU9eNBtgo6zjiatjNO/pnMCjuIvXs/AyV/Ns
 URB/R+FlEHyAzksgfaRvdgw0WK34QWnzHHMcN6qoXPjenLhIOF1oeRYbjF1Hp647mOWoQlc3hL3c
 ZMexQ8VxpTDmnfa+pzT1vQb2gnFjWtPhY8e0laryBOR4u/m4iBmYb1/LCV4/EuVHup06w3Vwxf9C
 F7D6LKKRTfdjzQ6YC7Heg3Xf7O1TOd6RcY/MXB8eEq3bCN2QohZvyS03iBmgsz450Kmjd3fGV1bD
 j7kHqUESfAz/L5nIuDmgMQk9EfnvGevAMTGcFT3bIbtf63VNbf0lrvssY+k7AHGi1NevGWTo2+h8
 Lhk4HCeZR7ymlGVRtthBJ2y8A5arx6JItKpFaUNPGMMlvbMX0nyK1NiAJ0y2Qvvn6ds6mor35w4f
 SfHzQbABJfgy21HclcZkPRq7NhoxyMwqi8Q23Rgadfh5T5n5D4OHHpbEIgsllZKWnzc5M5WlNtVJ
 qo05MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_220118_861677_CF3C926A 
X-CRM114-Status: UNSURE (   9.99  )
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

Reorder the attributes and child nodes of the PCIe Controller
node to meet the DTS style guidelines.

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 68 +++++++++++++++++----------
 1 file changed, 43 insertions(+), 25 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index f6418201b..aa06d12ac 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -495,70 +495,88 @@ pcie: pcie@1e140000 {
 		      <0x1e142000 0x100>, /* pcie port 0 RC control registers */
 		      <0x1e143000 0x100>, /* pcie port 1 RC control registers */
 		      <0x1e144000 0x100>; /* pcie port 2 RC control registers */
+		ranges = <0x02000000 0 0x60000000 0x60000000 0 0x10000000>, /* pci memory */
+			 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>; /* io space */
+
 		#address-cells = <3>;
+		#interrupt-cells = <1>;
 		#size-cells = <2>;
 
-		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_pins>;
-
 		device_type = "pci";
 
-		ranges = <0x02000000 0 0x60000000 0x60000000 0 0x10000000>, /* pci memory */
-			 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>; /* io space */
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0xF800 0 0 0>;
-		interrupt-map = <0x0000 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>,
+		interrupt-map-mask = <0xf800 0 0 0>;
+		interrupt-map = <0x0000 0 0 0 &gic GIC_SHARED  4 IRQ_TYPE_LEVEL_HIGH>,
 				<0x0800 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
 				<0x1000 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
 
-		status = "disabled";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_pins>;
 
 		reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
 
+		status = "disabled";
+
 		pcie@0,0 {
 			reg = <0x0000 0 0 0 0>;
+			ranges;
+
 			#address-cells = <3>;
+			#interrupt-cells = <1>;
 			#size-cells = <2>;
+
+			clocks = <&sysc MT7621_CLK_PCIE0>;
+
 			device_type = "pci";
-			#interrupt-cells = <1>;
+
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&sysc MT7621_RST_PCIE0>;
-			clocks = <&sysc MT7621_CLK_PCIE0>;
-			phys = <&pcie0_phy 1>;
+
 			phy-names = "pcie-phy0";
-			ranges;
+			phys = <&pcie0_phy 1>;
+
+			resets = <&sysc MT7621_RST_PCIE0>;
 		};
 
 		pcie@1,0 {
 			reg = <0x0800 0 0 0 0>;
+			ranges;
+
 			#address-cells = <3>;
+			#interrupt-cells = <1>;
 			#size-cells = <2>;
+
+			clocks = <&sysc MT7621_CLK_PCIE1>;
+
 			device_type = "pci";
-			#interrupt-cells = <1>;
+
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&sysc MT7621_RST_PCIE1>;
-			clocks = <&sysc MT7621_CLK_PCIE1>;
-			phys = <&pcie0_phy 1>;
+
 			phy-names = "pcie-phy1";
-			ranges;
+			phys = <&pcie0_phy 1>;
+
+			resets = <&sysc MT7621_RST_PCIE1>;
 		};
 
 		pcie@2,0 {
 			reg = <0x1000 0 0 0 0>;
+			ranges;
+
 			#address-cells = <3>;
+			#interrupt-cells = <1>;
 			#size-cells = <2>;
+
+			clocks = <&sysc MT7621_CLK_PCIE2>;
+
 			device_type = "pci";
-			#interrupt-cells = <1>;
+
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&sysc MT7621_RST_PCIE2>;
-			clocks = <&sysc MT7621_CLK_PCIE2>;
-			phys = <&pcie2_phy 0>;
+
 			phy-names = "pcie-phy2";
-			ranges;
+			phys = <&pcie2_phy 0>;
+
+			resets = <&sysc MT7621_RST_PCIE2>;
 		};
 	};
 
-- 



