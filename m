Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6BCC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLnEeD4HScX3wYTfaLfMTcXpGRNYwxAv7p4Jh61bcKg=; b=wpEgSDrarHAmcFyPdT/krhX0+Q
	wdIjYqIfDyySvXG5YSOq59I12DgPCmh4RKrDdxvqfCslVehZSzlNC8IQl22tQLuA1aao9XSOScbZ7
	HVFmdx0WaYRcoIituDtAogbtpLzMH3fhskwZlno9Bb8QtAVAWqyNR9pBELMJAir6sr0lqGCiY/kOn
	hgXx7gJ2GuI0w1R6BS/qh3iF8srzreXg+GvBPDXcD69Szt1ACjJEgT2jUTTyv1613b6fIb1BZXWd4
	GFZ2cMjSWCD8bcBo+Fk+alsbnC6VqctkNqMCizDAVBeGe0clkeSFrfSiM/q2H5HAnVp+BBJ2zWDXw
	0T912ZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SxN-00EfQA-LH; Wed, 15 Jun 2022 13:21:13 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SxK-00EfOZ-MX
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 13:21:12 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-31336535373so60947587b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lLnEeD4HScX3wYTfaLfMTcXpGRNYwxAv7p4Jh61bcKg=;
        b=FAuYV82HbMz5SF8Z7r8LjZLY8Js1QZM8S6JoU4BP+yJW+/cPQITzEEsuzeuUPSFqbj
         cknm9RkZLDfM8pCMnBfGKMOBmpD2wRin39gPIaa4Wc0vF7A53qjSrsZNQYrQW2+63eHX
         /j64PsFHZlvSTFVpZgAvXiKd1MwQG2DwDHeYDWj9MJChIz4j4yj0G4AnzHd5R2/bXDGI
         p9AsvC5FJauhwdgFjUWfPZQWEKVUmpu7mcN/qvaaFutjh4y7Rfut/oK46cqLoiFv8Y3b
         PN6bs6TaE7EVVLE5vSJ1YBHMildxFf+0mCBB9DOccscXnPGY9tgcod5a+h/I5WzQVjNF
         NHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lLnEeD4HScX3wYTfaLfMTcXpGRNYwxAv7p4Jh61bcKg=;
        b=ZCRGWA6Mxd6d1kibvdZ9RwGGyHKKOjaYFd6tZK0qsF+zviUWiGFc3YI1fnRA0Ej7dm
         ia1O8Xclcoztk8POXkS2uXSE1g6QVlhOwB0fZzJEMlS0pacf8370hunIJHCr7pLQdSu7
         XsRwaBli7SQpyAOdgLhW8pmvkOYbb3WJyCGoX9N8qnzuSVXJsJP5m9IzMg6+R/mr+bmW
         8EJilm1rHruEZn2KAKvpM3kHP/Zi0BhLOlKEFU9r73RopOVcyql1oAVEFXMtkMZGukj8
         gmH99fkPC6wCppuR0spkFNIfu74Qvzg2I5XUn8uxxPRxf2+5pS5NWZUiJfnz/T9osxYN
         m18A==
X-Gm-Message-State: AJIora/ylRcpeEuZ1CCSh6WamMU1Cu4VTVK9yri+rjjZe0CtfAxaqK8w
	EVPOGeCUHsuH/ROqc5rRC9Vtf5aQHMbn3yONTmvWXQ==
X-Google-Smtp-Source: AGRyM1sWoBtACZMnUE5e9euq2R2bCswy4VmCdrOftup15FaJJZ5F8vphDQM3yFswuCusR6wCSWVBJAXvAZQH0EVE5QA=
X-Received: by 2002:a81:a00b:0:b0:30c:5c1a:19f with SMTP id
 x11-20020a81a00b000000b0030c5c1a019fmr11566849ywg.437.1655299267750; Wed, 15
 Jun 2022 06:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220525155714.1837360-1-nfraprado@collabora.com> <20220525155714.1837360-3-nfraprado@collabora.com>
In-Reply-To: <20220525155714.1837360-3-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 15:20:56 +0200
Message-ID: <CACRpkdZL6SAHWgOjcJ=D-fjTwYL4ctgo4Tbre3QwPKSTpzPs4g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: pinctrl: mt8192: Use generic bias
 instead of pull-*-adv
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_062110_794667_FD2AC20A 
X-CRM114-Status: GOOD (  11.71  )
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

On Wed, May 25, 2022 at 5:57 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Commit cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous
> Mediatek's bias-pull usage") allowed the bias-pull-up and bias-pull-down
> properties to be used for setting PUPD/R1/R0 type bias on mtk-paris
> based SoC's, which was previously only supported by the custom
> mediatek,pull-up-adv and mediatek,pull-down-adv properties.
>
> Since the bias-pull-{up,down} properties already have defines associated
> thus being more descriptive and is more universal on MediaTek platforms,
> and given that there are no mediatek,pull-{up,down}-adv users on mt8192
> yet, remove the custom adv properties in favor of the generic ones.
>
> Note that only mediatek,pull-up-adv was merged in the binding, but not
> its down counterpart.
>
> Fixes: edbacb36ea50 ("dt-bindings: pinctrl: mt8192: Add mediatek,pull-up-=
adv property")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied.

Yours,
Linus Walleij

