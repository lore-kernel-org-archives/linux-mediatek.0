Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C31C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+ffK6k3wuxRJkjIkwzv9FZHaR6LLvsyi/OIXg5VlQo=; b=IjvtgsHCTcU2vQF7Z+QmHKsXAJ
	3Pu96uPIyj0V+H2hK3T/H3diOVPe4j2QgX6ZSq8XAIIsnKJbOAx6DmYiAT9GW6Zz2KYvvgL3+KCQZ
	aZAcCXR+IHwn+REl5kMb/HL07da/VGlpf3sA31ylnYfua5euRZInarrWzCHCEU372aZBSV5XmtkbW
	XZIGtdTOSu17Db1Kx9w4P/aeaVzf5+UfPd83iRoIcmOxDhl3RtMXdH6q0jNwiTuyrnbHF6M329nRZ
	4IbsyWSOMdyBnfZpPBu4qbLw0zj70zLNGa+eL65CGF/mnERgCYTe9EewbC2jnYK/m3SHoeReoTqeo
	j9DWPK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBye-00GbHk-2t; Thu, 23 Feb 2023 13:49:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBt9-00GYKV-Nx; Thu, 23 Feb 2023 13:44:01 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 00374660220B;
	Thu, 23 Feb 2023 13:43:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159838;
	bh=iTiXsbcvL98tLYBNMasBh9C/GsvGSy9IVHh+FRRt/uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WlHxlvYZhxImKA/EjmjKE1w6P5Qc75JZ/An6P0DwEXCUUhAT0LZTb1G8KatASzVwS
	 rTldgl7J1lSp/I/2C5dXrjBJkr+WDCi/IhvDiGChKfVNtnapxZLoHMXeJUJYv3Uu8N
	 FBOj27fNjQUQ4H5Of6Rbxmkgikx8LbSxzPl8mY52uBeD9P4O1aa5mml7muMKjQfmnQ
	 YUI5rJWK8drYypyz4I83DOtUIaDr68Sg784Y6HLC/iyxTjI2cbuxcIeW1s7vBIKO0d
	 ohpt1xwRskUr3FK7NX9PscPFCT5rxQ6M4fAFdyGXqt+l9QHjMwcJ79QBbqkZaxI6fV
	 o2R7M25q8pCvA==
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
Subject: [PATCH v2 04/16] arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
Date: Thu, 23 Feb 2023 14:43:33 +0100
Message-Id: <20230223134345.82625-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054359_943848_B44FC5BE 
X-CRM114-Status: UNSURE (   8.83  )
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
2.39.2


