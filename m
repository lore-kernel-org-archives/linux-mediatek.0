Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D69CA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=; b=HsH2531m/92cFEp5cG59ALl3Mj
	PkbfpalGgxqu+x7WH6csictBPDRKzVDqmNuIQnD5gTAgPEqE6+nI4L0IBzG02Ub18wD9/go/c4jTD
	Pk3Uif2l/0xEArDrsyB7J4ZH6JY7fSzI8Ky7ekjctHrC8wzzVwCwFedd3k7QqKhnFgi5KODc/mKjj
	LJZbxOADBiOI9xuEeeltnH82Rr3Cs1o/TpFm/3FlGDA7Ad0/eutCxdr3qZ34J0wXvSk9r8qd6v/nw
	JTDs3du+QJ9Ps1l0oPBuIPl8byX2yw6PFuj6iQ7i/pJphaixRusyo8mB3AgHb7wJE2Tl2pozBuBIy
	jaO3pMUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPV-00000001cA4-3qX7;
	Tue, 02 Sep 2025 19:11:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR50-000000003MG-0YRV
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 13:29:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f7204b6aaso2713082e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819784; x=1757424584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=Gb7Pys0p/Nf/wKuMK50NcD8a9iKPcrI8p2CI2fgOlP5bKfRb5/RwOkGnjHxeUYJZnA
         Ugh6ttVW7zVelF5vHdn5vlbYMh+/IncCpMXyfW5C0HwmUgYFGKkYb0P2+rbn7/VZwOpy
         c5uLi/VPegt7o5GRo8iT/cXreZhKT4u7VxjK8BwEic3+PGHUyAMhL/iGV8fCkEIAhWBk
         KD4Qx5r3D4y1n/gTUxOrXtFUl05iLRzxAjczC2MB1gqbS5VdS4v7HqCwQqMCHofYMCBj
         7j168a55hhO6xGuFP29NcS8ZQ0UzpXeQYN+Lp9XTMQKHIo2Nbf/ynf/TmE2ZE7zzof33
         WSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819784; x=1757424584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=jMBIHQ5UwFtkCxjzXuPXZA2kTPwOMdt8yXyooAbDmOgsVFoa9sYQqTaTEbMjHZSonu
         2Kr+R52C9aAaYlpua5olnWJERr9qOaTkvoFqE00KyV4CqKngz4u5KiItdS8oSkl82+iK
         TLg4RzrHkacz7QW75nfuqxVRYQgUzBJzsWCON6bLK6e7BFYqwNy7e+1x5kebHRqRxe1l
         Yer2wlh1uHVauNaCPZrxdKb9lNMcu+O/1d7btlDX7EIA7C490VrM+DFvyjf66vPmpKR9
         wdgkJDnD2buwtJIJotZI2h7S/XdBQg7jmbb4hYXT3G+yZZRVHzpdPP/Zp0j/io6v+57J
         AH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs0FGQ4s/s783lJW91IA+SstQ2WQHtmyZ9nd7e40hk+PeEpS2HFiHXc0UvZaDzJAsjLe1qeIoKqXvxYixllA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw18O6O05myvpe4zFb+UXTPkQKDPWyodY0qx35vDGhqIAdJ4uzh
	CHrxn9w9fi+y05aFD/XMkBdJjhm4I8OOwwxfu0stM6Apwg/UK6EYyjQjyH/JQ7d7b4qYiENOKqB
	3gMlerqcrqfby7b/Ghf3f/O+7KSaBjgZz1V14mNQpIg==
X-Gm-Gg: ASbGncuR8yG27VWJTk+BjGU6SYY4ksO7a9xaY5LQ3Au22yar2f9ngiLdKEe/gmx4LWm
	bdFX7F6hf68dGQqGVuQfsbQtoMApQ6P2Hk11Iib6AZ801iPshuoqE5CUQO+EHtsoxBG9uePBWdy
	ZYX9pYL4ho7oI2RofNfknH9PChq5WefhSvuaMJlh7gCzat7h4b5hcT/WR4nr/LFAy51rznPOr2M
	UK6SThp4ZpMnYUK539wwbqHFOA4QpjbKPZu3jhx+9UXfRA7Ow==
X-Google-Smtp-Source: AGHT+IEokI8/QdZgrQf6Khw+qmZIKYKiiUgjGe2BsWGspCY5PLtcBEV9VcspomwVXiAZN5jhrLGIGNRfYpYegqH5QMI=
X-Received: by 2002:a05:6512:6512:b0:55f:4760:ffc4 with SMTP id
 2adb3069b0e04-55f709953admr2780344e87.29.1756819782757; Tue, 02 Sep 2025
 06:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org> <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
In-Reply-To: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:29:31 +0200
X-Gm-Features: Ac12FXxptM2x0FIw3VzAD9gZWlHPceo9WcRvgcocpGcthnkDE6yjXmv7vVmpP9U
Message-ID: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062946_414437_2825A3A8 
X-CRM114-Status: GOOD (  22.71  )
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

On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While the API contract in docs doesn't specify it explicitly,
>
> So, why not to amend the doc at the same time?
>

Because this series is already big as is. That would be another commit
that can be separate.

> > the generic implementation of the get_function_name() callback from str=
uct
> > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > NULL. This is already checked in pinmux_check_ops() so add a similar
> > check in pinmux_func_name_to_selector() instead of passing the returned
> > pointer right down to strcmp() where the NULL can get dereferenced. Thi=
s
> > is normal operation when adding new pinfunctions.
>
> Fixes?

This has always been like that.

> Reported?

I mean, technically Mark Brown reported my previous patch failing but
I don't think we do this if we're still within the same series just
another iteration?

> Closes?

Ditto.

>
> ...
>
> >       while (selector < nfuncs) {
> >               const char *fname =3D ops->get_function_name(pctldev, sel=
ector);
> >
> > -             if (!strcmp(function, fname))
> > +             if (fname && !strcmp(function, fname))
> >                       return selector;
>
> I would slightly refactor this:
>
>                 const char *fname;
>
>                 fname =3D ops->get_function_name(pctldev, selector);
>                 if (fname && !strcmp(function, fname))
>                         return selector;
>
> >               selector++;
>

You can do this in a subsequent patch, I prefer a smaller diff personally.

Bartosz

