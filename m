Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC8AC83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=; b=losrT5eeA5LIkjgXfi5nlWvhwt
	GY9uQVPDbTdLpzOatCaZffj48Z+0YUPYEW0kc7ulax5VoDOJzEVhQxjQno+fC2+CT8n+rBdcGx4qn
	RGzE1ZYxnzzUa2OS9GoNVUzHFq+98uz3n/EMV6VplKffmLRMUWJgOVsdNbpOjKzcDsrY4f8Y3EwcQ
	qVxOxAyGhvRnmjdPzTaKmrpmyTPsfQFJG0fVjJ5v/jGftHwpmw30cNtYFkm+kbNAzcPb/+jkZC6mG
	nUOhum5ZQqltNfwo0TtaJtsU2CE8n08NYByI4LY4DZN4+/e8N+4lgbb23u64vWeRKk7vSeKuITOXz
	jtJg/WlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu6F-0000000COGJ-0YnT;
	Thu, 10 Jul 2025 16:26:19 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrUV-0000000By74-1HqK
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 13:39:12 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-558f7472d64so1670904e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752154749; x=1752759549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=P99Ai6nT0WWeGDXAqqB5oTcci3rWuAWwVoRUWc3exQ/bn8xdXpjx9iL57f473k4KTJ
         XY2z3k3VWUY7npi8aVr24vd5MhAAhkx7lhl49OKx6aE0hiDle/gFsA5fA9wHBwy7YnIo
         jBCrWE8u8pQo3qSMYz3LdVLqdgSCISBLO1nnZwhVlzheqcwpe398gB/1UPARkyTTGYJ5
         pyMd8SWqXMNJhjx2jMQcazkF4AkpZyZpTKk5zhhti8EZ1+Ooxd9fExqIaXAxpORSDHXS
         3oj+lmrtfVO4LVnFnKMuwUv8WXBIlcGx+tGeczkcDzV+LEV5Ym8wXPMsEaJWyrwcajmC
         mDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154749; x=1752759549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=U5G8TaENWn+IrCAFwzJmrwpxIZHNTYisxiuPmVTHEyFOONGz1xNhTDD10NqvkEJmCD
         0644dBT3TqbB/XOHaQ3d17df9eZwGQZRKyGa6mm/7MKvIN3Q5mFXP1mAHh3Bm8C4cOax
         5fZdTwWIV6EeORICVmyNUiWvDMPwUIwV623xGhBYgHzVeo2+6pVqSt/lamdyurjo3qIE
         F757bqAKJZxM8JiM2tPj6kIPz9dYixdtg1tRWZBYrSlB/3KEs1zd/GfAkXvAVIMt6FM6
         YhvOl+qjLOMnyCqPkQu7gUj+df8CNuVLdszvjN3rEpEjdd602LCy/XlMfSuP0am5WTb3
         4klQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1abY4TE4Lw+oPdsJnmoZ2zqxqZ+zPQKQnjtWLTtr9XewDOu/ALDrj2lzDK3ycV3vVxtgA6wjfrDCxEL+fxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVIn6hNgLOgCnJMQIZWwg1lzhCqy4fiUo8q7pkacYWXyEsaFfl
	+HTKVFKuit8eYscRQZQJgRI5eDAygd+q22SSSIeuI9GY3YNavJgaR3Kfm3AcSAAGNo57BVhITsM
	acXGCF73mB7A1/n7a1tmrBTUznU5sYJQZoNH62I0Xjw==
X-Gm-Gg: ASbGnctfWFSyIituS3eT3LFJBfy5hdR3eMVxWje3yQ9xTfJMxdV85e3QDGApyQh6iI2
	aTHwYt1+/JfTNnr0HYkLKOuNVECu11Yzpey77i57VF/Txo0Xao539AHi/OhS6jilINNsHdwx5Tu
	mz3Op4d2Vj/XmLo4nQ26vPbr6JHN47vbNTeps2IrDn8WuBtL7TxDkurwFNdlUyGTjHabKJ6TYme
	54=
X-Google-Smtp-Source: AGHT+IGB6UUmFZhzqKjRvGV4lr9BeyGDE6WH9O1sGiazwi8CZoRnZBbYDI50VNLpbqgC1sRg+VYVXXWLsDZF+CuXQF4=
X-Received: by 2002:a05:6512:1587:b0:54a:c4af:15 with SMTP id
 2adb3069b0e04-5590071b7c3mr1264610e87.19.1752154748737; Thu, 10 Jul 2025
 06:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
In-Reply-To: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Jul 2025 15:38:57 +0200
X-Gm-Features: Ac12FXwUS6h2JE4LNA_vmGF3f9mhet3j6NKR8eSjHb_k-YJ2CoyhrM-67s3nQ-g
Message-ID: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063911_374504_1DAF6FA2 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, Jul 10, 2025 at 2:25=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data)
> >  {
> > +     const struct pinfunction *func;
> >       struct msm_pinctrl *pctrl;
> >       struct resource *res;
> >       int ret;
> > @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pd=
ev,
> >               return PTR_ERR(pctrl->pctrl);
> >       }
> >
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
>
> It's good in principle, but we're now going to house two copies of
> the function data in memory... Can we trust __initconst nowadays?
>

Well, if I annotate the functions struct with __initconst, then it
does indeed end up in the .init.rodata section if that's your
question. Then the kernel seems to be freeing this in
./kernel/module/main.c so I sure hope we can trust it.

Do I understand correctly that you're implicitly asking to also
annotate all affected _functions structures across all tlmm drivers?

Alternatively: we can provide another interface:
pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
- would simply store addresses of existing pinfunction structures in
the underlying radix tree.

Bartosz

