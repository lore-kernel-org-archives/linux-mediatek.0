Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75964C54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8WcCyd8vgz263xa9NPZybhQi9kVqK0YmFh146T5x90=; b=RoESfou3LuoI9c+oIp5/nB6tX5
	4Jxl2dHFRmXqAwjj0Hh2OZoaaWCWWaNkG0vthSE1FHrMPKqltiGjmk9gfpLzZHAlxrup5HiJXLUmB
	IfxPm2Ii1SXFdQJKFWx2LZfXe+6gjwD+ZJgcNS9YpRy6PLFY7/nH3x6GrJXaQI7ia9mHo9AcPbmLZ
	LHgnI2phEB+iz7cv9zHFaTvOKIMdpBLnPTLsajw4vigDwkEgqX9vWx3MC7IBmAvjBeFlkHc5hTz7H
	x+I6C7KVD80SVOucobg0kknlt84J+5bQ8o8nfp88c0LiVk82AKXLC4R86mBKye2wKfE5IQ37TH+0R
	3pucNJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlsSI-00000005aES-3zTZ;
	Sun, 17 Mar 2024 15:29:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlsSE-00000005aCu-0jmL
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Mar 2024 15:29:43 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-513d599dbabso3640917e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Mar 2024 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710689377; x=1711294177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8WcCyd8vgz263xa9NPZybhQi9kVqK0YmFh146T5x90=;
        b=hLaGkA5YTzygbxFRkENNs7zKFYRk3x6K9Vjh95pZwDEcdsZhfacBcB6t/WYEOSxQYT
         yZLCGh2KudkEO7C8AkGC4OfQTCrCl2ApmDjQoRWQecF7njsetJIE59bThMrgswHPJG1T
         rvlbv9NNvIkjM9nPYIcaxF5MHM97KkXnm7LG2m2gIO+7PDdiIh9hBQW1MB7nVjHmqRSS
         M2+bO6AEh4Om2Vt6ky9TS32uXsDRHqfwCYkea4ALzeAJ7FNgYJWyE6X2rgDzpF+vpMVf
         T1b+x6m4UT/tmCVP7brf2oY+7iSRs2VOik7v2+y2/1D7zh6yglGTLLHNDxgLdiGyu55T
         IxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710689377; x=1711294177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8WcCyd8vgz263xa9NPZybhQi9kVqK0YmFh146T5x90=;
        b=ExcCT16Z62QRPm9T3s1ZVkc8CFEOZvr80mv1NeZrGgGbr3frzi/2/kwFuH+yIQ9H/0
         NzPvKkk1zWobgj1R6V0lvO0OzurJgcFGsrkV/6vJWSXEeNxGklD33oqThNj1WqYiQDhO
         N6Jofy0MYS9ZsMjBMcm5UGx8eoLI6Urrv7pvvPyyKFTy8bUr4IVYT/HcQ2ie7E6SptcK
         MLnCrOE2YpLLnsPzUnweerX/CC2FIqOLFuOwUEDopgiW2qAsfjE/45SJBmWTLW7Cosdz
         deaCKUadRHxlAsr/XPbH8eM49CTVfF1JM4MOBEq8tOnyp1Rz+nM2sGlv1jsugb1ZdF6K
         g82A==
X-Forwarded-Encrypted: i=1; AJvYcCXBrakGh05gDOwEX/Ade6te7yUFLbWPw/gZtVlTg+UPmcen/6077DCuIYwu+VIfpVNv3xl8dWYLcgb0Hsq5FRI93Y1R/yY6LXQB6NPoatqhugZu
X-Gm-Message-State: AOJu0Yy/+lpBOS7yA3g+3Tzbyb7k/Ff/fHbtVjYMfLTdK/Wu3kTCiPus
	niMieFfeedQ5NRlakgnKDsOpM11NDKPAy9tpMjvmDNpj33yqATJ8qV7e2jrdU7Q=
X-Google-Smtp-Source: AGHT+IGgfgH03LvKICjbZS2cDme7K6TcagY32JX5GkRBXMsxFk4N9eETQx3WDI3Zqf+qcERZN+nN1w==
X-Received: by 2002:a05:6512:3a93:b0:513:e7ff:15af with SMTP id q19-20020a0565123a9300b00513e7ff15afmr1090150lfu.64.1710689376859;
        Sun, 17 Mar 2024 08:29:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id sd9-20020a170906ce2900b00a4628cacad4sm3859452ejb.195.2024.03.17.08.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 08:29:36 -0700 (PDT)
Message-ID: <adefc3ff-86a5-4af7-8276-73d0e0108901@linaro.org>
Date: Sun, 17 Mar 2024 16:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <CAMhs-H9ZO-sitsrASuvsEd+ddwVyHH35gj7yAABTqFNfOCGYYw@mail.gmail.com>
 <60512ae2-dd73-4cb6-9514-145f946300fc@linaro.org>
 <5d6c36cb9dd9afda1efb69aa34058517@risingedge.co.za>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5d6c36cb9dd9afda1efb69aa34058517@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_082942_263366_4565ABFF 
X-CRM114-Status: GOOD (  14.85  )
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

On 17/03/2024 16:22, Justin Swartz wrote:
> On 2024-03-17 17:10, Krzysztof Kozlowski wrote:
>> On 16/03/2024 16:49, Sergio Paracuellos wrote:
>>> On Sat, Mar 16, 2024 at 5:54 AM Justin Swartz
>>> <justin.swartz@risingedge.co.za> wrote:
>>>>
>>>> This set of patches was created with the intention of cleaning up
>>>> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
>>>> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
>>>>
>>>> [1] Documentation/devicetree/bindings/dts-coding-style.rst
>>>>
>>>> [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>>>>
>>>> Justin Swartz (14):
>>>>   mips: dts: ralink: mt7621: reorder cpu node attributes
>>>>   mips: dts: ralink: mt7621: reorder cpuintc node attributes
>>>>   mips: dts: ralink: mt7621: reorder mmc regulator attributes
>>>>   mips: dts: ralink: mt7621: reorder sysc node attributes
>>>>   mips: dts: ralink: mt7621: reorder gpio node attributes
>>>>   mips: dts: ralink: mt7621: reorder i2c node attributes
>>>>   mips: dts: ralink: mt7621: reorder spi0 node attributes
>>>>   mips: dts: ralink: mt7621: move pinctrl and sort its children
>>>>   mips: dts: ralink: mt7621: reorder mmc node attributes
>>>>   mips: dts: ralink: mt7621: reorder gic node attributes
>>>>   mips: dts: ralink: mt7621: reorder ethernet node attributes and 
>>>> kids
>>>>   mips: dts: ralink: mt7621: reorder pcie node attributes and 
>>>> children
>>>>   mips: dts: ralink: mt7621: reorder pci?_phy attributes
>>
>> These are all simple cleanups for the same file. It's one patch, not 
>> 15.
> 
> I agree these are all simple cleanups.
> 
> Even though the cleanup pattern was the same, or very similar,
> for each node affected, the intention was to isolate each change
> to a single node (or a grouping of nodes of that seemed logical
> to me) so that if anyone had any objections, the discussion would
> be easier to follow in subthreads identifiable by patch names (and

Objections to what? Coding style? Coding style is defined so you either
implement it or not... and even if someone disagrees with one line swap,
why it cannot be done like for every contribution: inline?

Organize your patches how described in submitting patches: one per
logical change. Logical change is to reorder all properties in one file,
without functional impact.

> thus subject lines) that clearly indicate the context.
> 
> But if there're no objections and it lessens the burden on
> maintainers upstream to have less patches to apply, then I have no
> problem combining them into a single patch.
> 

Yeah, one review response instead of 14 responses... One commit in the
history instead of 14.

Best regards,
Krzysztof


