Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CADC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSXShbI9Or2uREZSM6R/Nv0+n3Db1qfzHhiPhFy352Q=; b=oxKwzFGg6W+lyR
	ryQfKgvjiBs/CzOW9m/nno2PbYrC7NZ9GqjMFFnDnlNF36mTiVSUgMSSarrkZOHsAKWhEmIHupv3d
	SLpg3trdS9IcvhLxXkF6Hivmc86nOD0o+DYvxHpGzjbjbEDwxWadDfi/zXisk3D7DWGUNGRyMfWDm
	lXYq3pjYh6rwFJU+bKjWxFcVcRTHrwJr7ge0cgGImTL2Zi+Z4+7KdpDqxXcTdxlwuGYccLYEplXN0
	hnIw+fI6LuZSPmXe5QCPMcSdxE8Yh2w01HavPP1F5CvW/+AunYECrh1/TNtpV4PfQBW/bbbhupkpP
	Qfa1mHH+qjCcIGt/XrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ8cr-00Bk1V-DX; Tue, 29 Mar 2022 09:58:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ8ce-00BjyY-PX; Tue, 29 Mar 2022 09:58:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id w4so23952190wrg.12;
 Tue, 29 Mar 2022 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cqxr6OhCLAeis14Ai1MXs5IbZsdF6NcwLCK9JA8OCCk=;
 b=APkLu1nrcJCt/DUy6IoHQg+vXFfPUQpIBuInTdRsn9n+DSItES39e8hU5u3bRelbyB
 RymW7jdF2JhdotCR/QQ8OAdIj1/IPVJT3LXE7aiQ8rb+UPFgIdpFOk4U3DtB7q1wXliw
 8EgXvGen5NVyIzI5lgOQB7WSMNfyP9yN2RpYRxYm31LxnREzsSyd1tFUkQBRXjYWZu7o
 adexctW1y40/DCBI7WHJL6o0EY3bKZ/CY0zixRissxuynDmho4ND2RwV+qddNCW7QFWN
 Idce5bpc1guxX9+YSz309F2GuQNMRf4M3ZjEEKTMUK+Iumyrk8itZSVBpBVQRl+jl4kD
 XBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cqxr6OhCLAeis14Ai1MXs5IbZsdF6NcwLCK9JA8OCCk=;
 b=o2dZOhDJe0F/HlHt0cj/pM2EScq7BDNXno0wrdahN+hLWDohryrzmg3PtzqaugnvzN
 v/YZ7stWP2XjzupC8DDaQV02bBCIPKBaScGQ91VXpR3eyC4233c47P/JF4FgbBa+WQsO
 K0Rh8qLQ6Q1uh523yIgyKhyWEu451ogKltU9wypuoBnUFK1EyHOSGC4g5x+MeJZgy19d
 Mkp1/ETTRBHGA8IznH8J7PYoRtBngzWdJzTK3HnB9fQCTNUBDa4e+AS/TyC9hFLtcAp1
 tDXxX3MfRuM+HxGOHhozL/FHYbIS5aMt4fyNZpRvu/NWVY8WB1v/XS2k6ZEC9MLZhETu
 Q7aA==
X-Gm-Message-State: AOAM531ngCw+JOLcDJMEOlM3jc6q3syfejD1/DO2pIKbxRo5du8ip/Ne
 sn7GjBiRDRM8gbJt3ZEy+EE=
X-Google-Smtp-Source: ABdhPJzxnYdYXMhuUZ0oZHT2rxzYUX+MKBj+eCpNozcEdgx5kp2txaItFhIM1PdWk5f+lsuYwpzm3g==
X-Received: by 2002:a5d:588c:0:b0:205:7f17:3901 with SMTP id
 n12-20020a5d588c000000b002057f173901mr29825326wrf.359.1648547922831; 
 Tue, 29 Mar 2022 02:58:42 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c5457000000b0038c98c12ea9sm1812512wmi.1.2022.03.29.02.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 02:58:42 -0700 (PDT)
Message-ID: <9e4e1905-6c43-44c6-e812-58d802baf88b@gmail.com>
Date: Tue, 29 Mar 2022 11:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 16/22] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-17-allen-kh.cheng@mediatek.com>
 <70350446-9e89-3c7b-d515-22cb2ed5a9ca@gmail.com>
 <af19b42faf9a510578e48d6f497e7d2069327195.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <af19b42faf9a510578e48d6f497e7d2069327195.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_025844_870260_E4B49905 
X-CRM114-Status: GOOD (  21.60  )
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



On 29/03/2022 11:09, allen-kh.cheng wrote:
> Hi Matthias,
> 
> On Fri, 2022-03-25 at 16:22 +0100, Matthias Brugger wrote:
>>
>> On 18/03/2022 15:45, Allen-KH Cheng wrote:
>>> Add vcodec lat and core nodes for mt8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 61
>>> ++++++++++++++++++++++++
>>>    1 file changed, 61 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index 63893779b193..71ad3adeed51 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -1285,6 +1285,67 @@
>>>    			power-domains = <&spm
>>> MT8192_POWER_DOMAIN_ISP2>;
>>>    		};
>>>    
>>> +		vcodec_dec: vcodec-dec@16000000 {
>>> +			compatible = "mediatek,mt8192-vcodec-dec";
>>> +			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS
>>> */
>>> +			mediatek,scp = <&scp>;
>>> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>>> +			#address-cells = <2>;
>>> +			#size-cells = <2>;
>>> +			ranges = <0 0 0 0x16000000 0 0x26000>;
>>> +
>>> +			vcodec_lat: vcodec-lat@10000 {
>>> +				compatible = "mediatek,mtk-vcodec-lat";
>>> +				reg = <0x0 0x10000 0 0x800>;		
>>> /* VDEC_MISC */
>>> +				interrupts = <GIC_SPI 426
>>> IRQ_TYPE_LEVEL_HIGH 0>;
>>> +				iommus = <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
>>> +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
>>> +					 <&vdecsys_soc
>>> CLK_VDEC_SOC_VDEC>,
>>> +					 <&vdecsys_soc
>>> CLK_VDEC_SOC_LAT>,
>>> +					 <&vdecsys_soc
>>> CLK_VDEC_SOC_LARB1>,
>>> +					 <&topckgen
>>> CLK_TOP_MAINPLL_D4>;
>>> +				clock-names = "vdec-sel", "vdec-soc-
>>> vdec", "vdec-soc-lat",
>>> +					      "vdec-vdec", "vdec-top";
>>
>> Clock names do not match binding description. We have superfluous
>> "vdec-"
>> prefix. Same holds for mtk-vcodec-core. Anway I applied that patch as
>> the driver
>> does not care about the clock name. In any case it would be good if
>> you could
>> send a follow-up patch to fix the clock name.
>>
>> Applied, thanks
>>
> 
> Sorry, This is our mistake. those clk names should not append "vdec-"
> prefix from Rob's suggestion [1]. ('vdec-' is redundant)
> 
> Please drop this patch in v5.18-next/dts64.  I will send the corrected
> version.
> 

Ok, I dropped the commit from the branch for now.

> I apologize any inconvenience caused.
> 

No worries.

Regards,
Matthias

> [1] https://lore.kernel.org/all/YYFCaHI%2FDASUz+Vu@robh.at.kernel.org/
> 
> Thanks,
> Allen
> 
>>> +				assigned-clocks = <&topckgen
>>> CLK_TOP_VDEC_SEL>;
>>> +				assigned-clock-parents = <&topckgen
>>> CLK_TOP_MAINPLL_D4>;
>>> +				power-domains = <&spm
>>> MT8192_POWER_DOMAIN_VDEC>;
>>> +			};
>>> +
>>> +			vcodec_core: vcodec-core@25000 {
>>> +				compatible = "mediatek,mtk-vcodec-
>>> core";
>>> +				reg = <0 0x25000 0 0x1000>;	/*
>>> VDEC_CORE_MISC */
>>> +				interrupts = <GIC_SPI 425
>>> IRQ_TYPE_LEVEL_HIGH 0>;
>>> +				iommus = <&iommu0
>>> M4U_PORT_L4_VDEC_MC_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_UFO_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_PP_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_PRED_RD_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_PRED_WR_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_PPWRAP_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_TILE_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_VLD_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_VLD2_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_AVC_MV_EXT>,
>>> +					 <&iommu0
>>> M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
>>> +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
>>> +					 <&vdecsys CLK_VDEC_VDEC>,
>>> +					 <&vdecsys CLK_VDEC_LAT>,
>>> +					 <&vdecsys CLK_VDEC_LARB1>,
>>> +					 <&topckgen
>>> CLK_TOP_MAINPLL_D4>;
>>> +				clock-names = "vdec-sel", "vdec-soc-
>>> vdec", "vdec-soc-lat",
>>> +					      "vdec-vdec", "vdec-top";
>>> +				assigned-clocks = <&topckgen
>>> CLK_TOP_VDEC_SEL>;
>>> +				assigned-clock-parents = <&topckgen
>>> CLK_TOP_MAINPLL_D4>;
>>> +				power-domains = <&spm
>>> MT8192_POWER_DOMAIN_VDEC2>;
>>> +			};
>>> +		};
>>> +
>>>    		larb5: larb@1600d000 {
>>>    			compatible = "mediatek,mt8192-smi-larb";
>>>    			reg = <0 0x1600d000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
