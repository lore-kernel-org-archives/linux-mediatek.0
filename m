Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0042C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9QMhP7RuJ2vD98LLNWsEKcc2ULPtmnhBoh1bvFxOtQ=; b=mDixTFw2tcGnOX
	Wsps0AkhWTevrNuxfcwhKWWeU5rVWHQ/pObl4M+2wCEyOI9OhCPqGfSZgoLRv4YqOWDwjZL/qFPfz
	QSIJUFWuHfyARe1rhfLzufTXiTdiUHDVFquNWsm3kEhFOs44+CeE/879T5co0y4aqa/6u8acpHpnF
	PBqkPSG6AJeCL1Pa0KL5lXw/fKAHC5fDSoAfFbYxP6RjTvdhxofnvKcui4A9gSSb+yVEPnzsgGPCR
	4GA8jQ2L3yCe3XZAHvOddZXi1bsS4FMVPXZwoX4pzYGuAGtS77au5oCdO0SZ5X9w9SPWDlUBG0hBP
	VeLcm6BJnqu2IGntIg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtb7-0029Hi-4I; Thu, 31 Mar 2022 12:08:17 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtau-0029Dl-E7; Thu, 31 Mar 2022 12:08:05 +0000
Received: by mail-oi1-x22b.google.com with SMTP id e4so25002345oif.2;
 Thu, 31 Mar 2022 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GzekprHvhU9HqCe2Q2SnOEP07QMEYok2g4o+xh2TZn4=;
 b=XWnMOZa96XHZi26Qv90uHAyVOPG1F9C3ajBPJi/wzZD0+zyoc2Pj0h8l5HjrUoaBJt
 lrLglpe9ZQ/WLQtJoJ/stUfGSkjHc7u4eJUD7JigH97q2Pp2krOHghCpdL08qVdXsdYF
 7cZMd7pVTVxeBFBpDp3RHSH8y5qIVEG50Hr2I6dQNlAo8aflehlBUZ5yQrseQBgnCBNJ
 ouR+PjilooHqXhbDwxJCdupK+7fCGVvEe5vnZguMucBjlQoVF0/8ZG5sFD1dehI5Lr0t
 P1btM+6KIKaXYx53LYtTU7nMbVIkgeI/YufNTt/a+AMjhpuEkqmHVfic9Y5pFE/gPvlu
 q71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GzekprHvhU9HqCe2Q2SnOEP07QMEYok2g4o+xh2TZn4=;
 b=3tSI2zjVHqW8GO2SMxGXFe+4zjqrXrtnDK6PsN3k+E/H5Ty5nwVPf/vQEbLRHW6k41
 Bl2HnH/fEz0TGqK/erGcbIHuDG1KylrL/2VHjTEPElStI40c4SnwBBQdyGA2sBmLtKkb
 XNnS8MZ6k0nhQ4+qZHrMFgMz5LAenSw5PU/BK+rwTyylV7pl5hmZfB4i04IL/5tVqCbR
 A7+EU3L4kwvqou8ZhieRxt7VaB4XvJh0gLW1c3MkDfbqSoV5LZzZsxUkyhjNe4n5w/8X
 KSAWsfDZvGDud6BmV2z0VeqsEC30kWhceBuUAPhrUm8I85EPBrb4QD0aWjNsVM/qfadm
 PRPw==
X-Gm-Message-State: AOAM530tHuc9AAABxhqTxwJOthoT00ZMEcfQb6GP+iAx1DT64bycp3DD
 nNN4HgyaaFhkhrutAyj+/J0=
X-Google-Smtp-Source: ABdhPJwqbyLW/OnZh9P63G9u0hNBlNmj4xyBFk34d0it8CaipwI8ohODOz//5NdFBPTZgUaZH3JvaQ==
X-Received: by 2002:a05:6808:13c9:b0:2f9:2cf0:932a with SMTP id
 d9-20020a05680813c900b002f92cf0932amr2436272oiw.39.1648728481068; 
 Thu, 31 Mar 2022 05:08:01 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a9d7853000000b005cdbc0f02ccsm10578954otm.68.2022.03.31.05.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 05:08:00 -0700 (PDT)
Message-ID: <1483ffb9-ef39-0974-10f8-37b7a7a40225@gmail.com>
Date: Thu, 31 Mar 2022 14:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 3/4] arm64: dts: mt8192: Add H264 venc device node
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
 <20220330133816.30806-4-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220330133816.30806-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_050804_521686_99341B7A 
X-CRM114-Status: GOOD (  15.50  )
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
> Adds H264 venc node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I told you in v4 that I'll apply it, but it's not in the repo. It seemed I 
accidentely dropped that one, so I apply it again now. If you realize something 
like this in the future don't hesitate to tell me :)

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c1057878e2c6..3d61238fb102 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1166,6 +1166,29 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
>   		};
>   
> +		vcodec_enc: vcodec@17020000 {
> +			compatible = "mediatek,mt8192-vcodec-enc";
> +			reg = <0 0x17020000 0 0x2000>;
> +			iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
> +				 <&iommu0 M4U_PORT_L7_VENC_REC>,
> +				 <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
> +				 <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
> +				 <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
> +				 <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,scp = <&scp>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
> +			clocks = <&vencsys CLK_VENC_SET1_VENC>;
> +			clock-names = "venc-set1";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +		};
> +
>   		camsys: clock-controller@1a000000 {
>   			compatible = "mediatek,mt8192-camsys";
>   			reg = <0 0x1a000000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
