Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0801C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 11:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbefYfUzG5BxKsWRBtbIucuyyqa3BZG4AScEYVrOhxo=; b=hcZWlrQ+NJtOa8QsoHjRiDQ43J
	1akuyktxlfgaOoJbvsuNfnh+/ykOXbJRq+RZq9VblUl/RArn10xIe6CtcVdHEBUJE8bbi3ZLZAyWS
	hY+4ds7sWN3DVJXHuNgY6cCaMIG7P09N4xTB1Xedn/xzsAXnMJh3fL01OgMuh/yfRNsPYCY+bem5Z
	eHErBaIFGh7xw1Ix3BM68hCGEKj9FI5zHid4JpvYGLI2jmYew0z3ZxE/uNbZYaBx4cISnmfg9OcoD
	hDtUfNCulIWXNUFJ86/udwdyqEJPkco+U9NuSrwVR+rYmfoRmP7OUk7Rz7I+9Jo2sqwrRnsnLxoIX
	nImdv1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXh7I-001w0S-Rq; Thu, 02 Mar 2023 11:28:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXh78-001vxu-Nc; Thu, 02 Mar 2023 11:28:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id az36so10476994wmb.1;
        Thu, 02 Mar 2023 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677756524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbefYfUzG5BxKsWRBtbIucuyyqa3BZG4AScEYVrOhxo=;
        b=LrWllxYQ0n8ajJAexBum2zDwvCb3m6Fpwsk6bRWeThtZ54KAbabBoydqP1jWsn8jCF
         ZSlwjJ+cl3RuzIx5imC+4immHm14f+jmT4gUPaGiSm+4EBBDQfQ+jA6Ujv5729Hi6SUc
         jrNgVOENH2CKO7eASSCcSRnbC+oR+5Kmztvt5VMza184SEGd07l71xAd44clTVGDI+8Q
         CZLC+Igsn1SdgtveM2AxhoS2Tu0hRvP/spRCoquTVp5DpvgyIfkrtPcTatwIQLzjXCoC
         ggg2dlbPe2lu7IcVCAgYrklURr0UmQhvA87ORzQrr1slB9bhe8aWksY+gEI9gfl1RCVP
         TC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677756524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbefYfUzG5BxKsWRBtbIucuyyqa3BZG4AScEYVrOhxo=;
        b=UgHRlHEzX4maaZPKmgcuFFgKF8AMtuOo488ftQvWMHwT2fu40/S7wzymfWJgeseKVv
         YsgDP2asgCA8kIX0QqyHwNvhtXwm1yjEbNeqvExG66z3IWbPpjeBrdva1+EZNN9zABfg
         hBBRUH017foL4FmQPABATAxGLhmW9mF/LYmY2B3CjTCcuA7BmOgYaqJZLUKLcyUWdWLe
         uar48fG0Z4YuSQ93btJjCnUgoIocqvzjJ4BP0HCEILhLKtGmOMzLCEKIKkpWewmT/YV2
         9KL/g4g3XzW9W7QH+LzFYMAwbgTSGMBHBZ0s5wgo3s/T/jSuipYd6T2ehfVLUq/ALvuh
         3JaA==
X-Gm-Message-State: AO0yUKWFvinu8pgnP3+CG+Iji71Br5CfeUgRURPItZNCbN1EAixr/v4D
	ClluhUpYSzvkDk2NTIWA95c=
X-Google-Smtp-Source: AK7set/gnKHcVpKfeIooNDE59TK9Nw8LRlREd6MeAUDwxtLB4n6A9jRhZdg4gVdwC7woIubSJjpmKw==
X-Received: by 2002:a05:600c:3507:b0:3dc:4fd7:31e9 with SMTP id h7-20020a05600c350700b003dc4fd731e9mr8155628wmq.7.1677756524154;
        Thu, 02 Mar 2023 03:28:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003e21dcccf9fsm2519117wmi.16.2023.03.02.03.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 03:28:43 -0800 (PST)
Message-ID: <e5302c3e-f985-b020-5f8c-fba876768eaf@gmail.com>
Date: Thu, 2 Mar 2023 12:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <b4fc6bd8-e300-0f40-4216-8b99589c21cc@gmail.com>
 <895abaa2-5fd3-9928-4e53-86ce160fbad8@collabora.com>
 <CAGXv+5EPVhH-O+ZdoLeW4OZVcEtS824oracmu3jHTa8k-tEU0A@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5EPVhH-O+ZdoLeW4OZVcEtS824oracmu3jHTa8k-tEU0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_032846_806654_0C73DFF3 
X-CRM114-Status: GOOD (  11.35  )
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



On 02/03/2023 11:11, Chen-Yu Tsai wrote:
> On Thu, Mar 2, 2023 at 6:10 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 02/03/23 10:36, Matthias Brugger ha scritto:
>>> Series looks good but from my understanding has a dependency on:
>>> [PATCH v4 00/12] Panfrost: Improve and add MediaTek SoCs support
>>> (https://lore.kernel.org/linux-mediatek/20230228102610.707605-1-angelogioacchino.delregno@collabora.com/)
>>>
>>> Did I get that right?
>>>
>>
>> Yes you got it right - without the mentioned series, this one will do nothing
>> at all (and will also fail binding checks, as the bindings are introduced in
>> that other series).
> 
> Please also let me test them on MT8183 and MT8186 before merging them.
> 

Of course, I'll wait for your tested-by tags then.
Thanks for testing!

Matthias

