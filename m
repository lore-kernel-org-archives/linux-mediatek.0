Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F15C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 21:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AIYPfZqge+9rlxwTUUN8Wgjlyw1hvN5yIzIMMFQLDf0=; b=0uhIwUJ4+JG7EUlj5EY/AZN8Xv
	5F1UKNPsSNyDO6KRAAQU5Gl5f95BLO/hDlTxUJtYRTCMHofCG+kzDSMVy4afLiDtuXbtISWc2T0Ob
	jH1pCwZA40Qcf9LvscX9SCUxA+6BXQQl0axIBrt4GJQtlec96T80Dp07T5wQH3UK2kWnuLJUGVcrR
	Y0dY3+F6pUlVSxRtFbQ6OMaN8jNBFv2SWVH9JWc9xHxC8i57YUHxHi4DCM5A9pTJJIkFHqG18jVIq
	wJW/rC1Stu/Dhi9W4UkM80+t60usJw0QWjDXPpqVk57DGcnM8MBMd7+rPu2yayePt/YX87pHlmHJM
	vR+mq9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAbT-00CrDZ-0k;
	Tue, 12 Dec 2023 21:47:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAbQ-00CrCQ-0i;
	Tue, 12 Dec 2023 21:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91B8D617EE;
	Tue, 12 Dec 2023 21:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F05C433CA;
	Tue, 12 Dec 2023 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702417663;
	bh=6YruCECQNqriAxLtk267bYMIHs/Tox5AgVT0K5CGKo4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ejWKvJpYGg7GLTCRZvqJ+KRRJkgOgl45d55UP9zn5amtV6+LgF/XKhI5WUtewgjWf
	 8puG2X2OXjXn8W29aUxMjrA3atFy6i4+Zm7vjH0FObCwLI+zZ9fZVafnb8ApFuzPYl
	 u4LnI/3BgXa4oXe7I40OcUEDWrhM2j3OP9G9JY56K8fz3ycXfLy19w85v0hZ1fqo9K
	 zbfslj0+5AadVN0Rwe/5C02871OQGY59S5kc5FmDr6QV/vWs8VDxNr+wTas+HDSGfL
	 /2iNrosy3sPDr1/fHEP0RLkHtSxWo2E6D073tSUGN3Q6TynPgTGYm/cRHSyCCEO7Pz
	 NXFc1SkXhVAIQ==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ben Lok <ben.lok@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: mediatek: remove broken pmic interrupt property
Date: Tue, 12 Dec 2023 22:47:22 +0100
Message-Id: <20231212214737.230115-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_134744_300104_BE670342 
X-CRM114-Status: GOOD (  10.70  )
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

From: Arnd Bergmann <arnd@arndb.de>

The pmic is connected to the GIC, which uses four-cell interrupt properties,
but its interrupt is specified as two-cell that would only make sense for
the GPIO irqchip:

arch/arm64/boot/dts/mediatek/mt8195.dtsi:464.4-27: Warning (interrupts_property): /soc/i2c@11d01000/pmic@34:#interrupt-cells: size is (8), expected multiple of 16

Remove the interrupt for now to shut up the warning. When someone figures out
what the correct interrupt and parent are, we can add it back.

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 70b465f7c6a7..a409ef998746 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -238,8 +238,6 @@ &i2c6 {
 	mt6360: pmic@34 {
 		compatible = "mediatek,mt6360";
 		reg = <0x34>;
-		interrupts = <128 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-names = "IRQB";
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		pinctrl-0 = <&mt6360_pins>;
-- 
2.39.2


