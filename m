Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFBC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJBAY+EVsFCK+6qYmvKhC75YavWi+kzyxoJ2FmRxal8=; b=ajVxt44xS9+rDC2Mfgd7OMykQI
	XqWYaI8VIqtzDwzUBoHzpwt339KJ6SF0UrwNn+tqZlPJMvy7mbe4FckOEXoa/y3QxRpxhRwO205E6
	v/qUVOPanDdnJo78N4OPFkQN8CP/SUwfda3yOUGSR9hXZMLaqe/o/skQ84CF4DUxhtUK8O4tjFAgv
	PKIqyuDFF/1FGT8YWQDqPwJA/eNhs/J9GbSiqKyKUK2KN3rg9WkqU+LCRqTyzuVtZ2roiIXv+VtV4
	0hc7+IG933H4NDQ/0KaUajnLhEjAmGtAKZJbjYVZcxx32wta5s4u24HapW6Cb5mEvYk4gx/LE7vyi
	kZtckSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IUb-007vhl-2P;
	Wed, 29 Nov 2023 11:12:33 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IUY-007vdV-1e;
	Wed, 29 Nov 2023 11:12:31 +0000
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db40b699d2bso5905358276.1;
        Wed, 29 Nov 2023 03:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256348; x=1701861148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJBAY+EVsFCK+6qYmvKhC75YavWi+kzyxoJ2FmRxal8=;
        b=YIv328xiBa/bvsawca+aD8k8sohmchFRNo+sBcvKJANyVVaT3/G2oX8RQ0JFGO1/1U
         aZx3edSO+VjaM0fgcAaYOLG9p9zWeZTsKHSQZNuIWLR+99GtQrqeN8CvfsExaG1nxCoU
         9oeztFdjWay6EZz7IP50LWjeqeSDuvHs/62UykMDESzUINSIdhT16MepL6K+A0yU+/qR
         jvuNA4sWuSb/xOu5jP86j5XBEYwF2Ofys3sLHb7cW/73/qCUH0w+nXnQMYif/ISw9IRo
         KUkNpT28iNIT9cpGh9Ahcm+3cbLc4k+r8VZ+u81Lu4qxFPZ6QYGmjUaczohvm9buCUMc
         brnw==
X-Gm-Message-State: AOJu0Yzy+MKX/+5OPv3CYrMYtO1hlkI6IMZDFKMyaU9m8z3Hg2ijMbEF
	tRJ6wrTMMLNXNRheLMd86oMRcg1UuDSEeg==
X-Google-Smtp-Source: AGHT+IFMQzfhXyyFLAskGJPP7FATOTpkzX5Nv0Usjm+U2UpV/UCtr4qbbTecTXwM/IlIChI7Ugkjyw==
X-Received: by 2002:a25:db8a:0:b0:d9a:e6d3:ae1c with SMTP id g132-20020a25db8a000000b00d9ae6d3ae1cmr16524128ybf.53.1701256348242;
        Wed, 29 Nov 2023 03:12:28 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id g4-20020a258a04000000b00db408d9513esm4031504ybl.15.2023.11.29.03.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:12:26 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d279bcce64so4230557b3.3;
        Wed, 29 Nov 2023 03:12:26 -0800 (PST)
X-Received: by 2002:a81:574d:0:b0:5d0:675:575 with SMTP id l74-20020a81574d000000b005d006750575mr10045178ywb.18.1701256346741;
 Wed, 29 Nov 2023 03:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-11-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-11-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:12:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOTNBkq=ptZ_Y4=+h+jMXKDYXr4iJcs1g7aGYCDKLtuw@mail.gmail.com>
Message-ID: <CAMuHMdVOTNBkq=ptZ_Y4=+h+jMXKDYXr4iJcs1g7aGYCDKLtuw@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_031230_555155_49CDD8FE 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, Nov 28, 2023 at 9:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Add PINCTRL_GROUP_DESC() macro for inline use.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

