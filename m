Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D85CA0EED
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2fgjYTxYjXy8UMOqphDGxwyeF/52vWVWRMlWTcUmd0=; b=3LgQMschbcF/LG0m9HWYRpuZLb
	cI3ZW3Tx3lPqRhrZQhXxuRpR4GJ9zFo1g+nJ/g1sS5z8Qy27OqiaHrP9EJKjB00ulfBpj3TkaS4wC
	bGDqxB+1TB/xGf0Hy1ajDg6R0sbZE3IUMo5Dhv8+tB2e3ml9izc7dEMQyNAbTfwi8XB6dtrxE7gyU
	yMSlbu3pP1CexJda3dQECs7sv6tgExn4wCQWhp74aCKxwNw+A5EOYJ7XxHvJT2RWJKfnOnPkkEOP7
	LUrJaFDenXIxPCe3rpPsA4IfvomMbzqqv+348LV3h9VvoDpddy/ongjitaZQWFjbsQP3qDcRoT/G0
	Wjfu4Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeGS-0000000CkyD-0wE4;
	Wed, 20 Aug 2025 08:33:48 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod0J-0000000CZnD-1zCs
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 07:13:05 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-333f92d60ddso43508991fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755673982; x=1756278782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2fgjYTxYjXy8UMOqphDGxwyeF/52vWVWRMlWTcUmd0=;
        b=dZ/fHcQ0PTUZRjiC+nLTCizdTCyH+9MavkSRkmPa5cV+Vh9GFEu3uVJ8xcIzoGCKAy
         rqLW6EDLvScYLA/fd21qMCHAkaRP19nve4+PG5JxSYVlx2gINUwaUd/k8T4ZRRs10Jy3
         N4Rq9zlTVNz4bQLtWBf6gG1RCG7O5FY4TbYRZ9Sj9hMOkgRQsVsGDGxzlcN0m3q61uOq
         Oe5+vnW/IvVHs3gwJaSAjUkHcgBo75RYZxV0ZipN3GjZIgD7Yv54zeME0X17GMig9WZ+
         aHDHb/6BbpBKGUC+Z0UcKHPLkG3Na8/s/4Ioj2fnyIPJ7OMpbvmi+YemAAE7lADnWdDN
         Vj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673982; x=1756278782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2fgjYTxYjXy8UMOqphDGxwyeF/52vWVWRMlWTcUmd0=;
        b=rP6oOzeb3403bZs+tz3IB9LONATXeleMgYU87/Mh7LqC2lcgXyrnqhSexr47Nt/Cfz
         VeekYyVuFTo1jHlgKTqZ6dWVV84vgEwkO9tE8KpU2v53s3pOwCPcjROWtvLR3HfMf38d
         4JbJIqDjEIazco4bzHOwoVf5QnT5OPUPsF6lseV2TYVgaGpsAKp58UHcpVD0bHYgP/A6
         ayyJLK43KfgH0Pux16PPWjw2zNxNhSMl8ztEzLXSIl2xFKpSqTzu8WM81+z2/Jmg7o9K
         Elan5UM/gkjP1rxBEh7uqVEwQN4XiAfu6FOXaz68VRZDZIUItmJWcsvXaY4v6lxeUC8I
         DVog==
X-Forwarded-Encrypted: i=1; AJvYcCVyLPNYMCRwXpTPAwVzimsSxZ27WRBjmJ2Oke1iY4k0LRMLTpgg7d82baKsn0VYy/Tn8gj7JZ27s1O2i4U9/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+8jO2xFsslnVccBnz72FFyD/QYBiIKTnkuukcpXmPdt5rU+v
	kg+K7OMwCClRz6kOB/V5BQ7uRzZahPKJ5RfJ020LeYKCYC/TmW6z4y67sz2+MaYSflU/QB61e1q
	o228ETBJQ3Y9IsPdqOlrf+FTBaq3eRnTHkdtlJsWsCQ==
X-Gm-Gg: ASbGncsDCiBy1HsG5k2ZhZ9848LoikHiz/b8Ry1MBLUtbC1H3frd76m0FZ6wM36PMYM
	aZSxMGy+/L46UYuWFEITSp3dBHPT6AUwZx/lJm2fYMXdkT5ScGw6YeB3nHR/foaBA6226s+iZLD
	u3a0qLH6L82KDQGmawxsSlZjVBOFwflFJF8P7BUbzOiYboy/T9JlymF+zNwUE7umwN38w+vfA8r
	BkEN3JTbjIk
X-Google-Smtp-Source: AGHT+IF6EyOC5NaF9ylfzmvC/lF+XZ8ruNEnYsDF5O1GCCUBAqJgipnFljpMN/OqbECQRkpVCXWcXHbvMHeyWEs8R7M=
X-Received: by 2002:a05:651c:41d4:b0:332:45e8:3aca with SMTP id
 38308e7fff4ca-3353be058demr4837631fa.19.1755673981615; Wed, 20 Aug 2025
 00:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com> <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
In-Reply-To: <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 09:12:49 +0200
X-Gm-Features: Ac12FXx_mHZvAEY3OP5MA3Uo1ED7cgPY59m1esPAFUlhfqgk9BLjcKH2xKwqp3I
Message-ID: <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_001303_510906_76E6F978 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Aug 19, 2025 at 8:31=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:

> > >       devres: provide devm_kmemdup_const()
> > >       pinctrl: ingenic: use struct pinfunction instead of struct func=
tion_desc
> > >       pinctrl: airoha: replace struct function_desc with struct pinfu=
nction
> > >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> > >       pinctrl: mediatek: moore: replace struct function_desc with str=
uct pinfunction
> > >       pinctrl: imx: don't access the pin function radix tree directly
> > >       pinctrl: keembay: release allocated memory in detach path
> > >       pinctrl: keembay: use a dedicated structure for the pinfunction=
 description
> > >       pinctrl: constify pinmux_generic_get_function()
> > >       pinctrl: make struct pinfunction a pointer in struct function_d=
esc
> > >       pinctrl: qcom: use generic pin function helpers
> > >       pinctrl: allow to mark pin functions as requestable GPIOs
> >
> > I applied these 12 patches as a starter so they can
> > stabilize in linux-next.
>
> Hmm... I'm still sure that we don't need to have a separate flags
> field, but since I am on vacation and will be able to look at this
> closer next week, I can't look closer to it.

The qualcomm 32bit platforms fail in next anyway so I dropped the patches
for now.

Both you and Bartosz are on vacation so let's let it rest for a week or two=
.

Yours,
Linus Walleij

