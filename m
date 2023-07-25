Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE6C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 10:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWadWjqF45OYKb04rK5xzE1AeT6F9pvOBw28ewY8qRw=; b=0cFHDassI0bKH7ebK9DRGyUoBk
	da55PNbGnVRJkOuDvws2I6F4k8zCP2kt2D6wMiXfTKJmVXlsIfWWFhkHKD5ce9C7KWv2peFF4dMbP
	MtP9sU44slHTM08Glt6EmuSJ1lWfYNnQLeBRyfqMC4kqlqG3mqjQfH+j773YEAKZGjxHsdPy2AEcT
	jz85B5NWp0KDgtucPs2IDDXJmtyDjW0hRGQio38bqaxh591Wl2GDW3XHDYs1s9gMh9M+ERKcdynqo
	rlOyUhFQEE3ALFv0YKGtQsICsQ7PY8YFUlznyUZx38ZiLXciTaz9rSMdRG2JOtkNn4Nec/tHN2vM7
	aKQvSS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFBP-0075Vb-26;
	Tue, 25 Jul 2023 10:22:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFBL-0075UL-2K
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jul 2023 10:22:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99313a34b2dso782247266b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280536; x=1690885336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWadWjqF45OYKb04rK5xzE1AeT6F9pvOBw28ewY8qRw=;
        b=CQiqWpke4LmeiynkUU0LU4wU+J5FlhcsxT3Js4zHwRI/SiW2kSi8fbWeP8Zuc4XdWd
         B2ENsZ7qPQojA9+xYW+5DNO+4OL1FsHFEOfM3CtYhFj7dLmESzp5eL2x4cdJMs/vs5Bn
         8ABaHje1rWZ8sX5Mpe9IjWUqw/H3tTrWnTle3qYiQFZ6oA6ayHc8lrWlEte53fBrFjrW
         IcZYrlf2HseSwTZn7rT4igpkk2hKMSRG77sW6LU1yp/btgD6tbiE6UE4vVlk9tTk9qRL
         YE6RVWu/giPc3uvJJzSzdOqY7mu6hP8EigzRYKBeDo0RnG1dkuBsiJd4InbMBVDO+C+G
         lCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280536; x=1690885336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWadWjqF45OYKb04rK5xzE1AeT6F9pvOBw28ewY8qRw=;
        b=XR6meOLs71U48EbGN6N4MkMx7KA5UmiNUSQ6cS1iTC1ZZ+xHOwvPIpSsLDnoD7Yc4l
         C6e4gTD4YKyrS2WzDGYRCbKjjZwn5y3qlqYGrdUG2gxEVI2EiQe53jhseVWBpcMPlATj
         xK/RfFrSysi7nP3ux37U4nM9cVj0Q68NZm4w7mawfGglBZgOV5PxeqaHs6pnmdMmTLu4
         4Tmc6Bharu+MXqwMFWmVFI3oyz5Is8uENzBpUSDG68hT05GCcY4F5rTDqnFwkf6vpW4d
         8ox66BucE6wHXu3VFczEvOjmcxD0fOU8kADlNhi1hkLThybKKSYHWVhPuXLWicoiS5XA
         jigg==
X-Gm-Message-State: ABy/qLaLPleVor/23X0TBqxHPuK62KvCtqQi+8xAni45JPWbJFtq9pt4
	LHPe+pPM1Iz0BEbDyVwbnTKzOg==
X-Google-Smtp-Source: APBJJlGGVArmfyzfCFxzdLxo1G3ncs6vyd50LiUpQOe+HyUBxHObEZr0PgpxaPwhnG1avvlYapxTDQ==
X-Received: by 2002:a17:906:30c3:b0:993:f996:52cf with SMTP id b3-20020a17090630c300b00993f99652cfmr12726557ejb.28.1690280536032;
        Tue, 25 Jul 2023 03:22:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id jp7-20020a170906f74700b009937dbabbd5sm7952129ejb.220.2023.07.25.03.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:22:15 -0700 (PDT)
Message-ID: <c54c8973-7cff-dad5-51ef-41523cf2f2b5@linaro.org>
Date: Tue, 25 Jul 2023 12:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: usb: add missing unevaluatedProperties on
 USB connector
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jagan Sridharan <badhri@google.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Min Guo <min.guo@mediatek.com>, Gene Chen <gene_chen@richtek.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230723071105.40157-1-krzysztof.kozlowski@linaro.org>
 <20230724162638.GA3784203-robh@kernel.org>
 <60e7e772-bf0a-264d-abac-4ed72766a2d0@linaro.org>
 <CAL_JsqLwZR_VQEAuhLLqN4BF8Yvh=3vkQe=tFHaKWzJzMMP+qw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqLwZR_VQEAuhLLqN4BF8Yvh=3vkQe=tFHaKWzJzMMP+qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_032219_769137_18388EA3 
X-CRM114-Status: GOOD (  12.84  )
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

On 24/07/2023 23:02, Rob Herring wrote:
>>       compatible = "usb-a-connector";
>>       phy-supply = <&exp_usb3_vbus>;
>>    };
>> };
>>
>> I would assume that phy-supply should be a property of the phy.
> 
> Indeed. We already have vbus-supply which this looks like it is. I'm
> pretty sure I've seen Vbus in phy bindings too which I've pushed back
> on as to whether Vbus really went to the phy or was there because the
> phy driver just wants to control Vbus.
> 
> The marvell platforms aren't in great shape schema wise, so maybe
> don't worry about it now.

OK, I will send a v2.

Best regards,
Krzysztof


