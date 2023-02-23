Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1CC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TygdOeWQTpz2f8gBD/DGmlXExAUxciSBYq7LXZrasM=; b=RH/Q2f9Acz5uBR4GeOD+dDgIVE
	rUjm1MMOjMENajEYJLyogamzDJMut5vpJ/wl/9eU6I847XLF8w32g3Ha0qBYFpfMo2ub9BBjIMAH1
	M2mX5nPq4rT+cTA/6XbDqFyoSmk6iUds5vjJMAG69X/NhvaHptqEnDr26u3m16YlTD+MRnnMC5V8l
	h2XvaXRajZ9KS9T+gr0qI+3v53I5MswFLH77Ln9Gz5i/q5byE1+S9YCxSJK5NDZsynbhHbB01sDUw
	Gkn8j16+dDvVBf9PL5W5Z4x6xhlqtHHknOqNJPBvgNTHZ3AMBWDEe4rdQZ+/7aDTbk2Mz1IFkEhRx
	IZQqQoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBw3-00GZgA-Ez; Thu, 23 Feb 2023 13:46:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBt7-00GYIu-SJ; Thu, 23 Feb 2023 13:43:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1486F6602208;
	Thu, 23 Feb 2023 13:43:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159836;
	bh=1V2jxX0ANAEWX9LhnlvthMdf0fZsDfORdoxEzmZYOWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UqxbLCz8YHPHJZ9kauVlS3ft33uV+Tec6ZhPT1U3ATczFXnqwSLCJHvz4cyADKVND
	 bwPjNx21ZnZ3Ks6QJtzE0J24frRwjmTRWZRmxcDPPANbFp5paKF6fGPg1/rl+CmpgW
	 obPMTF3+HXqjminUq1KC3eXFDOsjy4DUWcHS2zFA1ZFYlu43RS0RA8EWwZXOGRBvbT
	 7MbWgwnGO0h34kVEV2xqBwxc8vPuh6uRxAlqa+eABVfwfvPPY3Re4ssUOvTv1imOwo
	 pKR9zaTuTXMDmX12RZXxBSMWAJK1Z1yl+bSzYC6EG9wToiHXiFO0g+Zt5leCqvoYn2
	 JKR4BvnpgMkaA==
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
Subject: [PATCH v2 01/16] arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU regulators
Date: Thu, 23 Feb 2023 14:43:30 +0100
Message-Id: <20230223134345.82625-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054358_082626_F174A61B 
X-CRM114-Status: UNSURE (   8.86  )
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
2.39.2


