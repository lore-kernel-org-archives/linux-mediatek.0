Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EFDC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:28:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CEA6196E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50CEA6196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r7oi+oFS9XeWQJJsHnWphzlUqUNaCwveplpRDp4FDXM=; b=AOYi9/sTFKaVfjOX5ShJc6/pC
	zCx/q4Y7GnRw7AXrVo2AO1xpLtspGmycppxr6yW20cIdpsYTIkmSAwuoqaef12cpr7TWx98KRldmd
	LqjP3mwvP2WnF5gln3IT78QDzJLVwg50I6rI1D7vHOEbv/WLxVOz8JuiRkhAzbE208uWzFag6CWDX
	tB9jh9JG6RWOqVLKiUA2aGO7oVa3MXc6CgIZ87bGo9DeyBXgjVT2U/TmPf5BzfAhLInbwr9CuD0l0
	8561Tjhe51q2Mb4YCpdu6quMGTwLJOrHXGBw7quy80dMLYlR96ZZHnCacjvLx3mJa1RYc7ZshWgf0
	xyYTdzCSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxYO-001FFE-Iz; Mon, 29 Mar 2021 19:28:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqU4-000d5V-Fm; Mon, 29 Mar 2021 11:55:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso8392021wmq.1; 
 Mon, 29 Mar 2021 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DTGUJTFeIuqkHE7OgJ63VK0q/EGuYFQeHNPktt9KFqo=;
 b=QN35vK/ypSg7ojWLSyNITTgbIp7lU5hj9ii1qUFNLXtobdt6MopjIdyHP28M9+Rffc
 0QyV1rs6l7CwMir6EKdxwwiegfEr5OyxXCaBZjYkx5GuJjZliKYxynDp13LHfw6DDagS
 UVD21vEON7j88LiUfCj8od7SxA+QySey74c9RbkXt7E8GTsIrOKSLgI/zZ1dO85Gz7Wq
 LJtj9zPXDtBbnEGjHUJYXws5JFL5lrmn8Gk8DParf4M5AQKjTOQ5fGxDfoPv0LraDup6
 gLklABKV5Y3HL0FsuHujXQv0D5BhUQyhP+ZaAwBeT++RpwmgiCJ0IeQSXp8ZGUkmyegF
 RNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DTGUJTFeIuqkHE7OgJ63VK0q/EGuYFQeHNPktt9KFqo=;
 b=f8AY/d/aH1Ak8qMQkMobWB2Hz0NHtoNGL+pvWQMO7rHEvggIKfd4pMyDPoQInWtOVc
 E7XQCQtwGXwrJKf2p/EdUQyZGqY3VLabzsCUsWiYhT2+9uLrv3HZ/x9A+dcTv8oedXDT
 L033fi7iNgFTfZzWcQU3VMQbXDoqmVizqbROe6IQXBZPQl6UZjOhbd+bQJ1djT4KirAJ
 66RRaJoTvFiWFWGyRkygpe8nOpdxEYHBVSq8IDXuMw/e/Tfz1Qqht2eDrbVNsVkyids2
 +LMgOf3RIHa+FlltkXL2HrYgdM/WUl2HZN0SCtwpcpDr+bo3Ts1TyVwXdONBChg59AXX
 vPEg==
X-Gm-Message-State: AOAM530esvSQ4PWSGx4h5hKHEzHhKiTIoYC9u5u4XZPVVqZnexp7pVGj
 w1ePG+y5y2Wwvx1d7pFxhEU=
X-Google-Smtp-Source: ABdhPJwwik1eV8I3tyUxdsEEtBJZ250VJWBh3/7XjHJgtNWDne3LT3xC5YApnDCKW8FGW59G3wBZqg==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr24516003wmc.59.1617018903448; 
 Mon, 29 Mar 2021 04:55:03 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id f2sm30409723wrq.34.2021.03.29.04.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:55:02 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] dt-bindings: arm: Add compatible for Mediatek
 MT8195
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu
 <stanley.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-8-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <dd425954-cfeb-01d1-0027-17dedfd29dbc@gmail.com>
Date: Mon, 29 Mar 2021 13:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319023427.16711-8-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_125504_934170_BAC3C5D6 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/03/2021 03:34, Seiya Wang wrote:
> This commit adds dt-binding documentation for the Mediatek MT8195
> reference board.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Applied to v5.12-next/dts64

Thanks!



> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 93b3bdf6eaeb..a95224fcff9f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -118,6 +118,10 @@ properties:
>            - enum:
>                - mediatek,mt8183-evb
>            - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-evb
> +          - const: mediatek,mt8195
>        - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
>          items:
>            - enum:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
