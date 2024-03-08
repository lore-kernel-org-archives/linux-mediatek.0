Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048B7C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK1jns3vULEJfy8OFDSsNxpR6piVHIAeHp2yPIJZNeQ=; b=jfOvuRYmFsfSi5KsR6fiYx1UOZ
	dqYMS9k08OjZ1tmOPTmQ/onq9yxGCftXpCiTdhhKSYTCxpkm8Vj29rVc07yqAylCkWhNOroVFFTR8
	+jSxC2bAA2z7CvTztJoamRpPmbVChELLqRudN4UjiFUryTJc/kApjcuXGgPyjrcwKiZ4yM1oC0E55
	F/9fDsZDcMfuKMZGmeLbIeCSQK59JmW5VjYaQpdmwYEggtVhpyx3NgzRMupEGr9hP/UVA581AAPSn
	LNo7HjigDH5mOpBknr6Jw3KSxIf+cOg/m4AB4VPYXyCGE4A9G9YGSchMGdBfFfKL+fllsMW/cWv3M
	zGAvVtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ridnG-0000000AQkV-2Rha;
	Fri, 08 Mar 2024 17:14:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ridnB-0000000AQip-2LWo
	for linux-mediatek@bombadil.infradead.org;
	Fri, 08 Mar 2024 17:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qK1jns3vULEJfy8OFDSsNxpR6piVHIAeHp2yPIJZNeQ=; b=BC0zQX1ICUYPhn4AN8Tcjx2rS0
	Hh+1ihRE0RubRW+fB/+v0g4lQLnXB4arvy8IAnMOlIp9S4TixRLP7HfFUMP2yGOAH+96zWQSr9hmf
	pOvDLDmTGm6nVyHLbjmvLjd2gzN2N+iqmY45BSDmeA7RZ6dsHV8rqQQNmEhZ331XozQAB9W0r7YDh
	f7cP5ClJV2J2nOdOw8ErsLWu9wxKiYoQxFn4OY/WAvd5NWj2KtXaDVi/q/p0jRlWjpRjinBQbewID
	6+R4IUM7+k52xTjWJFB+BZYYNViPuRGSNPweW9keoSizXOgw0pfz4VkLpB01n6s/XAVKWRq0yoXmP
	PSwQ4iYw==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ridn7-00000007N2r-1S90
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 17:13:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5683093ffbbso1245057a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Mar 2024 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709918029; x=1710522829; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qK1jns3vULEJfy8OFDSsNxpR6piVHIAeHp2yPIJZNeQ=;
        b=utWWTguWQB7ahvDfJSdtAlZiJw/4bUJZc8hO+NxSSzfzenTasep3SBjqU/GV7QGjlO
         DLWQZx0DQMy2noaXjAvRC47FMZ3kTxGi5Q1A01iD6q9XUTGtBLnODK7KVh9yDFLVN0Sz
         yqTvqyYoYJQvvX33P5FmOZSaNnxHJ+Wxd7vrgzw2ax1ZCwIhvt391gQAx1i3xpn+s5MF
         u8noU/jtMq/R/c1E5EY46QMGH3cxmMkt1JjYf+5Ly/gk4xKsFZ8cZdtfRJI3zvyu4eFv
         JRqD5Gpwn8bMW+T4C8jLDv/I0mECH0W/hEzd6K0AHeMs1KPtEzKx5P0AtNwvR5Ricc7D
         Rldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918029; x=1710522829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qK1jns3vULEJfy8OFDSsNxpR6piVHIAeHp2yPIJZNeQ=;
        b=svydTOYB7KquCDgidH4xg8hnI00LGxmVacHDtYIy0XIdvHLiTPVWrsr8m28u6yhDqW
         /mkojZBULNP7cXaA9CLRH+A1W5H5aeQ1Eoo/D7vMQDXbq8CJZybUZl/RipgQqlPXdb5o
         9rhLSpvzGMjmxnHeuuPJpZeNq9sZv3YfuOFHsiJvKFg1WXfpFXf5BwrLbuN7l3w4UrCR
         /mgMl6YWtcPrVY/90BLmgrHhNRpfxs4cdHm2e6SYC49dfCUmPf3qAMYDCcjHIITpzrz/
         9gOBbopB9XvN8TGMvJzzd3H1vBvi2x2DEWEdWrYafqT7nyTOKRKQIH56cigOFmjTHg7A
         CluQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8qtQnp/hDu3O+MaeC0XRga694H5PYSh4GKwiOzRZFZ/2fjMDwV81fGZnRcfqY0xCp5lmMEKjbrYqiZY/9r7NTrmoTH/9YXSqklgNa4KZ091m8
X-Gm-Message-State: AOJu0YxyO+12+Smo8tFMDrCH2D2T+nxVtfsZK1ZJtuKy+rrplTEo77ts
	jcCIVWcYM+AavxJQef6pANYhyQ6KVl1J5CO2Qxy43D4Tt00JuzvXUQg58/bJADU=
X-Google-Smtp-Source: AGHT+IHh+jGBt7zZqrF3tzGe26VHugYZd2UpdNjYXqM3HAwtD74nVS84faIgE5NU8u/wZqzcHLtbuw==
X-Received: by 2002:a50:9505:0:b0:568:1b1b:e221 with SMTP id u5-20020a509505000000b005681b1be221mr2397645eda.25.1709918029169;
        Fri, 08 Mar 2024 09:13:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id c21-20020aa7df15000000b005682dfd9182sm725756edy.61.2024.03.08.09.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 09:13:48 -0800 (PST)
Message-ID: <eec5be72-e27f-4068-ac7a-566605f3256c@linaro.org>
Date: Fri, 8 Mar 2024 18:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240308155616.11742-1-justin.swartz@risingedge.co.za>
 <20240308155616.11742-2-justin.swartz@risingedge.co.za>
 <70822db4-d642-4180-9db8-eb0aa5728ef1@arinc9.com>
 <bec06da5c4099898d9e531181d0797ca@risingedge.co.za>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bec06da5c4099898d9e531181d0797ca@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_171353_604428_ED63B2C6 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On 08/03/2024 18:01, Justin Swartz wrote:
> On 2024-03-08 18:14, Arınç ÜNAL wrote:
>> On 08/03/2024 18:56, Justin Swartz wrote:
>>> Add missing pinctrl-name and pinctrl-0 properties to declare
>>> that the uart1_pins group is associated with serial0.
>>>
>>> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>>
>> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Please add the trailers from previous patch versions from now on.
> 
> What do you mean by trailers?

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof


