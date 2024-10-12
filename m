Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C886D1A44B
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y47osbZEpig2j8Dhtrtaq13j7HQ7OuMMaZaPMSflYZQ=; b=vtlcCv+AoOguGOVkiZG89lpqvW
	Uap7eln/5Qv6pniSBgMHSEoWtF4cZnJffIUAkLcMMG2WM1rjXgMWx50W6UjZ6cz4EG+bX9Zf2rgbJ
	+E8r8bDDMA9n8Jz/DPxn7M3g2URhU8D7UY5KS/YF78oNQJMQiYgwO+qsE4HQjyQ+DHSwOLp9DdiU0
	jJznTpeYm6TA9YMJM9TCeVgPENuVvq1S/q630kI8p54e6wE9wRF709Q5h0YfecbhWwJ+ytTYM/xC8
	sBBX8uR4d8lN8tkex0AJaFphVxaljp+5WOy0AgJQowqVpvN4dtYGKDPtquLt6p1jP28TvKzQ4qh2w
	JOMe0Mpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szXCC-00000000o5C-1pTu;
	Sat, 12 Oct 2024 08:09:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szXC8-00000000o4l-4BUK;
	Sat, 12 Oct 2024 08:09:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so4419953a12.1;
        Sat, 12 Oct 2024 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728720587; x=1729325387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y47osbZEpig2j8Dhtrtaq13j7HQ7OuMMaZaPMSflYZQ=;
        b=i3RGU2NVlBwZRbT+nBdqH8/dkKlIivgcLmQDRvyLIEnQ3+INvaxN0yOpjnZ1jFjBFi
         bAtH1Dp2jMAdpP4077wI30KrazK7EZgPUhXIiBoiAD4620XPn9xB3F4qMS6yAxy4+v7L
         gVkcnfvC4ubcgy+balLxElL2I6D+t16GJIu/WDQHogNYWJ4/tpN3b2fFc2hV/3EBfAlW
         yYkCujpuwmvgGlCy21GilYHrJRb4sLEwnP68xrWvIhohHcr+N0XUtyA5sDs90gCEqIhY
         aenfdh75QvXojZd6mHPYUZdKYaBEJQ8YdU2wq8+BdX4T285Lh+nSghVtE7EyWI0tzbbf
         pVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728720587; x=1729325387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y47osbZEpig2j8Dhtrtaq13j7HQ7OuMMaZaPMSflYZQ=;
        b=QINgclHjTRrEjrz4JXANmmALC9WawSDBmOB6NVfZp+sJGUw0ufuZPHFGrjN7qBRDo0
         SrtiRc0MLlWRXSHsU1G2XFuWwQdTIOtr3BdQvcEuSGbIjHgZossQmg3r/k7kBNwE3mh0
         MqkvHxruOMS3ANzZl8H1VbolsbvoSlduUfPUFhsQYfgO/Nxow9+MgQVi9Dq9yzbmvZlf
         GZ3XA/WIvaP4lVCyanN9Wlr8dn4bTlDQdnGmmx8pDyIYtZCgELUYrbHhplQPLm0t0lU5
         M+o5W//7np04ANupBnOasMEIAAZdDmtJvHP2PbfCF+VTecgNrScf0FxZRlwPiyRcZQ6O
         tRpA==
X-Forwarded-Encrypted: i=1; AJvYcCUHj5gSEPj+eBm0zodffVbNLPNdnGDaW8zFjdnWUR1wsDx8cp7cjjuhV16VD/pF749snkqEWvfriST0hfq5LRA=@lists.infradead.org, AJvYcCVq3dYBmCwC0uzx7l6drUIOpByu9Beue3islJcuDrP+MaSgeR35bo2kV4S06rzsO4zWsu0TCTyuXlJgQz0m2P1y@lists.infradead.org
X-Gm-Message-State: AOJu0YxjBc2Bs8dhzJK2Xpp2upaAfKwYe5EUugcuemD/08GWsYNJPw4k
	/Wbyp6KBmCCVGc2jxzsQcsjEHP14nLQL1dxk0VXPR0RKkamBiaCv
X-Google-Smtp-Source: AGHT+IHwDQt+BavVrp0xAiwiPItwadb7l4mpS1tMpCHTp3qUc1XcuRjeOZD/fRmRhAPcaznsqWGOHw==
X-Received: by 2002:a17:907:3f07:b0:a99:5587:2a1f with SMTP id a640c23a62f3a-a99a11087b9mr980459766b.15.1728720586881;
        Sat, 12 Oct 2024 01:09:46 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99ef5f3128sm35734166b.42.2024.10.12.01.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 01:09:46 -0700 (PDT)
Message-ID: <e410cdb6-84a7-482b-9234-3f61077b8151@gmail.com>
Date: Sat, 12 Oct 2024 11:09:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
 <20241011165640.GA2475122-robh@kernel.org>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241011165640.GA2475122-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_010949_102599_4C11DF5A 
X-CRM114-Status: GOOD (  13.99  )
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


On 11/10/2024 7:56 pm, Rob Herring wrote:
> On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
>> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
>> has a description of the pinmux property, as well as some additional
>> descriptions for some pin configuration properties. Pull those changes
>> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
>> preparation to combine the MT6795 document into it.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> index 3bbc00df5548d..352a88d7b135e 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> @@ -111,12 +111,12 @@ allOf:
>>           - "#interrupt-cells"
>>   
>>   patternProperties:
>> -  '-[0-9]*$':
>> +  '-pins$':
> 
> Worst case, this could be an ABI break. Best case, it's churn for
> mt6779. Is it worth unifying?

It's better than keeping different patterns, isn't it? We wouldn't have 
ended up here if they were made as one in the beginning as it was ought 
to be considering how similar the hardware is. It's easier to change now 
since nothing is using it yet.


