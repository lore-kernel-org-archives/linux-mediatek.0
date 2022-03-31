Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 14:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67lGzjegQI3WSqGrWqBGEibML3OOWa1Lxto4i0jw+1A=; b=DzR5Z7numm3Ny4
	brhh6McwA8S8b+BUbRZO5WZx75t9faGLC6D+lGw5MHmPo6tkNJtBr4AIUdOa/90CWBfQnK7dv3NqE
	7A8jLD6tQfE9LhrZiiTW1HgBI+jm+7ERziTx97Qi/GPguLkoFYeohb7jMWhmxyiOPCNyLh/Vylr6b
	xg7B4/cCPpp/sQCo3JxWV0uim6Dhc8w64qGDf/74U1HCvlMAwQKXyUnl7V307BSfbA6fLZdz/albn
	NFlc8H5ssKv1BZCosyA2U2T9PoK2V77idDegzW9VIp/Coot4egvQx90hIQl5tBl2PoX+Kuj/h8bf8
	ac+nABf357v+Qu/i+QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZvfR-002ZJe-9q; Thu, 31 Mar 2022 14:20:53 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZveQ-002Yy6-SW; Thu, 31 Mar 2022 14:19:52 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso17234296otp.4; 
 Thu, 31 Mar 2022 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vm/tLIcwztm/cAKbFq5hHS63stt8moqDI9vFQVEX30w=;
 b=BacBToiK8uRJiYP8U49LBgQIIk48GIXBiDcFFbQX70JKSoZiVymsFSN84pgd2xGBUP
 I3hhs4i+5uCE3p+wCmcL+oJk+n/mLbzzymDDLXeIVLVU+o2pcWQHSsuE6Sq9TjyeaMi5
 FLt3FFJzp10/llYMGVcgIMsbUBKhefUl1PY3LUzM1rINwwg7Gb87cTpfA59pkFiW0Q6s
 K/SE5gAjNWlrL532/Ng+WvWcZ8dRsL+35hHVQ/sJ/gslQbFz26rIB+54RaRBuUqIMDLi
 VFTX/NBB5Wr0Y14Nl8nVs8bjFssMJrX2GRNq+yjFLZWwUq22gvirxt4jtWFCe/RTCTkX
 d0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vm/tLIcwztm/cAKbFq5hHS63stt8moqDI9vFQVEX30w=;
 b=5pt33JV7OAQKtFcXycCvjKhfuPHz/7BZmh7uZxnJ7vfY7W4I9ki+mI2yZsZxZ9kJ2d
 h+eZyIAHRffsIKsJU2vw5tNgCJNq1QKxAGamDGCUGFpfDNrISq5IGNN+Mjqvpnzj90Ku
 ZDNl05nT7biN2VtPBsWUWbQoNMYcjzHy8HIQ3ZO+1kfeyCOtVsvFbCKTf5Qc3wrPuWJx
 6xuixONucX2NJOZFiUqpTtJdEWHCzLzaTw+ARJt5zT5+lWlPqw6jUVOkjTvDghGEjxPY
 bcXzMFXRpIR63tp5qpH/hzPOvapqZvIiq+uPmRU/D4kxusk03FoqF+ZdqierkNfX2mC6
 NqAg==
X-Gm-Message-State: AOAM530NNY1FBRrSrL5A5A85lDkn5btrwVHZVDjhmTRYowxzRXLgXulE
 9kD7kFRh2gbUnOgshM7Evuk=
X-Google-Smtp-Source: ABdhPJxvaMnWlIqOGNm++kxUq/OI22tXvuvCi7hITtxpHtFZJ3FqhnurnjI95U9h2jczQz9rtAONIQ==
X-Received: by 2002:a05:6830:2b0d:b0:5cd:aca2:f3f2 with SMTP id
 l13-20020a0568302b0d00b005cdaca2f3f2mr5709703otv.212.1648736388863; 
 Thu, 31 Mar 2022 07:19:48 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a056830409900b005af164235b4sm11919171ott.2.2022.03.31.07.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 07:19:47 -0700 (PDT)
Message-ID: <68f66e54-e5e4-28ff-96a9-d4eaffc08c82@gmail.com>
Date: Thu, 31 Mar 2022 16:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/4] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
 <20220330133816.30806-3-allen-kh.cheng@mediatek.com>
 <4cd1c5fa-0982-0355-d5b6-7025b82174a4@gmail.com>
 <ccd28405c8f2c420354f3355fc9d4ef1dd7ea35d.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ccd28405c8f2c420354f3355fc9d4ef1dd7ea35d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_071951_001752_69872EAD 
X-CRM114-Status: GOOD (  17.72  )
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



On 31/03/2022 14:48, allen-kh.cheng wrote:
> Hi Matthias,
> 
> On Thu, 2022-03-31 at 14:02 +0200, Matthias Brugger wrote:
>>
>> On 30/03/2022 15:38, Allen-KH Cheng wrote:
>>> Add mmc nodes for mt8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>
>> You forgot to disable the msdc clock node, which I understood we
>> agreed on in in
>> v4. I would consider this change as an substantial one, so in this
>> case please
>> delete the reviewed-by tags.
>>
>> Regards,
>> Matthias
>>
> 
> Is it ok I send a new patch for this instead of a series?

Yes sure.

Matthias

> 
> Best regards,
> Allen
> 
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 32
>>> ++++++++++++++++++++++++
>>>    1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index 69e8d1934d53..c1057878e2c6 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -991,6 +991,38 @@
>>>    			#clock-cells = <1>;
>>>    		};
>>>    
>>> +		mmc0: mmc@11f60000 {
>>> +			compatible = "mediatek,mt8192-mmc",
>>> "mediatek,mt8183-mmc";
>>> +			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0
>>> 0x1000>;
>>> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
>>> +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
>>> +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
>>> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
>>> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
>>> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
>>> +				 <&msdc_top
>>> CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
>>> +			clock-names = "source", "hclk", "source_cg",
>>> "sys_cg",
>>> +				      "pclk_cg", "axi_cg", "ahb_cg";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		mmc1: mmc@11f70000 {
>>> +			compatible = "mediatek,mt8192-mmc",
>>> "mediatek,mt8183-mmc";
>>> +			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0
>>> 0x1000>;
>>> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
>>> +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
>>> +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
>>> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
>>> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
>>> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
>>> +				 <&msdc_top
>>> CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
>>> +			clock-names = "source", "hclk", "source_cg",
>>> "sys_cg",
>>> +				      "pclk_cg", "axi_cg", "ahb_cg";
>>> +			status = "disabled";
>>> +		};
>>> +
>>>    		mfgcfg: clock-controller@13fbf000 {
>>>    			compatible = "mediatek,mt8192-mfgcfg";
>>>    			reg = <0 0x13fbf000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
