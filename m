Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E50C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZ91eMB5wYeySoFf+07M0y2HuJe4FWjN7MxfbScqXTc=; b=vt8OEV80u5yw/Q
	7kIc2zhAk0vRzKDnUlTPTlnXFB315hQ4veRJbAfQmSNQdlJppzr/u0tnVvgzbZ1YSG54kloFsMQj+
	1+NlXgeCzc4vHy8YGd5k9h3yUVYeQVOsGnN1E6n+2BEQtpi0J/aNtv4KWB0VMpWOi7ObKTogQEXDW
	BgaDQgDa3wqADHcqh72Bg8m7H2quomDP3haNpQ992bd1FhHi4Gz+ZB7nrN2G3LAb3kQ2fJVMLWmHm
	cRtV85qDjDt4ZRkgJf9CVTEs3cvoShjEfxLHx+IgE4+XWh+wWGVp50xJ5lN9qyEv+afT3ACdZwljA
	5HQzxyyQbmeX019LbDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMkM-003WLU-TT; Thu, 09 Jun 2022 18:19:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMkB-003WF4-T1; Thu, 09 Jun 2022 18:18:57 +0000
X-UUID: 424e7c55f80d4ff0a8eb54e2ab8f8e59-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:226bca1c-b000-4a74-835f-29856a4d59bc,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:48ff49e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,QS:0,BEC:nil
X-UUID: 424e7c55f80d4ff0a8eb54e2ab8f8e59-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 743595470; Thu, 09 Jun 2022 11:18:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 11:08:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 02:08:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 02:08:45 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
	<joro@8bytes.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<krzysztof.kozlowski@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <will@kernel.org>,
	<yong.wu@mediatek.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
Date: Fri, 10 Jun 2022 02:08:45 +0800
Message-ID: <20220609180845.31195-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220609100802.54513-5-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_111855_962982_856711E7 
X-CRM114-Status: GOOD (  17.05  )
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
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index 623eb3beabf2..4797537cb368 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -329,6 +329,7 @@ iommu0: iommu@10205000 {
>  		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW>;
>  		clocks = <&infracfg CLK_INFRA_M4U>;
>  		clock-names = "bclk";
> +		mediatek,infracfg = <&infracfg>;
>  		mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
>  				 <&larb3>, <&larb6>;
>  		#iommu-cells = <1>;
> @@ -346,6 +347,7 @@ iommu1: iommu@1020a000 {
>  		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW>;
>  		clocks = <&infracfg CLK_INFRA_M4U>;
>  		clock-names = "bclk";
> +		mediatek,infracfg = <&infracfg>;
>  		mediatek,larbs = <&larb4>, <&larb5>, <&larb7>;
>  		#iommu-cells = <1>;
>  	};
> -- 
> 2.35.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
