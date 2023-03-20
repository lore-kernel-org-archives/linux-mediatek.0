Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEFDC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX3X6XUUIZJHDMdzSW16zvJ7y/lCtQTDcoWIHMDryz8=; b=mr/9617LzSLADRS6IlviSaVBn5
	gb0ZdunZ4jrPoISzbrN+80WEozTNvte4Abp6BOFxvcEOZmBTUsCrKJHam3sjSniPfLZLiDeQvGHMr
	HEn9dQsCgMZJIkxaGrfCUBMNWrWr7YxFXJV40+ze6aOoZPYb6M5vBexfWo23dhbejoeN/zzART7t1
	o9UDSfpP2PxbhJBT/5A71aBt6y22h19hapIiZaHy38Ls4Z0GRfzjkR6D3rVx0H6NfLskmFpUS2fVn
	MfX7fQgbZUpa2Qoy6+4aj4mwZtXZkax44UgaKdgFJEIi331zpjCa8dF4mgIlWMbE+/6bX/245lzLB
	8FhykUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIr8-009u8M-0f;
	Mon, 20 Mar 2023 16:59:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIr3-009u6P-3A
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:59:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C140616DD;
	Mon, 20 Mar 2023 16:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B860C433D2;
	Mon, 20 Mar 2023 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331568;
	bh=erXq85FyIZtloI+86moWAdAbuiYWCHhJtUTWTR5zF24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6Yew46aNS37ilruUDPlt8PDEPagkM02hjjuYvwmCyha0ErZGzm+AnrYwU4QfSneu
	 aVhngWEpjFKmnzW/ounuNw2VTPBYK4UVmX8666/kyvzx4MvPPWvIXSuo7ty1fSrpqy
	 EX3RTHitTqmOuAENKuqWmy+Wdj9oPbECvfe4MbQFZ7Xjl3Fdz6HucCyw2CwowTc8rZ
	 ToR74R+tKAslNphht+kW1LWEEtow7yyvayizvEUUwtY52+nkSy6g5qRQ0RAmBw5rE2
	 PC7E4NPpSULVp1NCM8fVAB66RJFwZvCIJ15jlo4d4P3tBnHbs8tNTQpeliwS2Fpx1Y
	 G4KaBPh8WWIvQ==
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
Subject: [PATCH net-next 10/10] arm64: dts: mt7986: move dlm in a dedicated node
Date: Mon, 20 Mar 2023 17:58:04 +0100
Message-Id: <d74e38de00ad1b858b59a7ef6cb02321b0faf750.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095930_090237_920D150B 
X-CRM114-Status: UNSURE (   9.74  )
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

Since the dlm memory region is not part of the RAM SoC, move dlm in a
deidicated syscon node.
This patch helps to keep backward-compatibility with older version of
uboot codebase where we have a limit of 8 reserved-memory dts child
nodes.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 30 ++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index a0d96d232ee5..0ae6aa59d3c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -93,16 +93,6 @@ wo_data: wo-data@4fd80000 {
 			reg = <0 0x4fd80000 0 0x240000>;
 			no-map;
 		};
-
-		wo_dlm0: wo-dlm@151e8000 {
-			reg = <0 0x151e8000 0 0x2000>;
-			no-map;
-		};
-
-		wo_dlm1: wo-dlm@151f8000 {
-			reg = <0 0x151f8000 0 0x2000>;
-			no-map;
-		};
 	};
 
 	timer {
@@ -444,10 +434,11 @@ wed0: wed@15010000 {
 			reg = <0 0x15010000 0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
-			memory-region = <&wo_emi0>, <&wo_dlm0>, <&wo_data>;
-			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
+			memory-region = <&wo_emi0>, <&wo_data>;
+			memory-region-names = "wo-emi", "wo-data";
 			mediatek,wo-ccif = <&wo_ccif0>;
 			mediatek,wo-ilm = <&wo_ilm0>;
+			mediatek,wo-dlm = <&wo_dlm0>;
 			mediatek,wo-cpuboot = <&wo_cpuboot>;
 		};
 
@@ -457,10 +448,11 @@ wed1: wed@15011000 {
 			reg = <0 0x15011000 0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
-			memory-region = <&wo_emi1>, <&wo_dlm1>, <&wo_data>;
-			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
+			memory-region = <&wo_emi1>, <&wo_data>;
+			memory-region-names = "wo-emi", "wo-data";
 			mediatek,wo-ccif = <&wo_ccif1>;
 			mediatek,wo-ilm = <&wo_ilm1>;
+			mediatek,wo-dlm = <&wo_dlm1>;
 			mediatek,wo-cpuboot = <&wo_cpuboot>;
 		};
 
@@ -488,6 +480,16 @@ wo_ilm1: syscon@151f0000 {
 			reg = <0 0x151f0000 0 0x8000>;
 		};
 
+		wo_dlm0: syscon@151e8000 {
+			compatible = "mediatek,mt7986-wo-dlm", "syscon";
+			reg = <0 0x151e8000 0 0x2000>;
+		};
+
+		wo_dlm1: syscon@151f8000 {
+			compatible = "mediatek,mt7986-wo-dlm", "syscon";
+			reg = <0 0x151f8000 0 0x2000>;
+		};
+
 		wo_cpuboot: syscon@15194000 {
 			compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
 			reg = <0 0x15194000 0 0x1000>;
-- 
2.39.2


