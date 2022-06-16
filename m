Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B20FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=; b=FCkSuGxiHwkFJkgM3BVK3BJati
	zsXhtzNFb0refv49wr4iAd1DxabS7CN5ZCgxreghAdaSdl6yi7zdsTRUp+5Ylq/g6mFYbZsJWt2PS
	e7dKO6pOzhYvax4shePhw4+uHR+Ezp7Lu6KTyesfTYnBvmUkk/PzwpV/N3Jp3rCu7YDS9sYvsgAae
	re/Oi11xHHr//BfduQEgnzzOreDAibIIjp1wBT4HNy0SSsZAqbIFMCB3QoqcdIJF6nFmrYjk1Fcn3
	8++/5wPRpZgD7dOzhdDaADrTJrWZQzgiv+oO3AzSu5JR0wups3itFDzuEGlNeOQHFDtmltXqmNdkc
	8fur3OUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pMf-002QjI-FP; Thu, 16 Jun 2022 13:16:49 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pMd-002QiZ-3I
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 13:16:48 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id k2so2153523ybj.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=hfe7mj1KZcI8jwu/+nrNcYUQkpbisjdMGB5MdUDVHZURXKTI0fpPSwYzVJTSQIvUQj
         mQ+FkQDUQOvueZPXCdzZ+WEb9CVEmydueaKmiNl4EduEP7G5KldCbqyuT6DrH619ltMs
         SiQd+lbSkJ/2ztzapTtqInm6GdRXCWf5M7sFxt2WgQ72hgoUmjnoNNk2kM6AO8hHEKNE
         9YK5KNalKb6+DMnwTXh0W8DordCVtz41PW0ZjsKXzkeRiewzu8ZSaBVNIEHFdWdQ6ziQ
         lQIpZXEuEWineyu9YQb+gIhoNcGOJyB0hu2Lyui1EO16WO1/xuKLHNgfFYiihKSzkXkW
         MS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=Fm2PcnMzmRZsX7hlK/xuh537ilKC+TL2v+OjYp+bCeKXQp+gBJ0uROhPUJ/e1neGsi
         yIwqWgA1JswDi16e/SC4lJGGmhD7ly07eM1VrFdSYWir52KivWJj6XQtnYmr5BhdNzxg
         oRmVAMDO6Bg2zQ8S95fsjuytL3IKP92JpHWxTiA5kFU4utc+TG1EknzR/bkKBmNTVLYE
         OOHONxLj5/0Cz7Mtd2/uCoc6BjLNlW50pGAjx0Hjlnz9PW161Ln1nZxW4wle5FndijlV
         wVfdNLjwnqczLeiZNGrMHIxD8S1ufa5vZsdMpSoUBOgxWdJuQOgUYwkDjg4Dv2q7IpJ8
         5a2A==
X-Gm-Message-State: AJIora/iag7A78YY97gXB12RRwJna2dnk0MLI+DVyWAVNq1YWiKmScjp
	xmUXcjD34HfIelQh7Zwld52DzEiprExPBZRmKTQ+hQ==
X-Google-Smtp-Source: AGRyM1uSi6CDKxBHFMyZRQ8/7cL0ndy869mFvAGFrCTYZ+gYNuQVO0PO7I97kA8jFrTxg7Fugxfs5Adf3pgP5atidCY=
X-Received: by 2002:a25:2642:0:b0:664:c89e:b059 with SMTP id
 m63-20020a252642000000b00664c89eb059mr5336121ybm.369.1655385405187; Thu, 16
 Jun 2022 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-32-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-32-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:16:34 +0200
Message-ID: <CACRpkdY4DMPwkxTGdyj31YsS=xCv7vv7Zwp5Awy3aNRgUMZcfw@mail.gmail.com>
Subject: Re: [PATCH 31/34] iio: adc: qcom-spmi-adc5: convert to device properties
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Benson Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Jonathan Cameron <jic23@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_061647_171085_3F01F682 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 10, 2022 at 10:49 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

