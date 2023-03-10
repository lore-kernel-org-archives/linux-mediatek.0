Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5DCC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJcUaaupxC0Cesm+olJlrB4JiVcGZmcF1bEfkcOLpFI=; b=xTPOLdHjyr0uxHDqnw9aKdbKDt
	7n+/+WFlvB1xNHuRR5g+jDzz9I2sgWi1pko8zKU7wMKYtihKsIo823pXPKg1qUlePmDbP7f8OKy7q
	inezcy59ZoXXbLN1TI+zff3SWoQOTQZIL6srnU9YA9rSDMtw1/g2piFV8i8ex521fBjKzWaML6S+m
	8gs12ykqZ4rw88mAOhF5Fw3HXxmqaogYRFbzrqpBn7eF2MivSsZpp1GVrlpsc1ieJPymh8utBsdQO
	KBm60EkSkLdgoqhc0Avfj8duVu4HYI3D4ePOyzrgLDtjfJtnPkeQJAEMaoLudhv7i+D0r7kXmbzes
	w7yRYjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYDv-00DgAX-GT; Fri, 10 Mar 2023 08:35:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYDo-00Dg68-H5
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:35:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id o12so17349467edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJcUaaupxC0Cesm+olJlrB4JiVcGZmcF1bEfkcOLpFI=;
        b=zztfA9qPNw1B7ChjfD6USbohMrg+ZdoZ+JjKrIEDhaJERv9YNUUUQA1X1MYjz51uKR
         31cOuv6NTiT5mbHRx4VVFO/fLvmc6dEtsHOvB/JhvBKy/W3SfiRXVIxspinsqMKpHk71
         Ohyk5en+I2XdyMp7RQzAftVAY53VhRcipdTO/jpldfsrK3XqBiBRPT3D81j5DfxhhroN
         +UZsxlgxInFQQOlcNXCPbfakmwzJgJz4/fLsWn6a6gJkwKQkwF4lvwNb/Q1wCAIYfSGr
         mVYdb5SQwYtmu37jDJrzCVexyecDa1PMdsaS/6WHX+wtWHTghlwfYJqQ8Iy71DilruNc
         jL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJcUaaupxC0Cesm+olJlrB4JiVcGZmcF1bEfkcOLpFI=;
        b=etiS9oQseKDTVlfOu/xi0pKZipnimdfC5Vkw7SJRnbsIJeagdtBKJCqMVFrUruTW5W
         OpV31hVh6ryjQtTD1O6Q0RtMz3dTwjq18tCj/4BaiwdoNrnklTX9Yrn1HMBNXRnbtYO2
         O64v/KCcg47C5tlJYwIG2YrR6R96FNnevJ2FV8wkyufySJ+Ng+y3pCmj2o3AJjpVUYdb
         64N6+Vc3PPl3AhJPaISFTRXRr5K1AfHeHAtpvsf5F85dpWk4PCC/7hCzRqbXaXE9asgs
         LOthIX1aZD1cz9qHCzvEQqxxPJBCs3TSk87Jdq4NhW9MZMK6toNucRF6NFNz92MBTThv
         Pj5g==
X-Gm-Message-State: AO0yUKWgK4tNM5Soqxv3ak2mfpbAqFzNYCDx2sO8HJSGBHLtmtzNCfKc
	5b3T/MYD+dvU+MpL0vSc/EO0Zw==
X-Google-Smtp-Source: AK7set+DBGNE0cU7kyarjTZodaPg1LsewOJQmmlUqoGRgEFs7ZUUw7tEf5XmIBJ8/sY4WBxI3pQ6dA==
X-Received: by 2002:a17:906:6dd3:b0:878:8249:bef6 with SMTP id j19-20020a1709066dd300b008788249bef6mr24440085ejt.59.1678437327185;
        Fri, 10 Mar 2023 00:35:27 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id zg12-20020a170907248c00b008c76facbbf7sm679116ejb.171.2023.03.10.00.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:35:26 -0800 (PST)
Message-ID: <f76edb9c-a3e9-456d-30c8-bd1af074a0cc@linaro.org>
Date: Fri, 10 Mar 2023 09:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/21] dt-bindings: display: mediatek: dither: add binding
 for MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-4-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-4-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003528_605119_7C0D77FF 
X-CRM114-Status: UNSURE (   7.07  )
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

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> Display Dither for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


