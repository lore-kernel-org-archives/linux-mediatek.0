Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0DDC07E98
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 21:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1ZO88hxLxdvNhHhYibiygRoAvqr8qAWNq84h8JNdaQ=; b=U6bX5GgeCFTIC+qkxZcHbwKxs1
	DyEdPL5z0TnJjSdyfhXw/hbov+fFhizPA9zgWoA1v6LJgVfUD3hkpPXQf47FfUdf+YZsok/lr3ahZ
	NVVJy8OrSW8p+PJWfuTa7prAF8Cj7ew2raZu30eRIPWvJs3jEFPvQA8x57XlohXUtyqEiPdXjWwwo
	nidgU+6ciwhbjLYjocncXyInps4qnL7Phk6C5SFFPeUT6RXTgzWahMIzuWMk6jgp8idPMHBMhf0Bz
	fE0OZ0GhSqG8J8TRkDXwP0S3BDFRA8/x2uG3fkJ07iEjrTJUuVCMHqlVmJRd4uGRFxoozn7ajH+IT
	uCFLYeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8SJF-009MSb-15;
	Wed, 29 Nov 2023 21:41:29 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8SJD-009MRu-07
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Nov 2023 21:41:28 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5ce8eff71e1so2549517b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Nov 2023 13:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701294085; x=1701898885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ZO88hxLxdvNhHhYibiygRoAvqr8qAWNq84h8JNdaQ=;
        b=rhi+4udZ0mdumcQcI7KhBlO35oz34fVk6X3lLKKqRn7S7/D/6Yyps96l7xNzuZfloh
         4eTntfvYTbXzBGt6lpd68SMitbYbzCSfGaHeLw5GCzLB4M97kOliK/Y+qqqUryqAyQlj
         X4mwrrWDWBgMc3k4IOuy8gil6RuXhFN/xnnR8xK//Qk+MEnM2kmilrSqAh0aEa2Hzbx/
         irKWGiGs8ZzL1GGqNLNa+6fYR8USGeIqU2JLcyHvr9xlXKalNS2Nv248pzQ1CtRJU8zr
         vT+Nllig+3VYh9n7oxMX3HdzTt6me8Hj7C+P+VJoXfA4vkIFIcbdTi1/MoGMDxSnQ2Fq
         nhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701294085; x=1701898885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ZO88hxLxdvNhHhYibiygRoAvqr8qAWNq84h8JNdaQ=;
        b=kiYVh0fbLpz8yAil8bcUv/WmFnV79e16LHPs4oRFE0SA7z1r6tIOGzn8R8Oakt5xsO
         DoAZV4bkpMPrsyUf8pJAhmVMha3caxgnfbgcK2lCyfcI2g75X33hIwiVeOq2jAYwJUbc
         fibHhBtzk2xrN6PckrHYaOfnBOQVV0RJkSxmIU7U2pUBz8jzA5QiAGdcB17utsOEme04
         JH6xb5r4IQOwVUhtk926b+bRbswohfjipQY78kYRu59rpkbxMl0fiJfHRVpmwyV4bPuc
         EP/LB4eD17m9OGm+lcsqVdxd/kjL5eXmr4aMLojeureUTJHUtKLU9UZdGVkcEbJL7aVs
         Cahg==
X-Gm-Message-State: AOJu0YxrZV7lffV/FYKqoZAVMBMPi/Ar3gEebUI3PsgQoL1Uj1+lV5cO
	0iMUFmGgs11UrJlmVdtdR/oQHog9liIY+J+Ssmfegg==
X-Google-Smtp-Source: AGHT+IG1Uagfb05AQRCkYJ/sVdTN0npVgY7BidrNhD15Xi7KOYZSxtp9xnbO86r7NF5QEuNER2q641/tZFxOQM6la+4=
X-Received: by 2002:a81:cf08:0:b0:5cd:c65c:8173 with SMTP id
 u8-20020a81cf08000000b005cdc65c8173mr18687170ywi.10.1701294085422; Wed, 29
 Nov 2023 13:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com>
 <ZWduPKmBWkaIdLhi@smile.fi.intel.com> <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
 <ZWdyOc3pCoNihDtD@smile.fi.intel.com>
In-Reply-To: <ZWdyOc3pCoNihDtD@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:41:14 +0100
Message-ID: <CACRpkdap2fe-L0v7ttQULGq7d_zVCb2MmD4w=hHxKacKZH8jng@mail.gmail.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_134127_075498_726EBCB7 
X-CRM114-Status: GOOD (  16.25  )
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

On Wed, Nov 29, 2023 at 6:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Nov 29, 2023 at 02:08:38PM -0300, Fabio Estevam wrote:
> > On Wed, Nov 29, 2023 at 2:01=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > It's explained in the first paragraph in the cover letter. Do you
> > > want to copy this into each commit message?
> >
> > Yes, much better to have the information into each commit message.
>
> Here it would be like
> "Because other members will be removed to avoid duplication and
> desynchronisation of the generic pin group description."
>
> Linus, what do you think about this?

I can just add that to each commit while applying if it makes everyone happ=
y.
No need to resend for that.

Yours,
Linus Walleij

