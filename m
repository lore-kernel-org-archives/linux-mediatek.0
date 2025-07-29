Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B7C83F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jul 2025 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=; b=N7NwrNk5huwCF+JV3N/5zVZZEI
	jyEs8M5JZBEqiBykrmWW3okAJonQyH/B8b32IhKoDtX8j0gEhXaAOtzomMJwbbVmBD9gsJunZ1/Ir
	KkFtfX9c3JNf+JtlMidTusu3SYYJ2f0WshYYlmDA8sr9TAODmKiKDyZ3p087pW5z4m9dsmzA8DjcX
	7m2YlCFwdl11rxDWN3NA3ShfhYSTAEpKTX2g4UQj4sYV9SnE2CNX+mJNwClTeLgOiXwSwai70028d
	YGg8egaSbMi1RlN1l434QiGmTKjxLOZYpCQvy+sAUwvUw++DgrVBs+V7g1EzqZJxWHjY+dxGi9jf5
	+fArgNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggoP-0000000GQ88-3MUV;
	Tue, 29 Jul 2025 09:39:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggZ6-0000000GO5E-0Ab1
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Jul 2025 09:24:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553d771435fso5495010e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Jul 2025 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753781046; x=1754385846; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=;
        b=HYpQhLLNllZGRAIqMFMEakDNLU9A+4Q6pWwx21stFu88fsC3MZC81F46Wg6qIfF+TB
         zK/S3vjTp5oL1oOFekviDEDfhUuQhUkx4bNmjXN3IQ+JjStyv1CrmFu1KwUxRX9F07LJ
         9ezfHkVoyzTMyhQ7mLrW2gHU2SkqSbJqArDIuMI0V8cuZf+iUTabWpbGS6P6+wN75O1G
         nDpzD/fc4fBf17HswieOI4b2FsOkKTJe6v6aP3IGXqii2isRw62L5URJYIWKDP0DJiH8
         nbF7a0IQwzWCB49sctCUaRYzFUzmWYcTNs4cNeAvtl0UfOMegJqfeZB/d4FhivzMls7c
         pz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753781046; x=1754385846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=;
        b=D7Es3NkuG4qykQohog6ofZxWNe5fSZyvDYUji5VGyfuYR9nIhjRSmV0CDPAZavwCOO
         xVXrc4mf+/pmsL5/g5f0+CChOI+HkkThW9tkBPnT6b1k3NrjkE2zD//L7wW2OQk58oFa
         xRB/4Q1wIcaX0DaXq/VIIozFSuW0dTXo72umWvEItO+LqULLIC+Ub/VzMWW0ywc147wi
         IDlCvhT6ui+mdhCZU4SfYEv/3FTKanPX5mlEMn/njKx92a8yt6MyJROBhRdoEck0aH7A
         U7ICf00h4i2x7TTURhuvXps5/zj+PPXU1R/3bq4a3oS9hWYbLOi4nOms+aYupDVe9BXr
         c08w==
X-Forwarded-Encrypted: i=1; AJvYcCXdCAi/41p6b927VHssKy0hBkhHxz9SnLAZQ6rAqa95vj7PaF55+lRM06iX/SlGQQ2mzG4EW7iq3idwFKch4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ve/DM3uK1hM+pNn0SeP611hETeivpMrpwCrBWxbiIdjgTEc8
	J0J2f9YL7+M4yQibZE4EFa08CBDzrOyXSgjbwRLbQvIreghtxx0SXoq5/q4dF6HWODG/xEKQh0h
	fkW6BrPvGPzEXmIxAc2iCeLbETvxkLOwjaM4V11Ntsg==
X-Gm-Gg: ASbGncvWyobjqyJrlp5AaCFn0RjGxjsatFkcLqrQVkk2RmnmTPjWrkTchHO2ACHKYeu
	+aPMCSFXtQ0IdrXHddAlV3f0DdsDyka3aKKZY7rpgzprWhs4nddpWZL4gIhS08u0IkHRM22g3m9
	jeQRO0YBekXCR9d2CePsbMN64kQReHyCdBj9sTj+YLRh+i4KLjmg7gpxn7TteKnT+6HxcbYJGTj
	MJv546wZPc7jCAr965tT0wCOWlcs/WqL9DmqGo7dhH2z67z/A==
X-Google-Smtp-Source: AGHT+IG4d8eX8f04SwumbDn+t8ORtzgwAVwNB5BHKdmUryIfl8eqxh2e3123W81layXfFQt1IEka9/bpWuzrKar7j3E=
X-Received: by 2002:a05:6512:3a86:b0:553:d910:9334 with SMTP id
 2adb3069b0e04-55b5f4df595mr4041752e87.46.1753781045533; Tue, 29 Jul 2025
 02:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org> <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
In-Reply-To: <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 11:23:54 +0200
X-Gm-Features: Ac12FXwkqCsphx3p10ZENgy5ARM9FowTyJPFq-nwB_5x6uw2mPSH_J_dgheu8yg
Message-ID: <CAMRc=MeEo6p=6Tp5kORi9y5tGNJKrzh0kq7tpe_E=5TasMjgbg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_022408_177906_1AA1E9A1 
X-CRM114-Status: GOOD (  18.59  )
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

On Thu, Jul 24, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > struct function_desc is a wrapper around struct pinfunction with an
> > additional void *data pointer. We're working towards reducing the usage
> > of struct function_desc in pinctrl drivers - they should only be create=
d
> > by pinmux core and accessed by drivers using
> > pinmux_generic_get_function().
>
> Any link to the discussion and perhaps an updated in-kernel
> documentation and/or TODO?
>

The discussions happened under v1 and v2 of this series. The "reducing
the usage ..." part refers to the need to avoid memory duplication of
struct pinfunction really but it's a prerequisite.

> > This driver uses the data pointer so in
> > order to stop using struct function_desc, we need to provide an
> > alternative that also wraps the mux mode which is passed to pinctrl cor=
e
> > as user data.
>
> ...
>
> > +struct keembay_pinfunction {
> > +       struct pinfunction func;
> > +       u8 mux_mode;
> > +};
>
> My gut's feeling that this type of construction will be in tons of the
> drivers, perhaps better to provide an alternative like
> struct pinfunction_with_mode {
>   ...

Nah, literally only this one so far. And I bet we could rework it to
avoid it altogether. Your proposal is too specific IMO. Let's cross
that bridge when (if) we get there.

> };
>
> Or even with variadic arguments... (just saying)
>

Oh please no. :)

Bartosz

