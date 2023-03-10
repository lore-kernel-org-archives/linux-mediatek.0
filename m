Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAF2C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tqTbN90TBZ0zefNDHJFQj8Y2oFNn+f8xqJtYKWO66M=; b=gy2nDxeaAnn4e41WR5R3whzA0F
	zKlQYEgNeuxSc+WSBVRIM3E/69oHOFjBRpqKpEMIGWy9PD2+plb78+0o0wfk71p0fj0aChEvoGY/V
	2jkgSPlY00HmvB5WoCumx9iGGyhaIrV/GDjfbI/cmRcZdqrIW0ISyKq0mYtbzbXa3a40JiAQJujNp
	PF5r8yROltfDha87m3/mklc0mo3bPQrhw33nfbYR5zNXCMgNLumIzElC4e/FKUcptMSxIN2AkDjnh
	wJOuoEhCVukfjtW/APoVTKKSD3eD3j4Y1lUiR4dJxKy3Erh8md0DdaaEPXsQbdeQkDZihvfo72qPW
	TbWT0xOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYHr-00Di95-5o; Fri, 10 Mar 2023 08:39:39 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGs-00DhX3-Pf
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:38:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id u9so17465210edd.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tqTbN90TBZ0zefNDHJFQj8Y2oFNn+f8xqJtYKWO66M=;
        b=pRIzZ6UCXmZB2NcXkc7WBVCJ4vwl1sCOTvFMG/JG9/E2ijwpL3As5mJDTmX7etHMht
         WgTM2o0G/yHgu/7xR9eB3kGZC2f8kCyXdIQsjwN+HrGuFgrETv1P/8rPa2tNxxD6oi33
         frhXLk1Q5GFvR31T3l5/4FaRTdGwSo2HqtWQ0S/JQwyKkQ129k9Lc7NuWkgOffv1ilOc
         Y8iojBlVToX4Y1Y5KoZblpTphuQ3iuoO2WVQnRa0RqGEf4lispXd7kWN1algg0L5uuIm
         7U3mDuJzcm2kI6nqr+lRIlKgXojvbqImqJH7n8l7sa8Z3ODbpiOhFJk5Oxsc3czcombI
         7r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tqTbN90TBZ0zefNDHJFQj8Y2oFNn+f8xqJtYKWO66M=;
        b=GG5YIJ+cUyHuouKvWfp4ArGDI7Xz9m2aOU6mWjAIM3tr5eAix48VKtnAcGD8TSCG0U
         1sEHkm3zdfxT4O5R0tiqe9kP03mW9Ff+bGDgaTn6JXNxRhrZVlnpB+TDw5dZTt/ObMx5
         QmerB9dfcW98WDLS0HWpMFX/FIXev2mGcc7Ucsx51PE81gHQjC6da2XuB8I6N6dil4LN
         Z40fPF0VAQi0EL4BL/oX+5l2r8I7E79gCqtSICUuycs6G6LwrPJGib9hy/pinYGCXfLd
         sO4vMcGQs9nlfaoJFcXPt7nFMYtMF9srcLFWlJiLKNgUiOXjL2i+vwsMUfVq9PwzfEJJ
         iIzQ==
X-Gm-Message-State: AO0yUKUUIg8vDunG22fWMjndUF/V+g7mwR9KA/NQf8gKQGK5UTkJprs8
	ZygfUTzxmvHXPzc+IS8w1KndLQ==
X-Google-Smtp-Source: AK7set/h5FxPvnnKJlG+TPaefKxMrangV7NrqmrrnV6erBcJRruBPLyZhbPSj9qylkGQ7tlnCFxtog==
X-Received: by 2002:a17:906:40b:b0:8b2:7150:dcff with SMTP id d11-20020a170906040b00b008b27150dcffmr23818587eja.23.1678437518421;
        Fri, 10 Mar 2023 00:38:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id a15-20020a170906274f00b008d0dbf15b8bsm669297ejd.212.2023.03.10.00.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:38:38 -0800 (PST)
Message-ID: <24ba6ba6-7554-46e8-6ccd-191a385ab2bd@linaro.org>
Date: Fri, 10 Mar 2023 09:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/21] dt-bindings: pwm: add binding for mt8365 SoC
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
 <20230220-display-v1-13-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-13-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003838_898589_903AAD9A 
X-CRM114-Status: UNSURE (   7.10  )
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

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
> along with MT8183 SoC.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


