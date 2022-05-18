Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A520C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaZKxHJMNQN0ATvpO3h9kTp0jd6Xuv5e+8jo/n/yYdA=; b=pyIn4vvMoqMLEJ
	zMS2uvkETJDOQgHJug5c8jxIGef3Kd9lAGJSj/HCXGvMPR9fLJnqrqQN+mkCpTqSkmdN50QSK1Nv5
	Rvu5Wkz31k2p6+itqEo6Opu2fYdy5OJwhFvI34axu8TDBusRKJzeOOUyD6pEli34MAKw6Z0ju7v3C
	JsTHkSY3cAQtGI7PR3l0OVtR3GqaS5ipW5Knr/vBr9ySTeYTS3/KaqUtDmdXxWNWq1LLU0gKVAFWy
	zNYPK9K3eDi0y+Dgf4SU4sC+6tz7OXmpwfnceYovxrl+0UoavokDW5FwRLFEThUkhKNo1FKs6docF
	kHdF/pE56Blb0S4AJSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGaH-001FmR-Jh; Wed, 18 May 2022 10:07:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGYQ-001Egl-NL; Wed, 18 May 2022 10:05:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D048F1F44E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652868314;
 bh=+xTyEZ131wWMOMNxSY33aVPVZoxl3tqtIBcQv4cQtYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D1vp+/AwIas/9dOAytAhqaGYFF/9ac9nRiYcMReBB49LkaAcP31lRYdpULf1VS1SF
 cEjTybeVHaZFAHgwxqh11jciQsrb28ENTeg8dN5Q/7YFOCncRGirCbQGQpDMVg1q0M
 HUZQZcn6afPA0ez9BITloBRac7pIwBiFAEo02wOsBn+jVRBFzUEeMpFoqM9pCp2llZ
 osCTplyIdDD0KUAgaGhqpaRNs4n20bmze5pCBC9YDjnGHNsheMqmDzOa3UvAmA6V24
 uGMk40rfjHouEFuxGi0ku4uD2F9dygsDLroKK1o6+NPYQxLNQEjvW0dzA4VGw6f0wZ
 +8Gj0vRtIV0Yw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/7] arm64: dts: mediatek: mt8173: Add mediatek,
 infracfg phandle for IOMMU
Date: Wed, 18 May 2022 12:05:00 +0200
Message-Id: <20220518100503.37279-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_030518_933914_1A7D6639 
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
