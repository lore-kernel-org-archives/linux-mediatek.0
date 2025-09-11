Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29EECAC592
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=; b=uSSi5WWx1RJ4AEAuVXkbJxKl4Z
	L+N+2tfcQqIj82lcvWEsnVlyUiYeWV3TbhAjNn437O7pbMn5gnPksATSsq2WDkIpamSxVHnzK6Nqk
	4kNILlPFC9JTGD/OvdpO8xpr+FLFnQHJtIckxsMK1ooo+ESzN73zzKgDieQXO+OG4fizDnp8R9Xo6
	lKR9K1yleA0jfrjiXQbGQELvltP2mIrBspqAv5QqnKkeIxRER+zu/1QvMvAECnijOZPG3W1SHrzl0
	/xfHteRGhsXP4MjBwjfRjX8vd8bGdj2Z5G5P4poqfWfNyVDXb4YUGSZiRfbY5Bn3YAVAVsGJBycGg
	oWsLS2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAe-00000001dxk-2FIt;
	Thu, 11 Sep 2025 07:56:44 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAc-00000001dvn-2ljP
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Sep 2025 07:56:43 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-56088927dcbso463950e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577401; x=1758182201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=qBq8T5GDwgLhlPcZ1nVKXFo+M7OlVFB7rb27r2PqfKo8zNhne7sPA4CcrOb2l1uN9C
         UpekQBze864DJWQ6TXPJTMzzueNQrxTjDeX7uaPdqFgZpVa52kLlu+F4VSsPeDZ89Hgj
         tECMwaF7Kz3ZeutpKaOFk6fNYi/eAoJPvbcU15vVSs3dcZjGmSCbdO0IyOLgAjCbPtJi
         8LyBL0DwT4p/0/X6rzo07bqKQHJEH/LjuRiEeA4lVLfZY4C1uWK9tKgBeVczroh1fTmv
         DZO9gOGaK9EUDXQfW1nbwOtM2T3lnTZq/83vUf4rhC641C6AfmS9cTaodL9aszqnl9lw
         lOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577401; x=1758182201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=uqQe6tYIyjKKekl7AJ8ZnO4nIUBcuXMfb08O2PvyIljiushH/Sx56OV1lJEnASLYnT
         vuQYMA7A5GWBl1r1BV07hdNYPC45KHfYEWs70eIJtysOXfOXE8uJuPXmxFBEBQP7ezGc
         bwg9vDJhrWIbFenWj8ZNCFrBd/kmapTVgVh1RZlG/4xy2mqAMq+t2bjEqpQzVXx/ZXT7
         2zoFVq6KU+GPtdgSaQX3KR/lzNyMB9fzycDXauPe8espceAHWLYL/+x0WF9uEhEwJ4Yh
         nR4knisMMMpIeF2ZyL7lJYeGRP06PHo10RBa3zQuAoEIMTP8x6aToej5rb+RvIMWL7wm
         Ba8w==
X-Forwarded-Encrypted: i=1; AJvYcCUjS5DAWqFTnVjjA5nr/B5C7OQtJY4PCKf9jj8AmEw1yikR7QE6EkmZR/absJKTu5qn9xPpD+81jVP9B2vtpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+21s54CokA2+LEGuekoyGPNw9BLOO4ELqyWa1WNr9KBcBMvI
	0Ri1MExlq/+tkQ2CtrJJ/G42y46tInU9h7PvINk/RZ5CuFGPbibQek0L0muGTqNTYeibr1zfYq/
	la8PNjF6Z3A2C7nIvgcp0sbyQ7jJpZKy01gYa5yBzVg==
X-Gm-Gg: ASbGncs8TQVOJHrkkPsqH9ZnVPEPb45+F9XXYLkDiqq6xQz2VwDcR+P8foYJy82WyiA
	8B+urSTvEqOBj2oYWb8pkhFFIe2vVoFJPK7eTLz2F2ZfYpcq1KdUqQ2Tp4qs1RDg2RyxW1jnRuF
	KYUqUBU+aq4p4dsN4DvFNlTF+5W4k7Nstpf3AJJxnzS+nm5H3bqPJ6Hls5x4B9Wi9d1eyGjejjV
	77KtZYOhaFecPJrlGapxNBMD4FyH/WWdo56LZA=
X-Google-Smtp-Source: AGHT+IFSDgCLPJndg4TOxS4/+K2sQKL3XaKKbJwpYxrHeNncRVK3PIq5fLt3S1TrCjsBx8V+oC1pdTue83tyCk/M6OM=
X-Received: by 2002:a05:6512:3e23:b0:568:25d0:f843 with SMTP id
 2adb3069b0e04-56825d1df24mr3328322e87.4.1757577400507; Thu, 11 Sep 2025
 00:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org> <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
In-Reply-To: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:56:28 +0200
X-Gm-Features: Ac12FXzR1a5xkbJIh_yEzUr3Ha0h6_elTIUATVbDxWcMjvS8AEDuwvbJ1IToPQE
Message-ID: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005642_715596_B16AFEF3 
X-CRM114-Status: GOOD (  12.77  )
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

On Thu, Sep 11, 2025 at 2:11=E2=80=AFAM Doug Berger <opendmb@gmail.com> wro=
te:
>
> >
> > @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_devic=
e *pdev)
> >                * be retained from S5 cold boot
> >                */
> >               need_wakeup_event |=3D !!__brcmstb_gpio_get_active_irqs(b=
ank);
> > -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> > +             gpio_generic_write_reg(&bank->chip,
> > +                                    reg_base + GIO_MASK(bank->id), 0);
> >
> >               err =3D gpiochip_add_data(gc, bank);
> >               if (err) {
> >
> I suppose I'm OK with all of this, but I'm just curious about the longer
> term plans for the member accesses. Is there an intent to have helpers
> for things like?:
> chip.gc.offset
> chip.gc.ngpio

I don't think so. It would require an enormous effort and these fields
in struct gpio_chip are pretty stable so there's no real reason for
it.

Bart

