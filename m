Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C405C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUL2O9wbBAu6ztSDG3ElgZvx99nzcRnOeYgEYBuGPRA=; b=3nxJHSFnw3EoxfjlxOu8YVhmFf
	QeIQNKVzflXeaI20hpFcKZi8kXdLNPTRbKvocqnx38vLB8O7DGnyEWZIMz875X/MaotVljAcoo+1R
	qncESEU4H9Ru5j6QJ0l+NcDOMvlKlgvNLh40GzuguclJ7/oeY0ArCNSCmZ+HrcuzWaDatogzQwZdc
	0V0IPoTtFR/NuM1vRmfnwql1qCWwS37kik6h3TZ+dGlG9I2rIgHDfl9MAYyEu8LX9y7r7hpLw/O3j
	I6eizNwmDeIJPiUk5P8jAI8Z/xzgQ0GS4QWSP3sWGfwuH3jftcJX+2QfJuVULUIRiOuiqW18ct+L3
	l9V6sNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0d7-002M3A-0g; Mon, 24 Oct 2022 16:48:49 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0cw-002LzJ-26
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 16:48:40 +0000
Received: by mail-qt1-x82d.google.com with SMTP id bb5so5929546qtb.11
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUL2O9wbBAu6ztSDG3ElgZvx99nzcRnOeYgEYBuGPRA=;
        b=EEmIXtqXupNZGMQusrGu9cSwDxciaaGSv2LhhL0tX6byMmK28IsBk8c6ClWRq6lYkA
         5+dolwExw1XyN7N2ZUnUo6goPkhL7uOXaTIp+47CzWhPnD5qROzOOFZav4k7YHRwqMEH
         FUMPtqxOPxGTW4BVMVkUU5EW2Xr8k2N+TpV67Fm2aVZNsQK2YGa5ARYpVK2ZvjpFSstW
         5LGsb9+H93HpawF9AoNVTC4rjX5VhkPFm7zaO/rvKQjhCs45phjNvhnsoAZmagQcq/C/
         HnRdp7bCxBKgaIB0yVFB18J5KwAXnMljceuUkDgw1IMXcatnvOp8r7QAReZIeerM+SnW
         dxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUL2O9wbBAu6ztSDG3ElgZvx99nzcRnOeYgEYBuGPRA=;
        b=t3Zx2wJQsot9ODc5t6eOOqZLNizJlg8PEsgqhTMhnkPeKE2m9GEFzazPpWbmf2I4kZ
         /xo5uzdHxXZlhhBIQyPI4LExZeyRlxcLkQlmsQERRdJmHUw1hhQNncOMhClswcKb+WhL
         q3591K1wx88YsjqO/+6LM7yZwk6Vz1C4D3Ua+rQ9A7zn51tMgqkh42t9Rh86cOxv37pk
         UyGHUgJjAF8RSW/tF4pqbn+GXHFNeAB08Ncxnux3QmE4JV8VRQSVHNfI+9b4i6OTRlaj
         HStkr8cxUlR+sWbDc2CsY/AcuApzorJorLA8ef7GYWCNXELO57235qQVq+Xue1BR5kKb
         cPzw==
X-Gm-Message-State: ACrzQf0GpWTk2RTT9695Pb6mMhB6MhbTbMWE7LvWwdJrUKtlAeT+Gn/e
	kbdvQvF2c/Ft/OO/1UO2l5X0Yg==
X-Google-Smtp-Source: AMsMyM57TE1ja12+inLNwlTcq5BSzAd/+4nM91OaJJGzUPwVHrd3YNRlGWdmd5z78YjGbtZPGpbilw==
X-Received: by 2002:ac8:5c11:0:b0:39c:fd77:336d with SMTP id i17-20020ac85c11000000b0039cfd77336dmr24199445qti.479.1666630114992;
        Mon, 24 Oct 2022 09:48:34 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q8-20020a37f708000000b006ce0733caebsm279848qkj.14.2022.10.24.09.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 09:48:34 -0700 (PDT)
Message-ID: <0b9d7768-3f30-c084-9a14-f439cd49d643@linaro.org>
Date: Mon, 24 Oct 2022 12:48:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Aw: Re: [PATCH v3 3/7] dt-bindings: mmc: mtk-sd: add mt7986
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221023091247.70586-1-linux@fw-web.de>
 <20221023091247.70586-4-linux@fw-web.de>
 <a0121e0a-9f62-8630-45c5-d32eaa91d46f@linaro.org>
 <trinity-95441a68-0025-49de-8c73-9730fb9cec42-1666623320110@3c-app-gmx-bap55>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <trinity-95441a68-0025-49de-8c73-9730fb9cec42-1666623320110@3c-app-gmx-bap55>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_094838_111171_C044215B 
X-CRM114-Status: GOOD (  13.18  )
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

On 24/10/2022 10:55, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Sonntag, 23. Oktober 2022 um 14:56 Uhr
>> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
>> An: "Frank Wunderlich" <linux@fw-web.de>, linux-mediatek@lists.infradead.org
>> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Chaotian Jing" <chaotian.jing@mediatek.com>, "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Wenbin Mei" <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
>> Betreff: Re: [PATCH v3 3/7] dt-bindings: mmc: mtk-sd: add mt7986
>>
>> On 23/10/2022 05:12, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add SoC specific section for defining clock configuration.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hi,
> 
> got another config from mtk which requires changing binding a bit
> 
>                        clocks = <&topckgen CLK_TOP_EMMC_416M_SEL>,
>                                 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
>                                 <&infracfg CLK_INFRA_MSDC_CK>,
>                                 <&infracfg CLK_INFRA_MSDC_133M_CK>,
>                                  <&infracfg CLK_INFRA_MSDC_66M_CK>;
>                        clock-names = "source", "hclk", "source_cg", "bus_clk",
>                                      "sys_cg";
> in binding:
> 
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -241,15 +241,17 @@ allOf:
>            items:
>              - description: source clock
>              - description: HCLK which used for host
> -            - description: AXI bus clock gate
> -            - description: AHB bus clock gate
> +            - description: independent source clock gate
> +            - description: bus clock used for internal register access (required for MSDC0/3).
> +            - description: msdc subsys clock gate
>          clock-names:
>            minItems: 3
>            items:
>              - const: source
>              - const: hclk
> -            - const: axi_cg
> -            - const: ahb_cg
> +            - const: "source_cg"
> +            - const: "bus_clk"
> +            - const: "sys_cg"
> 
> will send an updated v4...old version was working but i should use the new one.
> 
> @Krzysztof can i take your RB here or should i leave it as Patch was changed?

Please drop my tag, so I will re-review it.

Thanks!

Best regards,
Krzysztof


