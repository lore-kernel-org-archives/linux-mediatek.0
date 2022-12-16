Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEC2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6rJOMn7C23Skjh05sZtrGyFbRX+KxJmq2HKTjescBA=; b=MeF9UIzgdFyXbMmtbkQG6NUdX8
	T+4xt9cbnCoDebdeYUYwHMqcRhH/8GLXuuUmP2et3DVEft6GjxShVXQmhuUFQ0ZHDdt2ggtRv8+U6
	eETo27s0VQtCVaaEvu0/BnRu4DVkTqv/1i38hEK4vl8D4Fww7YY8kWglKxVVfks0P7hYTKrNePBb8
	83u3h3IsHGKiMYA/jyKaci0gD79rgTv/8SSuvQUB5wTbVztt99wD1vHC7n7DPVyf/X8zI9oUyiU7f
	l/tetu0N/eZLO1JNuyfkYSwqtJX5wQxVM0afrwKybBxhxceZYA4OcF8Gq8ePSbnx2vT9qMyp6JhmP
	s+QWvC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68lw-00EQif-9D; Fri, 16 Dec 2022 11:21:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68lt-00EQed-5I; Fri, 16 Dec 2022 11:20:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso1517283wmo.1;
        Fri, 16 Dec 2022 03:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6rJOMn7C23Skjh05sZtrGyFbRX+KxJmq2HKTjescBA=;
        b=qg7teXP6fiOQiKldcNczsQqbtZOU/V9iOr23m0M5Q/bRhWnPzdYnxG4fJ6l5USVyQb
         I5MG+/+OsIYUQbT8szIrQfwFaKZ3ydyrAcsqnkYuCOZ/pgcIqXnv0hnLOucCxSDnE4OG
         uEiIfyVrHWxvpIrsBCR0Da0ZaS216fMSyppRbXJkoSn25H7ZdJWiM1lmKRc2TKChEcLn
         mUyYkXTL3jUHPFmlngbUwPPzZOCJ5smVlW25CDyrgqUWJwLJYqZnf09M8tnVFsCvOr33
         W4eCf5upz3a0/AITLh4S/crrpPh4UYjwRs9mdBoWwyGMUOZnzY1pcFDgEV0vCJvNlD7h
         qNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6rJOMn7C23Skjh05sZtrGyFbRX+KxJmq2HKTjescBA=;
        b=8H439zMbTBKcvg77nzCaNtZZc+jPzxjRE62dj2Zfga3ik6eIeYAwv9z/na3dtzkyng
         P/l4bUov3+FRyosr13TCbHYGerc91xq8w6XycTKDx0w922xKvRcTa19NfSKSdZqPKDlS
         p6h1Bga4yHAaa0s4SbEuZw0nzc3tPpEbkMmdgwDqev6a2sj2Lbq4unXnykpYeQ7pIb29
         uT3cHJaGKlkiCXFdJRwudmgvd2MNEWVG0GxWHSpcBIB/9h/wD9alMfI2chd4QOxMNmh4
         Dxayp85+iT7yX/08zM8bS7pDlJED+PcCdQR9nF+DcxZu0HMA6ZkdIloMuHAbogtgmXyR
         cfFQ==
X-Gm-Message-State: ANoB5pmOjsru0OidKbuk797ClslrUhlz+JD6t4iYiPfjepBIkksLTFcD
	IzS9ovcQlIGdoopIQgUSgYsIrmnvbDM=
X-Google-Smtp-Source: AA0mqf6jQuaToMJJezs8ZJuNep7ptUzLIx4D+Qs7heEC/M6wGzD3F3viBPGs6CBe7yGdkl8qVp6TYA==
X-Received: by 2002:a05:600c:4451:b0:3c6:f8df:b2c7 with SMTP id v17-20020a05600c445100b003c6f8dfb2c7mr25258759wmn.22.1671189653316;
        Fri, 16 Dec 2022 03:20:53 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o31-20020a05600c511f00b003cf71b1f66csm2579285wms.0.2022.12.16.03.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:20:52 -0800 (PST)
Message-ID: <f16a68a1-46e5-8e5a-2d41-3b8d23a9f41f@gmail.com>
Date: Fri, 16 Dec 2022 12:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-6-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221213234346.2868828-6-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032057_255212_4595C6D1 
X-CRM114-Status: GOOD (  12.39  )
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



On 14/12/2022 00:43, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index 7168110e2f9de..d2655173e108c 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -28,6 +28,7 @@ properties:
>             - mediatek,mt8188-mtu3
>             - mediatek,mt8192-mtu3
>             - mediatek,mt8195-mtu3
> +          - mediatek,mt8365-mtu3
>         - const: mediatek,mtu3
>   
>     reg:

