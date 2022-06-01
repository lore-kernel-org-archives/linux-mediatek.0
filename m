Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7tlSEnGDwba1fZj4+hxvoSoRZaF5iDCLtKzSy0oBGs=; b=P6SNgMpcH6SAh3
	l6PzqbHMBXmbIxXt5/20W9/GHTrTTEhsASfLNrdWZPkPV+7F3WNye+DuxChKCZv/QMf8WKxgLI0jN
	d+XgsRqA8MjGbCJbDansx+LyzwpzTQvZi7kaFQTw7RIPZDBenZafClM19SaNNB7jSOrqn8tnBgQhm
	CAs1lZKRimiHC2yqrIiHoK8u9NxmuE2lwcGymydntE7SYzV5zuhB6Z7Pqi1uRBb1Q9C1bZF+fqMkr
	NVkutHceRHLNK7xOP3jMrpcPPprHrclXOONQrXz/GAFfq8ztwV1g3Q5IUW4+HYgN8gcSDbVE8z453
	lUTIjIhDHDNpga5W+6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKly-00Ex9u-Hi; Wed, 01 Jun 2022 09:36:14 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKlk-00Ex2U-N7
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:36:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id u12so2520702eja.8
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=80TA4biEL75JpwIy1s29sYa6y3k0xQC7PWeNV9LgrvQ=;
        b=tKtvsZK+FpDanzSTRFw0YIjrVyEJrG72uSqb0z+4vkE/CmrtUfaW7U2SdbLzLJ2PQr
         B81ViPqRk2Er7c00KN6OcOuV+VAAWhQXDS5qqmn59IAxUvfaNdLXuqqK6tY4ygbfPb6q
         tYV+Nxi5wEZf8fDRUT+7nP4JwSQcvGWx+5Fspvp5ZulhHt8EvsXsMLgtOZSjbB8fO1xG
         Gwgf0nZ2BJiCKvegpIzHvjJSEgUZgqEY2hLTHW13Ovwno4zk7n6/vIKZTKuhblXdPurq
         PJxjvEV6jtjisq0Rk3V9r00Qvso7tGD9biCoactt/Q1DrpwJUiCsHMVqgyXbXMNFUD1V
         RrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=80TA4biEL75JpwIy1s29sYa6y3k0xQC7PWeNV9LgrvQ=;
        b=Dt9yQUyeUFEi88sOg+jhImoIL12kI2efm1cAlKAZWXBP0Bhj+ym2ps31/rYiM8iQjf
         xQax6ekav+PmJAPX/oMom6cnBpSQbQbg/zOpx5yj5T6OvhEMwHWU5+4mr4Sl41dunvvP
         mHLMgvwxB0ben3a7usp0+uguvIl/j0M8rp8KrZX6/Z75q2YlrYCDoqvxxmvjU3LWVEtc
         J9OH6dufYuVLDVgw03BBBXKQg8vbvlVADeqelo8rpb4uW6aUhx6TDyVEw60c1Bq5u9UW
         D0XKCDKRWitwRRHBScN/LDHsiNsXKydaBPo4p82/EMEjgbW/xWVO84bKThHmtzw4fjGY
         f+Cw==
X-Gm-Message-State: AOAM531AgB7c84C81erIEH71eJM20SktiE6jxSZAKdr7PqXNWH9epPPL
	7xS/aS6nIb4v8vhysl2wjiFR3Q==
X-Google-Smtp-Source: ABdhPJxHNluoQgYzcVZlXvHgthHPUvCjucaP5txH3zIrCUu4kNf9JIOOTe88nyi6ufuCZ4jETDxlaA==
X-Received: by 2002:a17:907:908b:b0:703:9e42:3d07 with SMTP id ge11-20020a170907908b00b007039e423d07mr5211375ejb.748.1654076156968;
        Wed, 01 Jun 2022 02:35:56 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a1709066ac100b006feed212f50sm482860ejs.184.2022.06.01.02.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:35:56 -0700 (PDT)
Message-ID: <35389032-c4c5-8bb5-3a78-52ff6ee004b5@linaro.org>
Date: Wed, 1 Jun 2022 11:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 03/17] dt-bindings: mmc: mtk-sd: add bindings for MT8365
 SoC
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Wenbin Mei <wenbin.mei@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-4-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-4-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_023600_759191_54B41ACD 
X-CRM114-Status: GOOD (  12.99  )
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

On 31/05/2022 15:50, Fabien Parent wrote:
> Add MMC bindings for MT8365 bindings.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..3195b80ef057 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -38,6 +38,9 @@ properties:
>        - items:
>            - const: mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
> +      - items:
> +          - const: mediatek,mt8365-mmc

You code it so inconsistently... It's one patchset but each patch doing
the same thing differently.

Please put it under enum in entry above.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
