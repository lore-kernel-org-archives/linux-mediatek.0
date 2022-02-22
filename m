Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 02:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGTcs72teq6LRSqKCbxJ0ZRdbETrw5r1f0hiuHAsgeo=; b=ZUmUZa/Tib7oDY
	gDqcuxF3MXip8wzzT4CYvlLgrfJAOSop0UHMk4RHZtQddNQ0uaR1SDF0ZhtT6NLC5MRFP+3OyYVdM
	S7IX2GxG3a6B53sa/+dXWqusLcxGtSdLs9X4bsoYB7vt6w15hw7OcTG/Af7EH66ApO8g5lJNHq1ox
	DWcKVR4gu4WTfxwe0U8gWV7nFxXEP2+DBnppfXpmAWMcJyF/hnEln49eoZt2VYclstOSL8okNWN2v
	AueD/3lDone5HsmH/8u0l99+0Ek+cb7NJIMjweEsIhiaz5BZhB6Eq0FtHJxZFG3/D5s229t2i0d22
	ACzbQpSB6R7ys6kAU0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMLL2-007mu3-7I; Tue, 22 Feb 2022 02:55:40 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMLKr-007mpk-7U
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 02:55:30 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id j2so38332114ybu.0
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Feb 2022 18:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flwzoWXjBS1fKxQYSqzor2TYAU8hRShfKYrKLieas1Y=;
 b=DpG8Z7TGWUvG/BQ+qbHS5epx1Ot08wZ4somVg/8Hv8Ipg4wjnOzU/2zaF7cbkFzGQY
 DdNH0nh1ltW3b5lUN4eFL8Gr+kU4irEFLTkTgTxJ2dspwBKKVY9OjQKum+lbDZ1YZq3y
 KjiPhY6gPlTfDnvw6F9YBQwFGxzH4wSBSHj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flwzoWXjBS1fKxQYSqzor2TYAU8hRShfKYrKLieas1Y=;
 b=GNdoQS5mxNq6nLITUe+2PvGn3tXwaoFgJ/i+OjmwGPbwxNUM6m62bSyXNILluWyZNn
 +G0cwTMfnvKW1vvXY+2xYDPVpGGm3nhc1FQsw3nbss2MeCL0AuZG8VTMI30coycfvMCU
 MJi5P4CaC/WvZE6kTcj8NAGh2yuxz3lqqpj+qiGu2rg1zQOcYHUlnENHKKdA69zH06El
 aoAW1zVuCKTFqsLOAcbVsWnn7ovlheBJL2KfTDuzjkhHOZkZQpT6027t2KeC92jjtnwn
 DQp1V5jcjGugeppS4RLjAUfEm6FGLIjjW3hJDlLZFFaQJXS+pevD8aCs1RVbiJ/EFf7I
 7krw==
X-Gm-Message-State: AOAM53045+00Clm7sULxNFxZdeMclIYkWd62VXZgD5TrHN581Q+yS0LT
 KRz7JCuB9slgb+BV70ir9iaSGLCcliGPE7/J1ZFd6Q==
X-Google-Smtp-Source: ABdhPJzx/1Y7F9nbMupU99Wa5ez7jb/PujfIQdzFN2lV5ICZOAAPdhGexRkhW8sMu/dsmOHX3knv1+MYsXkEzSrU9C4=
X-Received: by 2002:a25:24d6:0:b0:623:a267:b5ee with SMTP id
 k205-20020a2524d6000000b00623a267b5eemr20997387ybk.278.1645498527071; Mon, 21
 Feb 2022 18:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GLSnr1rQ_K3Y1Ou3ocoq7cSmv8GMkRCEi4adxewY1dHA@mail.gmail.com>
In-Reply-To: <CAGXv+5GLSnr1rQ_K3Y1Ou3ocoq7cSmv8GMkRCEi4adxewY1dHA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Feb 2022 10:55:16 +0800
Message-ID: <CAGXv+5GyrMnR3Zu9AYT-pkctdEhFibSiX6xuEpS1u_=Zhx3N+Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: common-v1: Commonize spec_pupd
 callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_185529_280481_75EA30B2 
X-CRM114-Status: GOOD (  23.15  )
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

On Mon, Feb 21, 2022 at 5:59 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Reduce code size and duplication by using a common spec_pupd callback,
> > which is possible to use on all of the pinctrl drivers that are
> > using the v1 pinctrl-mtk-common code, with the exception of mt8135,
> > which has a different handling compared to the others.
> > Since the callback function signature was changed, this had to be
> > propagated to pinctrl-mt8135's spec_pull_set().
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
>
> [...]
>
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > index 007da39b68c9..5e1d17512a0d 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > @@ -222,9 +222,8 @@ static int mtk_pconf_set_driving(struct mtk_pinctrl *pctl,
> >  }
> >
> >  int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
> > -               const struct mtk_pin_spec_pupd_set_samereg *pupd_infos,
> > -               unsigned int info_num, unsigned int pin,
> > -               unsigned char align, bool isup, unsigned int r1r0)
> > +               const struct mtk_pinctrl_devdata *devdata,
> > +               unsigned int pin, bool isup, unsigned int r1r0)
> >  {
> >         unsigned int i;
> >         unsigned int reg_pupd, reg_set, reg_rst;
> > @@ -232,8 +231,11 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
> >         const struct mtk_pin_spec_pupd_set_samereg *spec_pupd_pin;
> >         bool find = false;
> >
> > -       for (i = 0; i < info_num; i++) {
> > -               if (pin == pupd_infos[i].pin) {
> > +       if (!devdata->spec_pupd)
> > +               return -EINVAL;
> > +
> > +       for (i = 0; i < devdata->n_spec_pupd; i++) {
> > +               if (pin == devdata->spec_pupd[i].pin) {
> >                         find = true;
> >                         break;
> >                 }
> > @@ -242,9 +244,9 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
> >         if (!find)
> >                 return -EINVAL;
> >
> > -       spec_pupd_pin = pupd_infos + i;
> > -       reg_set = spec_pupd_pin->offset + align;
> > -       reg_rst = spec_pupd_pin->offset + (align << 1);
> > +       spec_pupd_pin = devdata->spec_pupd + i;
> > +       reg_set = spec_pupd_pin->offset + devdata->port_align;
> > +       reg_rst = spec_pupd_pin->offset + (devdata->port_align << 1);
> >
> >         if (isup)
> >                 reg_pupd = reg_rst;
> > @@ -293,12 +295,13 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
> >          * resistor bit, so we need this special handle.
> >          */
> >         if (pctl->devdata->spec_pull_set) {
> > -               /* For special pins, bias-disable is set by R1R0,
> > +               /* For special pins, bias-disable is set by R1R0
>
> Nit: This seems unrelated, and doesn't read correctly either way.

Once removed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
