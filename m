Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23766C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zS0xTMXLEMBDIfQDjNebJ5IXzJnW9RrbHojzTjOzro=; b=jkjgCpjkljEkUe4ZzN31gGXi2w
	gkPAR4ERFWYEqG+FpUlr25OfidUEhQu4KdSMa6TMuM98vlkCe7zRxw8WNreSRvL0FWaPYXo6bsU/w
	hBiISkoc1tZkWw87XLdE7vhWa+ECggnNVMf/qpi6RtfpQh7RoOsGwiD0ZdR7z+vRVm8rIJ0ohTkWw
	TG9igck1YvtuMKmQgicqJhzdcQmk7bdhJBH5cDNPtaMxn4g4agmQ5k28Ro+g+Z3OXwRysl4J6ab3+
	mS17rFeWiCuqBnS9huHGJxkXAhILmaKxmqxoNEbnxPL25ymZMEZ8GFEYzYghCozWS2aclP4j8Ts7r
	1qnGVCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOEF-00EZUo-1G;
	Wed, 13 Dec 2023 12:20:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOE7-00EZR9-03;
	Wed, 13 Dec 2023 12:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470032;
	bh=BYmcEgaBo5I1IXZr2Bp32/w8YdhWfM9/oRB+PHkjY7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JS2mVMjISMIkLCwLDBK+frDTRB6utKwa+Cz7KGcUHrevMT1OIAO1bimOhP3kAa/Z0
	 J4kYwPCiOy6V/xClOuS3wtnjLSEW/Y+liR3MecZhpsoXm5nXRvYOv6buyq+f0tNYDE
	 bSvZeoqf//eX9EQWfhwGXv0FA+gHddeqgBQ0wYSWrVsIGVcphglJkFsr8xkN7/UA9i
	 +sAsblsELT4GxZhUNniDZQ8VKN74hWP46gtpXTy3KVEniKIoav2vHt0n+kAKfnmLKX
	 SR+XPbXDCqpM+k1FEtD+MGvD31J+ZTha+jvSKVfUHO/YsqN3a1R4S5gYjWnOZatFgQ
	 ElRalFyb5YGMw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 396543781488;
	Wed, 13 Dec 2023 12:20:31 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	Kyrie Wu <kyrie.wu@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8186: Add venc node
Date: Wed, 13 Dec 2023 14:20:17 +0200
Message-Id: <20231213122017.102100-4-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213122017.102100-1-eugen.hristev@collabora.com>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_042035_216079_3C53FB48 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Kyrie Wu <kyrie.wu@mediatek.com>

Add video encoder node.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
[eugen.hristev@collabora.com: minor cleanup]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 66ead3f23336..8535ff2b44e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1993,6 +1993,30 @@ larb7: smi@17010000 {
 			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
 		};
 
+		venc: venc@17020000 {
+			compatible = "mediatek,mt8183-vcodec-enc";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg = <0 0x17020000 0 0x2000>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L7_VENC_RCPU>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REC>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_BSDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_SV_COMV>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_RD_COMV>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_LUMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_CHROMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_LUMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_CHROMA>;
+			dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;
+			mediatek,scp = <&scp>;
+			clocks = <&vencsys CLK_VENC_CKE1_VENC>;
+			clock-names = "MT_CG_VENC";
+			assigned-clocks = <&topckgen CLK_TOP_VENC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.34.1


