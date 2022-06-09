Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD08C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaZKxHJMNQN0ATvpO3h9kTp0jd6Xuv5e+8jo/n/yYdA=; b=cTCZAqI+L0z/Dq
	X322iyJqwMVLitisFuxzF14WNXD/mhVrDUERMvzyqLPXYxBlwodadwQzYXWVR299drO5P9cuqThKM
	WhY5lMtMBRE5whh9uWi2d20Km88SJvVLKiBG3WZDHF0wXQfXOkHBpDtTZIjC6F3E8IO8gfaV/IrPE
	Ao0Su9r9nCnVwv4FON311qyFKGESzHsO1xWWZOhshAv+EZCQSa6sK6Vjb7lZJsXA8zlJouhrOC1Oe
	eGEAknZV5lT1LuBb8zeynyvBbiInUqncUcnw8mmVH/2bCGMB3xmpWMdeWO55QP439IIG/5BjtvMvl
	SAlqPlrHp+LVC2tkYxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5o-000s1K-4U; Thu, 09 Jun 2022 10:08:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5I-000rkA-LY; Thu, 09 Jun 2022 10:08:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1688E66017C9;
	Thu,  9 Jun 2022 11:08:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654769290;
	bh=+xTyEZ131wWMOMNxSY33aVPVZoxl3tqtIBcQv4cQtYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jQ0LgA4FXh4NTGt0fqXLzSjxIk35Va6Sa6B0gJWMushLSqFJg+Beh7Vh63EhvpMo4
	 fuXid8sXiUvv3dDi3aEtR8bq2XpIxEb/JrYdMrQvnUebHVs7U78QSk+eJ3U714kw2Q
	 F1BFsAYbMp+RW5xnnwEDa1RJEiNeFaU172kpfCQykCEeeUuMzFgjPH/44RgW057BBw
	 Qo2hcx51zaqJKORLQEDJG2y5Dyf/mSeWazI1F8DhTXw+AfxpfWFXQDe5jia4ERIhhj
	 Hi1PPJPHHw9wBPd+BXVki8npxPB8Dp+TL0dpmqz6Fx9fVp7tv2/mr9o2jSlpBPgmVt
	 Lo5bOD9XU5+AA==
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
Subject: [PATCH v3 3/6] arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
Date: Thu,  9 Jun 2022 12:07:59 +0200
Message-Id: <20220609100802.54513-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030812_928110_C1868781 
X-CRM114-Status: UNSURE (   9.92  )
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
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 40d7b47fc52e..825a3c670373 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -588,6 +588,7 @@ iommu: iommu@10205000 {
 			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&infracfg CLK_INFRA_M4U>;
 			clock-names = "bclk";
+			mediatek,infracfg = <&infracfg>;
 			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
 					 <&larb3>, <&larb4>, <&larb5>;
 			#iommu-cells = <1>;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
