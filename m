Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D064C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLRj1mFJpl+9yLnpvglaJFB5v6n1ThidnnLPgjLs0yo=; b=DfRmoWJ3r7D88PTtVkWKDnd0d7
	GvyM8/IttYH6dXt9pxc89RJiatYH+76Owfl0ZG317bQAunbXuz4AA3fG5gtQqa59GTzA3rVBmxbK9
	VUmYr6yWSzBSUozntz+f2sZ0gM35L4s334aZU/LeAIzJgilNI017nofQOhR1WB4YTqFeDum/596Mt
	7UGG6I5BZSM3oqQ/lYsS5PMYcOq73UcwBFvLjUlGOFZA6UczgWRuXgqVSJS9AEhAPMlA3Gx1118Fa
	cmhu8+WJr4mpZf27T9+BhRTGSF6ZGDn/kPeUVTJfohaTDkuJipuAysZzoC+IxG6YBGtsZQtMavvSF
	ETFiJszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCMG-0000000CVOR-47oU;
	Wed, 14 Feb 2024 10:19:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCME-0000000CVNm-1iQ9;
	Wed, 14 Feb 2024 10:19:15 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a3832ef7726so642166566b.0;
        Wed, 14 Feb 2024 02:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707905953; x=1708510753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLRj1mFJpl+9yLnpvglaJFB5v6n1ThidnnLPgjLs0yo=;
        b=IshhdJJu73D4LEgL0Sg3deOA3fn3WTNCx1YhmXl3REkd1KkRM8LQzmVvhITIWNKCoW
         I7WBeHdURJLAFMP3QtPFB2mLJJqPRWRp5BwS54gOBNYf66pKHj7fgo9Y4GcU5BqwcVph
         J08hnKv2W7zl5nb3R+tXNE87qEmnIDBxoqkE6cRgIVpfUWMhvRUzX7fuoWVr8jnn62wI
         o+owZFI0j1Yoy0Jn4HVTNz6zBC9Yk7DJNF/P4/5XIcaDRVKQbdObd/mo7H6FVprvUosT
         +Y6N3h7cp2DdpYyPwSDTFpX1dMab4r8REmdElSM2KgqUtDuh3GfNxdqgbqdgtKpbiyqR
         mj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905953; x=1708510753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLRj1mFJpl+9yLnpvglaJFB5v6n1ThidnnLPgjLs0yo=;
        b=bpcrw9pzQtxTyibZukh8yztG4MeR1fvx3Hulk4lS/4/xzWsu/Yf2MZPD6ZdlNJiLp7
         V4kTA+xsD+l2GiSxlLm/kInq/8KZ0kdKlzHw02VY3uq3otzrWyoH7RBqLsKyILQVCUv8
         Gpgi3tPF6Lw7LDYYO74vE6WMQDkekEEHaXKIYphNQ7S4FUHUghIwTRA6s26Rgq97zb0p
         wWMG1FmVijjqh2QQmfDrL+Vo+qSxbRAShZy7rzXv5nzr4oR5E+rikNvIXCz/GpAxN7Qu
         9gnRlkvArPl3Ow+ExKwoyZd5QHAFcOn8nqqPrhjUELUn5PQPqpSQpud+FNAVr3BMxs6M
         FXgw==
X-Forwarded-Encrypted: i=1; AJvYcCWRkQEm0FrnvOpEVSu9UjeOYB8wHJevRchoh7twDCOBaCQz7tasl0+7c7+ruPmsxFYx5WlCqjV8xCfSyxRZpj22Hx38Gdpg3Y0lD0bp+99YZFN5xg2xlkk427NXn4WRjgB4xVP+Fa5zhfhRyuc+rPbREmU11c9jnOc=
X-Gm-Message-State: AOJu0YzZXp+rmRlF+u5TPUmbRWe/UK2AyvtDk2K3bxvd8xMoDR8ytFKX
	aJ0R3vaTymoUVicbHZsk4FjBTObynlFK+eoC2+UnWKnVgwBQLf6u/Go2s1E1
X-Google-Smtp-Source: AGHT+IEl2Ag3bYgP/Z3P3BT488BPaO2IYQUkRcodC6FMIdU8fXJSacH/fwANZYS9xUDvQUcknqsHSw==
X-Received: by 2002:a17:906:4f0a:b0:a3d:607b:a280 with SMTP id t10-20020a1709064f0a00b00a3d607ba280mr349986eju.59.1707905952758;
        Wed, 14 Feb 2024 02:19:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOAx91eFcQOTulUqIbqfn4LyXCdEoTcC5Pncl3OX9Nh3Y4eCJSvYtv4fepI/t678chIot8cgWsOLyFXrLQqAOPHDpxX9Q/nqSucOiEXT7CQKSy9KVdZwTjtiSTBdA2puJ9YkN8pBi3EorRj/RBhLKdvQd8kvz+VSNzweM93AqP22Mv8Gz84kGcz/YfhKS2bWfYr13nQTskzh6dlIyq6HlMLvC/3KZDfE6rQ6hRInA2DUOBjUkAW+F4HVTPHb14OxJb0MBD2M80EendauhuZgrosIyicqRZDtL/f5eBVFVJMzqNAoNcH9/a55tMn/fh+0V+apL6py8P0xZKZSXz7Nn1eQf+0HlIC1PrjuFnViUzZh70KdJcgz1T8G2nW0goknTQQ4U9lCGW5Gcb0edyC1RcOSbiZeM/0XWmlVRijqqh9nAH3y5v086utpkgcKpnG6uVV/wbaneG4v+iCYsib1NRjBrkYcNaYUDw5W0prtE=
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id hw20-20020a170907a0d400b00a3cf243de37sm1738164ejc.111.2024.02.14.02.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:19:12 -0800 (PST)
Message-ID: <eb97a068-4de6-4500-993b-86737844de70@gmail.com>
Date: Wed, 14 Feb 2024 11:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible for
 MT7988
To: Conor Dooley <conor@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213-resource-evaluator-0754cfd5882d@spud>
 <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
 <e957b044-fe84-4b72-bdf1-cbc40c722019@collabora.com>
 <20240214-reversion-arguably-37bbee9caf78@spud>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240214-reversion-arguably-37bbee9caf78@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_021914_473518_AE766BE9 
X-CRM114-Status: GOOD (  28.24  )
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

On 14.02.2024 11:06, Conor Dooley wrote:
> On Wed, Feb 14, 2024 at 10:27:54AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 14/02/24 07:34, Rafał Miłecki ha scritto:
>>> On 13.02.2024 19:18, Conor Dooley wrote:
>>>> On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> MT7988 has on-SoC controller that can control up to 8 PWMs.
>>>>
>>>> I see a binding and a dts patch, but no driver patch, how come?
>>>
>>> I believe that to avoid cross-trees patchsets (which are sometimes
>>> tricky for maintainers) there are two ways of submiting such changes:
>>> 1. dt-binding + driver; then (separately) DTS
>>> 2. dt-binding + DTS; then (separately) driver
>>>
>>> I chose later in this case as my personal priority right now is to deal
>>> with all MediaTek DTS files.
>>>
>>> Is that wrong or unacceptable?
>>>
>>
>> It's not wrong but it's partially unacceptable, at least on my side.
> 
>> I want to put emphasis on sending the binding with the driver, as this allows
>> for a better review on everyone's side because we do see the full picture and
>> we can give better advices: in this case, I'm not sure whether adding a new
>> compatible for MT7988 in an enum is a good idea, as the compatible string may
>> be shared with one of the *eleven* SoCs that are supported in the PWM driver,
>> meaning that (hardware speaking!) the PWM controller in 7988 might be the same
>> as the one in mt1234.
> 
> Re-ordering to make my reply make more sense...
> 
>> In my opinion (and I believe many do agree with me), sending the binding along
>> with the driver is the right choice, and if you also want to include the dts
>> that is also appreciated: series can go through multiple maintainers applying
>> subsets - it's ok to do.
> 
> Ye, either of those two makes my life a lot easier. I can then at least
> go and check the driver patch to see if things match up. In this case, I
> would want to check that the driver requires changes to support this
> device, given the commit message mentions nothing about the difference
> between this device and others. I'd still probably request that the
> commit message be improved to explain the lack of a fallback, but at
> least I would be clear about what I want and could provide a conditional
> Ack.
> 
> If you're not sending the bindings patch with the driver, there's an
> extra onus on you to explain exactly what makes this device incompatible
> with the other devices in the enum, although in an ideal world it'd make
> no difference and every bindings patch would contain that information.

I understand, thanks guys for discussing this with me.

I'll send V2 with Linux driver part.


>>>
>>>> Also, what makes this incompatibly different with the other devices in
>>>> the binding, like the 8183?
>>>
>>> It can control 8 PWMs unlike any other SoC block except for MT2712.
>>> It uses different registers than MT2712 thought.
> 
> Put this information in your commit message next time :)
> 
> Cheers,
> Conor.


