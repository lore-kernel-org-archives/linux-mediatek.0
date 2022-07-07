Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EC4C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaV30yfY2MX777NwLyZ9LT1ytNc0L79CG7OYsrOikpE=; b=2OqE3PKiy+5UZDzxHisczxxnkY
	PVciq3ltdpyJTn/MkDJn55mqugbeM8NYwRl2Jq/Yc5k8Ey4MPAtbXultZuVa2WU1uu/EC12EvP9Mk
	Teuul+CHRxJ1ZheVH1t1bbUWfUWFTzUhNY/J1yGG1RuF2lXGSUfbxTq8W7CMzDqyvLr/9hwonrX33
	b3yALAc8fvyTOo+J1sxx51K192FCTPR8/tk6HJxYAV2PHZoxrKUBzX+SYndcJQKnPdeblN33bT170
	PYwNjkkno/cFgeGMrHkAXZlSDHjwaPKH/enGf918sHxQjGO7BmHGQ1ctnxDmaM5/m9SQ1/1HNufxR
	g4b+au1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9RKd-00GAgm-Hm; Thu, 07 Jul 2022 13:14:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9R99-00G79S-CT; Thu, 07 Jul 2022 13:02:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id f2so20840777wrr.6;
        Thu, 07 Jul 2022 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=XaV30yfY2MX777NwLyZ9LT1ytNc0L79CG7OYsrOikpE=;
        b=CAA7zEGg/B8eWgsrOCy2qd+dv2w6BaWSmNa5cx1jNFhJrobaQdqWq0dwV76x3Hssff
         cNkX4kAbUQX4h1kveFK0AwfDfYH/ytAFuDaQEPJFkQh4X1Gca85pXeWOOCrxuokwAqja
         Z28wQOsjQHkOYdfe7M4djt7qrt0wBTNSIHruMQHjpCX8eXAz3VTYyMl5SLU/fw3jzmLO
         onu3c3TzgiCsa5VY9Me4in1ZmpTmk+fmv8SOAcy/mWrU5dhnXs7Of7UYm84A1DL0IKne
         cg6tlOJ6dk72QX5KVtJL5aPeANgdEX8oty+NeSZ2j8DnbWv7eUOv0m4Kpen/1n74Okhg
         GowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=XaV30yfY2MX777NwLyZ9LT1ytNc0L79CG7OYsrOikpE=;
        b=kfEXg31epvc3vo2cEhatvXQU/DULEO+9um4l4xyTRf8kjHXsLFk0PpmR0Ikh3sRJmN
         nHotu2HNjj67LhvXNaTxGLQ6C7AJw9a8G0OsFM+GeCup7Z/3ZDk0j5CVazyV7sdyXHsa
         Kob/kGCjvHPKL2wB0WwEXOMRPrvD8XbdgfhTcUYOuSI/6J8LmdHA/kctwAYl5mbKny/x
         Fml2+Ee+th6ninz9+zh84IpcXNM8AByVGYpzyaCiNqbn22RfIyfNcHUEKSqMPpFKxqmW
         4oBztHrdZDaI2rrDUdcyk/2c6pjLy59qguSDYz7PhgHHoLI8A5LoyTPomCqlmNEXrGmP
         zMbg==
X-Gm-Message-State: AJIora8d2QWu+y+OQLQ21WJUELIhmANSbaFmQXFHHqtzmdn86q/NdQpu
	Hn7or5g//ClVNkvX74a+J0w=
X-Google-Smtp-Source: AGRyM1tD7/UCBhqliXFJCFgwWHWFzMcyZ0xmXaYmCAAG5xFaBJzHgi1bGNvjXkiKigl0APxRcvEW9A==
X-Received: by 2002:a05:6000:68e:b0:21d:76e3:cc80 with SMTP id bo14-20020a056000068e00b0021d76e3cc80mr12082902wrb.327.1657198933038;
        Thu, 07 Jul 2022 06:02:13 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e10-20020a05600c4e4a00b00397402ae674sm20518878wmq.11.2022.07.07.06.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 06:02:12 -0700 (PDT)
Message-ID: <665651cb-a070-4d48-9d36-92bab1814267@gmail.com>
Date: Thu, 7 Jul 2022 15:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-3-tinghan.shen@mediatek.com>
 <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
 <9757b32c-c196-f7e0-3c61-1d4edae854dc@gmail.com>
 <4c3443f4-a65d-331b-851a-01f5275bbf4b@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
In-Reply-To: <4c3443f4-a65d-331b-851a-01f5275bbf4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_060219_492037_79E8F3B7 
X-CRM114-Status: GOOD (  21.18  )
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



On 06/07/2022 16:38, Krzysztof Kozlowski wrote:
> On 06/07/2022 15:48, Matthias Brugger wrote:
>>
>>
>> On 04/07/2022 14:36, Krzysztof Kozlowski wrote:
>>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>>> The max clock items for the dts node with compatible
>>>> 'mediatek,mt8195-smi-sub-common' should be 3.
>>>>
>>>> However, the dtbs_check of such node will get following message,
>>>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>>>>            From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>>>>
>>>> Remove the last 'else' checking to fix this error.
>>>
>>> Missing fixes tag.
>>>
>>
>>   From my understanding, fixes tags are for patches that fix bugs (hw is not
>> working etc) and not a warning message from dtbs_check. So my point of view
>> would be to not add a fixes tag here.
> 
> Not conforming to bindings is also a bug. Missing properties or wrong
> properties, even if hardware is working, is still a bug. If such bug is
> not visible now in Linux, might be visible later in the future or
> visible in different OS (DTS are used by other systems and pieces of
> software like bootloaders). Limiting this only to Linux and to current
> version (hardware still works) is OK for Linux drivers, but not for DTS.
> 

If a wrong DTS breaks software, then it's worth a fixes tag, especially for the 
DTS part, we could argue about the bindings part, but in that case it would be 
probably OK.

> Therefore Fixes tag in general is applicable. Of course maybe to this
> one not really, maybe this is too trivial, or whatever, so I do not
> insist. But I insist on the principle - reasonable dtbs_check warnings
> are like compiler warnings - bugs which have to be fixed.
> 

I'm not arguing that these things shouldn't be fixed, but that they are worth 
being back-ported to the stable branches.

Regards,
Matthias

