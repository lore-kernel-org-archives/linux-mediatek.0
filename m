Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FB5C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e+fHXRd7p++LprNOAwracDYP4MJevZalRcYoppYUYSo=; b=MHBRrfoBxvRnLw7eYDle0795q2
	oBCdAst4RNqV0Id7+AABYiD5MSqKbD8fvYnmp3KSQYXZ/nQxIRfZKpzMRbPIh/+QycHXiURJANst2
	bQorbmE8LIP3Grj9HGHwAe34Xd1rPWmglWxUj0UOTT+JBaW9XPvWKvvmJ6pA2vveeIorV3Rei9Z3T
	7doKzoDOeGxwyiydCXfBorX9gTZ7+2pfIfi9BMkbVXD59346At+5AqF7Y2NPmkvzxgYQ7j34nGXON
	5wQmH1mVO4YooRhlliaZ5JJ3CuYQ6SgmuTIH/NAXndOQmV+wwSKQgIYGQYA/caNg5iPUm0vVqXrdu
	Nb1rEK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwhJ-00HWID-0A;
	Wed, 20 Dec 2023 13:33:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwhD-00HWGY-2v;
	Wed, 20 Dec 2023 13:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703079189;
	bh=/UPfNwo0qoGJbrXtvl2TR/jus2hvpz31Qe5IC0w5A2c=;
	h=From:To:Cc:Subject:Date:From;
	b=xtpP4bgflfX1fY3Td2eH9fzxt0R8XHPB2Ys/fVeu10em5VQI3vV1hsRTjFXSppnkF
	 ceuac2A+CKLBbmwW0Oxegbd+RjBKJJzHJILBfY04dkkFLu99ri8LX+rWfgSLtV31tC
	 4wR698rKUKmyjvNylnfZj52cooP+7cKSMqSnlrXS8HAW48LVvs31Oz5omyzkeqbkx2
	 aZlpsEAD3eVAhLQaoH9Jqn7FMoHg5WptJo+VvdACwUCcEkAA2dEdEPdYPdAwynfCCd
	 wryarHvNPy849UyTaU+H1NLHWarHUvpl87I4l3ljo7ebtUHJ9aMVB+HOxZrLvSn1D6
	 xC+eAn3hrFBMg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2EAD93781F8C;
	Wed, 20 Dec 2023 13:33:08 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	matthias.bgg@gmail.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8186: Add video decoder device nodes
Date: Wed, 20 Dec 2023 15:33:02 +0200
Message-Id: <20231220133302.39411-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_053312_092884_83AA8B36 
X-CRM114-Status: UNSURE (   8.39  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Add mt8186 video decoder device nodes.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
[eugen.hristev@collabora.com: minor cleanup]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---

I based this commit on top of the video encoder patch series.


 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index ebd07bf3d9d2..e451b6c8cd9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1959,6 +1959,43 @@ larb11: smi@1582e000 {
 			power-domains = <&spm MT8186_POWER_DOMAIN_IMG2>;
 		};
 
+		video_decoder: video-decoder@16000000 {
+			compatible = "mediatek,mt8186-vcodec-dec";
+			reg = <0 0x16000000 0 0x1000>;
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+			iommus = <&iommu_mm IOMMU_PORT_L4_HW_VDEC_MC_EXT>;
+			mediatek,scp = <&scp>;
+
+			vcodec_core: video-codec@16025000 {
+				compatible = "mediatek,mtk-vcodec-core";
+				reg = <0 0x16025000 0 0x1000>;
+				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&iommu_mm IOMMU_PORT_L4_HW_VDEC_MC_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_UFO_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_PP_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_PRED_RD_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_PRED_WR_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_PPWRAP_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_TILE_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_VLD_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_VLD2_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_AVC_MV_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_UFO_ENC_EXT>,
+					 <&iommu_mm IOMMU_PORT_L4_HW_VDEC_RG_CTRL_DMA_EXT>;
+				clocks = <&topckgen CLK_TOP_VDEC>,
+					 <&vdecsys CLK_VDEC_CKEN>,
+					 <&vdecsys CLK_VDEC_LARB1_CKEN>,
+					 <&topckgen CLK_TOP_UNIVPLL_D3>;
+				clock-names = "vdec-sel", "vdec-soc-vdec", "vdec", "vdec-top";
+				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3>;
+				power-domains = <&spm MT8186_POWER_DOMAIN_VDEC>;
+			};
+		};
+
 		larb4: smi@1602e000 {
 			compatible = "mediatek,mt8186-smi-larb";
 			reg = <0 0x1602e000 0 0x1000>;
-- 
2.34.1


