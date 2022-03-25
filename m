Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfKbmRSuFyatuNxtQD9U+CKtqRna0nJjzkVzGy2f/lY=; b=Tr1w1Lg+N2x+Gr
	ed6cU5DkhOhHg47DM3IoFdY7Lmk7zPxM7zn2W7ZvYG+2phtwIttRfDhUxXe4v1umGScb2lS57LoT9
	knsadq0qrpjb02Y3HBRVc7FrUrA4KtBL7CpSrSBzGz/1MfTfj9hCsLWubADWsMLQRIi9SgJ3aF/+X
	E1zC0pgfn30S1JDO6A95+eNlPt/T8SJW7kOa7514FG18vvEfvrtt9APuJZpqj5E8yyV00MFk+8nrw
	Bb7IqO6n44uJidRL2H14rDiTJLZxokY5C8E0hdHIXNhHtwSGjcGZIjO/UGYO+wBhw8r7izlSEoxjG
	+I+5rsLFSHMSaJWlQ21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXlly-002RJh-3O; Fri, 25 Mar 2022 15:22:42 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXlll-002RI2-Qh; Fri, 25 Mar 2022 15:22:31 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id e22so6439401qvf.9;
 Fri, 25 Mar 2022 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nr3DeqonwwMb9/SDbQnlHBzrqz5hNGIQ0bi9+OQD5LE=;
 b=I8ihO790T510KhQJWcw/xy+FXCvvY800WdiGxnAuxv+9UIxYIcbk5qRfa96ASujkqD
 YnLZBrFUJdko3+qJHqcLnJ8YKCVn03Dt9d/vk7FYZbZJjzTmr8cfAe80fjbtx2Ufao3T
 g820Zhc8CIFXmNolov7zEknYK3M08mP4OzHHiE0lBjG7BC+7SM0opObd0cvKjoEXz0O6
 xw68ll2dP6cmRcgZjAA3QlD8qZ7zRsT3iMwzMmmUcEg1U+DEVYbuQtxaqW9Ol/yqDS+s
 roA+gOkfJ8pbbZrGvRTH+Lk4oWUoJW/uGpdSgoCZwV4eulIV/XjaAfPm4rjAk1aFmxhI
 tO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nr3DeqonwwMb9/SDbQnlHBzrqz5hNGIQ0bi9+OQD5LE=;
 b=LxzGJx/W5ZeAsNIWJHV4e/tPlzPr/4yvGSVLJwAeaQhUyoOC+UN4AgeNehngLLqhfy
 OMj6UCVn6DVt9lXJ5RdR23TrthAx1OPwDEnkmDly2Wy2YAxLFHnT8DobXMz6pmVRjVRv
 wGcTYYJmWmy3USL+HVh5kjD8S5HoqYJ5Zwp9VYgB0DGMi00eDx9SLQEtPdEP90u/JFOa
 PqprlPECzLAhPkUzP6SZIPx5V6PZrL2WkDb/T6HOUcRKdj7FuI6/aTY7dAln+FjvVw/y
 s36Xga+H6iWDjQ0VZeTBG6NQDo2jcdn7/3M6OYEhYeavPsCwZ7qgi70BNOAsf8R9rWB9
 Qp7A==
X-Gm-Message-State: AOAM531qwhlPRbQfsseh8780PM/amOq6GpWe+TGpAhuRFZKkTexRw9i3
 6lxUKvFAZGf6icykoJS14+xiU5rbgA4b9A==
X-Google-Smtp-Source: ABdhPJytk6+Rgin+foiO9o9b3FUr7XdAI6fUfyHnb/q+96PuY8usYRfj3OG1kDe0fWKXu9O0cBZuiw==
X-Received: by 2002:ad4:5a11:0:b0:441:1485:33ff with SMTP id
 ei17-20020ad45a11000000b00441148533ffmr9233225qvb.127.1648221748311; 
 Fri, 25 Mar 2022 08:22:28 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05622a038800b002e236535929sm5327375qtx.32.2022.03.25.08.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:22:27 -0700 (PDT)
Message-ID: <70350446-9e89-3c7b-d515-22cb2ed5a9ca@gmail.com>
Date: Fri, 25 Mar 2022 16:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 16/22] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-17-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-17-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_082229_908838_C0549D0F 
X-CRM114-Status: GOOD (  17.41  )
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



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 61 ++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 63893779b193..71ad3adeed51 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1285,6 +1285,67 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>   		};
>   
> +		vcodec_dec: vcodec-dec@16000000 {
> +			compatible = "mediatek,mt8192-vcodec-dec";
> +			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS */
> +			mediatek,scp = <&scp>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0 0 0 0x16000000 0 0x26000>;
> +
> +			vcodec_lat: vcodec-lat@10000 {
> +				compatible = "mediatek,mtk-vcodec-lat";
> +				reg = <0x0 0x10000 0 0x800>;		/* VDEC_MISC */
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
> +				clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +					      "vdec-vdec", "vdec-top";

Clock names do not match binding description. We have superfluous "vdec-" 
prefix. Same holds for mtk-vcodec-core. Anway I applied that patch as the driver 
does not care about the clock name. In any case it would be good if you could 
send a follow-up patch to fix the clock name.

Applied, thanks

> +				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +			};
> +
> +			vcodec_core: vcodec-core@25000 {
> +				compatible = "mediatek,mtk-vcodec-core";
> +				reg = <0 0x25000 0 0x1000>;	/* VDEC_CORE_MISC */
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
> +				clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +					      "vdec-vdec", "vdec-top";
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
