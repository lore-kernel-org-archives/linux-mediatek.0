Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B60BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnYrALI2Kg5YpcRruW4wtSkyAYFQJQv5U1BxNcgbHyE=; b=TQv2FbtG5CJs9V
	17xj+gOAqXw1FT5MKuj3Zwe+QEE7g9mec7+5oWb7C98fisf828lTXWRmL4i2XbeFl6N6gHXI9FRf9
	Oq1Ucb3KzTHW50Klk/Uz3hCi9oa25sbVlvf/8eJ0s6ItVxHNCzNqGqcRO2x92B5iZFRHhZJ/6iKgv
	U5beqpmMB2kz2lIYq+woVpxuZz3ApWJEhqAb7zHQxdExcVkVL5UJNXZJlZDgcUzDbg6Es6bfc6EAX
	O8q3ufMmUNzg+eeTW5GdDsDT5omyyLndOSTNB8ECkgRY4b8ZMV3UfAr156TKXFrHDKudPegZiSWOm
	mQ5/N7vk/UUxAEmcAgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXgZ-004Jl1-NC; Fri, 25 Feb 2022 10:18:51 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXg3-004JVh-4p; Fri, 25 Feb 2022 10:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R1TUjW3FR0g4N/arQpSNxRqerqgJRvX9AVweP0pFvqk=; b=QBZQTz00vs0LOMzxKJLWEYQ750
 9kk0tkqlrECDqILShqnXPoZdE/WX87gvPOU4yOZV2lCy/QU7H7ww3Mfa+MUwtcVgRGK1QuwbR4FON
 0hH64DSko2JnCeEGkecUym2xqzV0xwaZdNOUke2+6LIVIIihto1+0wsV/prpJheAo4lI=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXg1-0007J1-AM; Fri, 25 Feb 2022 11:18:17 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: mediatek: mt7622: introduce nodes for
 Wireless Ethernet Dispatch
Date: Fri, 25 Feb 2022 11:18:04 +0100
Message-Id: <20220225101811.72103-6-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220225101811.72103-1-nbd@nbd.name>
References: <20220225101811.72103-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_021819_390342_C9A1E487 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce wed0 and wed1 nodes in order to enable offloading forwarding
between ethernet and wireless devices on the mt7622 chipset.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index a2257ec6d256..47d223e28f8d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -901,6 +901,11 @@ sata_port: sata-phy@1a243000 {
 		};
 	};
 
+	hifsys: syscon@1af00000 {
+		compatible = "mediatek,mt7622-hifsys", "syscon";
+		reg = <0 0x1af00000 0 0x70>;
+	};
+
 	ethsys: syscon@1b000000 {
 		compatible = "mediatek,mt7622-ethsys",
 			     "syscon";
@@ -919,6 +924,26 @@ hsdma: dma-controller@1b007000 {
 		#dma-cells = <1>;
 	};
 
+	pcie_mirror: pcie-mirror@10000400 {
+		compatible = "mediatek,mt7622-pcie-mirror",
+			     "syscon";
+		reg = <0 0x10000400 0 0x10>;
+	};
+
+	wed0: wed@1020a000 {
+		compatible = "mediatek,mt7622-wed",
+			     "syscon";
+		reg = <0 0x1020a000 0 0x1000>;
+		interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	wed1: wed@1020b000 {
+		compatible = "mediatek,mt7622-wed",
+			     "syscon";
+		reg = <0 0x1020b000 0 0x1000>;
+		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	eth: ethernet@1b100000 {
 		compatible = "mediatek,mt7622-eth",
 			     "mediatek,mt2701-eth",
@@ -946,6 +971,9 @@ eth: ethernet@1b100000 {
 		mediatek,ethsys = <&ethsys>;
 		mediatek,sgmiisys = <&sgmiisys>;
 		mediatek,cci-control = <&cci_control2>;
+		mediatek,wed = <&wed0>, <&wed1>;
+		mediatek,pcie-mirror = <&pcie_mirror>;
+		mediatek,hifsys = <&hifsys>;
 		dma-coherent;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
