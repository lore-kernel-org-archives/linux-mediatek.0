Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA1BEE49AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjYZtuuDSprtGhXi35X3nTK9OBfVVh4gcwf3JptlP0g=; b=35ROSi/TeIUsTan4UDXmT2z2Mm
	EVvAs6nKyIpDUCZEkocMWPT3Kl0WuvfyoU4eC76rXdYH72e2f/UYgE1bOMCvpvZHrEgaeQYhwDM5d
	ts7rw0ywyi8ChisvCbhVWKoHbM/RK2KFsex6B5IZT9jiQ91k3GRsn3mT2nOZtjVoTg2173V/+2Pxl
	G3UFViHzj2t/HXGWQXABngi/SzbboihoIYG03V4QCF1E/be6JDjtAe4BY+92gaYj226RkE5+0azSR
	LuyWBDv0DMroHSVvIgEpX4hVsP11/jMShQ5Yovg7zgGaUYWqs8h0jht14vzZcjRoY+vWazLOXfrCq
	CxhXEgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYZzE-00Gsi1-1Z;
	Tue, 22 Aug 2023 22:36:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYZz9-00GshW-1m;
	Tue, 22 Aug 2023 22:36:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B53D762C3A;
	Tue, 22 Aug 2023 22:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE3BC433C8;
	Tue, 22 Aug 2023 22:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743786;
	bh=NjYZtuuDSprtGhXi35X3nTK9OBfVVh4gcwf3JptlP0g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CAh/v16TAyXS6VO2ALNXtF2z0iRgcCCKE7nkjOLQellZv0WJnN86cgMH5yfZM03mJ
	 Jx7K+pGTv+F3J4t4qdynaJ4n+9KzyQL/Kl4q//xGrAaann0vW+KcGY9xzp2weGiAEm
	 AM2toYc5L90AHzt2FPD4Mu0ypPk8pnXSL+CD0gBQDaMwYb/M9sBM4CHI+zjnuQj2ri
	 39GiQ6h30YJ4VP+pOIvNDAKT+qCvo3e7cRjfCnGmssz08Ht+w9j4URgHcKpYBGxip3
	 FWaX/yBtm5Mb9ACd7PY7MPuGJvuu+s2iDMLyik9tB/h7AKE//+xsiAOJyPubVbG9Rm
	 fAD8TLwq5Lm3A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso77815601fa.1;
        Tue, 22 Aug 2023 15:36:26 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/3TzkQbCM0Sf2YgX5j5CmY3PwVIGNo4H/sWGedgMBOHQ9QX8y
	wMxYkCA8AKWw/aubAe7aYnUhUwOdrQ5C4nkeig==
X-Google-Smtp-Source: AGHT+IE9Tj4RwFZn6igP8wgaaZ8RvFIFIaigPEIiJVjQdchFweTdVVeIAYobrH0bchiVGw+zmZLMPKDd//GHA7HUmZ0=
X-Received: by 2002:a2e:b0d0:0:b0:2bc:c3ad:f41b with SMTP id
 g16-20020a2eb0d0000000b002bcc3adf41bmr4736964ljl.2.1692743763933; Tue, 22 Aug
 2023 15:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
 <5696647.DvuYhMxLoT@jernej-laptop> <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:35:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKL7x0JCW476dU=Q5dQOCjLkBq4xcZSJAKzBiLK94nsHA@mail.gmail.com>
Message-ID: <CAL_JsqKL7x0JCW476dU=Q5dQOCjLkBq4xcZSJAKzBiLK94nsHA@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Has him <shiraz.linux.kernel@gmail.com>, 
	Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
	Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_153627_698919_E9F7B715 
X-CRM114-Status: GOOD (  16.71  )
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

On Tue, Aug 22, 2023 at 5:30=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Aug 6, 2023 at 6:42=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Applied to sunxi tree, thanks!
>
> Did you really? Doesn't look like this is in linux-next.

Sorry, it's just the genpd part that isn't since that moved.

Rob

