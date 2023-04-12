Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D2C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eY38QovBO9X6brYLqxxxjQBNRV1VBzhniRNPrjrGVZU=; b=ntn/XYTGesxLRxW85dC+VdQ3rs
	xnEUAynURE2N4sUsHMCdaJpgTnxY3H0L+vTmOEduuitNIjJNLtuzrVgZOe1wVRshvHr96tWcxlQ01
	+i9oVuC9lxCi7E+Wl98YpOl7BGCAx/lqCHXbEuzdHfeHWVKnvE0QtdJpN9NeSeov4/5MaaYHCa+dR
	Qwjv2MVUE1422LkAYTPH4JEFWTLfsK0tnabypEm09xKqCXghEuzGjxUjk1s6v2Tl4UkMql68tH0wH
	0M6PkZdcYpCeU83HlZYpNNc5Kld/irgJxJh8h4gK43hnAm1Yr4xiKC2ykWrpL47vKTlxAkpGBAr21
	NnFE5L+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZgN-0037i6-13;
	Wed, 12 Apr 2023 12:34:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZgK-0037h1-1d;
	Wed, 12 Apr 2023 12:34:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id gw11-20020a05600c850b00b003f07d305b32so7187400wmb.4;
        Wed, 12 Apr 2023 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681302873; x=1683894873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eY38QovBO9X6brYLqxxxjQBNRV1VBzhniRNPrjrGVZU=;
        b=fmZsiHj4rx9xq5FQgOmOXXcMbHU/E0WtOfVdbUc8+/vCn2M26CpV8Ek1O40/kkrWEi
         6zMJDO5HcE660BAUn/G/QDSuh2gBMfU2cw6cyqL8o2NhawqkxGwQ7pPopcs2lBY5HuYx
         V7B8DOHQWR+5JsQYup6pv5v7W29eqmYY+B3IrwanVAdzSY1wx6NTATHVfYFNfMDJC9X/
         0+GEUiksr0AZa+EI+SRN79aBlMgcgPNMLkTf+YnmKZ+q+T78X+fZKV1M6tPm2FSWQSrQ
         YloSPAcWSSJQkVX0MlpguqUpaYZxw51vAKtrGBbjWA7gFpMz/D2gsbFSSl5VU95KjoWE
         dO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302873; x=1683894873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eY38QovBO9X6brYLqxxxjQBNRV1VBzhniRNPrjrGVZU=;
        b=k3cz27+YbOSWxFAMexxHpbKvUXsNvlOWNPq/NP4pDiRmTYLNPfH5WyO2EsdOurrXO/
         5ZP8Mlp0xodJTYeQu2nfcWtvkBHKlZpp9ITmtHO8LLF8zjCAYPt4Lbud4ppfepXs1EcX
         opQcSr7s4Vaxl5j19rdOI/pYv5HmH9HJ/fo7NEySriyS2PXvwjEwCnX5BwGH7veL4ai7
         XF5f+sRoweiXMs6PdPCVJR4GmdhnHNFrfawgL8QGrA/gx7L+XDRH26rKdvA/6pp8m64B
         ryWF50dOKiqGitnWhMYDDtfLveyHKxX9VG/C6mkKO6duA0nGAAioiCH95S7V1Y47p5kO
         rQuQ==
X-Gm-Message-State: AAQBX9cVfs0IPbTB3poJG6k+fDSpmORb2+317xJi0ZqkZMzu88PRw8a1
	P8+0Tbn4CDJbYKq2B/FN+QU=
X-Google-Smtp-Source: AKy350bGRvf/Hjw+RYU3A7cGvEuMBp8eO5w3pbAUHmtpQjt3TNMecIwKpO6IParEHspcLI6mD84xZA==
X-Received: by 2002:a7b:c84c:0:b0:3ed:bc83:3745 with SMTP id c12-20020a7bc84c000000b003edbc833745mr1856609wml.25.1681302872837;
        Wed, 12 Apr 2023 05:34:32 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e2-20020a05600c218200b003ede06f3178sm2223361wme.31.2023.04.12.05.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:34:31 -0700 (PDT)
Message-ID: <7adda7a4-99e6-f3a9-22c2-6f4e1e2273de@gmail.com>
Date: Wed, 12 Apr 2023 14:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek,dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053436_545581_E0391869 
X-CRM114-Status: GOOD (  12.43  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
> the same DSI PHY as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index 26f2b887cfc1..a9f78344efdb 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -24,6 +24,10 @@ properties:
>             - enum:
>                 - mediatek,mt7623-mipi-tx
>             - const: mediatek,mt2701-mipi-tx
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-mipi-tx
> +          - const: mediatek,mt8173-mipi-tx

I suppose you expect more SoCs to share the same fallback in the future, apart 
from keeping in sync with other comaptibles described here, so:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>



>         - items:
>             - enum:
>                 - mediatek,mt8365-mipi-tx

