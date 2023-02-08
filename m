Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49289C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4qZawTiUfJYUoyG+S/w1peaYo2X+t0fpaJtAtfcPns=; b=D4rN682kUn8/Uo9JDB4kd2TXht
	BRYWqWMMzYI8L5wfBsXyO/HqllK7JsYtcOXLktBlLXAtUbFgq/82YUDx0aeSJYsqfhGY690yRhUa5
	Lt9I3s+Y1BHeKtK66KOuVOw6Kred4uHY75kMKpSeu/GQ2vCqxbcmspHH9PaJCGStZBENL1cZzIJgP
	0TWj3puvROpeglHgTR2RAyU7/WkuFpm7ueyOVaT5tMPFB/Lg63zC8/a3wgUBe8UnosS512PldNNVA
	Dl+4zl7veTLbnSTW6vtNcNS1fIN9iZxvWDdBGpeo5rsFZSjP4zbQruO8Z+zOydM1mfBI7b9LezCCk
	8wOmYPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhzX-00FJ6Q-A3; Wed, 08 Feb 2023 10:47:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxL-00FHtI-D0; Wed, 08 Feb 2023 10:45:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EEA3660209A;
	Wed,  8 Feb 2023 10:45:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853138;
	bh=q6sTRzzpp6l1Y7FFoNdLPC+xxTx63E74abBtY/8WPTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jx8JW+uKpa4vJ4cTBiKbg9MOdA1JWYQtQ4xajYxH7ddT1fiVIpZwavll8AzKGxjSb
	 ApatJ7ZzvrOWRaKal/1gJkIJTrxoIxQCDwsmWt9wvr2JpfVrK9s2nhof7GUbBbDae+
	 3GeCn1eHCFvQe2mksa0/3dGZen4u+GIf5CXVRA0ul51VCJCAqLbqv55kYDhWeO+Puw
	 L4/362ubdORsOjUsmWvH9ZSl0ZaRaBHmLUhe+oiRdoTktkWbVpi7Akrj4602x9Er7K
	 sgtkJJerSWGYhpTnKoyaYE3z6wQtWEIeIQIoyu3B2SbMP8uzHj1XCPfiQUfrPSjDcn
	 B6XbAOk4nabcQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 04/16] arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
Date: Wed,  8 Feb 2023 11:45:15 +0100
Message-Id: <20230208104527.118929-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024539_614924_5EA63D94 
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

Add coupling for these regulators, as they have a strict voltage output
relation to satisfy in order to ensure GPU stable operation.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index a1d01639df30..c228f04d086b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -71,7 +71,6 @@ &auxadc {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
-	sram-supply = <&mt6358_vsram_gpu_reg>;
 };
 
 &i2c0 {
@@ -176,6 +175,16 @@ &mmc1 {
 	non-removable;
 };
 
+&mt6358_vgpu_reg {
+	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
+	regulator-coupled-max-spread = <100000>;
+};
+
+&mt6358_vsram_gpu_reg {
+	regulator-coupled-with = <&mt6358_vgpu_reg>;
+	regulator-coupled-max-spread = <100000>;
+};
+
 &pio {
 	i2c_pins_0: i2c0 {
 		pins_i2c{
-- 
2.39.1


