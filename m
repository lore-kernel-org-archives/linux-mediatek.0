Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF18C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rv0MnDhBR7RhUm2k1VltfAQGecmQlEWVWwPtQQZTHPg=; b=emNcSarJfUEl/u7fLhRCcBMWi4
	TVd7gdnO9JCd5t6YTW7MrPpOH08MZXVvn4kLxHBSbcSjuUit9+XOP99MPNUfhpjhPGH+zvyySW+8A
	OfOUjHMv7u7DlPkk12vQUnjjYtukEl2Sk16um/MzZ0u0nJRZFlOEfQsXfxSOeWDKJjfVlWWFQv3/W
	37VyR/p+eLJPfO+HVWSYrre3JCKnu0GtFRO1h7zkqTH+dFTb9HxSQmZHiRMmgpyg/8MlS/s8tWgm+
	1/OuPW/ippGq53VIY6DPvt1ooUD+vLsWDF6GSko6XmvP7bV8bKpWsTrT5kV8q/GrcNhFI4oHmQOAL
	5RFi8gqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklsL-00AFvb-34;
	Fri, 07 Apr 2023 13:11:33 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklsI-00AFu3-2O
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:11:32 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-54c061acbc9so115211277b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873089; x=1683465089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv0MnDhBR7RhUm2k1VltfAQGecmQlEWVWwPtQQZTHPg=;
        b=sGiUUuw1QRatxtEb/UcQOiPIoY1SZFkm69NaXnTRo60jT4ICPWsMeAtRvL98qGWe7Q
         jN4DQbWsj1/dP2Q5K2d6eHD5/C3BBT3SY4K6PuT834K85Y1+4cmuyUWup4N3K+iAT5eI
         HIMEc+3yk0sxork9e9g6HVgcuBFFzN7bJCpXdLxPF4ivGxkakgz6/BEW77QTgNNu7/mq
         WXUUwzGacCRgJJxd/fT5jIIIu74IK/wte3z6wC3MeALpaSiFj+IRXy9RJ0U1qPd1iB9n
         tmIAu0BdnFmdXeVlPm8k/XG61BqA0juulyMNfCvtnJeqFllkf2y74zxRfjTWaI4BqnPa
         wa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873089; x=1683465089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rv0MnDhBR7RhUm2k1VltfAQGecmQlEWVWwPtQQZTHPg=;
        b=7fAghktH/7HQMDahquv/JalCsC577kTS7rPqrR0odkPgqMmX5Ndk0xWjwuPed+elUK
         LTCDNfGStH3ipxn2PgqOP7rwvLROBzoof1xmhYBCc5pZBsiBvB4hfrrYZL4dSXWFzPMl
         W+GJuT2jUR+K0mWPg3Uw6ujoAYy8yJnhPxXK5e7YEmmUE1UxOVTUkXqJWCM79YMeQ0Y9
         aJMCZdCuAvO6anZSxGwObTnxgorlaqpzSklcduZtMAN7J2mtDeuNx30mbB5hUtnpCOqY
         lNNHD2YP7PLWrBTQDkClLhz/bGxRnjSnpbBs+v6k7+CW6/3Xc+SPMegq3QPRjWDoCNZn
         OQBw==
X-Gm-Message-State: AAQBX9fp9Bo0RDrNTUg8TvJI64yXJu3GzWDY5FST+96eHidg+dLSfjeS
	jP0tqGih3W3evXBpAalUu50shRlXNqUdWfWRuHqdmg==
X-Google-Smtp-Source: AKy350YsVPmfbqSl4Mg2xQTxsG99IXxfODcn5+1wDUxnKufIsSDPx49h6IuM/EREPmJZAy1l6VEHsqiSVeLHvbm2juA=
X-Received: by 2002:a81:b10a:0:b0:54d:d7f0:1d3b with SMTP id
 p10-20020a81b10a000000b0054dd7f01d3bmr669370ywh.3.1680873089054; Fri, 07 Apr
 2023 06:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-3-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-3-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:11:18 +0200
Message-ID: <CAFGrd9oi0AT3L8DVs7OYq-RjzBTqD+CB5mjKOwEbgNJDdyj2=g@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061130_778843_78394DCA 
X-CRM114-Status: GOOD (  11.97  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> Add binding description for mediatek,mt8365-wdt
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.=
yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 55b34461df1b..66cacea8e47f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -38,6 +38,7 @@ properties:
>                - mediatek,mt7623-wdt
>                - mediatek,mt7629-wdt
>                - mediatek,mt8173-wdt
> +              - mediatek,mt8365-wdt
>                - mediatek,mt8516-wdt
>            - const: mediatek,mt6589-wdt
>
>
> --
> 2.25.1
>

