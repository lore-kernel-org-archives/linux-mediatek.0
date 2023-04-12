Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC274C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LH8FUEh+YJu8DH3rQ9pd4R0sfMJTPR3+WipwFABmNG4=; b=Vzv4n3Wxocx/cm0siL8OYRgvPm
	LXH/E+o0mYyPlHOvA99NypO20OYXu4aSv9bnWhYm8H/htZILbejdPo6sueGR7g4NN22PlqsRgE+a8
	mAu/XjmDRCaYMB9gQSCzBjZv+9xpVNxY8/WrEkbTSUYFxKQVcQSd8uSaLKMpIt9ZO+8GFuqu/G0pC
	ulgDySCuGUzrHITdOeX5FfK3powSchi2VLbUoHV+V7PyuXGlDyrs8f7kb9hz535c7jJMF6EUAl6nS
	LjeeivklTgmP6oUOWHdocG8/tTmYxSIIx2PrqrYzHh495UhpPzoZh9VuDBbgEVy0uiRnJAuQYHilZ
	mP87QHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZcy-00375l-1C;
	Wed, 12 Apr 2023 12:31:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZcv-00374K-2B;
	Wed, 12 Apr 2023 12:31:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso7949636wmb.1;
        Wed, 12 Apr 2023 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681302660; x=1683894660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LH8FUEh+YJu8DH3rQ9pd4R0sfMJTPR3+WipwFABmNG4=;
        b=SKj8hts1928ziujgAoLnuqVkvDvGcPZx36SBJHxw+/0D/ZFODDY4QCuDaPwslggRoY
         AL0fHbhDZ54IiymSNRpgOcztfTVCMYJBahVeQxJRhHfMUx1zzQkD5fAr1uhNC8NkJj+2
         TlI+Xs2wdnQ4C2SbpWPLQAgzPsSE96He+YrPPhFhhWu7QXZIA7tL25TZaWLHKmmfolOT
         mgk5iGo1cZD7lug3KA6VJnE9zKrDfk0tJNM1YvwkgmiDXk29Cjt9H6nW/pcdYSMAbLPj
         FwqojBdj6zG94Wa5EDAvxojVaN46+6GMtSP1CZ/UqkOysvuH+mRZNQ5kNfJvr74I9E9u
         j1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302660; x=1683894660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LH8FUEh+YJu8DH3rQ9pd4R0sfMJTPR3+WipwFABmNG4=;
        b=jnPUZ3Dwxnl3n618fsM538Ml1tFJVD12U1SNwRasc5PeByPMWEoMDQZHC0RDGTCsK0
         3+eXTdB9Evz6AMCDqr4Fcwac218+9/a2SXBqD+9W2Ov5BNHEVtqBcfLnbXLBdjivcVAT
         S1/y56XIAR+Y490vqnO+fQGkJ4PDKbN92d1BbZH3vl0r3pmidfu8QiGMqX+vadEz7KTJ
         FMNt3BYGl921/GGAZmRm0Pw57d3zHqJibjsrsaKJ1nvyn7SwyXMnyiTdL/Di47CBLkaV
         CwjmfSJsrQ0GE3qYjDB1ebPlRvYOn/rl5k8MOjNqlvVpbHZ5AIR3C/XiSvU+ZRHyTkH6
         SkmQ==
X-Gm-Message-State: AAQBX9fwZnU0ke35W90CWyqTIUcvv/Pi2GdVwGkjmGqNGwUQjUW8juy1
	0ElPtFjFtsHmh4bs9/7DCmk=
X-Google-Smtp-Source: AKy350bn9uF0IQIwzgop3ifBPq286Rptgb8qr/QNLk/Ydb6m3Rimef/MNKrhRejMvnS2eP3FRuoY/A==
X-Received: by 2002:a05:600c:21c4:b0:3f0:4428:9444 with SMTP id x4-20020a05600c21c400b003f044289444mr11979874wmj.10.1681302660547;
        Wed, 12 Apr 2023 05:31:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb43000000b002de99432fc8sm17058331wrs.49.2023.04.12.05.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:30:59 -0700 (PDT)
Message-ID: <40b46002-fad7-9751-fc2c-5d96a5ce6b75@gmail.com>
Date: Wed, 12 Apr 2023 14:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
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
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053105_715772_7369F4C2 
X-CRM114-Status: GOOD (  14.14  )
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
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 0088bc8e7c54..153e146df7d4 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -22,7 +22,9 @@ properties:
>             - mediatek,mt8173-disp-pwm
>             - mediatek,mt8183-disp-pwm
>         - items:
> -          - const: mediatek,mt8167-disp-pwm
> +          - enum:
> +              - mediatek,mt6795-disp-pwm
> +              - mediatek,mt8167-disp-pwm
>             - const: mediatek,mt8173-disp-pwm
>         - items:
>             - enum:

