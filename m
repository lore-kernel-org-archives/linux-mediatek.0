Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17830C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp0IjsfcwvSP4xwYPboGJw1FyStABvBFv/P2infLWSw=; b=ZcuFh5oPHImoGed9r5awzs0fGL
	mY0ZbNpJ/nYrMJ70aY9zOB9n99fI7ou0utd/P2QNnNF9FH5x1bdc9LZNKHDns0mCX12OLTPLXNOwq
	IXjgis6l9SbJHqWBC9MtbppaaUVPFGvzn6zQIPC8G/k/TVpp0BIiccfM5gAjnW21F4gmsFcQ1j1XY
	W5rMfuGJRMNSoxkU+pm4xzfWQS23EiL3Hs/aRjxtNZx0O+Fd6IUCAmmJGhcDzufgW7SMYwAMw6siG
	iOv50i/9l57fgynQZbCiwKeF496TP5Z8DJHSOluw4HMm6degIcO2/VIeHKMoUOhQTnmE5gvv83qPQ
	nPSAV1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAA38-004nA4-00;
	Mon, 04 Dec 2023 14:35:54 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAA34-004n8y-0q
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 14:35:53 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-db979bbae81so442078276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 06:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701700547; x=1702305347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp0IjsfcwvSP4xwYPboGJw1FyStABvBFv/P2infLWSw=;
        b=yMnlGWGJ5X8mK4GvbGkGkdCO0ho/hcJHWpRmsDS9nePAXk46K/LfyWkgSdDA516Stv
         VwUFp1MRp0nb95rLvTuUb9pusYHuwXXnuxtNMVU+vUgV9N7HGJjXRoDQjbxmO/d64JtI
         sGQRNLe20nk8FqVBLdRKMNSDNCoWNUAr3X6x0fyyPIWzpGGqN2b9IOhBOjD6bP4t50QN
         C+6CbVXB+qOpGeq0HvUIulDuJ1g8lhL/5va5L/VqmobaH4a2yH1wxUNI/ZYMnc8P+seN
         51Qz46dD1L036ECoFsqHsnm3uiYM65KkR9impJhtFOjfc43fLEe/ooqpXL9Tu8wmIP8z
         ESpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700547; x=1702305347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp0IjsfcwvSP4xwYPboGJw1FyStABvBFv/P2infLWSw=;
        b=Qh0pcJBa4ldLiPM5gR0huRn1B1nlqk+AuprSVWd/jt6SCoVGqh3A13Jh5QxUMYj2v6
         Jktq89p28f8fbAXgtxUTKdtN4v7/AootDfHokm7VcYtk/AsR09ZOoceMLY3ahwUSUf6M
         n92rBmjBkzBSvAHqttxPys3XCRs5BwtbGlunOZAjs9yt8XI0Nut7/2c33JlfagJwStSA
         Kgt1U1/S+Nyu4bRBYGEp3rd3bpxVfGa0vSQzp/MOx9YTWKcQAogUofEHgOPTlOMgWJaR
         axJ24dQow+LMR5Ys1b0jfy8WXXdSexrwG3u7AcgHrdo/AjJ+QfzrOb1FqYtVDk/oIgmg
         E19Q==
X-Gm-Message-State: AOJu0YwD5L7pA3SV7fPfiSJpSHoYkwNr9cg2geQcjakCTbRcab6ikQVJ
	McmVrpmLZDUVCBwX5YljrGFzNcDjGIdMZjUYLFvUWA==
X-Google-Smtp-Source: AGHT+IGlzR6jMdp+UQm1IidwrnLTDQIh/k3Qz3N9UjI37v6TipIB4xIDPl1uX1mVMB9Ef/A4gLOOuoKxBOrzTG+rKVg=
X-Received: by 2002:a25:ad4a:0:b0:db7:dacf:4d49 with SMTP id
 l10-20020a25ad4a000000b00db7dacf4d49mr1286460ybe.69.1701700546895; Mon, 04
 Dec 2023 06:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com> <b2175abe-b989-4b77-891e-67e8240ba0be@linaro.org>
In-Reply-To: <b2175abe-b989-4b77-891e-67e8240ba0be@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 15:35:35 +0100
Message-ID: <CACRpkdaTKAwCN_dbcAn_qKLi2R15=BzJjpg85XtL=Ap6ORSgUQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
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
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_063550_306469_CE238B54 
X-CRM114-Status: GOOD (  18.13  )
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

On Mon, Dec 4, 2023 at 8:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 01/12/2023 15:05, Linus Walleij wrote:
> > On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> >> The struct group_desc has a lot of duplication with struct pingroup.
> >> Deduplicate that by embeddind the latter in the former and convert
> >> users.
> >>
> >> Linus, assuming everything is fine, I can push this to my tree.
> >> Or you can apply it (assumming all CIs and people are happy with
> >> the series).
> >
> > I applied the series to devel so we get some rotation in linux-next,
> > augmenting the relevant commit messages as discussed!
> >
>
> ... and this next fails to build on standard defconfig:
> https://krzk.eu/#/builders/76/builds/420/steps/9/logs/stdio
>
> I did not bisect yet, so I am just guessing that error looks like
> something introduced here.

Ooops how unfortunate.

I actually thought the autobuilders grabbing patches from the mail lists
would have warned.

I dropped the majority of the patches (not the preparatory patches)
from my tree again, rinse and repeat.

Yours,
Linus Walleij

