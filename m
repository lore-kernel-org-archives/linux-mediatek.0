Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B3DC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R1Sj0tDi2ehLT48w+P4ulNbR96KWPz5ISY1Z775GFo=; b=W0FhP8JA+cBDm68I2v92lQDDZt
	o1x30knyBNy0JbkL3tImtj2mOxWXiLJqbGhVaxsHOuqTD9phChLp3DRadRGzZk+Om0S7yOuq8u7d9
	4vuS5B5Bjx2RPmjMgrbNQUmD7wCmtZKnT0FFFw4abZfixixEETuUPO2lHCbRpnYJ0455Ifg/vPBWB
	xbEFrvb+qHoFNK4EjMJmhHeTzsz8O8tezsTFX6yrMkCnJobenrhDosjTXbAS0WpTGDoqSVMmuV8my
	yZzP8Rsf8bn6vP+IWIzz0dz48IVoJ6pL3/ps0HApHt0J/MDrC3C1Na3VV3ziaqtCnprANoRPnzyO8
	WnhC92rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LYf-00HUw8-0f;
	Wed, 31 May 2023 13:08:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LYc-00HUuW-1X
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 13:08:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-974265a1a40so200027866b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685538485; x=1688130485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1R1Sj0tDi2ehLT48w+P4ulNbR96KWPz5ISY1Z775GFo=;
        b=SV4Uab3DVC7zDV7JKPV9GphVtB2lFxktAO5OYzfZKvEKlE3tscwKtT1w9JmOVhBvbC
         jVg447Fofo02GPQFR9WMCpuKzkHrCpBFNunhtg1BwcLmPn/tTD/dldikvQMQN1GssXCU
         hjbcVbsjii1QLWL4GOcpXxjOKaU42BcMFHXH3u4xkK9VQqSQRoqBlaKExuhPe+RAZkOC
         AlNCh2nHqwUCQV1Mz7CTXyrYY4eVx3MoZAt1/A0rhFdn6QrgLCK0YoH/cJuzZQ+0DVJp
         mt+fvgNgOxhqbybJ2eZLSm5TEPnxc1oORhtD2y1xRRgFEpF889Unba21uPF5JD31hn/x
         3w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685538485; x=1688130485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1R1Sj0tDi2ehLT48w+P4ulNbR96KWPz5ISY1Z775GFo=;
        b=Qr6GrfkEE2pfRLg83nEwIEgPQiXPrmt/KvJywmFy+6q8CREr5hLpdR9FZOY+KRQ/bM
         4/7BDYTv9n3gv8aE+nAS6JsniMa1gbRpJyXBc0MbnDjvxmnRr3xnlVjaARdKSMtQfx02
         WDySFaF+aP0dVSXWnP9ibG/RIihN8rTEApzTtxyLlHh88eurDKIkl1PcAw2TYhSWVDgT
         qt9Mh97BpGAS0sbOLfHGidajkCgHaGTA1SQZx0Bf5x3rpSql4t41mV6PUHfMUqrguqZ+
         fcjbsCPPNDoJf33HdgCaHU/l4Ycfx4M8st9uduHesI9M6M7mCAew1IWI+unC+0/e7Tuz
         sAug==
X-Gm-Message-State: AC+VfDxIOYKT9ICivlFjZKJSxGhXDEfZuo3MyKN8d9EIn02XyG9fCjMa
	OFXZ/LM4qdtqDdqd4h9+30RO5Q==
X-Google-Smtp-Source: ACHHUZ7yi4O3Lr8N0xM2vV/dr4K11JP8UYtS7bQW8y7fQzKozQ/6LPXB7bmNsjtNT1vTVtAOoC2oEw==
X-Received: by 2002:a17:906:da86:b0:965:6a32:451f with SMTP id xh6-20020a170906da8600b009656a32451fmr5505298ejb.6.1685538484994;
        Wed, 31 May 2023 06:08:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709061e8a00b0094ebc041e20sm8821224ejj.46.2023.05.31.06.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 06:08:04 -0700 (PDT)
Message-ID: <b93b6804-64f9-f9eb-418e-dd4d03d61240@linaro.org>
Date: Wed, 31 May 2023 15:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: thermal: mediatek: Move auxdac binding
 to yaml
Content-Language: en-US
To: Matthias Brugger <mbrugger@suse.com>, matthias.bgg@kernel.org,
 rafael@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230530150413.12918-1-matthias.bgg@kernel.org>
 <80108a00-4416-a419-e45a-e5e4c1f111a8@linaro.org>
 <31f25021-aaf5-a6ca-049d-bb47f62936b4@suse.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <31f25021-aaf5-a6ca-049d-bb47f62936b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_060806_577785_1D5C8B34 
X-CRM114-Status: GOOD (  11.09  )
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

On 31/05/2023 14:42, Matthias Brugger wrote:
>>> +    soc {
>>> +      #address-cells = <2>;
>>> +      #size-cells = <2>;
>>> +
>>> +      auxadc: auxadc@11001000 {
>>> +        compatible = "mediatek,mt8173-auxadc";
>>> +        reg = <0 0x11001000 0 0x1000>;
>>> +        clocks = <&pericfg CLK_PERI_AUXADC>;
>>> +        clock-names = "main";
>>> +        #io-channel-cells = <1>;
>>> +      };
>>> +
>>> +      apmixedsys: clock-controller@10209000 {
>>> +        compatible = "mediatek,mt8173-apmixedsys";
>>> +        reg = <0 0x10209000 0 0x1000>;
>>> +        #clock-cells = <1>;
>>> +      };
>>
>> Drop both examples, not really relevant to thermal. It grows the example
>> with code already documented somewhere else.
>>
> 
> auxadc and apmixedsys are no examples. They are referenced by the thermal node 
> as described in the binding. Without them the example won't be complete.
> 

The example is complete, because you have phandles and that's enough.
the auxadc and apmixedsys have their own examples in their own bindings
- no need to duplicate them here.

Best regards,
Krzysztof


