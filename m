Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA9C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs6A3xuh1wg0WbzcNgHtsf7usFbi1rf+zDWg/hjd3e0=; b=rT4Bk7pWrOQAu0AEZsMxxm58Wb
	Pgu+FZLXPa8CAXEE6xZjxTiLYf5ihhScW/7ByT3NLugPS68ijoy7I+FRGbDSBYN70GqWR3pCQ76h7
	Z+mEV7fOIZ6aFQ9Vswn52VrUjXq4jsae5XJs9ZmiNriKmpbnTOMxn1mj5JsfAumAVm8ytVu7ZCyDL
	Cik/pOafgCdK+CoPV0Wenez4s5/S6niGXpX4wZXzMkC7MCmWq6fCSbZmVgoWZHTf0Ax/GqhqU+WS/
	ONSTmjZO40VDWb5tCphZMPfi636JI2J8nITbb7ds2QPVulOhhwRlJR0XOGSRSJLclswdLJjFYD0LS
	Uaovqz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhy5-00FIGh-M1; Wed, 08 Feb 2023 10:46:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxJ-00FHs8-8C; Wed, 08 Feb 2023 10:45:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 724466602091;
	Wed,  8 Feb 2023 10:45:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853136;
	bh=DG0Bfe4ArjgFwtknCIsWC7PDxg3CMEPnouLpXP/YXz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mbSIEeCx3m5ABKgI70bBZlZl72M3m+skFht303Hzt8fhtoCvG9St6GkUQpii7FiVr
	 kBqJ1MkVDcoiZqE5iBf1rV9QCMXuA1r12odYfNycoB0KzRtt1byoEaEPV9AHwu8ZdU
	 Kco5xghQWkzMyG0c4ZBLzZWELpCObGNygTH93Wdnseeuru6frEFZLEgeBAFdYBA6no
	 OmW33r7rjrKw0mKEopkp19ulQQmjUBnIiOGolUcPeqKDoYDFLbBgksMDuUlB4uG7T1
	 qwS29jePIo4NTFRXPqcbx2UVIJyx973ZDn4BdRRAT+UJVlhq7pBo/ZkJBWSIfNc/Kl
	 7sbf726tnsoFw==
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
Subject: [PATCH 01/16] arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU regulators
Date: Wed,  8 Feb 2023 11:45:12 +0100
Message-Id: <20230208104527.118929-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024537_491936_ED775244 
X-CRM114-Status: UNSURE (   9.44  )
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
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index fbe14b13051a..de9778c85b94 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -294,7 +294,6 @@ dsi_out: endpoint {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
-	sram-supply = <&mt6358_vsram_gpu_reg>;
 };
 
 &i2c0 {
@@ -401,6 +400,11 @@ &mt6358codec {
 	Avdd-supply = <&mt6358_vaud28_reg>;
 };
 
+&mt6358_vgpu_reg {
+	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
+	regulator-coupled-max-spread = <100000>;
+};
+
 &mt6358_vsim1_reg {
 	regulator-min-microvolt = <2700000>;
 	regulator-max-microvolt = <2700000>;
@@ -411,6 +415,11 @@ &mt6358_vsim2_reg {
 	regulator-max-microvolt = <2700000>;
 };
 
+&mt6358_vsram_gpu_reg {
+	regulator-coupled-with = <&mt6358_vgpu_reg>;
+	regulator-coupled-max-spread = <100000>;
+};
+
 &pio {
 	aud_pins_default: audiopins {
 		pins_bus {
-- 
2.39.1


