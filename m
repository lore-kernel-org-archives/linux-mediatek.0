Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McR0+7huQOJEI8vf4lDqqIvCW7P7RCIN1cXUCzP4AgU=; b=IeZeNBdcUJOzzq
	fUPsToz/zU1dTwhQVo1x/TNnUbONlIGUruIzUh3xkFX/t9zIq7jRuIttxzeDqAJrOOBceyETSbdlf
	3/8kvbctAbpztV+nPvjDRlnWBuc8UgrXrxq1xG2XTFlA2sgENpETfexMWhTJe6lGO8aBUy8qHodSq
	7aB+JKloIUNkJJ3zkyO7xYoyQ0dLLzg7F+lC0giCGoybTMoZLZePFD2U70cYxLo+SRnnCl0yj08QV
	l04URStwuYqUBkRPLcDS7d8Ka0+BI7v1xq+fyIqfb8yeXGy0DQQ+Zd31fCNGdFfgdGN5o70tmo2ja
	OZnvhZ04fH6qbKoK3ytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZvW9-002W1p-14; Thu, 31 Mar 2022 14:11:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZvUY-002VIU-Gp; Thu, 31 Mar 2022 14:09:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1828754wma.0; 
 Thu, 31 Mar 2022 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=u5RKTCIhVT0UdLD5a9lBWqntnPr7pNgupr5inV4aYmo=;
 b=Ro4qjQTYngAIqa+KiR2jjeeqVbD7TQOphkTqAOd+zRTPfvi/q+DLy38lEFB9e/nctR
 r9C2zey8bGqfLiHcRW7nudtjsB3uqDnkfVwY4GCxL0hyhF2DUSO2dZ7J8Y9hVZ8ireHf
 vcm6KXCJPWnBVOzzcw0LaLO0gA4h9C4yzHZiGjjNnQyoTn0z3xpsQ4BpJ168c5kkz052
 LeHIMkk2tbZb0TretJ7hOKmyvl7hFwzGQs86zp5FhMo6h7HPnIRSgA+EEE0DJ8D3PxCE
 NhzyXk7ZeMi8LIDj84km1R83duFUydosQIamaHC/PBSv9tuCG2qOs+qHC1G4+ap+UG0R
 FoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=u5RKTCIhVT0UdLD5a9lBWqntnPr7pNgupr5inV4aYmo=;
 b=YDkfYzgD7WUlWdER+NIO3s85ZrYVUNKeKmOaW24nS28/lsaHbhX7NbAiKdrzYS0uls
 yDfHV1lia79SRTaGVI26hfez7FPt3HIRYj8H83JjoEpKN7BQ4exxmFgsyi2XAWApB/nP
 P7Y+fhEYPvUskEMbgwmyZ61znNtlkW25vyV2QWvaF4Ho8/2FBh9R8kRm/rs2ckv4AQgK
 Zxd7smX9u33upPnXR31fprLybOJ7ElwxOaeWY791Djfql4fob85zymIMnLeKoSjps91o
 DWTtUgcP2b1NcT8UzcdK7BUaAJx1Wr8j2O6MnRm79ZVStwPgoKQOjL7N4CJIs3uwPmXr
 Klkg==
X-Gm-Message-State: AOAM532yx0BTsyzqqsvE3i8D7T9x/Nzh5d7cIw79lXAkJlCbe1VoY6Fj
 MNvncJWSHwSA2+h2wskjzbY=
X-Google-Smtp-Source: ABdhPJzLW7IbufpTDK9sgCBrOuZXAxLCMbpjDk5nnxZ5Ix8pSN5DFz1+MRhK5/qsv/pHBDz4RHy+2A==
X-Received: by 2002:a7b:c925:0:b0:38c:82d7:868d with SMTP id
 h5-20020a7bc925000000b0038c82d7868dmr4701164wml.100.1648735776562; 
 Thu, 31 Mar 2022 07:09:36 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a056000144f00b002057eac999fsm20704386wrx.76.2022.03.31.07.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 07:09:35 -0700 (PDT)
Message-ID: <4452dd35-d4f4-66be-807b-7277cfd9a57b@gmail.com>
Date: Thu, 31 Mar 2022 16:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
 <20220330133816.30806-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: mt8192: Add vcodec lat and core nodes
In-Reply-To: <20220330133816.30806-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_070938_670863_9280A90E 
X-CRM114-Status: GOOD (  17.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/03/2022 15:38, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Please drop reviewed-by as of comments below.

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 3d61238fb102..0b2b52a8f5ed 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1115,6 +1115,66 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>   		};
>   
> +		vcodec_dec: vcodec-dec@16000000 {
> +			compatible = "mediatek,mt8192-vcodec-dec";
> +			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS */
> +			mediatek,scp = <&scp>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;

Change that was not part of the changelog. Please mention any change you make to 
the patch in the change log.

> +			#address-cells = <2>;
> +			#size-cells = <2>;

Binding description says address-cells and size-cells should be of value 1.


> +			ranges = <0 0 0 0x16000000 0 0x26000>;
> +
> +			vcodec_lat: vcodec-lat@10000 {
> +				compatible = "mediatek,mtk-vcodec-lat";
> +				reg = <0x0 0x10000 0 0x800>;		/* VDEC_MISC */

I suppose we would need to fix the reg value here then. Also IMHO the comment 
can be deleted.

> +				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +				iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4>;
> +				clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +			};
> +
> +			vcodec_core: vcodec-core@25000 {
> +				compatible = "mediatek,mtk-vcodec-core";
> +				reg = <0 0x25000 0 0x1000>;	/* VDEC_CORE_MISC */

same here.

Regards,
Matthias

> +				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +				iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +					 <&vdecsys CLK_VDEC_VDEC>,
> +					 <&vdecsys CLK_VDEC_LAT>,
> +					 <&vdecsys CLK_VDEC_LARB1>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4>;
> +				clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +			};
> +		};
> +
>   		larb5: larb@1600d000 {
>   			compatible = "mediatek,mt8192-smi-larb";
>   			reg = <0 0x1600d000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
