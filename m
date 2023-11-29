Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDC4C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uisL/RS3uo1evP9py88SsS4qsxKCbh35nvAGjS1i0wE=; b=EHsqLCDg1K46u6iG7IFGLhzSAT
	Qq0/YoINr+2+0Kq758kTsiHxboR13C/4AOFW/4j77KQZVnv/OGbTH3gv0hHQkGrKCzl25wcSv61OH
	I1ZJqt2+VriCcMF0UZwI9vZbeDaH38zOKEnzzsdriO1wNleRhLbm1K6opCnNxxBr5Fma+mwSLvY2I
	PJ5EXNQaLSsRiSrETBABlEyXmRxab60sqDXq4TYqXs8qlghFkeuQviBsCOyl9GjmJFdMOqrBhjxzk
	BZ8ZXSxXR6Wmmr3Uqcmjvbctkg8iTs96OqDAGFWfd15RTIBtqTPY5NsoWPZaBacWlVe+bBE3RR5/n
	ur7Vvsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IWv-007xJG-1n;
	Wed, 29 Nov 2023 11:14:57 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IWs-007xE8-0I;
	Wed, 29 Nov 2023 11:14:55 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5d1f8bc279aso6073677b3.1;
        Wed, 29 Nov 2023 03:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256490; x=1701861290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uisL/RS3uo1evP9py88SsS4qsxKCbh35nvAGjS1i0wE=;
        b=DTYffHrq8pwpbQrdjkIvYat4RuOAv80gjDlEMmhuRwcrTQ4UTK4Sr8u7y72A9XOvhr
         LonpluuDFxzQwnT5rqtKgeNKy1RzbhkV0lkO/kqJZLMXxEUmsQbatCO3A6bBOYY7zJG1
         9zJjRPOAAO4c99fEtcvhadNF/s2WT+1umxQDmI5YDd6Zot4KiRYibKETevEmPVf36i2p
         UpKuk8WZV9GR7L0sTtZqv4haOflnShFwLxSVxcjv6VC4OR/T39s05U38/wfxYtiVjon5
         ki27pbMgJQ2hP0bdq885ZTCqcm4/rtsZsAx0Fo7ekBjbd4TyG0Mvlvxgka4VosJGOZSm
         lu2w==
X-Gm-Message-State: AOJu0Yz7utwfxKN8F6luR8r28w9lN7+yURXu3dA3gp6Tjffe34VepbwM
	d7p9bhSg9TovB5vWN6fL5+S7+T+o+3nG8Q==
X-Google-Smtp-Source: AGHT+IG2zJWZ6gzJAjNbBnXmVm2C900w5qSqUFGVulDNvlzHcAmUoqvtVlpTQ6Jl/xVKCznjcBY6Ow==
X-Received: by 2002:a81:910b:0:b0:5cd:1ef8:456b with SMTP id i11-20020a81910b000000b005cd1ef8456bmr13623228ywg.25.1701256490618;
        Wed, 29 Nov 2023 03:14:50 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id w189-20020a0dd4c6000000b005a7daa09f43sm243571ywd.125.2023.11.29.03.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:14:50 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5d1f8bc279aso6073627b3.1;
        Wed, 29 Nov 2023 03:14:50 -0800 (PST)
X-Received: by 2002:a05:690c:338d:b0:5d2:813d:d6a5 with SMTP id
 fl13-20020a05690c338d00b005d2813dd6a5mr562225ywb.23.1701256490377; Wed, 29
 Nov 2023 03:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-14-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-14-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:14:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbAgr0X5_BNdoQjuzhsOjLa2A0vttr7Pkj=ROrC82Vww@mail.gmail.com>
Message-ID: <CAMuHMdXbAgr0X5_BNdoQjuzhsOjLa2A0vttr7Pkj=ROrC82Vww@mail.gmail.com>
Subject: Re: [PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct group_desc
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
X-CRM114-CacheID: sfid-20231129_031454_135282_00560D60 
X-CRM114-Status: GOOD (  16.27  )
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
> struct group_desc is a particular version of the struct pingroup
> with associated opaque data. Start switching pin control core and
> drivers to use it explicitly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

