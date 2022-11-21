Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C097C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=255dOqNolHNvw0+5ItpWC+fmQMElh60KndDJXZcS5WM=; b=4twZ7LYNXjRc7AjNaJXk122o++
	vLc/3TzmuXJP2IMouRbXSX88OHOb9+sugfvLO9mrtQ2e3u6QhGPLmv8t4SjsGH4cplM5PQ+TJQgA4
	Ca3/u6SY9QlEo51iSUOppB3CAGjmSldBHINkfGMYbYEdYDY8EsEtiL1auDEW2jd9D67z5uLKrvKQ4
	xBdRbZU3KoKUQaKSO8Exg/XUUiiCRsMF9xftn/Prq8j65zrybNpGkRXufqldgoZ806fwe2+rlbVGN
	BZKmnrAHK1UHCEY0siIRnEsf61J+3h4ai+3KoAv/t80949rakvox5Ff0YOQVAq5eFEMQ1XUN/39oc
	TG+S75uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7Ah-00E66J-Ge; Mon, 21 Nov 2022 13:49:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7AV-00E60t-Dm; Mon, 21 Nov 2022 13:49:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 219306600371;
	Mon, 21 Nov 2022 13:49:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669038541;
	bh=AeKWzGXHbjRKpMaS+ztWcfZ+DeI78CJ083tMt3FLtes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvComeICZ+p7rb1lgdPClfoyO/gA+D0VTz/zn47MaRosJ+vsGqguHKWSYUZZXlp+4
	 ApbqaD01wloyg1n/LrsQ8BRaImqS0tFmCnBDVPb5DG+4fQdRQsZE0NwabIqlUxiqJA
	 6dbt0E6jgQkxX1i+Upu+iKAWrvod1wn4ljKNv8Rv2whVNckIJFFrgOCpEsccQDpFSJ
	 u06xUkNp0QYwa7+gXDXhxsEtE6lMTAZVStCXqz38UpUYTMJTtnR+CwdPLa/qsUFl0R
	 jN8Ek/4YiZNsFcb58074RKzFx3sAbpZH0Gt2J4qNwywvaz2OvCWr/LbatB4/LTGRAC
	 545gIjRkAST9A==
Message-ID: <1d27a496-b49c-94d5-e9e6-68c81195a69a@collabora.com>
Date: Mon, 21 Nov 2022 14:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 6/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6735 pin controller
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-7-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118113028.145348-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_054903_636265_1FC90D24 
X-CRM114-Status: GOOD (  17.88  )
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

Il 18/11/22 12:30, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the pin controller found on MediaTek MT6735 and
> MT6735M SoCs, including describing a method to manually specify
> a pin and function in the pinmux property making defining bindings
> for each pin/function combination unnecessary. The pin controllers
> on those SoCs are generally identical, with the only difference
> being the lack of MSDC2 pins (198-203) on MT6735M.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 55 ++++++++++++++++++-
>   MAINTAINERS                                   |  6 ++
>   2 files changed, 60 insertions(+), 1 deletion(-)
> 

..snip..

> @@ -352,18 +391,32 @@ examples:
>               };
>   
>               /* GPIO0 set as multifunction GPIO0 */
> -            gpio-pins {
> +            gpio0-pins {
>                   pins {
>                       pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
>                   };
>               };
>   
> +            /* GPIO1 set to function 0 (GPIO) */
> +            gpio1-pins {
> +                pins {
> +                    pinmux = <(MTK_PIN_NO(1) | 0)>;

Please follow the same format that you can find in all of the
mtXXXX-pinfunc.h.

What you wrote here (MTK_PIN_NO(x) | func) is defined in there for the purpose
of providing a definition name that actually means something (for both readability
and documentation purposes).

This means that your GPIO1 set to function 0 (gpio) should be

			pinmux = <PINMUX_GPIO1__FUNC_GPIO1>;

> +                };
> +            };
> +
>               /* GPIO52 set as multifunction SDA0 */
>               i2c0-pins {
>                   pins {
>                     pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
>                   };
>               };
> +
> +            /* GPIO62 set to function 1 (primary function) */
> +            i2c1-pins {
> +                pins {
> +                    pinmux = <(MTK_PIN_NO(62) | 1)>;

pinmux = <PINMUX_GPIO62__FUNC_SDA1>; (is it sda1??)

This means that you should as well add a mediatek,mt6735-pinfunc.h binding...

Regards,
Angelo



