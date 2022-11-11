Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9906C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QviO7g0X9TaU2BPfKXn+/uDSwn9+ZcxkSHMkagSvBQ=; b=BUUYm+1cORhg1V
	C58UaiXDjMVrNi8U298hHLKVAXjp8Vj7sLnrKCMO35A4bFqpr7j6ec/FJwABEep1+dAjYwwvdF/ay
	PEcveVaN9IuPC0Yet9/3nz1rsYcF0ioI3e3W9E2Buzoj6fBaN+pbJhB2ru1o+mOpqDPjrusbAqwXS
	NdUHTiAGg4YVHB+dVmX+XRLUnf6+rvtPf2F1iNzFTwkRcmc8AywwZKDg49kdp2+BgdHe7nBzlpnIY
	slDiw3S9S02xytHpXL2Q48+CloMPVPaWSlThaHPQMLTXwdB+0UfNrJqH255a4sUDtgdDVqXc9jaux
	H9p4BN646w1QgFVKayYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPyq-00EUSl-Ut; Fri, 11 Nov 2022 09:05:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPyo-00EUQn-0J; Fri, 11 Nov 2022 09:05:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id w14so5600419wru.8;
        Fri, 11 Nov 2022 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QviO7g0X9TaU2BPfKXn+/uDSwn9+ZcxkSHMkagSvBQ=;
        b=XH7/0SMYFxcygZBP/lXF+7e071JADn9twF2Wzsu12Te92AbupuMte1rSifd+asp7zY
         m7ZZ2eKEOK8HhQYGiAIqYQXpyRljjlMXVfstuvWKERhG3gJnDgdSPB0K8JXrnxD7Kk+2
         0uvQRV5C4MFPOSgA3jhqSBPaS6l98ohw1nHuLHRipMSzEGVI1B4c58RM9TlM7AoMx4k3
         ZXbg1AUUduuFtWLNmWmPNDUVr4kUejMwnwFQbbRq05nZf+zu49I/dY+T8ZITK51DPGYk
         f2IFeKYc/YOR4Q7vTpztl13WvEtiOCY5uInpO9olCCpTD7yIboP4gupAqNBm1IvPUfbk
         lxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QviO7g0X9TaU2BPfKXn+/uDSwn9+ZcxkSHMkagSvBQ=;
        b=fwn3LD5BFazDYnTvl/BiZd3yixwf3GIAnasuuUlArbFX+RA3ggqlFaeE/QLT0eIt9C
         bHqF1y/01I2eF1ir/YsF1xHKpavW6ivg35fas0JnoUma8M5LrC7XMGKUUDGWQeq3JVaP
         VOb3Vitr6UEUh69JYlk4AcYsfj7qzrzjmFQlb1beuwTFLHCbQY6GMKiL+9QOSV6ygq6g
         Wby/XwZpHh/cGPD7t5FoH/ANVU9O6aF0MUweZX7eJegL0Fk2Zl95I7g7lyI/qUKNIbpC
         JKBSl+XTUs5ajkBsXkapdItchVmBUw1ObhTLjXvAxlWzg0mxv0qfXGQ4vVvhj7QhMu1k
         RQCQ==
X-Gm-Message-State: ANoB5pku6FDwIzD6W0CbQM+eOFlQDEF388b33vn1TfPMiM3Y+PzkXDiU
	WvZEA4BvWzjsHwKYjsZWVaA=
X-Google-Smtp-Source: AA0mqf63UJilBtZakUaPTB0dgbaIiRLdllAsQExluAwwAkE1d1Fc1dH/wnYZ/0v9nOHk7xNr/uBT4g==
X-Received: by 2002:a5d:4841:0:b0:22e:38b:95ff with SMTP id n1-20020a5d4841000000b0022e038b95ffmr610851wrs.202.1668157540379;
        Fri, 11 Nov 2022 01:05:40 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c1d9900b003c64c186206sm2203693wms.16.2022.11.11.01.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:05:38 -0800 (PST)
Message-ID: <a9273083-eb34-6415-132a-621ec7703d92@gmail.com>
Date: Fri, 11 Nov 2022 10:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 01/11] arm64: dts: mt7986: harmonize device node order
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-2-linux@fw-web.de>
 <d38f8b81-b62e-18c5-1bd3-d1bc1f2b98d9@gmail.com>
In-Reply-To: <d38f8b81-b62e-18c5-1bd3-d1bc1f2b98d9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_010542_071688_F0698638 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/11/2022 09:55, Matthias Brugger wrote:
> 
> 
> On 06/11/2022 09:50, Frank Wunderlich wrote:
>> From: Sam Shih <sam.shih@mediatek.com>
>>
>> This arrange device tree nodes in alphabetical order.
>>
>> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Applied, thanks!
> 

I realized that
wed_pcie: wed-pcie@10003000
is'nt ordered correctly. Please send a follow-up patch to fix that.

Regards,
Matthias

>> ---
>> i modified sams patch
>>
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20220427124741.18245-2-sam.shih@mediatek.com/
>>
>> by moving pio-node up instead of moving uarts down to ensure alphabetical
>> order for switch-/wifi-node.
>>
>> And moved uart0 and wifi in mt7986b-rfb too.
>> ---
>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 94 ++++++++++----------
>>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 22 ++---
>>   2 files changed, 58 insertions(+), 58 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>> index afe37b702eef..6189436fe31d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>> @@ -54,6 +54,53 @@ switch: switch@0 {
>>       };
>>   };
>> +&pio {
>> +    uart1_pins: uart1-pins {
>> +        mux {
>> +            function = "uart";
>> +            groups = "uart1";
>> +        };
>> +    };
>> +
>> +    uart2_pins: uart2-pins {
>> +        mux {
>> +            function = "uart";
>> +            groups = "uart2";
>> +        };
>> +    };
>> +
>> +    wf_2g_5g_pins: wf-2g-5g-pins {
>> +        mux {
>> +            function = "wifi";
>> +            groups = "wf_2g", "wf_5g";
>> +        };
>> +        conf {
>> +            pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
>> +                   "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
>> +                   "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
>> +                   "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
>> +                   "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
>> +                   "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
>> +                   "WF1_TOP_CLK", "WF1_TOP_DATA";
>> +            drive-strength = <4>;
>> +        };
>> +    };
>> +
>> +    wf_dbdc_pins: wf-dbdc-pins {
>> +        mux {
>> +            function = "wifi";
>> +            groups = "wf_dbdc";
>> +        };
>> +        conf {
>> +            pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
>> +                   "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
>> +                   "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
>> +                   "WF0_TOP_CLK", "WF0_TOP_DATA";
>> +            drive-strength = <4>;
>> +        };
>> +    };
>> +};
>> +
>>   &switch {
>>       ports {
>>           #address-cells = <1>;
>> @@ -121,50 +168,3 @@ &wifi {
>>       pinctrl-0 = <&wf_2g_5g_pins>;
>>       pinctrl-1 = <&wf_dbdc_pins>;
>>   };
>> -
>> -&pio {
>> -    uart1_pins: uart1-pins {
>> -        mux {
>> -            function = "uart";
>> -            groups = "uart1";
>> -        };
>> -    };
>> -
>> -    uart2_pins: uart2-pins {
>> -        mux {
>> -            function = "uart";
>> -            groups = "uart2";
>> -        };
>> -    };
>> -
>> -    wf_2g_5g_pins: wf-2g-5g-pins {
>> -        mux {
>> -            function = "wifi";
>> -            groups = "wf_2g", "wf_5g";
>> -        };
>> -        conf {
>> -            pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
>> -                   "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
>> -                   "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
>> -                   "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
>> -                   "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
>> -                   "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
>> -                   "WF1_TOP_CLK", "WF1_TOP_DATA";
>> -            drive-strength = <4>;
>> -        };
>> -    };
>> -
>> -    wf_dbdc_pins: wf-dbdc-pins {
>> -        mux {
>> -            function = "wifi";
>> -            groups = "wf_dbdc";
>> -        };
>> -        conf {
>> -            pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
>> -                   "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
>> -                   "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
>> -                   "WF0_TOP_CLK", "WF0_TOP_DATA";
>> -            drive-strength = <4>;
>> -        };
>> -    };
>> -};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>> index 3443013b5971..7459ddb6b6f0 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>> @@ -25,10 +25,6 @@ memory@40000000 {
>>       };
>>   };
>> -&uart0 {
>> -    status = "okay";
>> -};
>> -
>>   &eth {
>>       status = "okay";
>> @@ -99,13 +95,6 @@ fixed-link {
>>       };
>>   };
>> -&wifi {
>> -    status = "okay";
>> -    pinctrl-names = "default", "dbdc";
>> -    pinctrl-0 = <&wf_2g_5g_pins>;
>> -    pinctrl-1 = <&wf_dbdc_pins>;
>> -};
>> -
>>   &pio {
>>       wf_2g_5g_pins: wf-2g-5g-pins {
>>           mux {
>> @@ -138,3 +127,14 @@ conf {
>>           };
>>       };
>>   };
>> +
>> +&uart0 {
>> +    status = "okay";
>> +};
>> +
>> +&wifi {
>> +    status = "okay";
>> +    pinctrl-names = "default", "dbdc";
>> +    pinctrl-0 = <&wf_2g_5g_pins>;
>> +    pinctrl-1 = <&wf_dbdc_pins>;
>> +};

