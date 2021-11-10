Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 05:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A02360240
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 05:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A02360240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nomy6IsqHiuNynQN1RmPBNe7imx16B6Ewnj2t0EbS9I=; b=skLFoEM64G72Ax
	LXumQ2gaM14UqJlLDF8Rheb/jFqhiacbKYT2XvJQGPMCGrzTRaxH0kIOKZkVmI3Hajd6sJnKaB9ey
	QXbTu2meYKcb5ASQbEmOjwakTxcqbil+dmh8qrI8MeUOVkodXutJ9euPGTiUkOImOI/CothBDr39q
	PeLRZbdW23wyQDnKGBhv8eY384S/fvqbQR+t91CSnoJ51RJBAJjt9vLf1Vhil86fAPhmozn824e9T
	VjieV+uuoIBYnl+mkkqnqRHwAra6UevLBafXIly29pD5C4A0CRHRjc0ncTOx9JWGSbUWWDr4gF56w
	+qSTrzICYsVBdwp/xiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkgZR-004W7J-Iv; Wed, 10 Nov 2021 05:54:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkgZO-004W5f-L9
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 05:54:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p16so3318363lfa.2
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 21:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TgZ5k8tAe/+pJDD+RCLvpCMRygApskgp5M5BH1MTJeA=;
 b=VgjjGGPKec52KZ2HHoQk88GnQ0q5PYMG5hs02d7pEMoAoX3iW2t5j2CZmkkspTtZM8
 Adw+v8DRlHu2yzeOUMgmFCyCD4P2J0XUB5YqQkhoG26vf3+lfgkfT8FXcFTAQp79Lmee
 jV1RYmz6nHUWKjoOxNLcb5/wVkN1ZU47X8Rss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TgZ5k8tAe/+pJDD+RCLvpCMRygApskgp5M5BH1MTJeA=;
 b=p5DNOquwC0NmcsxVQW0lsuhgkX92Wyk+g7xgkLkYDdxAUv7m7kAPmA8OX0Je3aN/us
 iZ41Iz3OEY/Jxo3A1dCRB1IHUzPNOD0ur6jH3Bnppdtjcg1Gg2GLxjPX1RjqdVk8rw6/
 Nuv2QWDEhKbXuxcUsMRt6HC79wvVeE/y2PTKlQUaRWM6q56WVSj9xemAhKc7vfYj7P9P
 TkI571n+7jxGhfqLKq+47e54ltVySnoVuHK+cJf8hZ6M+Td2JA7yeyvTr5+CtPsUH55M
 0Z6utsfJQjF1kX0SeM8m3OaOYzgyE933RhYlBRsC5+x5Jk1QDU9l8Kkmikq3Iv37x3gS
 J5fQ==
X-Gm-Message-State: AOAM5327BsNQAhrH90PLxTAzrnYbIdYyDzVNgGgcyaAhQJu2SIYOxT0f
 TKwLwKtweauam+R7t8SJcxDKnXdnRB5nfXZSnPSowQ==
X-Google-Smtp-Source: ABdhPJxj2FKRewwrDxr1vDAwxEiLp8eMAeSoq4KW0LmVCVSj17K2eiqMz1j+pgJjsehYBcIRooitI8dgNQhyaqz87FA=
X-Received: by 2002:a05:6512:2506:: with SMTP id
 be6mr6901429lfb.597.1636523688194; 
 Tue, 09 Nov 2021 21:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20211110021411.31761-1-zhiyong.tao@mediatek.com>
 <20211110021411.31761-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20211110021411.31761-2-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Nov 2021 13:54:37 +0800
Message-ID: <CAGXv+5Entn5QnCODgbUSdDFSds4z+_QJ6cD39yEoLndms+rY7Q@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: mediatek: fix global-out-of-bounds issue
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, srv_heupstream@mediatek.com, 
 hui.liu@mediatek.com, light.hsieh@mediatek.com, sean.wang@mediatek.com, 
 seiya.wang@mediatek.com, rex-bc.chen@mediatek.com, guodong.liu@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, 
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_215450_736680_7424B561 
X-CRM114-Status: GOOD (  19.90  )
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

On Wed, Nov 10, 2021 at 10:14 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> When eint virtual eint number is greater than gpio number,
> it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

The order of Signed-off-by is still reversed though. The author comes first,
then comes everyone who subsequently handled the patch.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Also, for single patches, you don't really need to have a cover letter.
Any info you would convey through the cover letter, such as changelogs,
additional context, or whose tree you would like it merged through, can
be put after the triple-dash ...

> ---

here. Text put here won't get included in the commit log.

>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 45ebdeba985a..12163d3c4bcb 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
>         desc = (const struct mtk_pin_desc *)hw->soc->pins;
>         *gpio_chip = &hw->chip;
>
> -       /* Be greedy to guess first gpio_n is equal to eint_n */
> -       if (desc[eint_n].eint.eint_n == eint_n)
> +       /*
> +        * Be greedy to guess first gpio_n is equal to eint_n.
> +        * Only eint virtual eint number is greater than gpio number.
> +        */
> +       if (hw->soc->npins > eint_n &&
> +           desc[eint_n].eint.eint_n == eint_n)
>                 *gpio_n = eint_n;
>         else
>                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
