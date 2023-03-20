Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89687C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yPLdRArzhGP5b6xyzP+wdoYtIf+AayS7rO8O1L8lt8=; b=4QnNU3vleF5qwFodZUNdVb2/P0
	jgnOfmcrHm+tw8qHB4bqWC9tD24YtUeyHbcnrqpzFGPnxWJgXz5RC7TZg6VO9my0yin+Sdg7U6BLb
	GE7AuuQ56hveAbwDlt9s2TIkuvM8ZWKbVeONqGwRrI3Mc6Im67wRlRI8/Z/SbqDo772PaAGFbcZPC
	3NawmM6tsWWQpcN2SM+1mDhmViFuS0o65sMAQ8ZGyQPNclstrm1D3b1fJnBIfDHelGI/n5TuoDyEH
	Ci3tE8Q343deSiw+aJiQufqCjOyK6z0RJeyOGqcFSGUnQC3+GQ2Syc3IN6WGPdmlce9V9Ei8ix3eP
	ICnpELcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIql-009tzT-1j;
	Mon, 20 Mar 2023 16:59:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqh-009txo-11
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:59:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB704616DF;
	Mon, 20 Mar 2023 16:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE26DC433EF;
	Mon, 20 Mar 2023 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331546;
	bh=Pe3VP2wxZ1LgzDKFV9zDltQiMh3cGeAqwPGq68FDOlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FkGr472jOTqkgltHePWWiSJxD3ZM6RmRsglUXYf4dBC59FaFr72iibUPBtSLSIzIE
	 SLUoXipwmHSrFKeH3gQcSoYIw+5/ljBSWw01GIO6JkA9/TGH+9ZoxJXFJWbvDu0V7E
	 IiKZ/vB7zUETiSoBcC7N5boYCmVBxJQ/+vgpsaH8/H59tYsNoOzzEU10L1ma1g54JV
	 RzGTV0LalvNkOBa/AYYO+a6uvBFLrk0722COR4g8fNVH/QDhuVAFaX4zNB3Ss2ZkFg
	 j5fKOLqB0Y8oQkwv3uG2g+woQ+PnYE23w9nBgAVWHRJTt7PW4QgoZ6KDecE+uGaL/O
	 GhG2uVEJEYujg==
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
Subject: [PATCH net-next 04/10] arm64: dts: mt7986: move cpuboot in a dedicated node
Date: Mon, 20 Mar 2023 17:57:58 +0100
Message-Id: <61e2445f79d8642e7749dac409e2b93b96667610.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095907_388186_ED3BC286 
X-CRM114-Status: GOOD (  10.04  )
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

Since the cpuboot memory region is not part of the RAM SoC, move cpuboot
in a deidicated syscon node.
This patch helps to keep backward-compatibility with older version of
uboot codebase where we have a limit of 8 reserved-memory dts child
nodes.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 51944690e790..668b6cfa6a3d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -113,12 +113,6 @@ wo_dlm1: wo-dlm@151f8000 {
 			reg = <0 0x151f8000 0 0x2000>;
 			no-map;
 		};
-
-		wo_boot: wo-boot@15194000 {
-			reg = <0 0x15194000 0 0x1000>;
-			no-map;
-		};
-
 	};
 
 	timer {
@@ -461,10 +455,11 @@ wed0: wed@15010000 {
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
 			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_dlm0>,
-					<&wo_data>, <&wo_boot>;
+					<&wo_data>;
 			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
-					      "wo-data", "wo-boot";
+					      "wo-data";
 			mediatek,wo-ccif = <&wo_ccif0>;
+			mediatek,wo-cpuboot = <&wo_cpuboot>;
 		};
 
 		wed1: wed@15011000 {
@@ -474,10 +469,11 @@ wed1: wed@15011000 {
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
 			memory-region = <&wo_emi1>, <&wo_ilm1>, <&wo_dlm1>,
-					<&wo_data>, <&wo_boot>;
+					<&wo_data>;
 			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
-					      "wo-data", "wo-boot";
+					      "wo-data";
 			mediatek,wo-ccif = <&wo_ccif1>;
+			mediatek,wo-cpuboot = <&wo_cpuboot>;
 		};
 
 		wo_ccif0: syscon@151a5000 {
@@ -494,6 +490,11 @@ wo_ccif1: syscon@151ad000 {
 			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		wo_cpuboot: syscon@15194000 {
+			compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
+			reg = <0 0x15194000 0 0x1000>;
+		};
+
 		eth: ethernet@15100000 {
 			compatible = "mediatek,mt7986-eth";
 			reg = <0 0x15100000 0 0x80000>;
-- 
2.39.2


