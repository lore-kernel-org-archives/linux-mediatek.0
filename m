Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81BAC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuA0GggvFnL6xorv923s6HYLTCa7eZERPeLUA+fkC5g=; b=qCRrr8J9CVLeRRrYV95FgUSLho
	2/xkJGnNB1JOtnCwjIKaT5wspxNO1f3Lm7OyW48dglvC1WDmJE7Eqz4GScGn8qGevdtqE9Y9ZatXt
	kgfMO7h3qWCn8I+cBzxYNWD5EZC+9XsWbipdABvRPuXqb4L3VPx6Rf4toIvktJWEV8qK9dVp/LlJC
	758bgyc+3wB4WPdn5hISpWJLb6FyFTWbjNrYYXpm2+dz81WAP3/dfr5ZZZmrCmlBVs3r8yVrKxyIB
	O9a9azqgBCST3NWli/SwtbYvS2RC43kBHc+msW3tVx4iOXvTXbghR9Jg4/abj+UcTYtErzJI/7Bl/
	y+AfVwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcCH-001FgV-Mm; Mon, 28 Nov 2022 11:21:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcBi-001FMG-Ff; Mon, 28 Nov 2022 11:20:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4BB2E660294D;
	Mon, 28 Nov 2022 11:20:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669634435;
	bh=0/HOyrOTrjT43+4gbX6kjcJ+lmgqvtIXNi+Hvx25WNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATmJ7/+JQK0ca/cSCQ2o9iLlMZ80XEh0q9IJdyHKw8ro20J/ctNnVYIJJwmJhlhxQ
	 CT3+RxkpZ4bDrSRNd/RMTYbqdUbkLDyS7PYzIjYhmwSV39sCc4/nDw0L+m8nOr1//F
	 VprN5G8TwBRBglCudv+8906HGFAcN4If2Hi2TP/O7ctZ8tyEYvWi2wfxqnoEbukv4l
	 75AA6IxlIhXy7Wp0TRV4XY63jmwpbK8aPpfFhVWhle2ApCp+Uup3i48wmk39ix3Aly
	 v+chLF5d+a/TZbQj4Ow8FXX7pkHD3Ie8ys55dRa6/iW63DYrEVIHDvHDsUl6U90MXe
	 tcJnQg0/rBLMg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	john@phrozen.org,
	sean.wang@mediatek.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 1/2] arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
Date: Mon, 28 Nov 2022 12:20:27 +0100
Message-Id: <20221128112028.58021-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_032038_752497_A6CBBE67 
X-CRM114-Status: UNSURE (   7.80  )
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

Specify #pwm-cells on pwm@11006000 to make it actually usable.

Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 146e18b5b1f4..f321c6d0fd7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -435,6 +435,7 @@ uart3: serial@11005000 {
 	pwm: pwm@11006000 {
 		compatible = "mediatek,mt7622-pwm";
 		reg = <0 0x11006000 0 0x1000>;
+		#pwm-cells = <2>;
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&topckgen CLK_TOP_PWM_SEL>,
 			 <&pericfg CLK_PERI_PWM_PD>,
-- 
2.38.1


