Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDE6C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5A7AA5AGzQgiddXc+3zjziCkgb3+uWLboNJsEFjyjw=; b=VOtb7BZSd8/B0uh4Z1+iRqMplT
	MgKZgMhxSubrOUUICZBkOUEA+xuYhxjeZFgjFdfkeKjh5h62rx0knGY9+6NvKBb0Mgy7+BDofbiGY
	0/iiu1ueMyermlsQNEC71JCLbr/oan9NHPO9JaBTxAj0FJE6alds0tt1vU5Jx+1djMo/MpmYaWe5N
	dLozhIRVyuWbneTf9+2Xcmm3+QNNTSJI6mHB3f9XYhpwcLJeYf4kDM7ykHoAzJPh/HxOGkZWtXCJ6
	xRw0qENDkxKK37AYMN0QfpN91zjfZxhbcDSdN/Vhj1OukYEtuFB3duttDVqP2HYELUkEZzH/VEd1q
	4pfJSi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nNd-0020UU-PU; Thu, 16 Jun 2022 11:09:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nMh-001zyH-SD; Thu, 16 Jun 2022 11:08:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DB10C6601755;
	Thu, 16 Jun 2022 12:08:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655377722;
	bh=bxI13qYR6i+Qbu3k0FjubHCH9lucInKe+lBf6R85H4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SU7bp+YuqjQvSEWyPZ80x4Ek4Eb2q/aHXqf5vRtCA1X8e7bqnvd0aaNVjf3eYR6D/
	 b22pDjD7cpHquZu/ko2QgcHmr8y+jLM98NKj973KxJg8mCbgwcxdF0cgo+szu6eseV
	 e+RziHxVQaZ8Ds8Ja1WH1wijmVTf/43nMGwtGlxKeq4xYWW7yAE6/8LQ864y8xj1Hc
	 FFZFdirB4hUmB3T/ztjUrFL6MaXMImQBul7ohbKRiScy8hvrwZuFSodpNjQQdhMzTO
	 CZJQ5cnK+sX1WnhHMdXvSP/rEsPn6XScmlammVvFedur2hX9OsDXKrAOnh4qaawl++
	 IoYi7THqnsQLg==
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
	miles.chen@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 4/5] arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
Date: Thu, 16 Jun 2022 13:08:29 +0200
Message-Id: <20220616110830.26037-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_040844_081019_3B64BB98 
X-CRM114-Status: GOOD (  10.55  )
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

The IOMMU driver now looks for the "mediatek,infracfg" phandle as a
new way to retrieve a syscon to that:
even though the old way is retained, it has been deprecated and the
driver will write a message in kmsg advertising to use the phandle
way instead.

For this reason, assign the right phandle to mediatek,infracfg in
the iommu node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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


