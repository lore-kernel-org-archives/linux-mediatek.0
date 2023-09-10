Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DBAEE14D8
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4YUMVbAN13zpaZAGFCDLaoN91mtJ2lE9r8ZViQLkdw=; b=Eda0F6Y1UewEAwf/YXpJ81l6i1
	HBspegknOLZhTOMDKTJtV033C7b6M8UDuYa58h6hz4yinFUFCTrYTCS6OCrS7PAIwMy2y3SeaEM3K
	Z95HBv9Lgm11fXxQxN3L7wf5l0K91yHXNTZP/+kaSu5UQyWF/pBMvTBaxPpwnULGMrOpoEx+ts1F7
	nR6ijIpXBZv4xtWDsY7JWb8o1uB8H6RuEh+PeOVnAImYPnJmMgilhm2fcefFYzHkjhfFr5Yzh1rCU
	nUljs27anU5TilQsJFCOPAEtTLaGXJylQF7PRUPT1lPz0xylgXJ0E7UqApf4bEd2dTW6f8DUB8mpl
	wLzjugFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGRs-00GKRX-0I;
	Sun, 10 Sep 2023 09:09:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGRo-00GKQp-1T
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Sep 2023 09:09:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c93638322so731410366b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Sep 2023 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694336978; x=1694941778; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4YUMVbAN13zpaZAGFCDLaoN91mtJ2lE9r8ZViQLkdw=;
        b=vEkZz/tbxGFglOiE/cgQwjoayyJ8cldI7vxoNEdlMuRSJlJBs0SMlbDEPGyTraagbp
         4fPrfg9ajHpa/mzJGB/wNShFseC/R0fEvKPeG17nPR/61ED6XhkVq8zrixBrGgBHX0p/
         NAc2kRxQ7fhFhh9NPc6cKLn85Qa/uur6SKnAy1iU/4U4rDJ/MJxDZiT+nE55mXQjoQzh
         v+oLzOFzs/8IGk3+5iLbCg7Psp7YRKQYh5XUfSb5pNcaeu4SMyoWx4J2Z9YQ6KbI0r0M
         XIUKNooBEOQcQulCPyBLWHrGCW4g4TQzkToEVrvrxRScbzwYcpFWxOj4GzzaYlII301P
         KeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694336978; x=1694941778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4YUMVbAN13zpaZAGFCDLaoN91mtJ2lE9r8ZViQLkdw=;
        b=uHcAqq3gNv92PRfT/KIbj9FGIgn1jPAyHjwnKt5NdwoWGbX/j8uxZNKv85p9od2lVo
         /9oDprParyXerqWe+C+oqmGqC/5JaHLqXzqhFJWxfT0NubArrPDgHlNYDIzTpWhQ103w
         2XiRIsE7zv0b+bS4rRZ3+9zQMkaKhxCcDp7Gv4Y7oPFpB6VMLc/lfoUhhVmXIIgkMgE2
         tJ1woN6maMDLq4tV9dP9bd640PaS7Cfq+s7IBy0qyYZQs2C6dJBAnqMSmMroYoFtmFQe
         23jiJgaP5oYMPr3r54ARQEMSeBdVHa0uAhQr9YOx/LU5v7u39j3WuhA8W6HfQS3VSeg4
         o84A==
X-Gm-Message-State: AOJu0YyTX6DKBA8+FQYfQSES3emNwHWyC6ZAEuFmczxwexZ29VqyeHOC
	jVmqVpLQIQkkra3ilb2msNklNg==
X-Google-Smtp-Source: AGHT+IGvOqtyZxH1eotD7XBo6uaExFnUdODBgoQCOSDBpJTGPQZ4tRxNF4mNV3heGAAC4nTzUBWM+g==
X-Received: by 2002:a17:907:7295:b0:9a5:b66a:436d with SMTP id dt21-20020a170907729500b009a5b66a436dmr13524162ejc.14.1694336978017;
        Sun, 10 Sep 2023 02:09:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b0099bcf1c07c6sm3541516ejc.138.2023.09.10.02.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 02:09:37 -0700 (PDT)
Message-ID: <f8864242-daa1-e72f-4759-aac3fa1bbcf2@linaro.org>
Date: Sun, 10 Sep 2023 11:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230910062852.15415-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230910062852.15415-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_020940_591522_244D3601 
X-CRM114-Status: GOOD (  16.09  )
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

On 10/09/2023 08:28, Macpaul Lin wrote:
> Fix the missing description for Mediatek mt8365-evk board.
> 
> Fixes: 4f5fc078ac6f ("dt-bindings: arm64: dts: mediatek: Add mt8365-evk board")

There is no bug here. Drop.

> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index c2935e99626b..3ce39a346fb1 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -248,7 +248,8 @@ properties:
>            - enum:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
> -      - items:
> +      - description: MediaTek Genio 350 Boards (Genio 350 EVK)

That's a bit confusing. So all of the boards here will be Genio 350 EVK?
I don't get what is the point of this description.


> +        items:
>            - enum:
>                - mediatek,mt8365-evk
>            - const: mediatek,mt8365

Best regards,
Krzysztof


