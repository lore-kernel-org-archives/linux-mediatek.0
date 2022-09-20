Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E06C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOcKLPA1Hke5Hxn3XlZjk4FFZuO//yOwmcvsPyeNtqc=; b=sVgSI2AyLb5G/Xoa7EkLjCp/Op
	DszyjBbd1ntSfDBT2UHFFpyM9TTK6Y6tFMrao+E35mHmLA+1WGy8zClRB/pYBbxr1IO94I13n1DKv
	VxRd4JW4GkqEedKN2GfrgoM0ymbk9UylQo5DGIsdhrUzuZd6lcLkyVbJGzXV6nEs2ah0uSfs76KDm
	xuJZJKskKGman3x3+u4FcM5HKMga9vvw8j5RX5V9mARF13HSyQrOLqEzcXNtjVNRi44w0Cvubvsrg
	7bpB5uyRxlgyZ4a/zxmy3AED1Jr1lhP9xE/UwOO/oQr5zW2/Waa9h4O/uUQTFDkt5pz3m2zHY+8oR
	2dz3/sSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaEn-002pDK-Nk; Tue, 20 Sep 2022 10:12:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaEX-002p0n-Ed
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 10:12:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9E5761E7A;
	Tue, 20 Sep 2022 10:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDD3C433C1;
	Tue, 20 Sep 2022 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663668717;
	bh=qvEP025B6TRwZR+DuaT1m+QpQNlslSR24zRXyWzzujk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c6aM6pG0XEBakBAJiu6P9SfpQIydBKxSZ7AuSGMjB7XWhv4/hfpPVlGbYW2AsKaii
	 Zim8PK/sUcSOc/jS6J8Y9TjxO/6eqIkgbvg8Aa4x/O4DJfohp4XdHziN9Apr2EvYUn
	 J8yj433hYUDV2wsJnjaOnjFuQWqFWF3VCC0LDelfzo5F8nNmmyIcbgYQx45f4QxGxs
	 x3h+UVaWylaMpCYOeRfv0DC7Tyb6IuCL+c/0CzUsCAci3doERkotF3E9WhfpYFofks
	 vrSxCfNi6ndCEA6iPqORfd82lHVVzTbNJkgNwxD9WCfZZHLDkmcLbNf8YIpL1DJMzx
	 0qDEKM2ot5VWQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v3 net-next 01/11] arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch
Date: Tue, 20 Sep 2022 12:11:13 +0200
Message-Id: <af0c305b7eb8d7aec4c088cba6889a22724d33f3.1663668203.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1663668203.git.lorenzo@kernel.org>
References: <cover.1663668203.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031208_831318_2AF81066 
X-CRM114-Status: GOOD (  10.50  )
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

Introduce wed0 and wed1 nodes in order to enable offloading forwarding
between ethernet and wireless devices on the mt7986 chipset.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index e3a407d03551..692102f6248d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -222,6 +222,28 @@ ethsys: syscon@15000000 {
 			 #reset-cells = <1>;
 		};
 
+		wed_pcie: wed-pcie@10003000 {
+			compatible = "mediatek,mt7986-wed-pcie",
+				     "syscon";
+			reg = <0 0x10003000 0 0x10>;
+		};
+
+		wed0: wed@15010000 {
+			compatible = "mediatek,mt7986-wed",
+				     "syscon";
+			reg = <0 0x15010000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wed1: wed@15011000 {
+			compatible = "mediatek,mt7986-wed",
+				     "syscon";
+			reg = <0 0x15011000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		eth: ethernet@15100000 {
 			compatible = "mediatek,mt7986-eth";
 			reg = <0 0x15100000 0 0x80000>;
@@ -256,6 +278,8 @@ eth: ethernet@15100000 {
 						 <&apmixedsys CLK_APMIXED_SGMPLL>;
 			mediatek,ethsys = <&ethsys>;
 			mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
+			mediatek,wed-pcie = <&wed_pcie>;
+			mediatek,wed = <&wed0>, <&wed1>;
 			#reset-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.37.3


