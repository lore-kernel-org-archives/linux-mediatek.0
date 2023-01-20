Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C23C25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87wewJcDMxO1/wApr9mM6wxg/gQpNDtlUo6zWwmTnUc=; b=z1nyjsKghxPTcTGaOF0uwl80IB
	3GiLyuqwXtNMwwHUU9xpCx2SXRSWNyOa1gO/nTsjaj2t0gzcoxseSDNSmyc2TOONbrlTJvtEFYL4V
	GHZ7wIVvvclFG/Omnn+R1hhc1oVWkmRHGfsemTJ863pXwVmgIG+m3cYRJ2XMmu8r7SIa5hsjhyKEq
	bdmDtSPhx4o1ISc6Meogq5qqWsYg8YAWP6K7u8drudMIq9ynrSts3wYiOlFKVqjht4rPR+p0Nnz/M
	UFrfZZ8hI2CS4/NG2mebfEOP4qBvengnYw5r6uKvaesIoTAU0Q3M+h6RLkH8l13RJEY3cqHTR+Iik
	2Jg4xElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImIZ-008uLN-0T; Fri, 20 Jan 2023 07:58:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImIO-008uHW-1x
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 07:58:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so461906wmq.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 23:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87wewJcDMxO1/wApr9mM6wxg/gQpNDtlUo6zWwmTnUc=;
        b=dVh9GjP42y8hw3r8XKzX6I/3TTuG48UvMaXsEm05y/WklubZ7XmtvJFil4hvdWurWM
         H2GS/9A/BaFl47cQ5LXFqiSc4Nv20nB24KNnsFRuiDEaJ+ZpK3CNkn1nqd7mj2uDXct3
         2nf/GsPO/zt5PjGqa4nXalVPZ/6KAxI0QB438dagytOswxV6LTh2VzQ3J3yEa9y8YITh
         hVhYxX8iZSnZ8L3JASizW+e44jRkCHwkSioEDRSrls5qN4lNXI+W24reATXrMbo+yPxp
         p0g5N4xXDvGuNMQlsiubPR6NqvFQ9VAE9190b6mKrYLA56v3t0NubqMDjbU1Zt2h83pO
         HdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87wewJcDMxO1/wApr9mM6wxg/gQpNDtlUo6zWwmTnUc=;
        b=axOeZAWpLGxdORWP71svNzq6HeGUHGXvbAIiPNSEx2K0OPu7CirXYajjw5Wbg+8OgG
         W40endeG9Pz+dZjoLigcOIrYlnp3pCfyyHb1Khf+hHY6XS2cNJoMAuCsD2/qBnYz3aYi
         oqkMn4xd4E7vcn3YKufUM0hg6ep7Km+eOscbtzCP1DdXSOc/JJSLNJmOmJzqv+qwiFBn
         al6U0VmCSD+vwLUoL2FI7ex8Lz9dX48moOYz89RMWGc/Z0pJDk1a3mU1ASSKvOHlV5/Z
         gsFow1FQqRVsPNEs5k0qBqN3RAme68p9GlPnWjdf8agexDmdFyhuU2PGeaN8lntV8ce8
         NJ6w==
X-Gm-Message-State: AFqh2koOFQLJ6+tPT53NpjmcUa02R+Jl4gWZdwQor1nQRU5vggQg5AT3
	2Ufs1VRAbZPqxvRFabDeDBKfRw==
X-Google-Smtp-Source: AMrXdXvUWTpH4UqzcY+oza3V4zravkwu5m+Qw2tWv22KZ/050+r9+QNwDcC/rLEiAis2iyBoKJCujQ==
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id m10-20020a05600c4f4a00b003db05f153a5mr13547209wmq.20.1674201520190;
        Thu, 19 Jan 2023 23:58:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z2-20020a05600c220200b003db305bece4sm1083814wml.45.2023.01.19.23.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:58:39 -0800 (PST)
Message-ID: <ba05ccc3-6669-9a3e-361b-6b71f1f282de@linaro.org>
Date: Fri, 20 Jan 2023 08:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org>
 <CAFGrd9rtO0B2XWEEU6gtv39PndjdjLL6tbRWimWT3RvLu1GFrQ@mail.gmail.com>
 <b277b67c-bd00-a543-1945-f986134a78f7@linaro.org>
In-Reply-To: <b277b67c-bd00-a543-1945-f986134a78f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_235844_159493_F7A291D8 
X-CRM114-Status: GOOD (  10.21  )
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

On 20/01/2023 08:44, Krzysztof Kozlowski wrote:
> On 19/01/2023 20:18, Alexandre Mergnat wrote:
>> Le jeu. 19 janv. 2023 à 17:49, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> a écrit :
>>>
>>> On 19/01/2023 17:28, Alexandre Mergnat wrote:
>>>>       { .compatible = "micron,spi-authenta", .data = &spidev_of_check },
>>>> +     { .compatible = "mediatek,genio", .data = &spidev_of_check },
>>>
>>> Please run scripts/checkpatch.pl and fix reported warnings.
>>
>> Actually I did.
>> I saw: "WARNING: DT compatible string "mediatek,genio" appears
>> un-documented -- check ./Documentation/devicetree/bindings/"
>> But there are no bindings for spidev. 
> 
> There are. Just some other people were as well ignoring warnings. What
> is the purpose of having tools if people keep ignoring the warnings, sigh...

I documented the missing ones.

Best regards,
Krzysztof


