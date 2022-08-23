Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C1BC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etUNLniWHgJEJDCvw5GPxyP6mirBEPYcAYo8g53LeZg=; b=MYG7BIZFt9AJQyiR8Mzufc/hGM
	KtNCyLSwxGJ3aT9hn3TjeaTKYxmtEwofvLp8dJdyRbiFatVA71gxzwjuecjh8bk+9PIiS7t/g6jvF
	MbwnsUDoDEsd4vEEX4vRt+uBT4ZzY7F7mvIoOyc7P2i1mKHf0LAizi4w+NAU7H+peVhvrXKne3sMp
	qN2cdQpWvClbjdDExMpJ+FnX8Pi/AkTDxDIL1lb9iI8UC9zB52shTpWtQy+XVZke5H6L4nBbNa0IK
	ofnowD25rRBFrz1T9RGKwcZ/RqbaLmcKQKmF1JH608pdmeDhp2QB4gmi+CK4zdJDZlJVW6PK+G4H6
	1OsoBnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQUGR-006Qjm-MD; Tue, 23 Aug 2022 13:48:19 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQUGO-006QhK-9b
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 13:48:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id w23so8428907ljj.7
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=etUNLniWHgJEJDCvw5GPxyP6mirBEPYcAYo8g53LeZg=;
        b=G6u/gMHONj31bKntnY4mYMMepTc/qL4So3m6ypkJTVSM6Qx8oF5a7AjqcKACF0T90o
         ABUxoYHTA10t/J7O8DagZehl8ZgohPjweSQbDRxeFvG0CKwaGJcJAsh7K0m+Ez5gy60a
         RnrKHF312WnBAg9ACxc1UIB4SvNn7d8s9aOH2d7Pyg86qIzn+tlaKNlwpDfLpAI29njg
         OZ9WRyx7e0k/Tbiqe6bDgOR43DH2MzXZWulM58eicHufIU36kVwe+ngKi9Xi8WGEUq26
         3xRAi6KUKa5Wh2MS0Pm3IaPjvZMtMzUE5ikE5T/s/LxFQ++UU+SXZhe1/GLxsJ+kIC+9
         NkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=etUNLniWHgJEJDCvw5GPxyP6mirBEPYcAYo8g53LeZg=;
        b=dayLV3dzbFdYF9wy1qfEaZ1y1Tk1rpNA6v4yEjs7KlFUeUuehFBIcscux6AVV2jVh4
         vb1jkYMFAwA6fsjlvWYC+YsyPFb35CaIprt0JUvHbzlOx62R0d0kKaoS4UIBImZhr1Ob
         dXPYyc8PZ289fgbd/UjDW3bg4qkRw2q3ZCgnsDv7IyxKnBNuXw4TPuLkfGVxczk7W1IC
         mPuacN4KqlfX3XwUblEDmb0xKLZx595hSco8xPnRoHptmm7l1aoyJFsH2jrceMPaYaIj
         B8niAaUBFG2LriodD7jKjImsh9Qnya8WntsCPLKwg6lgtTuzQfdzxFqNNvoK0vf9e1mW
         ec8g==
X-Gm-Message-State: ACgBeo3n+nC2fLe0BZC5gE35btACCmIjQEcpHI4nCUAjHH9SlwQoiH5l
	rHryM91ozBSjBk3alMQxkUAurg==
X-Google-Smtp-Source: AA6agR7LLkgQKhdY0aEo6fL4eDcJ/ReUbDhzV9yPR1SsZVcB8imNPrMITsvk9qQ5MHab1vJPAgJbIA==
X-Received: by 2002:a2e:a812:0:b0:261:8f2d:9530 with SMTP id l18-20020a2ea812000000b002618f2d9530mr6450626ljq.251.1661262492350;
        Tue, 23 Aug 2022 06:48:12 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id w23-20020ac24437000000b00492f6ddba59sm398330lfl.75.2022.08.23.06.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:48:10 -0700 (PDT)
Message-ID: <2d2511c7-760c-31d5-5283-8ab0b20849d6@linaro.org>
Date: Tue, 23 Aug 2022 16:48:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220820075343.13993-1-chunxu.li@mediatek.com>
 <20220820075343.13993-2-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820075343.13993-2-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_064816_401288_71A2F960 
X-CRM114-Status: GOOD (  13.99  )
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

On 20/08/2022 10:53, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>
> ---
>  .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> index 513cd28b2027..d810dfccd1f8 100644
> --- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> @@ -43,6 +43,16 @@ properties:
>      required:
>        - sound-dai
>  
> +  mediatek,adsp:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

No need for quotes.

Best regards,
Krzysztof

