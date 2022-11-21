Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3BBC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jxn+RBGVERxukoZ0CuXSdveFCdESK0kHT4i7qD/8lo=; b=kI/vWV5+QgFhR2DEabZ02E1YVn
	eAVaIIxQ6IR+SFSQr+DU65IjyUoI73WRHjoSkkSacb95SoJRV3Q67Cny1Qc9qWKR09CAou1+UG//X
	xgooLx75Bx0rWjNLBbxpuA+dnB5uRysK5+WuZonZFrFUSHOLRUC/1ADtIqm0nZIKsoh9/UJOqXhIe
	gWIsHlwJbCXjmrs5pN3tK8Cma9f4r5JPjKH/hXs1yg0FjCzYMHY/lIWopnrLIe1uAiEjuhgv5FJH6
	l65CiadXv7iHiAgWNTI6RY7O13mra3mtl7SQtjoAAgnyneiBtBovhzpYivvuVrQQL78AacYqfhkOk
	rqw3RM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox61s-00DaTV-TU; Mon, 21 Nov 2022 12:36:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox61Q-00DZvC-TN
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 12:35:40 +0000
Received: by mail-lj1-x232.google.com with SMTP id l8so14310386ljh.13
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Jxn+RBGVERxukoZ0CuXSdveFCdESK0kHT4i7qD/8lo=;
        b=avTYR9olrnBS5pqSQmPHd3LPji94CnINQOtQsHzD/a+P0PPDtjb7NtjWXQa97kE2vK
         fk3AK8/yOUIXdoDjgYWT3cYk7YXlSbWrYLT+PWH/3xN8Euwi8N1xwjIOZWHXZlFlE03R
         cBGPWwUdWnvNGqruZU3mkCNmhGTZEJ7TtRIJRMVH8LHN59VBmHBRas0nz96tmNjVspYY
         ptAgVFOC6j/i/Ae1DFAVFQ23BX3fi6QGMm9nF+5eUikDw5eD6OBm+CFF8zXRYz1WWPAn
         bFUxrG11c+fveNxp8F1qc8rdv5bgJxfQ99Spzob3tH6r8NSjp8eMS9EsSwkk4dfTlw2z
         90lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jxn+RBGVERxukoZ0CuXSdveFCdESK0kHT4i7qD/8lo=;
        b=t65T30CbSRHAByce/nf/qV/aoqWoiGUTcGT+pmIUKmx9zfxG6kgBwzAG9exrLV/DSV
         YHb2xVNau6jHi6HExoiveMiZdP3Kkqq3NlgTvJ1GWNvGYrcdWajye/pKAOO6BYeeU5HS
         WfiXchjCqJBhvHi0TERLfGSg3K7V2WJi9I6T53XgMTeQ6A88q9VG6cnN2ZZQavxGzrd1
         C71RRAW69tBWTT7NRkBBkRdqPx6uJsyog/vxdtimxiSRxMasCThyUbGIJ9oCCz8arSTL
         +vHjGYH+1WS1SAxTMXg/rHP4dvqqgVJkDWfa/VFY/WYFLCD1VsgmyEYWCh2c7TidhJ1J
         mY6w==
X-Gm-Message-State: ANoB5plPb/xbaPZK8GlJY1OE1FZy6YouOL99ny891F/NaRjX2xqYY41T
	Z0GHO807fBQ2qKwTbQ3puuQwZQ==
X-Google-Smtp-Source: AA0mqf7v4KL+NRJmcW0UYDlYDyKz+pQ9NEJ+GlFkjY0ap9YTKo5dYcob7MHvqYFoPtRRPIYpyxeGHg==
X-Received: by 2002:a05:651c:1ce:b0:278:a696:2781 with SMTP id d14-20020a05651c01ce00b00278a6962781mr5482892ljn.401.1669034132326;
        Mon, 21 Nov 2022 04:35:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e5-20020a196905000000b004996fbfd75esm1980456lfc.71.2022.11.21.04.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:35:31 -0800 (PST)
Message-ID: <b97059c0-1ec5-cd66-f55b-0203dc9eba70@linaro.org>
Date: Mon, 21 Nov 2022 13:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/9] pinctrl: stm32: Remove check for pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-3-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043536_994812_1EC9F5C3 
X-CRM114-Status: UNSURE (   6.36  )
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

On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> Remove the check for the unnecessary pins-are-numbered
> DeviceTree property
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---

FWIW:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


