Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6E6CA0FFF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Sep 2025 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=; b=Zw8n57NRxxJdRaiF9TB6u2USdV
	TdJ528CoPIQJCos0he4FkXpI/R7RYt4y1NMWvG6zgpmoi1DgRqiW/ZzjrGFaxrZj2bDkszvkw6gIV
	I8/keklx9FoeOmyxn67b5wPEFZynNOyUBcYHykOAYzvFyEVLDFMTS2kueBUGVJP7z/yMElEI+Zq5O
	WIU/+abTsCM0JoKWoIuC4kjRlFBy4zyBTokcJ7nTmWd35WVD6ODDqQwmzIctT0RQTFDY7JnJR92MA
	st7sASCUmquF5wuMHV8YztC0FoOedXRM71kl7t3dac6tsjLL70/T0tssq8wyvLEZu9twY1O0E9xft
	CewnDoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7jK-0000000DLR1-167i;
	Mon, 01 Sep 2025 16:50:06 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4Sv-0000000CfQo-1Qoj
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Sep 2025 13:20:58 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2186169e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Sep 2025 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756732855; x=1757337655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=qWAcovFt2a4GqwdKyfgsDpYEikwoNyoM/48O/UJp5CsArox92+5gExe09ZmWQbpBFY
         dEsj/w/jnDVc0O5PUnxU4mFvRvi8nlqczgj8XVh4MoY8oVSJHaYTTtqcYx++P87uKfb/
         qda9LZeRF3mZVQPTOH5bbc/ylXv5h9MBByHw1Ljv+egZ/LEmrioC4mCdg2dfvEHwJT4e
         mlE3l/GMTC3+ZjvOHzivtneT9If2IocYdUv2y7tUK0eWCRyk6Jpt+OFF+ekxoNsbOXKU
         YctRPdScAIwtTaghLX0hH3RS+DNCgdwIAJHdITzeOLOPMw9n7W+XRFMrWXMkYk+stnec
         egag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732855; x=1757337655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=aQDtcg2Df2qS6MZUfkIpAMW2L8QTLij0PNPoRaZD06rRSniUIRLSbFjVlOqFeOPZrO
         4+SMfnWEcnm9PSQyHg+HA2o8BMiwtolVJ0dn+zcFcIkrzlZcaxyJFPLrbGv4mZTQs0i8
         m4cqOZx0jXGoCIqA9YRVY+9qOZ0aMoYSAXChMtnUDHu4TObUnHhDHP6Kg1T/QHwgs9y7
         x0sQ3ff9wEd87T8HYdz5sgfBttkgK2OsypBlztrGm+ua0UXv4Vqx2g3EnMyY2d/6/SRa
         /LAFMTTi3zbUmfiMtjwqKXc9wlQTTfH+5F8DVZlL80JfRc9dzVNVoCy4d6FHeiyrPTeV
         olHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW0ELwGY8KdrTF76ThCMqDiC/YXmBYzVs09a51W4iRzqgfutFnVLV2LTyGq2rMAgmZHg2kLILpPhF+rzg5cA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl9abTqVDMGP6JFhodd3YDxubG3YcPUFWhe9HJlj9OZ/3OgDu4
	nX5Sh0lDKwxLm+ivH8X2MQl7kRo0EbOIQaexBwMUw5qqJkG1b++q9JAQGNSXFlIILs1NQ+vvQND
	PwYCDL+9xCDuW+edejGCR1zset76SFaYvkCLAVf7oZQ==
X-Gm-Gg: ASbGnctfITst9zxGqFF0dR2j9oXNYsTxmL+Dxx9n+Q0nUGNt62LUvMV4QPrs4goNdDi
	VG+LcA0WBH1WOlePXgcp+nQlsIXoIHKWLvk29o6sfc4PN86swswj4rpHEtP74uOUyJ0Ij/siG4j
	Fk+Nggk2NJyvF2RAicnZ8IvIWqQ9UX1DOsu+VWeMaUSFQonuHNfqorthK73b5IyIfekodmPgiV9
	wKpeaHrhIAoktWE1TqGxu5jRUWm1u4eu1R1MI4=
X-Google-Smtp-Source: AGHT+IH912XrSXzjBk2qT9512Zc2BnDvh2hCyUh1tIL/e/b5XAWzm9U6VOUb2k8kMnjWcaLf9C4w4UWLuNtsABXzYyY=
X-Received: by 2002:a05:6512:2513:b0:55f:4016:ad2b with SMTP id
 2adb3069b0e04-55f708eae52mr2361617e87.30.1756732855435; Mon, 01 Sep 2025
 06:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org> <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
In-Reply-To: <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 15:20:44 +0200
X-Gm-Features: Ac12FXxw4k3UY5TBARAefSnKyhMDuDCBaUNs2qyNKYW8yrbkHP8etuyQPhIAuGM
Message-ID: <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Mark Brown <broonie@kernel.org>
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_062057_381216_9E2D122C 
X-CRM114-Status: GOOD (  19.31  )
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

On Mon, Sep 1, 2025 at 2:07=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Aug 28, 2025 at 06:00:14PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The radix tree containing pin function descriptors should not be
> > accessed directly by drivers. There are dedicated functions for it. I
> > suppose this driver does it so that the memory containing the function
> > description is not duplicated but we're going to address that shortly s=
o
> > convert it to using generic pinctrl APIs.
>
> This is still failing for me:
>
> [    0.628221] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [    0.636506] Mem abort info:
>
> ...
>
> [    0.801855]  __pi_strcmp+0x20/0x140 (P)
> [    0.805704]  pinmux_generic_add_pinfunction+0x28/0xe0
> [    0.810777]  imx_pinctrl_parse_functions.isra.0+0xf8/0x4a0
> [    0.816289]  imx_pinctrl_probe+0x404/0x520
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1758025#L704

That's not a lot of info but it fails in strcmp() which - I suppose -
is the one in pinmux_func_name_to_selector(). Any chance you could
check what the value of np->name is in imx_pinctrl_parse_functions()?
Is it NULL for some reason?

Bart

