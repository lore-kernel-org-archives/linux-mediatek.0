Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E58C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlo3GlfxkySRQfaKF0rOQvn2lMy6FTcAjbFtEaA9IPs=; b=H/560FlvpAqGVZ
	I1laSKmLiLTpHnMwebjsvpoL4LAcJsEf0mRTSnvLmq//85mBXZ9i9G23T9cFqpfvjj7UBySsWM0tn
	A6Tp/gvp8X37MVpcYVOiuC8z18RUtmKWSqw1JRIvIprsZmdC1uakehjAb9Hxd3MFg9+EnX8GbHjX0
	zvr9raMhi/3YBHaqI3vWhe89Wkbr3TFuGf0BY+2E1UvKcKw/3Au8gZsUhFQihXimdz9ePqIt+fex7
	ksjX9FhMpkcGbheM6NOBgkqtvrH1lCxpcY4v2vutZvpyI4m2wPOohn+YN/82jArthBVlcESuMldfb
	2A3J1X9a3RAefEoYwCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxM1-00DxF0-CW; Tue, 17 May 2022 13:35:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8Z-00DrxU-40; Tue, 17 May 2022 13:21:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 124DE1F43486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793677;
 bh=CgNYAOaieQLCVcum8jYWv0FFa/H0G4zrGj0sGsj1tXw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fSBaRyI6hnMhzOnk7Qp0Ysns7gPUpTUzRMIMj694El0CyT8qbgolMVkEpkBpzrtIk
 yNZIE7eq0Nbgo0c0an2FgIb2c0ciV4pEbQF8ZOSNq+nNZKN6Aql2OHLkz88WGk9pfB
 Md4Z9YLSK/U8pIAcrlPauRO9xLO+nayomT4d+bbyi1hM7/NLovW3MjWLwPMPYigFpu
 MugKE11JhgWjrruYhJoZuumEQKclpr7xzzyBQtsZQ1XQIELAistppfKN89g3PI5ukz
 fRZlj1xfXf6Oua1iryHxkyASM0L9G57c5BosNNF/fJK9yXkVEC6JkMM6xA8EYMPrNs
 ySLA+v4OILXkQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/8] arm64: dts: mediatek: mt2712e: Add mediatek,
 infracfg phandle for IOMMU
Date: Tue, 17 May 2022 15:21:05 +0200
Message-Id: <20220517132107.195932-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062119_339868_18962D3B 
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
