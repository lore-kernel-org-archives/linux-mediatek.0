Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023AC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIX1RNQkc6dFT3GzufGFqm5IkObG6UPnE4BiG2zpzws=; b=NYUy7XeCSs8AxnDYP16JSV1gmb
	U7Wjwd90jpvPJZ4Zc2OwwUjqRIugtHPTJUbXrDJBPliKN0WQw0CGWznYbyD0PqiOPnVPx1mUesX3H
	g+IRjX+crUN9o0ZypjZUSqXKHVixetmvE+Uo0gmmD0Psd8Skd1byYpXY4qipOMeabgxkOY5evqVTW
	MkDaIy+MGdrjtQg5o/BNIYRN08zllzbvcuPtYP+B+AtfYJHPNN09I5iQ+zIP4iN5Cmr/hPTJ5Wtz3
	QCR/Kr1+3tnhYGqitX/wfUTn41hvE51ytRc3/gvacv7HlOcsJREBCwXuDMVPiyHvrZ/50Nc/Sfu02
	Mae6Zm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBB1W-00CPBL-16;
	Thu, 07 Dec 2023 09:50:26 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBB1T-00CPA6-2v
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:50:25 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d3efc071e2so4823937b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701942619; x=1702547419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIX1RNQkc6dFT3GzufGFqm5IkObG6UPnE4BiG2zpzws=;
        b=hz9gp0I/smpCeN0D9Sgt6Ax23AJYicPdrzHcwXnphHiQtQn3fAeHuUtqbRu06MkI/e
         +gy6GffRsshh+nBYOcrX1hGgo16C9KtQxbCQNo2ajLO6Eh6J3oWU3QA4DgWgYTfckNb4
         r5XZb0TNYv5+oUv92BFW+SEsYJZcF6QVk7v8303E7hoSIVlmycOMqjtGIPs5aPkHe+Sp
         8O7bIM59g1K/f4666/hg+niy9auwYSgfnNyGy31SzL/eKrFRxJBPmulMexmYz4xvxSVN
         +FCOmw71Y25xsRG0p7cZwDpWuqHc+Sp3q5Db0TuWSkWM7eO1O9T4vYpL3AA67ZthyquF
         OPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942619; x=1702547419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIX1RNQkc6dFT3GzufGFqm5IkObG6UPnE4BiG2zpzws=;
        b=jXS+ZQQKASA5GNOR7023wfWYIq+XPrMdxkEO+CboZvT2hMoiQQoZHm1lQDNz8LxSfe
         3JJ/qbExxtt+Fyf36KkSo/b1umyF69BUFDr1m/AlrAxAnRMrIG88WF93OkS4Roez49IL
         MEgqJPrLYn7T2yeEcaIRVYaUCCPLg63SGRsidzp/z4x+gWUmCacDoWFUiebo4An1LLqv
         EWbRhaxP75JGF+CQ5pPk8IgIr8rCO6cWysyR8ABAM9OqOskNC9EZAExtAcFtqQD9aPbV
         t76vSlVAEHSDqmm3zaLqi4jynUKWiOmtkCUdB+3K0+9YcpqzLeH/1j7m/Dynha0VN3gY
         h6SA==
X-Gm-Message-State: AOJu0Yy2tyv81/RNF+Je2el3jdpzyzpF2+dMgc9hH6lLEWJvT9mZ2tcj
	FWQjmytrLLjLpjHQwZPM+OBIpiBm2ycr62YoQvp76w==
X-Google-Smtp-Source: AGHT+IEEJzWHmSbZphkfBLVNWSrStTPwZmWuytH0kY6FxBii24pm/m34J3igBSJ8TViq0A9/s3USCc7X5N9RAXK7HsM=
X-Received: by 2002:a81:bd42:0:b0:5d3:761e:d835 with SMTP id
 n2-20020a81bd42000000b005d3761ed835mr1947189ywk.28.1701942619477; Thu, 07 Dec
 2023 01:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com> <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
In-Reply-To: <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:50:29 +0100
Message-ID: <CACRpkdaDDJfDznGZE1OGNt0Rc6Wbh0-0suu6PgL+veJea9rBRQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
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
X-CRM114-CacheID: sfid-20231207_015024_017936_46D50FC6 
X-CRM114-Status: GOOD (  13.67  )
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

On Mon, Dec 4, 2023 at 3:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Dec 04, 2023 at 03:38:43PM +0100, Linus Walleij wrote:
> > Hi Andy,
> >
> > due to compile errors on arm32 and arm64 I had to drop most of the
> > patches again but I kept the preparatory patches so your
> > patch stack don't need to be so deep.
>
> Thank you!
>
> ...
>
> > >   pinctrl: core: Make pins const unsigned int pointer in struct
> > >     group_desc
> > >   pinctrl: equilibrium: Convert to use struct pingroup
> > >   pinctrl: keembay: Convert to use struct pingroup
> > >   pinctrl: nuvoton: Convert to use struct pingroup and
> > >     PINCTRL_PINGROUP()
>
> Hmm... Why these to be dropped?

I couldn't tell apart which ones could cross depend on the others,
simple as that...

Yours,
Linus Walleij

