Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D11C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WKb59GdaZ16vWTFxCjE3qZ2BMCsjK481LH3SrRs+fk=; b=0KPD7R4RUnkRleJ54kFGeBHpXs
	msQsYePg5CNslDp1ho7TcwCZ4kEjysUgkq0ursRYFRuUvxYPlpXe2N5u8FH5lufGXPIyFejOf5XQG
	PwJP6N+nyI2z9d77aNVvK7pXV83orYAssvtIo3MFL+FVTJwQNjh2PjR3JwqOFgrQcDnsaq2/zkMjf
	4eUyJxG0ZFuan06rrrTjtgfktCyqNdUQ6OJ5LAiIC5JpQXLAqP/O85SxROOudsZRlDBie9NIEY+we
	48XmopkcM7UidkvLcpvkJhDoYdc6z6mj3R8M5Hzp8ntQv8+Ouw/16J026XKPMex8wVfIrTx/Mft4U
	ZxkBIFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETJX-00000002I3m-2lve;
	Tue, 04 Jun 2024 12:30:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETJ2-00000002Hjd-3WXB;
	Tue, 04 Jun 2024 12:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504223;
	bh=4isRwFg+lFtocx2ttK9dTVWtREPPc/h5BSwfHPf+To0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kDFUSPMQgViXEXAe/nwxu4sO/3IfQMTtY58QNx41aL2W/3ilHMMLXOXaeW8j4WAil
	 tqzXsdCWy+xfiFDOxInXvt1uEspY4iOgFMShoFU27mmIwC17E1kh7LpaADywBFzQMy
	 OJEGrapfv+udD32gIHQWeoz/FqoJXW0XIgNBQvfzbwsaD0FMOHWCwYp2RLnD/dza9k
	 K7cy6HDewopEZecN3MJmQ992Mi183dePq4gHwGpnuM4tYYNJtZxr7HWK0SU+pfgGAV
	 ea00b2yt+WJmy5O1CZWkU37HwqNriI2KorKpLpgUCxZUaIKcM3+SaQ+M/bg8zEUT/p
	 9vdCQQArjPo1Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B443737821FA;
	Tue,  4 Jun 2024 12:30:21 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	bigunclemax@gmail.com,
	dlechner@baylibre.com,
	marius.cristea@microchip.com,
	marcelo.schmitt@analog.com,
	fr0st61te@gmail.com,
	mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	andy.shevchenko@gmail.com,
	kernel@collabora.com
Subject: [PATCH v2 5/5] arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs
Date: Tue,  4 Jun 2024 14:30:08 +0200
Message-ID: <20240604123008.327424-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_053025_953206_3EDAF968 
X-CRM114-Status: GOOD (  10.24  )
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

Add support for the ADC on MT6357/8/9 and keep it default enabled
as this IP is always present on those PMICs.
Users may use different IIO channels depending on board-specific
routing.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..5fafa842d312 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -10,6 +10,11 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		pmic_adc: adc {
+			compatible = "mediatek,mt6357-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";
diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index a1b96013f814..641d452fbc08 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -10,6 +10,11 @@ pmic: pmic {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		pmic_adc: adc {
+			compatible = "mediatek,mt6358-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6358codec: mt6358codec {
 			compatible = "mediatek,mt6358-sound";
 			mediatek,dmic-mode = <0>; /* two-wires */
diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index df3e822232d3..8e1b8c85c6ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -9,6 +9,11 @@ pmic: pmic {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		pmic_adc: adc {
+			compatible = "mediatek,mt6359-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6359codec: mt6359codec {
 		};
 
-- 
2.45.1


