Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B865C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYlFhP5YqNlN+T6Z0p+BCk0p9RCo5f0uf575ehkoRRU=; b=ziYZvTR22U/FUo
	rXwycADn6pGuRSOJdgVbj6HHtHiIgfYfUyGP5oM6OtC/VJ43NMIjwX5npXwKCwukmebyo48guFIC1
	id9dL1MPXYmOIyKQYvPgHhlBU+mm0OEn7KbgPMTWnwYCdw7DZk9dkCsjAbb9jrXf0j/d5JDKePM6t
	MofUsZKEZ2ziuIx101B7Ru9oBEeTK4Q+CrsgU2slHuv5w1cUt0aUKdPXMfPVt9waD2sdoWyKHBz8w
	X31BlKy7FWjI5f5MPG3GHnk+YFnMcbpCP6WPXgY8lwFboocknLgbCcqQDGP5cLnQVC1KIIk+ZPKAs
	+RWST2oQxzF8bT5ZjGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMY6-003Rav-Fx; Thu, 09 Jun 2022 18:06:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMXv-003RVr-By; Thu, 09 Jun 2022 18:06:16 +0000
X-UUID: c124a923bd514918b1f7fe8c998f1630-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:53c93d0d-96af-4dbb-a584-c36ece3d43e9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:c6ce49e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,QS:0,BEC:nil
X-UUID: c124a923bd514918b1f7fe8c998f1630-20220609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 363654327; Thu, 09 Jun 2022 11:06:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 11:06:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 02:06:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 02:06:05 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
	<joro@8bytes.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<krzysztof.kozlowski@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <will@kernel.org>,
	<yong.wu@mediatek.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
Date: Fri, 10 Jun 2022 02:06:05 +0800
Message-ID: <20220609180605.31142-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220609100802.54513-4-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_110615_448480_65C4A911 
X-CRM114-Status: GOOD (  17.31  )
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

> The IOMMU driver now looks for the "mediatek,infracfg" phandle as a
> new way to retrieve a syscon to that:
> even though the old way is retained, it has been deprecated and the
> driver will write a message in kmsg advertising to use the phandle
> way instead.
> 
> For this reason, assign the right phandle to mediatek,infracfg in
> the iommu node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 40d7b47fc52e..825a3c670373 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -588,6 +588,7 @@ iommu: iommu@10205000 {
>  			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&infracfg CLK_INFRA_M4U>;
>  			clock-names = "bclk";
> +			mediatek,infracfg = <&infracfg>;
>  			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
>  					 <&larb3>, <&larb4>, <&larb5>;
>  			#iommu-cells = <1>;
> -- 
> 2.35.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
