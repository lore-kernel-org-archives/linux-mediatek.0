Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64111C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlo3GlfxkySRQfaKF0rOQvn2lMy6FTcAjbFtEaA9IPs=; b=rJIXhE9h9UIDxT
	px8nB5I099IDtcuyg5TqKy/g7HupVJxmteHrdJR2Ihx37izZa30yTxMPoX53KhRqJX1GbCjX3T2GE
	lim+d5xSXkjb1gTlUO2pfp2/2K94wGJFNCk79+4fUfxR0tZc+fLYh0v4u+VAlUppfuyGLRleoN+yQ
	owZYCnGT9qQeGD7ax7bQewOl2VOpcS8rGhEoG6rd4QCG3BFGlc+FJm/zb/0ebCR+frwrB7BcPj5IX
	rOhdpDTK6LCVaKnqDbeszEeHM0RFXGb21bQC/SZnTxwC483qUDRKvdjLhJvdKftmRX7B3H+05WaJs
	c9gkEfTzo/4tkRVU5gIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF6f-000scL-Eb; Thu, 09 Jun 2022 10:09:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5I-000rkF-Qf; Thu, 09 Jun 2022 10:08:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E996F66017CB;
	Thu,  9 Jun 2022 11:08:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654769291;
	bh=CgNYAOaieQLCVcum8jYWv0FFa/H0G4zrGj0sGsj1tXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4v9L0EwV6ZsghUeg0tMGf6fhREdFwlSxn5OIdaxyAuxixlQ4vc1mzjV5mAiMi/0S
	 Y3WXyYPd5tu9/AhpTbDVMRDqtHIkAD9u8XCJtHJ0M4R5Vx41+7VZI5lkjfagzYkXBf
	 FYA8CDWVDbT13PoUBpcVoVXTi+lypmCRFqqQzicyUgtTCOBYsHDd19KU9nWfupPSKp
	 NnML1F+R9cf9+URrZzLDaTkg0aUKxsjzbtMz3Dfe2MKnICQY8o+9L/126eozTriZ3a
	 5dqcZDmn1GD8GaG/PgCqGYCcEi/AJlcZWRmdRQP4mBPofkwleHAMeQi0NjgSWnBXRl
	 W2OGPbpFxLcbQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 4/6] arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
Date: Thu,  9 Jun 2022 12:08:00 +0200
Message-Id: <20220609100802.54513-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030813_042681_3E85B5D2 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The IOMMU driver now looks for the "mediatek,infracfg" phandle as a
new way to retrieve a syscon to that:
even though the old way is retained, it has been deprecated and the
driver will write a message in kmsg advertising to use the phandle
way instead.

For this reason, assign the right phandle to mediatek,infracfg in
the iommu node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 623eb3beabf2..4797537cb368 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -329,6 +329,7 @@ iommu0: iommu@10205000 {
 		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&infracfg CLK_INFRA_M4U>;
 		clock-names = "bclk";
+		mediatek,infracfg = <&infracfg>;
 		mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
 				 <&larb3>, <&larb6>;
 		#iommu-cells = <1>;
@@ -346,6 +347,7 @@ iommu1: iommu@1020a000 {
 		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&infracfg CLK_INFRA_M4U>;
 		clock-names = "bclk";
+		mediatek,infracfg = <&infracfg>;
 		mediatek,larbs = <&larb4>, <&larb5>, <&larb7>;
 		#iommu-cells = <1>;
 	};
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
