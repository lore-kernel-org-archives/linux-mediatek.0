Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D32CA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=; b=R8Ti9blNyRTyKOx91zSycCtGSH
	Hc8BNSpnfdAMtlTUU/uWBhLSzD/1Nea5JXsHUe8kiIsxF0gsFHxarwLmTufJwNO9FNhlw21x5am3T
	27gIFLP1csntRhqGg1p3wHVq1rz3sZR4q3wxuy9Qac53KUzlWZJ4qwCxQAHl4OaqpxbcLuGFYApgq
	TAUoZ8W4CbwrXS+rASXe/ktCu7Rl0hR++V7Hb3+aFwvnSFlYoayQZY7oj4YJSSQadZ5Syl3WHca4A
	XO3j5Ujsrn2qDuGQZGsnwU4pw5nzrHl9pVfedPfMnm62VmDfS4hJ5e6mm61DtjZ3paqT/xSLgMz0l
	09nShHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPe-00000001cKu-3BhP;
	Tue, 02 Sep 2025 19:11:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR7h-000000004M3-0msy
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 13:32:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3016143e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819951; x=1757424751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=bIb99jIuxGXypJjtjjxkpWiXAZWKZzS06y++fmfh7HYtxnymNvWCXHr2XvQKdsXvN6
         2oqm4cBOn0uROyyi7cvdGJA23zD+/yqwfSl68WHHCKwcdl+wPUC0S+9NCJ+Yq6NVHCD7
         rIBFE8mbIPPoeXa6GKy7jGlXCFIQH3Blu1A9VYsEUEQT+BcIsLEKo2Egu2O2JeRq7QJQ
         +PEyjlQWvXsHBi4IY9xERzwt99La+llVlQyh+acGeHR8QY/5cUkD2fXCoNX0lToP2ktC
         j4j4dvmec6IaiJlFO3oEiouCvEz1loKoLM2z8mQDiqVHc+jmygLu6CU5B+mquaqBjRPa
         kBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819951; x=1757424751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=R8Ztz64Vc4rmB2ss/fUa+jxlQPoqgmzUjILyZfwX6GkxDI/6GSJ410CgMTfhbJqQk8
         gEMUnybfGbboows133qjVzDfib9pl5VW9itBxQKjR94SZZtPBUqfuhCd9R6xON+xe5A4
         0nMTF2F7LOgWUlVDXh62fl4UhjcvsuU8K69Syrr0r01PSTqCbQ02EIFcxeiCwzPolzCj
         EzxfPoj7hh6/OCeWXsjz0PTXYdyprI3weQu3SBDbtWyCw6U0goZIyCVr2xceoMlkyhqE
         XFWW+CNo8ED1gM48PLxjvhOB6ZYoHIiD8DvVAoA9xCGwrJExabo9FTTAiz9lBDT4NXvb
         tOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsaCFEWheBWSksOCF/qJGf4WVvIHGb0f8oqQ4uJRewd/slQ7qpDD8XaDealZip06PKseyZW6Wxe5DI6VOxIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXQzRXz3CYQ9C7T3cqhiP2QqM8odUJEUoI6l8DCbdEiGNYZpYL
	OGo4hb9xeiF0g4aUKDJy4kHQ5Fajmyx6ywyysLgHeyIQ7CEwjSKByTBMe/4UducdyMw+9BLagsL
	KBW9Y9BugVS967OXo9m1sYsLMfXrK0mt9RSvr4vYjVQ==
X-Gm-Gg: ASbGncub4LchaHoPtuQuTNgWs5aOZAf4azZRb2SXl4Rfc4eNK7EzR3wwRd0NzKE+tqc
	7o1bj8QovYiOXuPymems+5OdoPjXRAiB//BMKfL/Wqs8ntfNrNtZDQbp5fzQjI2ec7reyVh6xtV
	SewqDs5IGlR/dET4x79nIMxVjOTgRvGPa+TOCyoALtiGRBFajE3fEDnD8C1dqwX1b7uRd6g5qZg
	4sM15Xo1eQUKWQsefGSGm+MUJ4nTBrrXd1PYzM=
X-Google-Smtp-Source: AGHT+IHbC8qI4AC5+0YZNljCnPe19ZYxRaps+B2CcXld1o2mGtDbXzoveQoI0IeEbDNxVlYlEUG/+tn7nGWqsyLzmeE=
X-Received: by 2002:a05:6512:3ca9:b0:55f:55ad:2263 with SMTP id
 2adb3069b0e04-55f708b6c5bmr4286185e87.16.1756819949961; Tue, 02 Sep 2025
 06:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org> <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
In-Reply-To: <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:32:18 +0200
X-Gm-Features: Ac12FXySKFnql5rdsxfRBFF-2EejY2a696V_6zV_jaWq_9WtZl4uQNoHEj4w7YY
Message-ID: <CAMRc=Mdnp8T46Gi_xZintgc9AZGCGiRPYc9mR32Xwodxy7DLqw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_063233_228160_3088BB4D 
X-CRM114-Status: GOOD (  16.61  )
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

On Tue, Sep 2, 2025 at 3:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:
> >
> > With the pinmux core no longer duplicating memory used to store the
> > struct pinfunction objects in .rodata, we can now use the existing
> > infrastructure for storing and looking up pin functions in qualcomm
> > drivers. Remove hand-crafted callbacks.
>
> ...
>
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
>
> Why not simply
>
>                 if (ret)
>
> > +                     return ret;
> > +     }

Because it returns a possibly positive selector number.

Bart

