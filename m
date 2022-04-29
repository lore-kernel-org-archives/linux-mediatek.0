Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E490C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7Y8THLbEk+M5EBnKALaE8qiCTwc2xTHC/bjTaZrWWQ=; b=aLeD8M+PxMInbx
	O4HXf1xFAOwt1XwBIMJpcWl5jjx7otK/s63OQ/MOo2kisjv5CKAEHlL1TtuSteErzHeZLYs3N4sXA
	zin1Su5LhtyL9YHHT/2ZdkcSUz1dVoCm+4RP/E//WveOxhbYg8Nk8XSNeD5dWrBZDEtuPdm6sS0oE
	2CjehyRO0EILm9ZnuOzJGW/NKK/4DWONyF1xw/RmDCWJR5u/o89QuvxM0sol3ZiK/b8u/PYVK9goq
	/vpWibYRJfLiCPosj+aAZ4RB/FFyhG/y3YVedp3oXrlG+B8Tn8SZ7jfkHgOsC+6RtZN9hzzSqvsnn
	G8SUd4u/IsKylgmSCxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkRAv-00BTaf-2T; Fri, 29 Apr 2022 14:00:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkRAj-00BTZM-VO; Fri, 29 Apr 2022 14:00:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id w4so10886618wrg.12;
 Fri, 29 Apr 2022 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UXw9dRUog+dEg/XP99Hw1iqvRPucaZ7bzcG1rwJHhio=;
 b=YBd0+nTmzcoM2bp3hiXsuMNdPweajYXNtZrZPbniRjboy65K24zviiuLtMl5mJj60Y
 lGp3dU3D8okBn+ixe9o2sRzIW+TV+YaQp2DH7qI5AbiMQ5NPw044NSExSv8Wi8f+OyrT
 mm2TpGZewa0FjO4w6wneZ7n7gckwh1FVfTOWtx4grI94mq8uZhPbMjkEgbWyfE3+Pzb2
 HX3ZpJviFMo4mVpYilbLYEogCNK92s/Y1ll50Xv/GRNdgn3OTx/5Pp8+8HmBjg4tsCN8
 OHCH0rIySZ1wVcH4CI1ny32UzRDqzLISbA6fsM4hRJdAx4A2tleff3aa4juuguNGAYeN
 ieLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UXw9dRUog+dEg/XP99Hw1iqvRPucaZ7bzcG1rwJHhio=;
 b=4VapBSkYR4hPf7lPzmoYIWdSgdn1BIUFXxr8e26i2MOuq1jy84s4eX8N9aMhtjZcJI
 3k8l03RaIjSsbvZ0/0UKCIIn+4JBSuy1fGUITZGdour8/loK3qwZJYB6XOYD/6H0ccvX
 ZlvbvAElCFdfY8cmoGtwVvne7BvJyPLHUeJKU47/aKdQ9ohAGarhIAhFevhMQtCP3rvJ
 XfRPTL6SvHzA6hnxq0MxySuh2/JlN16JYBN0JyPLVYkqSw02i9Xs1RSyvl2ZGPVr1vWl
 OAUDoyFAD0oYc5h+EOOBcaVhGYnfdIq2cyvzCWEbwACorDoLFvMxSRWR1rusQp68xHHZ
 YS1Q==
X-Gm-Message-State: AOAM530dMD1WbkYzRqMBuZl2+hFGYZB8CJhCMP7+x8Q6IYIamiO84i8Q
 7nDQgyvRaIexMv7qJawJcRk=
X-Google-Smtp-Source: ABdhPJzUbO5VBiVmnymikmHFglcyLkJ2PMGYgcMmAt5zqGiCuS9Z+l25Ny/E4zFagkiIjHOEMjVlwQ==
X-Received: by 2002:adf:e8c1:0:b0:20a:e116:408a with SMTP id
 k1-20020adfe8c1000000b0020ae116408amr17196519wrn.672.1651240834295; 
 Fri, 29 Apr 2022 07:00:34 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 m6-20020a1c2606000000b00393fbf75a56sm2631655wmm.29.2022.04.29.07.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 07:00:33 -0700 (PDT)
Message-ID: <f4256b5e-e6b8-f9de-fe97-3e9c6cdcb00c@gmail.com>
Date: Fri, 29 Apr 2022 16:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt8195-demo: enable ethernet
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220426134106.242353-1-fparent@baylibre.com>
 <20220426134106.242353-6-fparent@baylibre.com>
 <c0cf89c05ee708ec3648b267c1c0a0baa1331836.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <c0cf89c05ee708ec3648b267c1c0a0baa1331836.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_070038_082080_C2AFC3BA 
X-CRM114-Status: GOOD (  13.54  )
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



On 27/04/2022 08:25, Macpaul Lin wrote:
> On Tue, 2022-04-26 at 15:41 +0200, Fabien Parent wrote:
>> Enable ethernet on the MT8195 demo board.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 108
>> +++++++++++++++++++
>>   1 file changed, 108 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> index 08cab3b3943b..0b7985486e2a 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> @@ -80,6 +80,30 @@ optee_reserved: optee@43200000 {
>>   	};
>>   };
>>   
>> +&eth {
>> +	phy-mode = "rgmii-rxid";
>> +	phy-handle = <&eth_phy>;
>> +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
>> +	snps,reset-delays-us = <0 10000 10000>;
>> +	mediatek,tx-delay-ps = <2030>;
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&eth_default_pins>;
>> +	pinctrl-1 = <&eth_sleep_pins>;
>> +	status = "okay";
>> +
>> +	mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		eth_phy: phy@1 {
>> +			compatible = "ethernet-phy-id001c.c916";
>> +			#phy-cells = <0>;
>> +			reg = <0x1>;
>> +		};
>> +	};
>> +};
>> +
>>   &i2c6 {
>>   	clock-frequency = <400000>;
>>   	pinctrl-0 = <&i2c6_pins>;
>> @@ -260,6 +284,90 @@ &mt6359_vsram_others_ldo_reg {
>>   };
>>   
>>   &pio {
>> +	eth_default_pins: eth-default-pins {
>> +		pins-cc {
>> +			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
>> +				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
>> +				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
>> +				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
>> +			drive-strength = <MTK_DRIVE_8mA>;
>> +		};
>> +
>> +		pins-mdio {
>> +			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
>> +				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
>> +			input-enable;
>> +		};
>> +
>> +		pins-phy-reset {
>> +			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
>> +		};
>> +
>> +		pins-power {
>> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
>> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
>> +			output-high;
>> +		};
>> +
>> +		pins-rxd {
>> +			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
>> +				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
>> +				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
>> +				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
>> +		};
>> +
>> +		pins-txd {
>> +			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
>> +				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
>> +				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
>> +				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
>> +			drive-strength = <MTK_DRIVE_8mA>;
>> +		};
>> +	};
>> +
>> +	eth_sleep_pins: eth-sleep-pins {
>> +		pins-cc {
>> +			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
>> +				 <PINMUX_GPIO88__FUNC_GPIO88>,
>> +				 <PINMUX_GPIO87__FUNC_GPIO87>,
>> +				 <PINMUX_GPIO86__FUNC_GPIO86>;
>> +		};
>> +
>> +		pins-mdio {
>> +			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
>> +				 <PINMUX_GPIO90__FUNC_GPIO90>;
>> +			input-disable;
>> +			bias-disable;
>> +		};
>> +
>> +		pins-phy-reset {
>> +			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
>> +			input-disable;
>> +			bias-disable;
>> +		};
>> +
>> +		pins-power {
>> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
>> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
>> +			input-disable;
>> +			bias-disable;
>> +		};
>> +
>> +		pins-rxd {
>> +			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
>> +				 <PINMUX_GPIO82__FUNC_GPIO82>,
>> +				 <PINMUX_GPIO83__FUNC_GPIO83>,
>> +				 <PINMUX_GPIO84__FUNC_GPIO84>;
>> +		};
>> +
>> +		pins-txd {
>> +			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
>> +				 <PINMUX_GPIO78__FUNC_GPIO78>,
>> +				 <PINMUX_GPIO79__FUNC_GPIO79>,
>> +				 <PINMUX_GPIO80__FUNC_GPIO80>;
>> +		};
>> +	};
>> +
>>   	gpio_keys_pins: gpio-keys-pins {
>>   		pins {
>>   			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
> 
> Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>
> 

I get the following error:
Error: arch/arm64/boot/dts/mediatek/mt8195.dtsi:582.26-27 syntax error



How did you test?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
