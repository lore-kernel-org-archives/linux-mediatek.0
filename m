Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CF1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9a56ia3RnMXii5rHGDgmVR6yGDBE8Nob5Rc8lRnXa8=; b=wUsnutw+/6P6kG
	MW/CMCXwFIYTDZ23ayE5taQ8i7vsFTd4a/wGDueTPZk6vfY6JIcq+jcWyAuhzSf16DHV6SWddrP26
	l3KO12mEJuOW/Bz+kl8PnAa9pQwGrv1SSHOW4xoykibIIGPNdsUH1ToxhUu4tJFnOBG4jxETFbUFo
	+NjFSJMFrGXfFfmBZMWZnQHOxbDE7Noujks1EyUdltL5zGAJByBQk7Sbp1BOul9RdWjaS0J90YGCA
	kDrRDt2hswZd1wTudveU9klRvtG2DLrXzMh2HHObjmlQCnE+Yhycgc7jM+ms2lPvupjYjoRH4LeNS
	ncHXutkEtl9KIEDPgLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXhc-004KCN-Ng; Fri, 25 Feb 2022 10:19:56 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXg2-004JUw-Gw; Fri, 25 Feb 2022 10:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DxOXxIW0oNb1NkSwODLS6r1eDbL6738IlX9qVviaol4=; b=FbsS5rnkdnhlt4LlHdXE6DO2uD
 Mppn0jqJI8jut6Nk/HtYK/E6NqHNMzA6u2HNL7oJkTslNXH2cN7ChUge6UBX9XqoHY/GSvQuA1g8c
 86vemT1nA1f6abyqcfbppEOXdyPU3XfuwBYuQwiOuMAx5VsdEOvR45bId6E4ba502etc=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXfx-0007J1-U9; Fri, 25 Feb 2022 11:18:14 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: mediatek: mt7622: add support for coherent
 DMA
Date: Fri, 25 Feb 2022 11:18:01 +0100
Message-Id: <20220225101811.72103-3-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220225101811.72103-1-nbd@nbd.name>
References: <20220225101811.72103-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_021818_821133_ECECD3C2 
X-CRM114-Status: GOOD (  10.59  )
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

It improves performance by eliminating the need for a cache flush on rx and tx

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 6f8cb3ad1e84..a2257ec6d256 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -357,7 +357,7 @@ cci_control1: slave-if@4000 {
 		};
 
 		cci_control2: slave-if@5000 {
-			compatible = "arm,cci-400-ctrl-if";
+			compatible = "arm,cci-400-ctrl-if", "syscon";
 			interface-type = "ace";
 			reg = <0x5000 0x1000>;
 		};
@@ -945,6 +945,8 @@ eth: ethernet@1b100000 {
 		power-domains = <&scpsys MT7622_POWER_DOMAIN_ETHSYS>;
 		mediatek,ethsys = <&ethsys>;
 		mediatek,sgmiisys = <&sgmiisys>;
+		mediatek,cci-control = <&cci_control2>;
+		dma-coherent;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		status = "disabled";
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
