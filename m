Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8AC7115D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=; b=hr6g/BZ15EzRzstD6JOmyDWqbG
	Y1WQNtOPNOJwG7XsJhL5BY/c8i6ZFdus8OVtH20GrwHonjibU/HrPmYjJ5vKKzYsV+RGmXInLDcf2
	erCF4N4XMs9DZN2R6obMK3cbn52EqLP9+2/PLs0N0ZRTRFvpDNgj1CzS0zVOEmFvVel0ZsRrpBGps
	/m3ivssU3/TDDyDeLdl8PX2seGP0WtlJggJYaFclec9JyBgaEy55yM9s4BH0JSmlMuRG05wWJtHK9
	YNZ1enjpOFquj14DqkRKg6pDjW+TWNVNePXDfteU+P0l3KlrNoHpDzvTBcYLZHFgYlKQbu6pvkoKt
	7XKu+o2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbfZ-00000001sNb-3ssE;
	Mon, 23 Jun 2025 07:32:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbdE-00000001rze-0JJT
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Jun 2025 07:30:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso561878f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jun 2025 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750663818; x=1751268618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=;
        b=gTpRs8FQ/s2XCjeokVAtx2eISHYYI2BoyGCsyTGPcb4tiVBIV3q8ISmGTi4iRcwbyM
         odlVvISmziv98iPsDUBv7iysOCxyOU8FSQnOzkId9YGlBth+DyBDEBIxcQaH4+8wnWL5
         IyI5ng5vBZ0cLr1KgewUPDiRxW8mdc8TTrcjpSsZDSJZFb+HNVc7vKx83QK/VQtL/xSJ
         bO/cw0cUAQcfK6xt/yVmS2Y4rLimCmlVIOTwPJDU39cPphm4K0Lb9lFSdnK7OxNva/h1
         EWGowUwcnrRsv4NW1i4aONyD66kle1AdAtfnN+LOyyWajGs8Q7pqGQ/oZXku00PZXmc2
         5yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663818; x=1751268618;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=;
        b=wvgcn39RuoD4n389dF+p77fdk3LOoTzPiTCpV8cLIy52uC9ZTWV9QyIvKIaFMVmcDk
         DalaazdQl0ScKdBSMtHton7XAYeptNpCPsQojOBJPAZJYNANR3Hv5x77WQUm74j07r0y
         MKi8J+f1LXZLmQs2uHpDze3e+ptpUgZTHjIR270kGr3ItH4Ao5FJDo+2+6A8PVFLSh7c
         7DbEcoAJrOvcKJBcBw8SPlvUkFg2A/9n1/4/q5SSFbXRUKhqr38HxqUbro8YD8IsNhyk
         CFuhv5Q5Vx7nJCHaOEF6Y5LEhaeYqxlLlkr7qnL81jUEfPJuV53JqtIUhwF4lYyCVbQf
         hTmA==
X-Forwarded-Encrypted: i=1; AJvYcCUrgHymWMhdWDela06GxrW7KSkf0TRG2RoUwzVCQEG3i5CTJmhUa1vww0XYnYA6VmTZSZQnL1ctacHCp5YlvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaZTZQA2UzZM9GJbaO9U9oz3gOb2fH9T9eD7oBK21N8IKrbBTW
	yfLUo7HDZthmfuslyKFlL7Ij6FDNuGXn/3GO+S0xpM0ntNptiEOWcojqFh2tQmT12dc=
X-Gm-Gg: ASbGnctYUcTz0XMpTKQBVuuWS1lXhrr4ENRtdX+40jezt+IZcvM5tqpS2RVhHDfKhSg
	XZK4Kp6vsG34uU+K+tbh0iqr1h8GwY4kpq58ygor9fGYRbo5QGC/fiy3y253gfwF5b0e4B07jDU
	Hxu5WT/fyGCkR/1Hw/F9++k4bUv42Kdvl4XdUP8GjCM5NL56ZWykKEFExDKDyGPvDZsykgmQltH
	7pUaEBNfi95rEgU7qu53vIbk6Q0EI/bc1f6PeeH4H8T0Ijoi44KhsXNl657XaWKv/V91/Y5D/4/
	HQi6kSLrcWp+rjVCodedBuVR7j8DmE4O2fAGohO2aszBDLbGiNbb9NVcFiWXwcnfw1e0D5NKVZK
	DT2F96RrbIIHfiU8fSA==
X-Google-Smtp-Source: AGHT+IE5sAJn2EldwKQPeiP4adLRE3U5OsQwf6bTownItGgAHFLMi64HBwYJ6D64VqjEns0LJrnYrg==
X-Received: by 2002:a05:600c:3549:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-453659ddde0mr39535235e9.9.1750663818470;
        Mon, 23 Jun 2025 00:30:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd816sm101186905e9.24.2025.06.23.00.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:30:17 -0700 (PDT)
Message-ID: <16ae3a9e-4ba5-48a0-959c-4c593d1f90b6@linaro.org>
Date: Mon, 23 Jun 2025 09:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 support for MT8196 audio AFE controller
To: =?UTF-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
 <20250620094140.11093-9-darren.ye@mediatek.com>
 <011093f8-85a1-4c3c-b3fa-7be9e6df8a25@kernel.org>
 <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_003020_141000_77473CE0 
X-CRM114-Status: GOOD (  12.08  )
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

On 23/06/2025 08:52, Darren Ye (叶飞) wrote:
>>> This patch adds initial support for the audio AFE(Audio Front End)
>>> controller
>>
>> Why this was changed to undesired 'This patch' (see submitting
>> patches)?
>> I think you are circling back to previous versions, reintroducing
>> issues
>> fixed in between.
> 
> Thanks for you feedback. Just to confirm, for the next version, should
> I revert the subject/description back to previous version and only drop
> the document part, whitout making other changes?
> 
> 
> Please see the following change:
> 
> ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE

Yes

> 
> Add mt8196 audio AFE.

This can be longer, but just read submitting patches regarding preferred
style. Changing to less preferred makes me thinking you did not read
that document.

Anyway, don't send new version just for that.

Best regards,
Krzysztof

