Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1318FC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsqTwxdIixnZB6IgwP/EtUJGZNyLL98knKFBMEAawsc=; b=FArcMR28t3EMhox92AawYN86/w
	dxkqWVC94yP9RwSGp9TcNLfLbSKgWvpLwKvMIupv6Wvl5V6W0c5QajmP+4dyhscXE/WMUCTZ3f++m
	XREw7I0rm51eEBVGh6/ZuRbt1X4iyNV8w1AKWhp+CTc5QpxU/nvkUZ+SZDJ1zPmG6dwRr7oQLir1F
	LOTTkpxhlDksPgQkT3G+UIzmjWMrgDFSUVpk4y0BPmPgGlSgoAztC+IsdxfuJf28Jd8UzWJBZrOOo
	pwNSrgFfZJfyX7VNfGKO8bDMet9wZy+GJR8l11ZpMlHlmf/xTP+rxFehUXUYkII/NBD2jmKXlm9F7
	ydrJUiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBzW-00GbtA-Th; Thu, 23 Feb 2023 13:50:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtA-00GYKu-Kd; Thu, 23 Feb 2023 13:44:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9AD21660220C;
	Thu, 23 Feb 2023 13:43:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159839;
	bh=MrIqGkrI7LujwoSZ7Bc2owhtRwNGguk3yNGZ02UZ6+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S52oOLdwx8SJc0VrVkilY+Rm9h+xmcZeTq4RbGHI9TpY0AWNOgqbgGaqRDfeuwtP/
	 wkHnBsVMEx32STxRhX6Mmtw4HJNy5/CQ61urf5woc0yxJjtvWfj3x+Fk/s6wWYwv6J
	 akCS5IaxUgmY9+tDLAbapeT8I688LPCCUTsvwXjWnNGLZvcTcnO6d6a5eronVa96hz
	 tvsYpiQBvJM+q5LIDuzyMC7XuYCaB73Y/BHC67tN/cNplq3I7MhBWyF6PRMFTAd4q4
	 FxOmIzMofge19j+bHpg0K0VJHyeI+gm/LAkpJ04tP41UWc//yfd7WPdUDWgWCe5gti
	 CFuCkPSlo8EIA==
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
Subject: [PATCH v2 05/16] arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
Date: Thu, 23 Feb 2023 14:43:34 +0100
Message-Id: <20230223134345.82625-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054400_870482_8178D3B7 
X-CRM114-Status: UNSURE (   8.84  )
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
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 52dc4a50e34d..fd327437e932 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -52,7 +52,6 @@ &auxadc {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
-	sram-supply = <&mt6358_vsram_gpu_reg>;
 };
 
 &i2c0 {
@@ -138,6 +137,16 @@ &mmc1 {
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
 	i2c_pins_0: i2c0{
 		pins_i2c{
-- 
2.39.2


