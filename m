Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4064C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 05:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DcNIhmYiedc7YAAaUDTwseiwW1WSirSX4X1QMozncM=; b=2ZKi3K0kj/p45Ld0CbEFRkdNOb
	kyfpF2FdAH04TEwHjGUsSPdZhENfrjZB6sxGAxI+3QvJPRMVEp8f/9hrLvGnCz08mKioC5s4XOdjb
	ZGxRZipi8pokf/JnCPGXvCBtQ9KUzfVJ0fnR2oYTe8NuWxQVxFwLRpKUTnwKLqGxZ8ko7tlIajI6s
	ZhYBmTGyH5ja/vBjo8+ZFHmhkjarbgYYt9Jgzpn9nUzz5L7aUxZRWfnqlSEM2dXOKVdKHggRxo3HT
	Xi+yaMMM/e4c8zy7CNkv6c57sUhBc9OxpS8eMKIBqqEt26QzT2Jh6WRZh0odaERFJd481mJHCydjy
	br0D5aNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVmPS-000uqY-17;
	Tue, 15 Aug 2023 05:16:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVmPP-000upN-1Y
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 05:16:01 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-986d8332f50so681607066b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692076557; x=1692681357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DcNIhmYiedc7YAAaUDTwseiwW1WSirSX4X1QMozncM=;
        b=EqFsvYUS7kD514OEFpT729cORUW7iOU9gyABhtRxUw/iso84K/+FIupjT14goCyRoT
         IGCw+Ot99zcvkJQ1VyOXNkju5piuc38G79TCSddAlpiPG5IiCNJU+SqGb+Ob0NkwScEI
         xUquHpa2anpapPtWOK9H+aBy3Ciby+QsqTAk7JyukpkMZPNWHdXVZobISSexqKG/wTGB
         RHhIzO34Cq1nkNOvhNS9vva9ymIpE0C1iVIEwlTsssUNDRR4dUkVd45NU6O67dbs0Hs8
         RXLWeyN1Ks+gk0QyP3K+P/NpA6WTmyiIXH4FdpAlGfqMhORcCM6fS6c0DBwqLxqlUpUS
         paLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692076557; x=1692681357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DcNIhmYiedc7YAAaUDTwseiwW1WSirSX4X1QMozncM=;
        b=bbGTus4yUgPDjEcv6c2nF+w2G8ODze/zZjVUHHbz8Cs1yjgzQElKyfkUaXk0wXQX76
         jB0XmGIZDMsIqxBJptJTlD/0dWej45DdyTMv1WR30QBFZCVRJiyLwMtSBmllSCPWMIz2
         gOrZZQUi9GSdbKMbVHCw4ALwltqS2jULJQ1Nt9hsVGv7d0cQBeUjAl96Tw2iZ6Nsdc5h
         CWp/es0eR1bG7Ja9cedABKZIeEiSynNE43L9cDuN2zlIN8ktJkXN8M+mRpR9lQbV43c5
         HzX9U+NtMSc89nLP0BwuWwX/8+9E67jc3597wUWYfgEZB+73h/WiDx88eqp0Qmg0drJ7
         kYUA==
X-Gm-Message-State: AOJu0YyL9RBog19hgyU4sRPuxdOaR+M8HLmWondXO25J/L+S1dGdCqQP
	MYgyN0Q9hfTj/UgwiEnPLZ/Y2Q==
X-Google-Smtp-Source: AGHT+IG1RrxofX9CeLU3M5cH+vSbJ+2a07TkS8A2zon57uWZ71OkHwvioJ2MjmW8tI5SL1pQZJX3zA==
X-Received: by 2002:a17:906:5306:b0:993:dcca:9607 with SMTP id h6-20020a170906530600b00993dcca9607mr8692678ejo.2.1692076557112;
        Mon, 14 Aug 2023 22:15:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w20-20020a170906385400b0097404f4a124sm6517600ejc.2.2023.08.14.22.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 22:15:56 -0700 (PDT)
Message-ID: <1c385849-490e-1d78-0394-1ca51e3ce81d@linaro.org>
Date: Tue, 15 Aug 2023 07:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: convert audsys to yaml
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20230814085342.8474-1-eugen.hristev@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814085342.8474-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_221559_527560_F5E63CCF 
X-CRM114-Status: GOOD (  15.85  )
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

On 14/08/2023 10:53, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v2:
> - remove comment reference to inexistent binding

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

...

> +
> +  audio-controller:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        audsys: clock-controller@11220000 {
> +            compatible = "mediatek,mt7622-audsys", "syscon";
> +            reg = <0 0x11220000 0 0x2000>;
> +            #clock-cells = <1>;
> +
> +            audio-controller {

The binding and example are incomplete. This should be sent together
with the afe conversion.

Best regards,
Krzysztof


