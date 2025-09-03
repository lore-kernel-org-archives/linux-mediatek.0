Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA36DCA0FF2
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=; b=RaTdq07yGFCubCNSl4AM7m4Mu2
	5l5WFzEcLZ6hJd9Fl7JmbHphBMtsl4ZnKyJDE9hWyYfwU0kiPIpZAUzhZ+YRbg2ofODsKNa0tmJk7
	LV7xz3uki4D8BcTesbUyqdOetCt6zdiONjvVJ90mJNh2qwFx4lvLZ5vHsKruhQw54IuoufeGZupdt
	RNLJW+IQsKNpa0RLhwFW25wL3oK57mAqBkGghBNqq1SWyywzKvnh6wakMH/cHiTXiKU87x/rxd6DG
	g/9D4i8L/sDDb8RKAfgzMJ3xxbyOMmKTKE4fmyJ4UTeTgwDjqZNhohWRfNohiPEAVAhYdrvmU0al9
	KEowD0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utn4c-00000006UNx-1zKT;
	Wed, 03 Sep 2025 12:58:50 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmGZ-00000006KoC-3Sxs
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 12:07:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55f720ffe34so1234560e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756901226; x=1757506026; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
        b=EPAhARhQSv0/bTbNCvy81/7uiV6UafbQ4YUPr0lJsxfcZe3AP8z14oBDEOlxP4//Yg
         f6S/a9VGZdNwaOjNM92uPQGtGItBoziI83fv0XjHEzam1iW7ip29KuRYzWNXo3m+Br0U
         YsZ1qWw1T1Mx5wMcD25bgxTUaPW1FKuxKKO20+hiVtodIRtLFWogyvoeRG0kyQta/B3L
         yKkO4jt2rjXecOq9XFikMCs/U0pH4o/4eZ8gF+5I7sRU+Azq5amBLY+QvQYabCdWDjHD
         zyE8G6zErHZCd5ixWCi8xFQHBHj1TWJc3Hdjs81u5q8AVMQnl8l7jTd7tq6EaG6lZCpR
         UBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901226; x=1757506026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
        b=giZ09SAn1sF8a3nQD1A0ccWsY7/EDYef1UWFjcIjsLWhOgQqX95lp8OFwuyoI7zloU
         /XQrexdazarXijJo5Ldh1X6W6KcSBBU2HkWJeC8MYY4q0547s3ZeVbm/ICfkurnXLGJg
         Xw01IEQsxXOrXlUflDH5M8LEAKdPJd/M0wVYZBD6XJGOfnIlx5ZbLCTkLeBsV3949Vqy
         2vh/jXOBT8zKzElgjFpVFLdxtE3yElUch5VqJzJ1wSuCK/S5mr1RLJGfuUGfXY6ILEab
         3uMiTJ25KUQ8Vr7zYwnXVudopR5uu5FF+oBnQju8zSBHMk5R7bqjGhlnxzM4SPgguXBz
         6vyw==
X-Forwarded-Encrypted: i=1; AJvYcCXi6hFrCxVCsMWpIHtobizuZRO9VNT9N2CXQZvf/RB1NyeIL4kBr8EMBtOpJveiPUzVQgE6BTrvmvdvK9023Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YykLQTrjvgQyvUpINCcdPgvMa8FEAj8z8TdpRNZj0ZwWREh6WiO
	j8npdT2aQtD0+eMBQfkSTGnxX2qS3OFJnlFyWfhi+ea8s3vNmP73uBBUSGbeqlDUqjIeJQ9W2Ff
	M70OrEJmvNgkdMsZBk++fKgbgn8ZWVlsV4J9mcV0dMQ==
X-Gm-Gg: ASbGncvrpAf3UbLYEyeP3m1lBs7dZ7lglvwqSKlQgFqqxAq8FsuFMOJ20onmyu4wwu0
	1VseSYzVnjvxPL62WO6MJLas2pA8izcmel3a3QjaDq5fzGPX1lF6Hz0PBSVjFlYWwZ0HhvUShlZ
	nBu7szJNTCFzEqg/X3pLF/QY7sq8MyQ14/VkPlALqHochg9JGKC1MTUmSn1ij0qtIEBfVGMZCRo
	tVUlt3byYT2zDZvD9gb3TJy1IIQq3Xc3wyWErY=
X-Google-Smtp-Source: AGHT+IFCWFQpsNSj5HbtwgM9MCfjT0JGzQpT+8Q0JOxroU2mp8U3cFtE7ajM8EOI5676CpGuXoSnHTYyKyq5zkghPtU=
X-Received: by 2002:a05:6512:3ca9:b0:55f:6b08:e60 with SMTP id
 2adb3069b0e04-55f6f6aab17mr4829149e87.5.1756901225907; Wed, 03 Sep 2025
 05:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com> <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com> <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
 <aLgrqZETNLmuMHhv@smile.fi.intel.com>
In-Reply-To: <aLgrqZETNLmuMHhv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 14:06:54 +0200
X-Gm-Features: Ac12FXx1vWTkfbwcKCR1G15N9111AA5z_ZoC4xZjaCT4bFZgzZIJamSIU5gFH4o
Message-ID: <CAMRc=MeX58XKmxaY1jYCMdy6fQJf7HWMR8f=DQpeovE8APw=og@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20250903_050707_866105_F043A643 
X-CRM114-Status: GOOD (  15.57  )
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

On Wed, Sep 3, 2025 at 1:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> >
> > I don't see why this would stop these patches though, as they don't
> > break anything unless you decide to make your pin controller strict in
> > which situation you'd need to verify which functions can GPIOs anyway.
>
> It can't anyway, Linus already applied :-)
>

This would be the third time he did it so it's not like it's carved in ston=
e.

I see your point but I think we should cross that bridge when we get
there. Shouldn't be too hard, we already have an entry point:
gpiod_request_user() where we could set an additional flag marking the
descriptor as requested by user-space in which case, when we get to
the relevant pinctrl code, it could check this and refuse based on
whether the descriptor was requested from within the kernel or from
outside.

Bart

