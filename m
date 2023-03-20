Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFF8C7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dpcwQhihfQUtL7kUJfHhFephZIeUzaPQhWxuBAGmbA=; b=fJ6iSVsx15+kS2jFZKzZoNdQcM
	lePFDaeoWvyaKJHfaWi5VOyppgZ98FzLdx+f2VtCgk7ewJr27GuvrIHZA8txC0dv/wEVz5wbiQmGK
	E6Xm3v377bKJ/unhqfZVPMuzQYjhGOCL2vSB33c+Ch5FKKj4bxoLFLv9fVhKkMrMe57j8HrTqiRz5
	fHcq9Qn8AUJsXbSkPP2eD9LwSgshlyx2GUBr2gddu5+2ZeQ66MGXTYq1Hj0RXTS6kciOHALtYTBsn
	/iRuGCe5DIUpCLAX+IqRl93SF1f2u9gp4kxJ1jgkk06dzN4TPVhqTqEfJaanZkIWSDwAgi+TQ//LY
	sOtpwFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqx-009u41-1M;
	Mon, 20 Mar 2023 16:59:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqu-009u2Q-0m
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:59:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D62EDB80FF1;
	Mon, 20 Mar 2023 16:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB44C433D2;
	Mon, 20 Mar 2023 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331557;
	bh=4/gQUt4YWFNm/6YwT4rVQA1tyKYT3o8UQlO++zo/1OQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c085N1aFCtD3ZLC4G1Wr8tStlsKV6pZIijpWWJYjGy3QwNos3yiXvlVHdk2EcxakJ
	 jiIUavZhu2ccRhaGs1ck01pU0vRKizw6jsvX6n/fuX3jtB6t5TF7fYzz9517/TEFPX
	 bQjo5Pq2woJfNNLCzww7s+ebjulp9XqmleR37touusZAD2xsFpIx5uaCtdndBhX3Rd
	 tubf6mrBkjcKWm+1+LFypVN0Xw83NqnhXEm3XT1bPcqc/+G/2rbZQj+yDQ5xSylJ17
	 su7dQ6q84anmfWwSWQqY3Dm5vnoyA3JKkhC/xwwNhIyJiUkZphjubGqb8tuqthCj+3
	 R6zxdpF/VtLBg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
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
Subject: [PATCH net-next 07/10] arm64: dts: mt7986: move ilm in a dedicated node
Date: Mon, 20 Mar 2023 17:58:01 +0100
Message-Id: <5e1168bc8fd29f4871f81d8e4a9fd43a2c3be146.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095920_575419_0F53570C 
X-CRM114-Status: UNSURE (   9.88  )
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

Since the ilm memory region is not part of the RAM SoC, move ilm in a
deidicated syscon node.
This patch helps to keep backward-compatibility with older version of
uboot codebase where we have a limit of 8 reserved-memory dts child
nodes.

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


