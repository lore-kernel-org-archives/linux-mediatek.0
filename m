Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88617C7EE30
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwzYgY//LGcWZQNi758UN/hidxcHlf+1mU/Su45QGhQ=; b=BsbcKTM5RKzC+GegB9/v1BeS/p
	ciQlADUqaXzjd+inx+ZvDdCPHQK+B0KGdEWnOF2jsAfrOkhVDNNSdt/nSLNvg1ihf1dbBlDKmM3M6
	aFMbq6t1Rn2po7Yrk4v9uBk6Z2K88HWPPvZLZNBRE1uuKp1LTeiIr+MRavNkghh8YN7KZbHpcv5b7
	0QGAPH0FWL3WlblTkCksU7XfrKgu/qSZcsGR4eRFez2+bKiE1WrbnEY1EmltjeOch82CWhNtM5zog
	5/lV96LwqwfvKXmrbAjs2XYyJkXZqSYflwivIjUMN7V2lpoZjYci+Q1z1oVuNeOPqq5UEaC4TKwSI
	B+lJoGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBX-00FdSV-8e; Wed, 01 Mar 2023 09:55:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBL-00FdK0-7P; Wed, 01 Mar 2023 09:55:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3ED4166020E6;
	Wed,  1 Mar 2023 09:55:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664529;
	bh=L6kGyfCrTlPJ9U3bVTbj8GIaJJMOf4x1aJLiGYToiq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eW99pR/vA4O7k7G4KkUJeTWCnY9hsn6relGj8RSw22V3Yiphv7T7bj2crtdA/NLne
	 4vXHLbhPyb+76dA5+PtCPhoyOhZDC5VD6e4FOKW+LDH+pEda8OSzF7Igo05iNVVupr
	 WjH4XiKEakpOFqQsVdUMyJUTT0FgiPig0BqNN2/EN/8LGlfKG/8pK0IvyOknXj8H1b
	 TgjaVl8RxIbw5Y+cqbdfjUzWov7kjCPkkaI1Vg7ul1NAf1UyOywj1XWnAmdzVIwXZY
	 sJa8i93kkcJc0jQh6AkiDU4dWWmkeAyxm7pI5Bvt9Q/Q5cDFf6ID9tlnCsRW7siR7w
	 SxawEniUqxEIg==
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
Subject: [PATCH v4 01/19] arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU regulators
Date: Wed,  1 Mar 2023 10:55:05 +0100
Message-Id: <20230301095523.428461-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015531_521128_DA9560F0 
X-CRM114-Status: UNSURE (   9.83  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.39.2


