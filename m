Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D29FCA1007
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=; b=epfJYzIHDK3qYIKxSb+m7DFBl7
	M5v0jF0lYLJ+Q7g9RgKRkWz7tnxV4bzCqz882dcIhDYzhkBK+wlrKoJOFra3d8K0XL8rGeb/42H5Q
	CyW3ER87u8YkZMzJeRENsuoGfM/H0Qz2+7Zzh84a2OxhANgF52f20b2ZeG23sbbHDQQyJnb9qHMvi
	BoJDfTO2BW1oAUSD6134N0w6c26vfbMbMj0JPByZ87ye/ioVibRMId8nnQYMmmFGYqY5Mal2zFbVO
	8/Nc53GdbHlDCHlnllt40cwQowxW6xc6f8wMHLki2wXGQt9VdhwL+rZUQoLGnx8DhimCabOCsaYFY
	f/aY6NQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPY-00000001cCr-0rOF;
	Tue, 02 Sep 2025 19:11:20 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR64-000000003qJ-2Nyt
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 13:30:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3014079e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819851; x=1757424651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=txt1l88zEr2AENXs4se+L1eu4YaZcjoHw/BuBf0wp129yTi2LN3JlfifRvix/siTMQ
         0lyxIi3l0U02QHyY1gfj5t3O+cHMNsWoK3uVIalIUDNBdyb6LIUKvuQJ4ZtwlVgkabVI
         UG5FaPN8C3kbIQxs8U/gIX9qu3VqPX3F3t8eUK7dCrShOZH/JMi8GYMD9n0IedMqmU0s
         2EesGKkwHpEysQQOjvlUtBuLo0q2U2RIsBmmOMyrdNl0RLNzumY+g75N5864aUU9mWUf
         fx8iqK1QvaWOEPuYba1ehrxR1TSDl3mgcTu9cEWq9IpT32SSzIa6Rrb6WyqfqYThvyT/
         EFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819851; x=1757424651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=VY0/dmTRWU1N5yAp2tmKNgqlKjUNcKIZIrBFGeE7JQ3gUK+4TR9Z3zzxoDBeyx4I/M
         ofLpbQsaf+7wYAGLzyaERPwxKi57XwMhjJJHvNI9RRxdUcJGKidTEDrUFM9Dz9FHsLrn
         2W8QvbRz3eeSMygmqIMiwlD7BReZGb4v5whYCr+5zw86ZHXkhMBqaOVlww3YoLz4DBSe
         jq7dyNwoyllgTVzZAWKFTMSyAMvj8L4EkhyMtAIZ43/TEsau5Uvj0sZugn2uNg3ve4L9
         C3Hkhe06qtyA9b+g6/5jrV+DuU62n7weLYiYH6UEUMY4Kwc+Ii3nZOyqLGr6thInfiuK
         rqCA==
X-Forwarded-Encrypted: i=1; AJvYcCUz5ykgQIuF68pqPiRga0q4fdMm2oaZEkk1JCDx7JHDT63jYwxLQhBuU8QDarAnJmis7LPFWglMlHtpIA+Fsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqA1Q3zzlQJmsNGpQlCY1o3aSaCjXwbj36LeTBFG5PJEn57NEe
	8sWu19yILzwFjWoM9gYD5EyeQqNeZFyLkXWBjGPsWxXTwCNBZJVW/SQ6bURVbfWN/L7J5d03TMq
	fJFZvFzxr0/qoYkOjg1XrYYOx9mM2cAsGT1nkc8crJQ==
X-Gm-Gg: ASbGncuTsjwUZMP2wFrZVcSNE13G21hrmgjnCu8L7tdo7WjHW9t5MnN2b29COFQx8FZ
	L4Tje6hUgZJWI5WP9LzOC/xKZC29F0YNZwBngXQSYq1Z1hcSzywPUq15o0GnP290D09p1SfDKMD
	gs24xjt1qgsUj5RX7uostPTOuGgN1JVoL7VNqKTLKWHEeRtqvqIV6tbHXmpyctaOrFzGOThZ+QM
	ni1ljI9qUADQ1+khQcTKmqu4htoKx7ZPgttJlw=
X-Google-Smtp-Source: AGHT+IETXrXrPtCI9kHaUsOk3PiYBtzLQDyO5BpniBUPpd4tNEA5zWWpm33Zl8pshGOfywjYNp9sGHw+kB/41Th8Wwg=
X-Received: by 2002:a05:6512:2522:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-55f70967db8mr4302395e87.48.1756819849325; Tue, 02 Sep 2025
 06:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org> <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
In-Reply-To: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:30:38 +0200
X-Gm-Features: Ac12FXwa7a499RP9JirYFVy7SbY2WfOVu2ugSGxCUkawbutvsj6hahPNBLiFvFg
Message-ID: <CAMRc=MfgXac4kRgeiw+SkNUZS_ThoX5qcXeRX5bPWm-t3JQ9Xg@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_063052_614114_5A13A381 
X-CRM114-Status: GOOD (  22.49  )
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

On Tue, Sep 2, 2025 at 3:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> >
> > Unlike all the other allocations in this driver, the memory for storing
> > the pin function descriptions allocated with kcalloc() and later resize=
d
> > with krealloc() is never freed. Use devres like elsewhere to handle
> > that. While at it - replace krealloc() with more suitable
> > devm_krealloc_array().
>
> With that in mind...
>
> > Note: the logic in this module is pretty convoluted and could probably
> > use some revisiting, we should probably be able to calculate the exact
> > amount of memory needed in advance or even skip the allocation
> > altogether and just add each function to the radix tree separately.
>
> ...
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Ah, I just ran b4 trailers -u and didn't check the result. :(

> This tag is not applicable to all patches, I do not believe this has been
> tested.
>
> ...
>
> > -     keembay_funcs =3D kcalloc(kpc->npins * 8, sizeof(*keembay_funcs),=
 GFP_KERNEL);
> > +     keembay_funcs =3D devm_kcalloc(kpc->dev, kpc->npins * 8,
>
> ...switching to size_mul() also adds more robustness against too big npin=
s
> values.
>

Eh... ok, if there'll be a v8.

Bart

> > +                                  sizeof(*keembay_funcs), GFP_KERNEL);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

