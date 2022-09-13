Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ACCC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOcKLPA1Hke5Hxn3XlZjk4FFZuO//yOwmcvsPyeNtqc=; b=a2lT7fon9MChC5qzL9mZy02YMn
	5vcIMPUHV7ny7gMkX9klZ47ovyY98TGMw9jIPG9Ns3kgpWHNRtVNkqu2BqcdfSnCoKl0KJ340rLg2
	Q54gg72gKzlBBxIVUWfATBw3vE3VyPsllWuQErFbBr78g2KbbLZbXCCWlgQWq1nn8HiWrv/Qqy2m8
	raXLcGzIhy4cN+4TWxuf5cGDAjnq3F3y+CyKST1D4PVK9/JmhUN8BiWLHHjnI21GlRKzA8eXRPffo
	6xwwadBtGnaWJWvZSb1i3yRUij5HDGfaLqYUqtCPNo8/+UuC9THKkQefT2saIpWjfwJdOhFL+lwas
	60zL1J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9IC-00Diid-BJ; Tue, 13 Sep 2022 17:01:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9I9-00Dig9-Dr
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 17:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91746614DC;
	Tue, 13 Sep 2022 17:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2354C433C1;
	Tue, 13 Sep 2022 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663088504;
	bh=qvEP025B6TRwZR+DuaT1m+QpQNlslSR24zRXyWzzujk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rx6/yelIF0ywqmOJcStv725FLALLWVWxUt2A4oigJKffjDRqhC67nuhROYSvPBPWO
	 eHczL2A+/dAcpQ/O28zHMoF/EvYnazaRclpqqja/Zp2fHQi7konS4MbLPZPdikaToI
	 vD+y7o8bGWbkyTBZnMMYf4MiktPeUjjgtzScgxfBXF6l7AVeKCd+UrHZ7+q47rrPsn
	 CxAHTMwwx8JBBbHgZAzqM5hPHd+P/3bD97zuJACBtAVFEx90ls4TJETM/x+a8mZhT6
	 BbOrMNJBD6QZE6IkVsqWq7CJHg/KQsVUnaCv3cEwe9kDzdDznibIqG/4SX05EY4HKg
	 1FeZ3ptMcoxoQ==
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
Subject: [PATCH v2 net-next 01/11] arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch
Date: Tue, 13 Sep 2022 19:00:51 +0200
Message-Id: <6cb5df83a154f19ff641756bdd494528ad1a2c23.1663087836.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1663087836.git.lorenzo@kernel.org>
References: <cover.1663087836.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_100145_538205_607195E9 
X-CRM114-Status: GOOD (  10.01  )
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


