Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3578C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Nov 2022 22:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DejAkKVANtN+Gn7CtQB2BM1M5Gg2Igelqp1H0xZD8K8=; b=mBSFFelA8MudPnRv3eijOteIIE
	Ot9Z49BVKpQ1DslHvp3YLXknBjWdYXqgynNLuQq6AbY0/M+jlu301a8oUmcCMLUQW8qx5jgSjhIYy
	KQO9ZmaQqoqxLfF7IfjP6ML5Brr2A42lm6pvNdikSw+TnmLtlJg05pR6rPOHI6UfOEbnJ7hk/J4OL
	wbNARj7ICIXHrf9U9lOjCHz3AtHDOB+v+XwrmDjcwODJepPep5ZrQIpgqky+QeKy26R4jHiuPjpjc
	6I0qHVQaUeKTlxk1LFCdNQWmIdjsL4dKbjVR8wYUjfTKHPA+BWff2CVzrXhEBSvacIqk7JZ8Vfbz0
	jbDjY4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouLT4-00EeC5-NJ; Sun, 13 Nov 2022 22:28:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouLT0-00EeAW-AI; Sun, 13 Nov 2022 22:28:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 203-20020a1c02d4000000b003cfd7f339bdso156782wmc.0;
        Sun, 13 Nov 2022 14:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DejAkKVANtN+Gn7CtQB2BM1M5Gg2Igelqp1H0xZD8K8=;
        b=ThCbd944EnlEnU0ELIRidN8c9d4ACPhsff8izbu9n59l+Kf2pUlLoNoSt/tJ4UDESZ
         CxaAgcz8RuNjGLyJgEz0n2HvFtvvxPiMIsrs5g2YAOrHI7Md3MdovTmxnSVF/THRU3UQ
         8qN0Uv/HwFHI5b021fgnofHPWInPH6unahjmfKoZdsI3DLAyVe/p/KUVnJuKa2z2r2tT
         pFhWK8jOmZzPFxmeIztZ0lAyk+QiFvbpFqN26q06FEsuCeBf0+O8hDCQb3hAQiPzeCdF
         NqzgSkjJS2+a5N+XjV5fj28abfF014nmgf+pz92LkFGox5OciJOt2H6wF/836prbbADN
         +IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DejAkKVANtN+Gn7CtQB2BM1M5Gg2Igelqp1H0xZD8K8=;
        b=b0LbVCMgk36tC29m7uG9AUF34zsHToa5ZoCda84U2WtTGyTyacJQXrSfrm8wm6MMB3
         8ZXhwJS1n1L8mH22Gandw8xkM3oUAA78ftsjLsihL8xbBLMl/qjfoGyzesLj5A/9IKAy
         iBjJ3LsAVC4FDRUXdg1nXlXrQAg1aJRZw+oINR7xT8j6//Bp35w0Jqthh4bkEc1/SAvZ
         4Zy7O53EJ3UU62e0U3AqofUulCQOn4MpFzUyM4Hr0pXsH28iQqhoH8iGgdb8+DT5oNk7
         kP4mDypC8/EKmRYMPJAISI9/tU/Zx5sQizXFAHTnOUPW2FYvLGzGT9T10i1bEIlH08Se
         kpUQ==
X-Gm-Message-State: ANoB5pk5qA7JwUlBPD3lNJJOXnd7/QOxezWVb7WELKgbNw2HX3cDLpMR
	hGM+PbhOGYOL698VGJWMsyQ=
X-Google-Smtp-Source: AA0mqf7xpdU3vTBrwNnJsb553ICVwAHBDfAHcu9CzRAnJXzkiuWCLsqwvTECJuavuy2uGP6vcQx2xw==
X-Received: by 2002:a05:600c:3482:b0:3cf:7b67:f692 with SMTP id a2-20020a05600c348200b003cf7b67f692mr6213428wmq.139.1668378519471;
        Sun, 13 Nov 2022 14:28:39 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t5-20020a5d4605000000b0022dc6e76bbdsm7903687wrq.46.2022.11.13.14.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 14:28:37 -0800 (PST)
Message-ID: <3a7cfa0a-970a-bc86-b519-7a7c925467b9@gmail.com>
Date: Sun, 13 Nov 2022 23:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Aw: Re: [RFC v3 00/11] Add BananaPi R3
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Wunderlich <linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
 <trinity-e9c6aa94-6656-4d9c-9d9b-90ede6c8e6fc-1668099812662@3c-app-gmx-bs29>
 <a34fd2d5-b7ed-2fea-7a6c-acc7659cb001@gmail.com>
 <trinity-b1022e89-9e6b-417e-9506-431574251dc3-1668170275463@3c-app-gmx-bap63>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <trinity-b1022e89-9e6b-417e-9506-431574251dc3-1668170275463@3c-app-gmx-bap63>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_142842_409752_EF7F08B8 
X-CRM114-Status: GOOD (  15.31  )
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



On 11/11/2022 13:37, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Freitag, 11. November 2022 um 10:17 Uhr
>> Von: "Matthias Brugger" <matthias.bgg@gmail.com>
>> An: "Frank Wunderlich" <frank-w@public-files.de>, "Rob Herring" <robh+dt@kernel.org>
>> Cc: linux-mediatek@lists.infradead.org, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Frank Wunderlich" <linux@fw-web.de>
>> Betreff: Re: Aw: [RFC v3 00/11] Add BananaPi R3
>>
>>
>>
>> On 10/11/2022 18:03, Frank Wunderlich wrote:
>>> Hi Rob,
>>>
>>> can you please take Patches 1+3 of v1 into your tree?
>>> due to reordering in my tree i missed them in this version
>>>
>>> https://patchwork.kernel.org/project/linux-mediatek/list/?series=685798
>>>
>>
>> They should go through the subsystem maintainers trees. I'd advise to resend,
>> dropping the RFC prefix and add the corresponding maintainers.
> 
> ok, wait for your push and i create v4 including the missing binding-patches and the reorder of wed-node together with my fixes.
> 
>> Regards,
>> Matthias
>>
>>> pcie-bindings are here:
>>>
>>> https://patchwork.kernel.org/project/linux-mediatek/list/?series=690172
>>>
>>> i found 1 error in bpi-r3 dts (properties from sfp1 not plural) which i will fix in next version and will drop
>>> the compile comment in dt overlays.
>>>
>>> also i've found this commit:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2
>>>
>>> so maybe i need to rename my overlay dts files to dtso?
>>>
>>> maybe the others can be applied (at least the mt7986 nodes)?
> 
> does this solve your question about dt-overlays?
> 
> just to note for all...it is all 1 board having sd+emmc on 1 mmc-controller and nand+nor on one spi. it depends on hardware-switches which devices are accessable (1mmc+1 spi). Adding dts for all possible combinations will add more dts (sd+nor, sd+nand, emmc+nor, emmc+nand) than adding the 2 overlays or adds redundant config.
> 

I wonder if in the end that wouldn't be part of U-Boot to pass the correct DTB 
depending on the HW switches. Just one idea I had is, to create on DTS with 
sd+nor+nand+emmc if that's possible. And then leave the permutations to the boot 
firmware (U-Boot).

Regards,
Matthias

> or should i copy the emmc/sd dts and adding once nor or nand? so we have the dtsi and dts for combinations above (=5 total)?
> 
>>> regards Frank
>>

