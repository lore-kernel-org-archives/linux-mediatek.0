Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC3C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsqTwxdIixnZB6IgwP/EtUJGZNyLL98knKFBMEAawsc=; b=C7Dfcu2Dx342qmMuFRglO0iGOR
	qON3xvioE5F9h9yHL6+4OLiFMXiShQptWZpP9+dCA/3G1maZDf91KNRMFRJxR/oIZ2HP1SX9gAy/u
	hbNYyLWng5uDL4TmeJEQv+gucqGLeCLhW2UIbPyJfMmchjmiowDwfS9yhDtYxOwiVBLL9gEPTVo1W
	nQa5odYEYTN1ldS30pQTGKCYX0S8ZaBgtmh0RuR+5hn4xPeW91yLfX8pJb2YWZvVFTI+mv7+5GB2v
	sRP1s10bOQK3unPhkld3sw2EZFP3ip9LhS2CcgO/r5j9jEY7L8Pc6/n76TZ7mGbcwz2ykbJGYfM/N
	PvcBU+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxXb-00Ckc3-7A; Tue, 28 Feb 2023 10:49:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWT-00Cjvz-Sw; Tue, 28 Feb 2023 10:47:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F0106602FDC;
	Tue, 28 Feb 2023 10:47:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581272;
	bh=MrIqGkrI7LujwoSZ7Bc2owhtRwNGguk3yNGZ02UZ6+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dR4/b3b5lltCNN8KfeulljLkwod7OuVNaM74a5HrWCCgegN1d2AhvW1vKT6Tr1vaR
	 1/SObUDle1lbS2jS+xAY5A7XfAZT/4WOhOgyNU6EKlFOvvJjQaWxpA8/ZcVUL5eVyA
	 goyY64+helLLB/rgqG0gQjaCUs2CreVyKfqEzt5z+wTAdOUcj5Q4BqJFIIPFpdOw/9
	 sg07ArnkLn47yTd+Hg1/ugU4uMQX3fyHn3k+kDWe6+1yTKYG1gZhO3kj5Yb3m/WN1m
	 A9LK6MVj+j2mC5orTIAkjMgZT1aL3SK3Yal8sxhThI4/vWBDUP7ziDaQr8uez07c1E
	 AnFuCFXdJE9+g==
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
Subject: [PATCH v3 05/18] arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
Date: Tue, 28 Feb 2023 11:47:28 +0100
Message-Id: <20230228104741.717819-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024754_100195_76E71898 
X-CRM114-Status: UNSURE (   9.25  )
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


