Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE7C761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8gFRk6npXZUFsEh6okDavKy5iOSV5lNNvjAZq8dGGQ=; b=tQ2vIKCqe4D87Ec6MytSxAqXgg
	zHk8fqF+Bx9RubBOGzBm5ih0lgzBucxxyW9kC9MIlEPN83gMDLanp5ZcTsAUOBuoJDqUXzOLt0aLT
	iSonH+3bsf57iQdS6v/0nqmVHOQLR7HkmafxT1baJT8hZCUhlx0vaQJFmNbNUxi3DOPwdpqyyIs+k
	ywVkS+x0tryAKiiiNCN5cGI1qWs8eh38akg7n4GyuDwk82aVUWoemVze6EdChKz6qQUwP+T6bRaBN
	Vl01TodR7mY57JnFIQZwewf0tMddpx/m711Httk3x7v9+hZlya1V2kKv5RkazjxdRTAx5kkiqrpvY
	EHUsuEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvtd-004bFr-1c;
	Thu, 30 Mar 2023 17:17:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvtZ-004bDn-1D;
	Thu, 30 Mar 2023 17:17:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so12274932wmq.3;
        Thu, 30 Mar 2023 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8gFRk6npXZUFsEh6okDavKy5iOSV5lNNvjAZq8dGGQ=;
        b=Xqxw08Vr4ij2tYYkX+zcETwPPckqyN+pCYWhay+i+vFGCC1ur8xR+PGWB6X5RqJxcz
         6G3HYbXACggrpVucvh44NtMuxmPIbHuThNE6K9OMcEY5kWl7ZKkCT+i9HkSW6hH5BRNY
         rVHHqMrzIHOUbm7rbhGHle5f4Y9AU+2q/Nb785UhbLTISjEQ1tfBEKtJg4x+eQSTOVwS
         iNb85SOiFW3gT2Lb4HFTz1dglpp6p1mewGxWpy6nr94k0K/mK15zwotK8GjFJ4pzQMa/
         lzoenhLO0stw5fqzXXxlq8a4gcNfIa3bX5XKgF/VU3jz2cufTBkKYwKcZBCUnHNmbgjE
         TV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8gFRk6npXZUFsEh6okDavKy5iOSV5lNNvjAZq8dGGQ=;
        b=mmuqHc0Sb30ZmrNP3YI8I4HGs1lTBRimTcaFTxMXBJYlxrZ/LDNQ6ZvqnAwqWCKJfm
         rPJvo+Tw9iL5+2Z8Lw/w9GM3zOjVGw8pcOyC9CghlEMNsCtDnf7fHNkDZa5brAAB2DFx
         JtNjgkDYOLs3gdDAVu/QdNR8eKU8Nmt64C5uQRSPNnvGaq5FeVfHFAilqEJotynmEAGn
         Uh/Klz+8Eb/e2PicOt2pl6N/cVIR0FLYqT4hQlYAkfaeWAMf2x9zBIuVbT/tN6/ehs8w
         Wru5zUZ7rCG40RwWewCxuQ1RVP9xfcCNnGk7G5AsYJzLy05a7UE/9NSy2h9WDvNEn/1n
         tS8g==
X-Gm-Message-State: AO0yUKVKMPOS1oAhTGcencFx/VQn1e7B+Gyzo3muDelR4jS8b7ldsPwn
	wfDm0LBXSy3fLnJ2sCOeZQE=
X-Google-Smtp-Source: AK7set92ZY/22pauXvcejr1Pry9EPukTCSQrrUreYCewWLNmuq2Q45DRuWZmp0KGJgjsRAQnql1X/Q==
X-Received: by 2002:a7b:c3c7:0:b0:3ed:fddf:b771 with SMTP id t7-20020a7bc3c7000000b003edfddfb771mr18578210wmj.12.1680196618247;
        Thu, 30 Mar 2023 10:16:58 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c029000b003dc522dd25esm6406727wmk.30.2023.03.30.10.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:16:57 -0700 (PDT)
Message-ID: <7dd96d42-e43d-9e49-a549-07f3969dfba1@gmail.com>
Date: Thu, 30 Mar 2023 19:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/17] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-1-0003e80e0095@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230203-evk-board-support-v3-1-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_101705_414539_AFA667FA 
X-CRM114-Status: GOOD (  13.23  )
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



On 29/03/2023 10:54, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-wdt
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 55b34461df1b..66cacea8e47f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -38,6 +38,7 @@ properties:
>                 - mediatek,mt7623-wdt
>                 - mediatek,mt7629-wdt
>                 - mediatek,mt8173-wdt
> +              - mediatek,mt8365-wdt
>                 - mediatek,mt8516-wdt
>             - const: mediatek,mt6589-wdt
>   
> 

