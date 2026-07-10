Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857A8C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfoUlWEeuKtg5ji7K2r6ODJIVODJRvoxIKC//T1cf3I=; b=HemuSggn84mEG9ykp+W/LtSNNs
	65jvm88312uf+AJNJd/b318QdM5lLyNPiJfDv67RQrNPchH6YH4XQyFns6+Ch+t+Q3dK8N3eCzjnR
	W+o8KljFw3aKF5bPQZCGCI5l88wDx805KEtWJRHlYczjzdF27FUlumaQuaYNdpXq1dziErlzzjnlW
	5fIBWvdIWlYhCtYi7cXU35O91FMJnxCPORpvEKy1Di0ZA0F3vhjHKzscfuYVwMZPppLsXl7nUe3LT
	Vp+DZCMyPvzEonutxLIpkzrDdRXemLcmxuONd8hf12yGYOHHlQswLsQJrhtX16Hc5j82yF0KkBoxq
	V8tBrXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH1W-00000005cNa-3DDk;
	Fri, 10 Jul 2026 19:36:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH1U-00000005cN6-3QhY
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 19:36:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F26A44EEB
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 19:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DB11F00ACA
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712192;
	bh=WfoUlWEeuKtg5ji7K2r6ODJIVODJRvoxIKC//T1cf3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UJQjFMO5Ru2ypG3zOfZ4hEANXRTwjm/9ejCDdL+TooLEtRU0lvKPAW1D8BqKGZ5DN
	 zEvvZ5IrQFu2HlBI3YhN2lLdHplytIRiFJEYVKL5uQ6zKJSNEZcCZ/PvddjkctsLek
	 ih3/t2hRqRPK4J0+kCQXiVOKCSvhe5higOtJ7/3l2k1z+YjT0o1ItDEZFSxD6dtV4x
	 2Vo6d2iq/8Gns/ljNTKgJujR8e16p/tPYYz+2Ta1p+GlwWvhRPl+3uc9dAhpowXSfc
	 P/J9a1UZInP7coH4/Q7zbMykGiVkgBjPrY1eX9612k4wVRs+hGMHFD5WQf5IGIG3yC
	 MEBCiE5QSDZKg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so1311791e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 12:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQrvuispJfq2w879RLzBOgxo4VtiUmNUT4fn5UStnFHGV30zY5ai40SDDK53nDIqNI7VDIlDMT04YaNwiXSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2i4/Cq9r+ZMMe098H9NahFFjwTlkZDJr3GSL74sn/kDfdPPw
	QQ+y9akKOhD1QlAJmTAlxrVlEER4jQa64VT8Csc3Kbbdo6OqMIas8T9FhI0ePTY66qGkcMOL8vh
	XpV9dAjtlLF559ojoWvhEZJuyNysAA34=
X-Received: by 2002:a05:6512:40c4:20b0:5ae:c454:3740 with SMTP id
 2adb3069b0e04-5b0236ec2f0mr64636e87.60.1783712190489; Fri, 10 Jul 2026
 12:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:36:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
X-Gm-Features: AUfX_mxF7aXm1NUaeKv9tRmJ75XIeUyINM_M0uEJT4kZsHp0a8M3V6ZUZMQlacY
Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 8, 2026 at 1:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

