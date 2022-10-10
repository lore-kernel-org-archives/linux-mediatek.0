Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC2C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/A6R+RaVI+GYMUHqfwCFuqrzI7fApq42tphdgeMu9w=; b=dbbEVoKxCAuq289eYy7Q+rNBsO
	oydoMsRB0Efc3ebAazS/IHlLKdjrTImb1uVTl3Op7elFd+u3Oehl909D01JoVAbsrfzRNqpQAzUn5
	HSnJM0htb+7I0JUMX0wwVGsq7UoTnzI6njXsXXY3XbUa7oxMtJO1ELHhslywQNmMRr6A0SDzIh7NW
	OyXjpWRfy3H0PfLayEHXva0uXwcFJbzFSkgAgxa3CqwvO7d7ZJr6g/w/cCnJKVtj/opoQfnaqd07H
	AGuy0GIkrMhlFZwn6wiYY+Rb70fqO87/QraVh8d8Lf4BTnwzfmWwAP0wBi3/Wfcc7ypioGgkkH/7d
	TwFpl4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqlN-000Z5g-9O; Mon, 10 Oct 2022 11:16:01 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohql9-000Z2u-SC
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 11:15:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id i12so6930937qvs.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/A6R+RaVI+GYMUHqfwCFuqrzI7fApq42tphdgeMu9w=;
        b=IzKZElHr3hNBLx0hm/iEZcUDMQ8P/NijsVO5z0aXgNyALMc5OgTk1tQcCp0lg7CxD+
         ij0o5NWtvWwvqoIsHtigAn3hjgql9+Ltoc83gr1eK6YhfTWBbNjqeMo0a+zXcy5DImUj
         qjm2+xKo4lgD7PXEZBor1mxBynsOZpHUgKDqTED5SvdBBBTUzB4WbfMOfFjvmnYMzOrQ
         lonzVSVgq+unAwps4QJNgyVzeM8zowvAVAZo89CnsVLTa2R8TgLQn5LDhIVyJ/4yUGwR
         l3oqMpXH6zm6xkSRY+gI50OHmOjM3GkK2ZRGYLS52nxAwWeCH5TGAc1LtSGglNiGKRsN
         5KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/A6R+RaVI+GYMUHqfwCFuqrzI7fApq42tphdgeMu9w=;
        b=dTJhwDCxBOHuHWmMi0SkuFqyukw6Zk2T2okRVkvuB+4EK6tmp+4hg7gHRFnnno4DCI
         N0lsPd0Rmb8vclY6xhCSRhttHg087bLVM6EgJx/dezwmpgpfMWjThHBiCQG/9C9WLJQF
         GVmlR6VYdtFelVS6ejLqaxw8+xWo8QBm9BUChDyvgf9zuuAlfDxBqdWchsvM9bY5rz4D
         iGyZE/Pd1khC6J4+proCyDaDDjhAnFQ2F+B3lMQ4UcPaF6nxKwf8Omo2GcIdpu0DwlLJ
         vDunNM+2UyX3TbRz+YIlgt77mMa4FrRZU9zLUcI4OXGBU+BTIbsZ+IOfsfnbHNPJEU0N
         i3Dg==
X-Gm-Message-State: ACrzQf30mwN+0R1G3TFidlXXnuAeiYgsJbcGpQUtkvq/VVf8iOJFyjaY
	dNGHfmHkB4kDoUvJD3fEpn5vsA==
X-Google-Smtp-Source: AMsMyM7o6XnoIw0wUDhjjvlAG6mgUAlZ5OTgVKjitQKpM0nAdGJU7XSZcBOAsYZHvvTETJPLXfdbtQ==
X-Received: by 2002:a05:6214:d8c:b0:4b1:7bfa:1f93 with SMTP id e12-20020a0562140d8c00b004b17bfa1f93mr14530080qve.70.1665400546182;
        Mon, 10 Oct 2022 04:15:46 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s4-20020a05620a254400b006bbc09af9f5sm9727164qko.101.2022.10.10.04.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:15:45 -0700 (PDT)
Message-ID: <0769c6c8-567d-68c0-323a-9aaee1241e13@linaro.org>
Date: Mon, 10 Oct 2022 07:13:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-6-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007125904.55371-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_041547_920679_316D6E12 
X-CRM114-Status: GOOD (  15.78  )
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

On 07/10/2022 08:58, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Replace the maximum limit
> with a minimum and add per-interrupt descriptions to pass the check.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> index 73ae6e11410b..a3a3f7fb9605 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> @@ -47,7 +47,10 @@ properties:
>  
>    interrupts:
>      description: The interrupt outputs to sysirq.
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: EINT interrupt
> +      - description: EINT event_b interrupt

Is second interrupt really optional or you just wanted to silence the
warning?

Best regards,
Krzysztof


