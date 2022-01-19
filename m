Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CEBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tx9PgeecBftD9YZrob/iQ56xb/MSkL/c2q0WUpm8muc=; b=v8bPXqYcBgxlDV
	16lBSC7GNYCroiEN3WlM1IDY2tkXM0P2cUd+Bvrtqts4Ug74BIEABzi23EphdvCDLv3+wJ/JOmk7N
	Cl6JjmdtWrM2c5b65A7CzLELbXtKpZEj31VnFtq9r32PXmePP+k0T/ZdXx31WumvdqU5RAvL8wX3k
	nFtSbD8yBb1JsODY+vB7chwjKwdfL25RJL6Rin4JbuuUP0KxbUK/ZoVfFaFAPIckV7Z0zGRi/udlS
	zD3ORqcUTNA/UmPOz7/ajrYxz6FmncGfO4VgqZe3RlHCIVkyAW9Zx65c0YC+VJxVwCzcsFt1djPZE
	LuHqxAwGiY20kfDuoMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA3yR-003tMa-JP; Wed, 19 Jan 2022 05:57:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA3yP-003tLX-8y
 for linux-mediatek@lists.infradead.org; Wed, 19 Jan 2022 05:57:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id o12so4779629lfu.12
 for <linux-mediatek@lists.infradead.org>; Tue, 18 Jan 2022 21:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=180p+GQo845oNXpNatB24v9mg/wSi3AnjTHWzy7lW5Q=;
 b=UMqQVImtdZBindUj0UKw3O5evttBaDA8C0gzixzt987uQXT8Y5eu/XzX82QJPB1v23
 hEQEO1o+ew6SPORt1AWDbFZAMBA92ijdtJ/2jla70icSIGsX1pWs+rHcXMKrEPkJSoQK
 jLBPjtEkJPK0cfb3/43ILnt6EnITHPad14/tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=180p+GQo845oNXpNatB24v9mg/wSi3AnjTHWzy7lW5Q=;
 b=DhJTZA2r2ZfE/KqhQxSds5vmtn8Nryi41gHF1DU7FWCIRIdMbXFli9CiSQ/HmgHg9S
 2blLTXGlblsADQ50HpsS2GgKKzhP4ZnBatPSH1B+VDqnwbvuaNQpK10wHBctnCwfEP8V
 x3XvBayU7yX7xHpWy0EqR0X0MOIldhEHflR7SEJijBXe7OGThR7IoEGDG++4R6Nil2Cz
 onyLnUWhy5Hv5pC8oYlVBIIpTWBnTSLkojrpxb3z8Z57rcoNbL2eStLbpSQdmQJzwU4T
 Yzbj2KmfZTNCGPWYeBl/Y3h/igT1shFdixwRPSAfJ6CwXvBevjSF+3/FBml+ugYEnTSg
 +j+A==
X-Gm-Message-State: AOAM532A8lXLrGLDKKS6YYEsVw3Frl1DhheoQRar/kda5hS2SnZFtNaQ
 O9aMYrcuezgSFFF6dzwxF7Ini+S+LUgcE94QGK3qgA==
X-Google-Smtp-Source: ABdhPJwmAbYBsIM1/e9VW3yeneVaeA59D14d9Js8kiEwjDiXSmFYOjsOytWEf0XP24p3zVI6PrzW1M84bl2PP9RLYm0=
X-Received: by 2002:ac2:5bc9:: with SMTP id u9mr24297297lfn.371.1642571849473; 
 Tue, 18 Jan 2022 21:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-3-wenst@chromium.org>
 <eca4a0c18fe75536c8276410628b9459c040dce2.camel@mediatek.com>
In-Reply-To: <eca4a0c18fe75536c8276410628b9459c040dce2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Jan 2022 13:57:18 +0800
Message-ID: <CAGXv+5GHVtCO9tN7B0O2c5V_Bk61-LL79LvbE1CRbyBfnvKSGQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_DISABLE
 readback
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Hui Liu <hui.liu@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_215733_326706_7AEB605E 
X-CRM114-Status: GOOD (  23.93  )
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

On Wed, Jan 19, 2022 at 9:42 AM Guodong Liu <guodong.liu@mediatek.com> wrote:
>
> -----Original Message-----
> From: Chen-Yu Tsai <wenst@chromium.org>
> To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <
> linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>,
> linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
> linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
> Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <
> guodong.liu@mediatek.com>
> Subject: [PATCH 2/7] pinctrl: mediatek: paris: Fix
> PIN_CONFIG_BIAS_DISABLE readback
> Date: Tue, 11 Jan 2022 19:22:39 +0800
>
> When reading back pin bias settings, if the pin is not in a
> bias-disabled state, the function should return -EINVAL.
>
> Fix this in the mediatek-paris pinctrl library so that the read back
> state is not littered with bogus a "input bias disabled" combined with
> "pull up" or "pull down" states.
>
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that
> implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index f9f9110f2107..1ca598ea7ba7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -97,8 +97,8 @@ static int mtk_pinconf_get(struct pinctrl_dev
> *pctldev,
>                         if (err)
>                                 goto out;
>                         if (param == PIN_CONFIG_BIAS_DISABLE) {
> -                               if (ret == MTK_PUPD_SET_R1R0_00)
> -                                       ret = MTK_DISABLE;
> +                               if (ret != MTK_PUPD_SET_R1R0_00)
> +                                       err = -EINVAL;
> Hi Chen-Yu
>
> When tht API "hw->soc->bias_get_combo(hw, desc, &pullup, &ret)" is
> called,
> The ret vaule of may be MTK_DISABLE OR MTK_PUPD_SET_R1R0_00 or  (pullen
> == 0),  All those cases are expected to be as "bias-disable".
> We advices to keep original code,
> +                               if (ret == MTK_PUPD_SET_R1R0_00)
> +
>                                 ret = MTK_DISABLE;
> +                               if (ret != MTK_DISABLE)
> +                                       err = -EINVAL;

IIUC you are suggesting to assign MTK_DISABLE to ret in the other two cases,
and then check if ret == MTK_DISABLE.

Thanks for pointing that out.

ChenYu

> Thanks
>                         } else if (param == PIN_CONFIG_BIAS_PULL_UP) {
>                                 /* When desire to get pull-up value,
> return
>                                  *  error if current setting is pull-
> down
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
