Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZOCnL2sk3pByrLKpJXQRiEZ7lTe3lvaSXFyozjR1Sk=; b=pbo4Vlm8fUH7GzTVgaNgMbOHOO
	C+e2CIKLBAhosPIQzamjxh20kSbYDqraGrU2PkPbH/r27rDY3xQOjj89IlP8IBOPqxv+HaF7iVFym
	v3rVePmdI6+enDZchk4L8PcbdKKt/e3El/OHhO0yCi/9Is7mXhq26bHI3Nuhafo/6gQ03apr/ac6A
	ccHw9I3wyArWprejX8H3o16DwIgz5yt6rhJXGVwlnj0cc/NlJbypWiUB9M70IHmoz96Mbf+9EWQaA
	URcncUdvH2CXN9plXuLlXM553vLpEcXOlR2EwEGWveG70EIJS8sca7H0Q9w1neDP8luncLj41+GKY
	ZqGH7EiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o96BR-00Ah5Q-6z; Wed, 06 Jul 2022 14:39:17 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o96BC-00Agwe-R7
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 14:39:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y16so26243986lfb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zZOCnL2sk3pByrLKpJXQRiEZ7lTe3lvaSXFyozjR1Sk=;
        b=lmT7TvAXdlwO8MoznJL41ScqnCxhsPkyj3eO8uJVObJgBwMjkbz/dZ39ZBM2Q6uKVU
         OYmvbwv02NdsHcN62nEMsrORHyzmxAYZmIPxYaTFaaaS18SQGiG0Vbpy5rd8u60KuOm7
         BZZCXPyYtByZ51BH/XuE3XmjOHA+E+ksnsjvnO4Vv5MRk6ia//DlfQXbATqtc/M32+0W
         Vkyn6341a4yx3S6P9qKA/V1h+VyuGk/bMIBNVaiOI9euzs7WrBD5hJ//1OG1vpriTMQP
         FvgjjPgQIC4C0Bs6jZFH0oQ3q2vOxEvDkO7uPZLvwfSJqE2C/qslvt4ZbHZUZi/wFXmx
         eOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zZOCnL2sk3pByrLKpJXQRiEZ7lTe3lvaSXFyozjR1Sk=;
        b=r3yxrlAH1QtqakfzjXYqRF9PPKgUFvI/7EGR9TpAPhVYeEvcETSeCv03/EiqTO80wa
         Uboq4P9C/CrT1efruwZtFZoimyXVzcOJ5uK1jPBLVIUrqO+FSbF+a0xbbgMOrRRaeiC+
         +O3V6udeetDlIBhIpR7/W9vIF+TGzR6GcKpZi4yUhzNFeuFSlqF0mzfmpk7W8bJQsmVB
         UQBgZJicNYvCqeTYyUf2mgIAlreL+bgcbsjHcm9Xtvizp2JAjI+t4klpDEWt9lu+Gx65
         Vu00NOcAQ1tOE1hoGPD1Alfyig3VJnWRN2hgEIeCjzKivcJzW3+wi+Ssm3GaVH6MhHGW
         cLTA==
X-Gm-Message-State: AJIora8OLnJvN1ACaEyM7dnGb9terM+PNPm2kYv4wcbLfnPFp6Yh9xsr
	cwNskq0SkmiV0mSMJrKqyFDECzJut4ES3nXH
X-Google-Smtp-Source: AGRyM1tvr1UuDnYcmSJc30YkpAaFP4aCC6wjkMinKdciZeRPBO4Q4W7IOip5cYIkpaF2vYVKHyb7wA==
X-Received: by 2002:a05:6512:2204:b0:484:e8eb:4169 with SMTP id h4-20020a056512220400b00484e8eb4169mr4366900lfu.472.1657118339097;
        Wed, 06 Jul 2022 07:38:59 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id b29-20020ac25e9d000000b00486bf193d23sm267876lfq.299.2022.07.06.07.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:38:58 -0700 (PDT)
Message-ID: <4c3443f4-a65d-331b-851a-01f5275bbf4b@linaro.org>
Date: Wed, 6 Jul 2022 16:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9757b32c-c196-f7e0-3c61-1d4edae854dc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_073902_892470_F66E1C46 
X-CRM114-Status: GOOD (  16.75  )
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

On 06/07/2022 15:48, Matthias Brugger wrote:
> 
> 
> On 04/07/2022 14:36, Krzysztof Kozlowski wrote:
>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>> The max clock items for the dts node with compatible
>>> 'mediatek,mt8195-smi-sub-common' should be 3.
>>>
>>> However, the dtbs_check of such node will get following message,
>>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>>>           From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>>>
>>> Remove the last 'else' checking to fix this error.
>>
>> Missing fixes tag.
>>
> 
>  From my understanding, fixes tags are for patches that fix bugs (hw is not 
> working etc) and not a warning message from dtbs_check. So my point of view 
> would be to not add a fixes tag here.

Not conforming to bindings is also a bug. Missing properties or wrong
properties, even if hardware is working, is still a bug. If such bug is
not visible now in Linux, might be visible later in the future or
visible in different OS (DTS are used by other systems and pieces of
software like bootloaders). Limiting this only to Linux and to current
version (hardware still works) is OK for Linux drivers, but not for DTS.

Therefore Fixes tag in general is applicable. Of course maybe to this
one not really, maybe this is too trivial, or whatever, so I do not
insist. But I insist on the principle - reasonable dtbs_check warnings
are like compiler warnings - bugs which have to be fixed.


Best regards,
Krzysztof

