Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58E0D78316
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mch10DIBi3tXOtxprf8O1i7f4Q2u3NNLnZFSAgGJOjQ=; b=nivtzRP3QALk+D
	V+E1G8irI8l6pemzz31A4Zhxv3O9bvB704JUsdiy+wfaF8jE01MSHNVpR5OT7UyeI6pFnjBEXBJBd
	OTSKMBbOuneHv56zUicSgGAzsx9Oqj1j0Sb0qAMeJNVsKvC7UtkjdTY9coBCgbdsvJYC8Nww0aEFX
	g5NsgNHFR6eK5HgUL4i8RNK3nIbZDPUrknPDYKZwVqq9kHyHjeyGQp6A8/Qwvn7oCiWeHUczR8rv/
	yTQi86hTGcvokIFr6fcLx44LZyD0gRxmGoSSWGVZVKj0GNHaL6V5bFbu0U/B0dQ35uvaMwmN2Rxja
	cB+/mQ9k7nfDgOrb+pOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5la-000000067AQ-3f1L;
	Mon, 02 Dec 2024 12:43:06 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VN-000000064CJ-1zDX;
	Mon, 02 Dec 2024 12:26:22 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 23A24100DA4;
	Mon,  2 Dec 2024 12:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mch10DIBi3tXOtxprf8O1i7f4Q2u3NNLnZFSAgGJOjQ=;
	b=yAJwAZmUyEiu+kekFbdArt27PgsYAE2PyGcJjwWnmwaSoyNPUACPK4BdPeXFB+oJpy1Y2x
	qx2rb8d7or9W6zXNThLaDic528Bno2IOKKNCxHBrORQq638qqf76qSpGfasxe1WMEEqp1I
	b00n+BKYvyuMLkS25PnQS2EqluA0Dpo=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 981BE360554;
	Mon,  2 Dec 2024 12:26:18 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 15/18] arm64: dts: mediatek: mt7988: add proc-supply for cpus on bpi-r4
Date: Mon,  2 Dec 2024 13:25:56 +0100
Message-ID: <20241202122602.30734-16-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 02459d1f-b577-4b20-bd96-fff9427d79dd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042621_650555_2D3D0575 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add proc-supply property to cpus on Bananapi R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts     | 16 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi        |  8 ++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index bc1ec73b8ddd..550c373b3d70 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -35,6 +35,22 @@ reg_3p3v: regulator-3p3v {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu1 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu2 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu3 {
+	proc-supply = <&rt5190_buck3>;
+};
+
 &cpu_thermal {
 	trips {
 		cpu_trip_hot: hot {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index eebbdfe55774..93c21a5248fa 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -16,7 +16,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0>;
 			device_type = "cpu";
@@ -27,7 +27,7 @@ cpu@0 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "arm,cortex-a73";
 			reg = <0x1>;
 			device_type = "cpu";
@@ -38,7 +38,7 @@ cpu@1 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "arm,cortex-a73";
 			reg = <0x2>;
 			device_type = "cpu";
@@ -49,7 +49,7 @@ cpu@2 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "arm,cortex-a73";
 			reg = <0x3>;
 			device_type = "cpu";
-- 
2.43.0


