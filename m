Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF5BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfG+hA+uYwDsZ1UdfYKRtVV9KVyXwGJ9M9n0nwa5OFc=; b=J1chQE2Nq/Hx69oBfGeRmMgSCF
	E/q8jQUBV2ZkvGCk1X/BFgJownLT//QgJbdDVj43Tkwpmnh4XYZJmJdrTcXvdriOt0Ny5sd/uOam/
	GOSBxM0/CR0yYkAAJB8+sUQ2TUrM6VqsL/2w9bL9nJwHhvvj5dJoy0zIPqXsFTvbf/RZYaKf+CmZ2
	HbRCWy3U/C0hJOnV8v40HvFnz/at+9qli0wliKXxiLu4IhdOreXYaLtapvdBL85mStG4HTXbyGwJ3
	y5QjRi8LK//7+ejU1goL4XX6uARHCTpv0AUAg8gv1AjwFCFHy+uIjaGaZxGm67JNQ0DvCRFSC7ZAq
	wLpDoKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox63y-00DcGq-1D; Mon, 21 Nov 2022 12:38:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox63d-00Dby0-7f
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 12:37:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id u2so14360174ljl.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 04:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfG+hA+uYwDsZ1UdfYKRtVV9KVyXwGJ9M9n0nwa5OFc=;
        b=qVRdaXRkwOZckqHytSlZzPQYqP9Y2TWyDf9/s0fgu823ggTHiRlvplRtwsy0grDGxf
         ccQ7o6o33EtwKwG//itIwf4diZmaVYzRFy9oyaivR2zdfA4I2b4CfEVKWI3hO5i+ik+s
         XgoVHRTKA5XYbIvi4DqaLUZBWxwy7mZl+d9D3fJcvQms9LGfE8beV94uDv3z9PqZ8J1F
         ZkjpXSo+yhIzwyvimRjSJ+Hb1lGfvqflyZpRUtCrZVV2Gtwo+76O1JgWxX7O1CqHjeua
         df8Re6bNRJdR29VlAS2Fnpr0NQCuB6zW5AjJiOzFW59JMr91yIoKltR+0sPf5BCU6TDJ
         VLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfG+hA+uYwDsZ1UdfYKRtVV9KVyXwGJ9M9n0nwa5OFc=;
        b=ucNRYHCNfMp6sOV5WoKdmgzrFUE9lYetz523MC4Mf4hY5X9jAM1otij9TRTuuT8c7s
         ScoYXenHpVr0szj8ZWSnh4zGcW4ABKugNWxdN1Oc3MJsGE9+TM38xghhPLm9qqdY+AI9
         3CgZ7FHA/66PNyHiosMG3TGtv6dlL6BELAoInJ228CxAcLc3dG9Nce7Vkk+CLUFNrjTI
         bRp0z11F00rLaiivcL8dY2XSeUKkcx3kaeXoXpDWzIyToTO6bH/euVqlFmVJVderF+Rv
         KEvkowhFWQFM2lS5UbyTffI4V8UnpwrWbcJQNmIRR5MddtDfmhK8eunUPwKhmEiaWHiB
         7CDQ==
X-Gm-Message-State: ANoB5pmgapFNKJ3HgtYMU7q/ap+S18+ev7E1Q5PoqHhKcNESANhsy9Wk
	uv3/J2WTP34EI/jU0ydwbigeBw==
X-Google-Smtp-Source: AA0mqf4lADTH4UBnhnzITCAh4PxE4jvuBtauyFJ39lIlkTlmOgO2oOYF9BQyH7qnNp+r3XAy3V46Cg==
X-Received: by 2002:a2e:b63b:0:b0:277:56d:fcfb with SMTP id s27-20020a2eb63b000000b00277056dfcfbmr5221175ljn.264.1669034271700;
        Mon, 21 Nov 2022 04:37:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k12-20020a0565123d8c00b004979df1c1fasm2006030lfv.61.2022.11.21.04.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:37:51 -0800 (PST)
Message-ID: <fd714745-ea9f-fba5-3154-7c4babfc7ba9@linaro.org>
Date: Mon, 21 Nov 2022 13:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/9] Remove the pins-are-numbered DT property
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <2cc7a3c5-563d-cdf6-f49b-5e0a9852fb54@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2cc7a3c5-563d-cdf6-f49b-5e0a9852fb54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043753_313571_6380151B 
X-CRM114-Status: GOOD (  16.76  )
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

On 21/11/2022 13:31, Matthias Brugger wrote:
> Hi Bernhard,
> 
> On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
>> During the review of my MT8365 support patchset
>> (https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
>> the issue of the "pins-are-numbered" DeviceTree property has come up.
>>
>> This property is unique to Mediatek MT65xx and STM32 pinctrls, and
>> doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
>> simply refuse to deal with a device unless pins-are-numbered is set to
>> true).
>>
>> There is no other use of this property in the kernel or in other projects
>> using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
>> flag is present in Mediatek and STM devicetrees, but not used anywhere).
>>
>> There is also no known use in userspace (in fact, a userland application
>> relying on the property would be broken because it would get true on
>> any Mediatek or STM chipset and false on all others, even though other
>> chipsets use numbered pins).
>>
>> This patchset removes all uses of pins-are-numbered.
>>
>>
> 
> My personal preference is to add a summary of the files touched by the series in 
> the cover letter (the tools will do that for you). This allows maintainers to 
> easier understand if they have to look deeper into the series or can ignore it.
> 
> No need to send again, just saying for the future.

Yep. And git format-patch does it automatically in both common cases -
writing cover letter manually or taking it from branch description
(which is absolutely cool, IMHO).

Best regards,
Krzysztof


