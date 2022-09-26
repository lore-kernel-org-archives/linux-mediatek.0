Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2096C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 06:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88T3QSCNULaKDxiPghKPnQRDxL4OOovXa9Ho2BaB7s8=; b=0JvVHnfvUoapCQTAXzk3A2ZxZA
	D4RuXMb3CwIpbSH1KoF+QpDiNOG4rTn8giJzMMKPEd1sQDo1gHzNXoVbV5H/KswCdmJPpiW02GzO2
	/oJyQgVcj1CUvCbdpQ6rku6sz8/4iQJt9AbKPr+h7idA1e1VnsbJG28gkd97ragXYiuI3QqX3gIjz
	mpq/XmrhfMS33tfskv2O3wHvTIy8VEVGt26ORr8SCmNLvWVGFxvij1k2yvdhFO/ElzLfxLO08BlS4
	Eq4pJapufjNVPq/QQSjLSBT0ezZfpErzi5u9wVzjUHwxubgE0grL9MbNrhAdM7/Rzbfq3EtPuvPrt
	BfXAyawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ochvM-002U4P-0g; Mon, 26 Sep 2022 06:49:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ochtw-002TIC-Nm
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 06:47:39 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y8so7612471edc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 23:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=88T3QSCNULaKDxiPghKPnQRDxL4OOovXa9Ho2BaB7s8=;
        b=g/e0p3noU5zZHf8DNPX1uUNnyjvgmp+4LVsZB5fu7/mc2jlvplhjx063ltZa5zgJ/t
         ZNg0JoMxFk3t4OnZqyT2rZZi1ax70PwFNx94dxy0Ot56HFvX+8/4o1rxumpbjqinMzSK
         JZtOnVTsXaocMtLpSHrOsP3HdSmTOl3yh+ObM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=88T3QSCNULaKDxiPghKPnQRDxL4OOovXa9Ho2BaB7s8=;
        b=tTeiZ23a7k9n5xjgPVWo3mI4prCD5F/AdHji7UgPZfDTxvzum8nP7EvLYEVd4MScjz
         G/qWzuf9MsDMQcekHT7jhDbisWTkoY3uQ8K3pT4hs8K7kxrQ2y6vHYaeBVD/Gcp02nwq
         tjpHJhfUNJBh9Yef+5wdvejSOyIGLpW5q6Nu3zzI71aJ2Bc4dRppOx4egZlSaSK6LCv9
         7BkgHq/+KmLUWCcwPZXUrF6aURLNL5q6WOotny4Xj4AQlkxfm8EikvhmxQS/A5YawJST
         cDQqDDSTbgMu4QNaw785ArWTkJt3kclcTKwnt4XLFPJ/Pp/teQnuAqGdSUVScg6dWjoV
         aYBA==
X-Gm-Message-State: ACrzQf1n+AGdIy6vtJuOCB06Dke07aCIn4S4JsJVuVT7r18gqa9SF362
	s9QlZQhvHc3owy6WTuevasn5OIrygPO8a2Qf6kAg4g==
X-Google-Smtp-Source: AMsMyM6RbECMtGrbbPAST+i21qjBet8HNCxVGnIE11peeASsQM5EtaznB/yehtxnAh9MTAiy9ZNvfVmi7qNk5dmne1A=
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr20513160edz.71.1664174853143; Sun, 25
 Sep 2022 23:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220923114658.8286-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220923114658.8286-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 14:47:21 +0800
Message-ID: <CAGXv+5Hx31PWVU-uz0araW+jYX-s+_HXph-ZAPa6eMPn0LQ+Bg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8192: Add vcodec lat and core nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_234736_865743_AC1CB49A 
X-CRM114-Status: GOOD (  15.63  )
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

On Fri, Sep 23, 2022 at 7:47 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add vcodec lat and core nodes for mt8192 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> This patch is based on matthias.bgg/linux.git, v6.0-next/dts64
> [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..aa6524948e7c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1449,6 +1449,66 @@
>                         power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>                 };
>
> +               vcodec_dec: vcodec-dec@16000000 {

The device node name should be generic, so maybe "video-codec@"?

> +                       compatible = "mediatek,mt8192-vcodec-dec";
> +                       reg = <0 0x16000000 0 0x1000>;
> +                       mediatek,scp = <&scp>;
> +                       iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +                       dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges = <0 0 0 0x16000000 0 0x26000>;
> +
> +                       vcodec_lat: vcodec-lat@10000 {

Same here.

> +                               compatible = "mediatek,mtk-vcodec-lat";
> +                               reg = <0x0 0x10000 0 0x800>;
> +                               interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +                               iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +                               clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                                        <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +                                        <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +                                        <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +                                        <&topckgen CLK_TOP_MAINPLL_D4>;
> +                               clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +                               assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +                               assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +                               power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +                       };
> +
> +                       vcodec_core: vcodec-core@25000 {

Same here.

ChenYu

