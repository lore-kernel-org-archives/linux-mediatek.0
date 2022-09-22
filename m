Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4212C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPd1M8oBjHnNozp05d671P5pFiuRlsalsS4w6miNryU=; b=jbIbxWu0lskfBKkOGy/7Kh+tCw
	M5HSj20tc71eBpigj6lDriix6DXyl1JlJpjVlnHcn8xL23TCVzAf5dd9PsMNgez2IwfDkAGkN58G5
	LtirIvnD2I/u9oz/BSHvOhcgShMdtsMMzcEpgn40OAIzIz8w8qZzqkXk3JyK5V7Thuk5g6yFJHWQ6
	wQ0pQlMTBSidNusQH+unIvOnpbi7BLgAoYVdt6lR5PNHX4lLv4DIRn350KY/Zp5hZamE5eJm0d1lt
	x4JK2BB+YVJcbyOhVGJtB8qH6AnxkXdvE8KwaHYOuO8DBL4C9E+Gfl28MfBxnYPuNSysbxV8v4W4x
	d9Gtio9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGWP-00Dn6s-Mo; Thu, 22 Sep 2022 07:21:21 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGVw-00Dmp5-Hz
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:20:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id a8so13126445lff.13
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TPd1M8oBjHnNozp05d671P5pFiuRlsalsS4w6miNryU=;
        b=DEJqWRMQjOJQ8++nLzN9KbMQNg31pNbXrNYPjUYeHJxeulmWbiO3uwjEydrBT8enpx
         5sS2fPSXu9nqh8I/U4KFSjfV3G927s/rv1tqmj11Z2hF3kMbAnVU2AD+yP09o57fyrB4
         3cJUgnwaYKiaus3XEQp1bZ/IX9OrFDM730VMEIsL18ne6cBc8bpe+z91516vR0rgCpTP
         AiRjBaf+dMkrbqac4f8myV0JWSpk4Ag1fPfLQclSe47PPYVhP9hqgVE/2t3wrtFREca9
         Dd1w0tMisqyJRSHK931fl/LPYRhJH7/SXY2e8WeY+Ypjx66EOWYGyniBFn6hR7Q3Zlzw
         uVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TPd1M8oBjHnNozp05d671P5pFiuRlsalsS4w6miNryU=;
        b=voR2EZOrC+ILknZN7nv8u1ybrPx+7tuRTm2wnDd91CZKJ6QJZkR19akNSaMHB54ovI
         koW7As+i2tTCqIdDybP8yjTuTQYV5eo30vvG9KnEYGkbyFhNz47lYza08mMcSZvkB5ax
         D0y2BXCl59QzUK4pbKSPZohCTiOCo9+JHWLMHWdqSohM/AxH50A+WJvjxc47l5bQdFkd
         Bl5EQeqP8oLzHQXcZzLYLTjYQ1vFHhDRCtcy50jrnl8WwF4QJgb12B2HDVvNsYyAWY84
         M2kEM5/pRo5sHCCL4XNGuv1kEqVrBYjhgYdWCGQzWjgPZAQx7X6gvFNE7mKfWmyW9oSc
         y5nw==
X-Gm-Message-State: ACrzQf2DLIJyt3s6gqQDCwBIBhJ0ZmKI9NOFV7rUpRw0uc9R+X6NC3bo
	iuFEU6BAh9lgpgQkIZ5Q/lpC0A==
X-Google-Smtp-Source: AMsMyM55t1rNZFbd9M//L345bj9ZqSPstb512C/ND5LsTPVxSfYeiy0p88QI81OjW4xD1dRYCtEUEg==
X-Received: by 2002:a05:6512:3187:b0:49e:6607:3a75 with SMTP id i7-20020a056512318700b0049e66073a75mr681890lfe.28.1663831249033;
        Thu, 22 Sep 2022 00:20:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a199209000000b00492e570e036sm801300lfd.54.2022.09.22.00.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:20:48 -0700 (PDT)
Message-ID: <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
Date: Thu, 22 Sep 2022 09:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
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
 <20220919-v1-17-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-17-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_002052_654747_93AFECE9 
X-CRM114-Status: GOOD (  12.49  )
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
> Add dpi support to enable the HDMI path.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 72049a530ae1..27f029ca760b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8195-dpi",
> +	  .data = (void *)MTK_DPI },

It's compatible with the others. You don't need more compatibles.

Best regards,
Krzysztof


