Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F63C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSJK8K5vjWv2/GVOfRJhK9M2GBqzEVnIXuyUiGIt284=; b=xUPymbNV0ZCHPIAgFV5I6XHNvq
	To06Az4avemVUrCm3Kanx7T+YGl40zI8pDRigFlmgxB2JH6bbKs1KlSI+zolaxfoNwjFEf31y0ns5
	+NqGMz+gUXzbzl8a7bsNYM+KCWX3aMx7MiH6C6KtT9RvlbEgxsfxmRqHtAkCe76e2wR1PU7urAz20
	Wr/c+kBRRbzmw+D75P5YAvIqpMy/UmIfE8Aqrfo0/RXB1DP1jyawPbTtizC839aypm0jHEhodXmEH
	jmwsZW0m6yMad4Ld0Lq/iGytzZwjv+abypBkjsYQDmFcr6RiGbOgz3DD+LfkI0rk0Cj8ZJuv8ncnS
	uuo9M4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oau2f-009YLx-R6; Wed, 21 Sep 2022 07:21:09 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oau2J-009YCc-KR
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 07:20:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id f9so7739554lfr.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dSJK8K5vjWv2/GVOfRJhK9M2GBqzEVnIXuyUiGIt284=;
        b=bRWGLyDSb/PlE+DBo6Ml2cCGQFGb73VnZHQptCvBpHFVDHi1H+j0AKvHi81YPWCKHy
         8dgUkwrZsN4Z+JwcsD3KmM2dJptGLc4uZT/bYKplMl/UP68YIrtnrtN1cHdmRaiV9dXC
         dqEwZ5uKmO5I8dzkQwA2EEKOVJvJc+uLjP6tO7G4VGZNzmF8zx56Nr38JXYOipaodfOb
         eSkrx15C/N0wdGj7/sYHLYTDGA5ysiArV1gem+8mAXf4T2CaWeg66j82tTYdYin4uoTQ
         rQnV7tX8ZKkOxeQ0yaEzmDpQPkLxHFioErtkcy9jUsYM0Ao3OB8tWjdKTMWa8MMWh51k
         sdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dSJK8K5vjWv2/GVOfRJhK9M2GBqzEVnIXuyUiGIt284=;
        b=A+BzQEdeLjPx+h7qAU4ku9aKOoIjBEzltczQ/6ca/02Umd3cWrHXc+1Qpe2ddPMcfV
         36zlIX2+E42L0XKq2UNrLdkF63r3K0bdkl5QMDBUxxKaHBQvm8AY7FC09ORsVXOMN6V0
         99PmY9lhqmNJJ/J0pr7b9QueNlmU1xvXGYK4C8Z/A7FsxiMCvcUl4KHEHbX134+6diy6
         nvf9sJWtngEXaXMPN75ZPrjyFAl119hmUBCxGS9VR+88hX3X/NK87tg4C4vbII699bit
         +MCSDichSXEevZkOnDPlP7+fw2CFpELhySOf3SPMSQWag5bVve2Sog95DimWGenyzTdZ
         f2Yw==
X-Gm-Message-State: ACrzQf27o9EbK+DghYIkYf5P5bYMBHBWwFKvlomHWGp3GtFwBjKzM0aA
	dtd2TjQo08X329t1EsgilgNaMQ==
X-Google-Smtp-Source: AMsMyM4S4yZ8U/MIOwL+j8mA0A3teebN1FCRPSnVbHnyyu4VBkIkiZN/SjM8Nm9dCbve/ZamCN2K1Q==
X-Received: by 2002:ac2:4bc1:0:b0:49f:3518:864a with SMTP id o1-20020ac24bc1000000b0049f3518864amr10496307lfq.155.1663744844975;
        Wed, 21 Sep 2022 00:20:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm310371lfe.195.2022.09.21.00.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:20:44 -0700 (PDT)
Message-ID: <b567fb19-460c-ea1f-4c84-0724e73052fd@linaro.org>
Date: Wed, 21 Sep 2022 09:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
 <20220919170115.94873-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919170115.94873-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_002047_688744_EEAC6E0D 
X-CRM114-Status: GOOD (  13.50  )
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

On 19/09/2022 19:01, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Documents for MT6779, MT6795 and MT6797 that currently exist share
> most properties, and each one has slightly differently worded
> descriptions for those properties. Combine all three documents into
> one common document for all MT67xx SoC pin controllers, picking a few
> parts from each and accounting for differences such as items in reg
> and reg-names properties. Also document the MT6765 pin controller
> which currently has a driver but no DT binding documentation. It should
> be possible to also include bindings for MT8183 and MT8188, but these
> have some additional properties that might complicate things a bit,
> so they are left alone for now.
> 

>  properties:
>    compatible:
> -    const: mediatek,mt6795-pinctrl
> +    oneOf:
> +      - enum:
> +          - mediatek,mt6765-pinctrl
> +          - mediatek,mt6795-pinctrl
> +          - mediatek,mt6797-pinctrl
> +      - items:
> +          - const: mediatek,mt6779-pinctrl
> +          - const: syscon

No, this is not like old bindings at all. It's not merging, it's a
change sneaked inside huge diff. Also - probably totally untested on DTS
(or old bindings were broken).

That's a no-go.

Best regards,
Krzysztof

