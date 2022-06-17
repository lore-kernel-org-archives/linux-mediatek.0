Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10mVd//XJbMVb3Cy5Pks+pC6niMtAwguM0D0PFkeb/0=; b=YwFM9DUhyUNYlcsabL7AK7PXVu
	8SeDXLRK9WDvs18AU0IN1+XxQ0zTU6nUZe34a+W2xUVFQYO/la9zDCbx/LSQ6+1g7OnuZZ88afFwj
	IXgWc2I/VC7F1+MO+CSzElfTx0JTUqJdmDn5nQoZr7RtUCckwuJqNLeQPCFAVF4YM9VrHDIeLdcNy
	tiEv6LCf3kG1A+vfPQS7QpCCpVlnaqBLAJRxw8RFiNmqdFY8vj45TuM7fChF7jY6TD0Ebz5kl3Apy
	rBdOCfeYfeqf+6QAlUGAvbBmiGKEcXTd9EqD7GkLhelVSj6xo/VLMtE0dMUTPE0mCd8p5BBimgYqV
	98vmXwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LAE-009Ymu-Ae; Fri, 17 Jun 2022 23:14:06 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2L9z-009Yes-Ss
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 23:13:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so5771995pjl.5
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 16:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=10mVd//XJbMVb3Cy5Pks+pC6niMtAwguM0D0PFkeb/0=;
        b=ftsgA9iCXVg14SM3UhGJNZroNcKteQOV8fhn/TQ4qmubLGEYc9goTyY9cqxWv/Vujz
         vvqm9Hc1xj1CilJkuFjGUkxiPQmxIGRA6ZWY937f+DBGH4jZKoO1kMpGaa8atsr2iy+c
         jInXea+ezAu5ezkR5e9DqoDPRxhK80c23I0Rxem6Hv76djU0l3rMSkohW6NtZA/wT8Xq
         kkbN94pT99l5RfQhhgeyyK0XqowM7S3hyzY9US2HlPGSSPmBn1VE+8RMyrvOvwk/qSQO
         VuNIIi8ERnbIixzMX8MQ/LZDa52WzzLDJSlri5vEF8FF0NVgt/kmQO5wufOCoypheUaN
         mQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=10mVd//XJbMVb3Cy5Pks+pC6niMtAwguM0D0PFkeb/0=;
        b=mAe5+WFBtyki9R9nAJwNVKIJ5GzTzTB67RTIiNFTVDjvd9LHkRNfC6haiOgjCxWPfr
         lbHdPhZj2wZdQ8N9ciudi8ztuQWR6laQ0BSOSFgO6xbvbK/chXKeBw3aXJDzhd2EleeB
         4dtnF0ZUxQgJ9XaKUbKxEeoQ9EqwV2rNhyR7is6qNjZ3vrXdGqtvCQksRj6MoLcQ2VmN
         osIsWXLhTyxgO1Op7+F06dY8xep2tBNHYhyLdZuebSrYcWCpXpV8vBVDcNaR/X2zgRq0
         PztDd/Ui1J5o4SJcAsDc2l3PUaVQgjgLmjJ6lFtIzVKgiflFOi8eHZ4GulG2fsPDot/j
         ha8A==
X-Gm-Message-State: AJIora/ygYvax3RdhiWtm3+ldoVlFrh7BuwpRSJTs5Wl0Iq1JJDonfzt
	HnCWA+FFeHtcmiaV3VLTV8Wd3Q==
X-Google-Smtp-Source: AGRyM1t/dM7EAh0Y7mmMWaeiTHeXaEw5ea7tY/IXesEX0mn/1dH62oUOXAC46KuZhDOj2XfNQPbrog==
X-Received: by 2002:a17:90b:3701:b0:1ea:9f82:59ef with SMTP id mg1-20020a17090b370100b001ea9f8259efmr13153806pjb.239.1655507627413;
        Fri, 17 Jun 2022 16:13:47 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id j1-20020a170903028100b0016784c93f23sm4054315plr.197.2022.06.17.16.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 16:13:46 -0700 (PDT)
Message-ID: <9b567f78-e12b-d665-2f11-96436fe9ed08@linaro.org>
Date: Fri, 17 Jun 2022 16:13:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 05/15] dt-bindings: backlight: Add Mediatek MT6370
 backlight
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-6-peterwu.pub@gmail.com>
 <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
 <CABtFH5KhijZDRA+K=stpOV0t8K3cqCMoLXpLShcdm9F8emrKCA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABtFH5KhijZDRA+K=stpOV0t8K3cqCMoLXpLShcdm9F8emrKCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_161351_975723_4E945C81 
X-CRM114-Status: GOOD (  12.18  )
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

On 17/06/2022 03:35, ChiaEn Wu wrote:
> +        - 3: 6
>>
>> Nope, I said last time:
>> "In any case you cannot have values mapping"
>>
>> Please use proper real world value, not some register bits. The property
>> name also needs fixing.
> 
> I so apologized for misunderstanding your meaning...
> I try to modify it like below.
> --------
> mediatek,bled-pwm-hys-input-threshold-steps:
>   $ref: /schemas/types.yaml#/definitions/uint8
>   enum: [1, 4, 16, 64]
>   description: |
>     The selection of the upper and lower bounds threshold of backlight
>     PWM resolution. If we choose selection 64, the variation of PWM
>     resolution needs over 64 steps.
> --------
> If these changes meet your expectations, I will try to modify
> "bled-ovp-microvolt" and "bled-ocp-microamp" in the same way.
> Thank you so much.
> 

This looks good. Thank you.


Best regards,
Krzysztof

