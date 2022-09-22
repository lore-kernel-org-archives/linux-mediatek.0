Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB33C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=; b=bHzE/g216i77VQJCxYY5WLj5+6
	tUbdbZQfHev/BTcAT0F8sZ/GPyzXbbQhQOP4oK709ZhxoTVB0wvQpvIW1vkFAwL2FO39b6a5KfLFa
	P7HjB7ieaNAz0eJJr6GpSw0sO4g4gqFGlV3Xj4012XPjEqeNNx8UPJz28SA95btpYxFwNf/Vjywzp
	JYgxw6Et6cNkZOfGotilZGvV9KYXJLXdhck9hOD2ol2bQJKAbOeZSxMJ0stoxKlVxPQgglQ0U8Mpc
	gmZRazVrMad/G0zbEOElRJZJO+vA/4QHc1QTTD5bX3gmsp4wzJw3gdqWjzj06DgId7we30pbZnFv2
	w5PZgI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGZl-00DohM-QO; Thu, 22 Sep 2022 07:24:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGZR-00DoZp-Tx
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:24:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id f14so13226779lfg.5
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=;
        b=MSlRGljboTuGCdg3YEgOuKZBwTHCYcmzhnbgNphcxRdZyyfnwC664T8n53L+7Kb5A1
         cBjGVu/xWbq4oUq8SLl+K3rsUKIyb/pAPtYAe6Ak01fZY6SfyZEnTaLs/z3BMKPjkSgv
         vjmGQIgs1lLjxNx/uTL+ut/giC8XhZcsQwMrTBvzpBex0lB1/0LvbylWJluy/Ic3INLQ
         SjlutBZR81gnaEMn5Jc0oha2px1AkGagITF9BddZQkinMio1PuFwtZLaGSUmLItkLHzB
         1LEDnf+uCMw/DTWJNW0akGZdDtngxnSDEMs68J10o1m+HzEjBBsp1pp6Xc4Uce8MuQ5O
         YqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=;
        b=sKghqR0A5edvlvlmPTqicXlNl+isKS7bSC7BNIhh1V2IGrZWx/dn2VjEZ4Oj2xxUSM
         /ky6NEU610Z6tJtYw2WpeQ9cN23p3a5x03SCzzVNa+jlfd608NhM8mcLQT3Mo3PgnDP+
         B2VbHEjvDx7ai7UyoU6u9mj5qZBGlxHG0J6kN0OiH51079JIUkB6KflaF6+d0Sk/lbUS
         Ca8zqxo2EdYzTRV9ZHF9n7n4Lm42eQ4Una+LsEJsONSxRaaItzXcRYPkWn0CiEv54qz/
         bHkZY4t7sfZ2IVv6UelZma68n+a+K9BiohfPM2cQ/VKvrDsnOq9YYSKoEbwQjR78tD+5
         BMkg==
X-Gm-Message-State: ACrzQf3jfsNOh7+ycKccLQ9OWohMP7RZDV26vkfiqII3zrm/BZz5JuBj
	D6nx8YWsoYYmKrREDYUfI1hNcA==
X-Google-Smtp-Source: AMsMyM5zA8VBFZmHafhekY2Y0dpCwQNF2kNCm9Hgz6tvQd/1QC+mRy8x/sO+uaHu1Mn31n8rO9wtGA==
X-Received: by 2002:a05:6512:370c:b0:49f:c4fb:8706 with SMTP id z12-20020a056512370c00b0049fc4fb8706mr723544lfr.635.1663831468306;
        Thu, 22 Sep 2022 00:24:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j5-20020a2e6e05000000b0026c59d3f557sm769428ljc.33.2022.09.22.00.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:24:27 -0700 (PDT)
Message-ID: <c74b4ab7-e307-482b-c4fc-0a7a1e39d6d1@linaro.org>
Date: Thu, 22 Sep 2022 09:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 11/17] drm/mediatek: hdmi: add mt8195 support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-11-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-11-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_002430_015705_5AAF8BE8 
X-CRM114-Status: GOOD (  11.92  )
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

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Adds hdmi and hdmi-ddc support for mt8195.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>


> +static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_hdmi_ddc *ddc;
> +	int ret;
> +
> +	ddc = devm_kzalloc(dev, sizeof(struct mtk_hdmi_ddc), GFP_KERNEL);
> +	if (!ddc)
> +		return -ENOMEM;
> +
> +	ddc->regs = syscon_regmap_lookup_by_compatible("mediatek,mt8195-hdmi");

That's not how you get regmaps. If you the driver grows, are you going
to grow the list to e.g. 10 syscon_regmap_lookup_by_compatible() calls?
This has to be by phandle.

Best regards,
Krzysztof


