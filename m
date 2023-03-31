Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6AEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ybd8G0xFJHWDTaQGrkD9l1At0q6A5075aYXdaq7Qnxc=; b=Lv6lH7xpJtqAW1jZaEQR7s22Mo
	V6qNFFN3ce85yCoq3YGQPN5OMbQbHGOwFvy5YTm2vI7Nx1fZED8xibdkOR4a93y3NDuKbKjUBnXXM
	QQmTF9gr2HbPbicn2GHA7DOvaojodFcZfmjw8fYur0I2rzDh8L18ItasR4weyCnOzkTYVZMbL+X7i
	2yLCls1Ratml3NLPIxCl5Jh04MTCXyFxLS2etr1D4o4T8CSg45q6Tu2INEbTxGBLnRVyo6ItwEIgs
	DbSwRyhIaGcnXA1SaBgYJ9w6KKuc1zlnqWHJ+kZwMtOBAcgXa2RWVoC9jALmkggeltFmWMSIUpvea
	m0OsZakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZe-007UXQ-30;
	Fri, 31 Mar 2023 13:13:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZc-007UVl-0o
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C23316290D;
	Fri, 31 Mar 2023 13:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6F9C4339B;
	Fri, 31 Mar 2023 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268423;
	bh=a7RlPuu7MvSxqwEXcrLQIgFMCd4DHwUbSml1aECRMIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zgtz4gCbONlRSOWEdIhp+sSDoMwKXRIiez+xhP/ZBMA1djCH1C22p/RfgOfvsJzjb
	 yKzEQ4ISqFEkAnL4NEDjUO/mTNeNY3dRUaADiP8Be5LUfnrYaUKR4km8QWj+efk22o
	 DlFBmHmpmXFFDAoDeXp2yZGyRdj02hdsQoLcXHhLaLLtedlfN1IJx2OxKiSnaVny0n
	 Ap36N68wqM0kmgNoR9OaA8PE1SoNlGzBj2LVFY37bQIIlDxVZ5UTGefYl40cRoquo+
	 D3rSnfQqjGee2DV8VBpvWGOjp1NsJNsxDj1nimgGHcz8/L4ynIDPok9dXeNnG2fomu
	 BN9vKZOGGimOg==
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
Subject: [PATCH v2 net-next 04/10] arm64: dts: mt7986: move cpuboot in a dedicated node
Date: Fri, 31 Mar 2023 15:12:40 +0200
Message-Id: <56608130babe671e5dd354900480abbe43bec362.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061344_359323_4D48EBB3 
X-CRM114-Status: UNSURE (   9.40  )
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

Since the cpuboot memory region is not part of the MT7986 RAM SoC,
move cpuboot in a deidicated syscon node.

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
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


