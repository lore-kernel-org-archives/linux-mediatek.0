Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F76EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pANNy/xJGcJmlXFLWNRphaV51QxiaFoMbh8h4kymSDA=; b=qo07ciS1zEwfYRP9EWkENUqs4R
	VqszYn+BlBV4MFgj+e/Cef4SXnP5oaIz+veYbbaLlHH2xWglzMQPpDCkn2hfmrx84EOkIcKuPRFPK
	2JIheJfjz+JVXLzkSmaqaOvClUVbTxHBoUmpjhbGML5766Xil/crA5WQN0fc83WBR2Mtz1TbyD6Rb
	ad6w54geRGcd2OcLUjbxNGPTcOvIx8byPbB2AM/evmzliwnlAE3KdDuv3j8j2Jo+PQpYvjyZKpgzS
	4jquFTg6L5IvPKkrWNNxK5w6lY5nPYxxj3bpmVOakWSK2YcqLuj64kEbjYi50BdwJLgO3XDH+wS3T
	75Lji/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLlH-00195H-2n;
	Thu, 06 Jul 2023 09:58:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLlD-00194P-0A;
	Thu, 06 Jul 2023 09:58:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D6B1660585C;
	Thu,  6 Jul 2023 10:58:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688637528;
	bh=kSDkPuyPb2t/JH+C79C1IUs7iSlEMd5QU2QZxBnRzjg=;
	h=From:To:Cc:Subject:Date:From;
	b=VrxAzq+T6v6gG1CSsHla+ctqoqAOgTx+nHsxbn/BLDMVwG7eC/KC9SJCSyNrgjB2B
	 W+IZJOwKW1xyggoG3Wq6WqwMzwF083PAVWJqgiAsRTlJ3Zhv3N02Jr0qBhyaxpprYy
	 uEqMxZhlfsr/7rkAmOTeK8rusLo17P9hZLmiXtIbQ8+ntt62CS4GU8CbK+uiIT7QcU
	 +Id9PIfe9Egl5JugoipJ/55dfncmt2osxQMtUet281ZSLzxisQ0FwJ0VhpkcBfyO3u
	 JRmt++euLLmnmJopWNxOgMaI6FHe1KCwkyQh2cyS/Xhcl5RJd20q9GMYkIZyYAAuTC
	 48m6kplJGwZmw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	yong.wu@mediatek.com,
	tinghan.shen@mediatek.com,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix PM suspend/resume with venc clocks
Date: Thu,  6 Jul 2023 11:58:41 +0200
Message-Id: <20230706095841.109315-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_025851_292209_0311C32C 
X-CRM114-Status: GOOD (  10.36  )
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

Before suspending the LARBs we're making sure that any operation is
done: this never happens because we are unexpectedly unclocking the
LARB20 before executing the suspend handler for the MediaTek Smart
Multimedia Interface (SMI) and the cause of this is incorrect clocks
on this LARB.

Fix this issue by changing the Local Arbiter 20 (used by the video
encoder secondary core) apb clock to CLK_VENC_CORE1_VENC;
furthermore, in order to make sure that both the PM resume and video
encoder operation is stable, add the CLK_VENC(_CORE1)_LARB clock to
the VENC (main core) and VENC_CORE1 power domains, as this IP cannot
communicate with the rest of the system (the AP) without local
arbiter clocks being operational.

Fixes: 3b5838d1d82e ("arm64: dts: mt8195: Add iommu and smi nodes")
Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 95bd058d6083..5c670fce1e47 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -626,6 +626,8 @@ power-domain@MT8195_POWER_DOMAIN_VDEC1 {
 
 					power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
 						reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
+						clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
+						clock-names = "venc1-larb";
 						mediatek,infracfg = <&infracfg_ao>;
 						#power-domain-cells = <0>;
 					};
@@ -688,6 +690,8 @@ power-domain@MT8195_POWER_DOMAIN_VDEC2 {
 
 						power-domain@MT8195_POWER_DOMAIN_VENC {
 							reg = <MT8195_POWER_DOMAIN_VENC>;
+							clocks = <&vencsys CLK_VENC_LARB>;
+							clock-names = "venc0-larb";
 							mediatek,infracfg = <&infracfg_ao>;
 							#power-domain-cells = <0>;
 						};
@@ -3094,7 +3098,7 @@ larb20: larb@1b010000 {
 			reg = <0 0x1b010000 0 0x1000>;
 			mediatek,larb-id = <20>;
 			mediatek,smi = <&smi_common_vpp>;
-			clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>,
+			clocks = <&vencsys_core1 CLK_VENC_CORE1_VENC>,
 				 <&vencsys_core1 CLK_VENC_CORE1_GALS>,
 				 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
 			clock-names = "apb", "smi", "gals";
-- 
2.40.1


