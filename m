Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEB9C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWg/EdVW8Yuj+rsxEgajt+GyBL3AvWUiqv9uyaF7DyQ=; b=abxNTHdMY7tlYRxTTHKDRTKdB8
	pOh2KuEegPb8YWQVPkJ0yRKkuU6VfhAB+CvoyUVwcKF+2Tvn41Ivk7Me9Z611WCN1z9X69Pr1O7XF
	IgVbI8PvX8j45zz084vm2bQeMjMsunOAsCxjUzAbLxCNJBPS1Cd/q/IqRvQSj1Js8P5K5n7XfzVn+
	pxwq3Tz0WyuAutiQq1dRHdDXQ8wBFWhipDyJDmeTR1+crovThw1pqM2IUp+pcpB0mtZA2Z/za7nVC
	VQ5kY42+N1JHGdawWj8rZ0DfcgsVZM8M2Te1AJxDpgHVwh7HKXDiLl+GUGWhelt/Y7S4YfrQUDUy7
	Qvv4VIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJC5-00Fdkh-Fy; Wed, 01 Mar 2023 09:56:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBN-00FdKR-01; Wed, 01 Mar 2023 09:55:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CEDD6602126;
	Wed,  1 Mar 2023 09:55:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664531;
	bh=68pAuhR2AwbWVXI3OvP5qkhYBgJxnDaV6L7C5W0OdA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1HDW/xGfyw5NrMrPFCU/v9jyz8pC0fuA9PeRsZ5TFG0+qFsW5D6upIxRYwPsMFqM
	 gTl4RmQ/oxW45ILWFsgzUZMSx5qakJoGVo1g9YN4bECROPHNFvrPMm03u29ayUtY1/
	 +dA43RxktVhEFfeCINFMnHmGPsIhVs2kWjRX7HXlHTXZs/HcjanVmrovgHj1MmKHB9
	 AMcXrmFtHVi2/qlAExpp0DiCSU4gY18atchb+tdfdnK52YvdY5FoQzmoQhTqqtKkRo
	 voW63sMbjs5yMG4uoyGYm4iyxoaFfytZwoTKYo63Uv0FkXb57ytFTgBLZ7uOuCkKWO
	 ueFcDgCgM6BcA==
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
Subject: [PATCH v4 04/19] arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
Date: Wed,  1 Mar 2023 10:55:08 +0100
Message-Id: <20230301095523.428461-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015533_214332_CD121248 
X-CRM114-Status: UNSURE (   9.80  )
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
2.39.2


