Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E3DC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJt1YJZCNbMWnYusEP5LK8uNhUZ3IJMqYE3HMfURltM=; b=G2z/yn/8KfauMdhDEAP0lgBVz0
	pGeZx6YHCy9RHuDw3hYmBu3L9b4SCoIdjpfgqe9ChIs3c4v8m5qVI5KN/g8XthQ7LLHo+VUJSCmvf
	wy3iFk+ocJfJtsXo2M+rW6R6/o6tRdFMFq3TeAhp9e+6l/WOustkGJKVfdPbrbl7RyR1Ovw5uplsY
	+xWAwHUU6c3NXHpY+k8/8SbHnupePKMy3o0fr1cn5RgXT2P4lhpcXZZOaKsxluTqjq4T9CfdLrO4z
	fYE/Aa2Zsj/f/uybubSqVHP52c3Z8wvQvLPbt/Gwnuq1OOPloU8DJnnO1nWBpOQPvzmcWE5+LvTKn
	wPXzrdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZu-007Uf2-0x;
	Fri, 31 Mar 2023 13:14:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZn-007Ubv-2J
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FF386290D;
	Fri, 31 Mar 2023 13:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09AAC4339C;
	Fri, 31 Mar 2023 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268435;
	bh=4cHdHnyTAhlO3f0cK1byiul6wL08Fc18njzb8Jp2zLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VBsKpbWD8FtuvEtQqWYtSO10q+cA3UyyeHUuVAUDglQuekLueAoxi1dmLXQfl77ji
	 HX6C3pEoOYXO6Kqu69oB1ZtcwD8DUrxAIhBKAPgiw2+3eK41O0eWHS32/fYJ3xADxB
	 anmlaPvXPwwEJoG2/LojRVs1+4aKdwC9zjLOMVOnoGT5z4Hk6RzZ2hHF77ZR8ZVdI3
	 iau0np5uRiI1FQ6szkcfJeh3xaP8oUAnffnUveMAjOIt9qqNf0gy8KjIHPT3t8Jj2g
	 /D9g40ssIf1YoFjbJv6VGqIl5mr/5UGf+qhDTjeUd6bWw/1TH1CK7KV3kFXX93pMjj
	 rtKh/sd3PYi1g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 07/10] arm64: dts: mt7986: move ilm in a dedicated node
Date: Fri, 31 Mar 2023 15:12:43 +0200
Message-Id: <b58a1517a81d1d0d591936832a07e5a723934fde.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061355_831288_9EE1C797 
X-CRM114-Status: UNSURE (   9.23  )
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

Since the ilm memory region is not part of the MT7986 RAM SoC, move ilm
in a deidicated syscon node.

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 34 +++++++++++------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 668b6cfa6a3d..a0d96d232ee5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -89,16 +89,6 @@ wo_emi1: wo-emi@4fd40000 {
 			no-map;
 		};
 
-		wo_ilm0: wo-ilm@151e0000 {
-			reg = <0 0x151e0000 0 0x8000>;
-			no-map;
-		};
-
-		wo_ilm1: wo-ilm@151f0000 {
-			reg = <0 0x151f0000 0 0x8000>;
-			no-map;
-		};
-
 		wo_data: wo-data@4fd80000 {
 			reg = <0 0x4fd80000 0 0x240000>;
 			no-map;
@@ -454,11 +444,10 @@ wed0: wed@15010000 {
 			reg = <0 0x15010000 0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
-			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_dlm0>,
-					<&wo_data>;
-			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
-					      "wo-data";
+			memory-region = <&wo_emi0>, <&wo_dlm0>, <&wo_data>;
+			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
 			mediatek,wo-ccif = <&wo_ccif0>;
+			mediatek,wo-ilm = <&wo_ilm0>;
 			mediatek,wo-cpuboot = <&wo_cpuboot>;
 		};
 
@@ -468,11 +457,10 @@ wed1: wed@15011000 {
 			reg = <0 0x15011000 0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
-			memory-region = <&wo_emi1>, <&wo_ilm1>, <&wo_dlm1>,
-					<&wo_data>;
-			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
-					      "wo-data";
+			memory-region = <&wo_emi1>, <&wo_dlm1>, <&wo_data>;
+			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
 			mediatek,wo-ccif = <&wo_ccif1>;
+			mediatek,wo-ilm = <&wo_ilm1>;
 			mediatek,wo-cpuboot = <&wo_cpuboot>;
 		};
 
@@ -490,6 +478,16 @@ wo_ccif1: syscon@151ad000 {
 			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		wo_ilm0: syscon@151e0000 {
+			compatible = "mediatek,mt7986-wo-ilm", "syscon";
+			reg = <0 0x151e0000 0 0x8000>;
+		};
+
+		wo_ilm1: syscon@151f0000 {
+			compatible = "mediatek,mt7986-wo-ilm", "syscon";
+			reg = <0 0x151f0000 0 0x8000>;
+		};
+
 		wo_cpuboot: syscon@15194000 {
 			compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
 			reg = <0 0x15194000 0 0x1000>;
-- 
2.39.2


