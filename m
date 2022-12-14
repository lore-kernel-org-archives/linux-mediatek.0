Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B39C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/OQxm+OmJ40HtGirwGYwb1GzeOKY9S3W4yB7HO1YOI=; b=tj6biDYpz7sQUBNyrDyMg683aW
	Us1VgtIyqFdj+D6FplUTvhDbH/9oVmNBaCUpnvYN1cft0gji5qwJ/t8Y854ME8BdATOx1q5CbXpJN
	4X4Jnv2w9/cJ6YVmQce1qwkZiqxT51ASykObBItzw1Atk/200lB/KeNcHv7tWuiq6boUWUZ+MXyeE
	/EYAi7DJZaJhJjDWDkUY61DzT8Ow9PDOC8rllPW984gdptlGHUFg/qMbf9I0AttH3mwgjTX2LFZig
	LRyYx1GZoqRIykAB4ZWHEBw7wJTR0ZsR8SSzTfm3yaFUS/kN6vOzpOAZHAQfwaNGOrLpXMyfqwPO2
	MCjM3WkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ric-00GhXt-Mc; Wed, 14 Dec 2022 13:22:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RWc-00GanD-Hr
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 13:10:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id z26so10340371lfu.8
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Dec 2022 05:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/OQxm+OmJ40HtGirwGYwb1GzeOKY9S3W4yB7HO1YOI=;
        b=M8aMUswawauJab+7K7Jn2Gkzte5YHY7Wn6tCg37AUcPW73EjMsr4P7NHJrZDpLN60S
         r6lDMHd+ySIdKe8NosoT/I9d/X1wBMJ5VC6kdckOmmZgxQzXrxOPvi8DFxBYEQi+ahAK
         FqY1ER0G2r1sNO9GmOzwMMzYEiNI4NfN+cyiZ4DTA8N9U3ukL6H8OqJQocdJ7K47wSFG
         n459EAdKKHRlnTeL2CurMSujEzBJPR6WjYKBzybCeTQdMJQbZQpBXhj0od7HIMTxOPI5
         jcv2Q+pyTPBxCbLjOw2lgj4vW8HdpM2Bhs6TmlL8LMN10oVxlzoHAVd80q/rhMJOPv28
         wsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/OQxm+OmJ40HtGirwGYwb1GzeOKY9S3W4yB7HO1YOI=;
        b=L/glQuDn9uWOj5tLrZysNmtLEzS7gwFlWNNUIgONR6pX53Q4DCv80Hx1XmuvxXs6pr
         1T024vA/K3tdon+VO4c5i4drL7YeCr76wuRfpXv1Te5jBQ5OwkBu/i+ASEkMNqgTR4rb
         09PXST8OTTY1gXV8mxqXpk3eHjWCI5dmbMkx1PHt9lodoKgvQ85uxdGtD3B7Xj+Q1mlX
         b1nii6xqRJffbFZRlZbTjDQgkSUOGNR4cLUpTOWdOtt8F2J9FCJ9ZiyukgDNHFUPZj/B
         d2mQWxNdHzOqxs3y9RdoJDY3/Jh+2ueHsIgg3xHL21xg863Rx4TjYnSWD3uIdzucSk0c
         hbaQ==
X-Gm-Message-State: ANoB5pnBwSDjLUoMAyvTYBIK3rnmHt1xDsjtlnKbihJj/Wv4g6GfgWvo
	5ZukboVd2fqehAAKTOOV9pROeQ==
X-Google-Smtp-Source: AA0mqf5XSd1rI4+lxJqzcmku43nUYBc930QOD/2bY74bont7jGKG3lndTw+vMTbzm531t15ZEOYTdw==
X-Received: by 2002:a05:6512:1386:b0:4b5:4606:7ad9 with SMTP id p6-20020a056512138600b004b546067ad9mr8121567lfa.39.1671023416204;
        Wed, 14 Dec 2022 05:10:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b004b48e0f619asm805945lfr.48.2022.12.14.05.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 05:10:15 -0800 (PST)
Message-ID: <286bbd0f-1632-6071-7d08-e56ed16c234c@linaro.org>
Date: Wed, 14 Dec 2022 14:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt7620: add proper function
 muxing binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
 <20221213130430.172876-3-arinc.unal@arinc9.com>
 <4ffd94b2-e72c-a081-4326-5bc254603ddf@linaro.org>
 <e4b6b334-44c3-9e73-adaa-9972ff9e6fd5@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e4b6b334-44c3-9e73-adaa-9972ff9e6fd5@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_051018_684660_8BEA65E3 
X-CRM114-Status: GOOD (  13.82  )
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

On 14/12/2022 14:03, Arınç ÜNAL wrote:
> On 14.12.2022 14:55, Krzysztof Kozlowski wrote:
>>>   
>>> +        allOf:
>>> +          - if:
>>> +              properties:
>>> +                function:
>>> +                  const: antenna
>>> +            then:
>>> +              properties:
>>> +                groups:
>>> +                  enum: [i2s]
>>
>> I have doubts such setup is maintainable and readable. I would suggest
>> to leave just few - maybe for gpio, jtag, refclk, utif.
> 
> These bindings are not going to change once all properly defined and I'm 
> here as a maintainer so I don't see an issue with maintaining the binding.
> 
> It's the whole pin configuration of an SoC squashed under a single 
> document. I guess this is the fate of the pinctrl bindings. The bindings 
> for mt7622 is not so different:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/mediatek%2Cmt7622-pinctrl.yaml#n63

It's much smaller number of if:then: than yours but if you want to
manage it then sure:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


