Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1268D2502D
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jan 2026 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2TJEkN2Q/elx9v4u+U15bZPiHFQ7wKjgtgR//tG+yw=; b=bJ6Tgl6OghFgpBuuGRuhW2TXGP
	8L2DoU4HP80S5Ml2Y0KAMUgJKhjVMFIWb5kT9M9RB4eAOX8OpJYef54SCVUBwE09rgWiFI28ZEVGS
	A9JiLocdlt1GCJJixXwvewrNMEj51PaoQQcIqaa0vHP04wKAuVm2T7DBRG+N2QjfnBRyOiEwAcJyM
	UoXBbntoOenpNRTCDL1X8O6mr0u5kai7X78ZqITy8FkR7Cq4Aj9aqckt6RbEQ+4b5B+LbnlfLvqRx
	LAjc6jV5nyk7cLUQ8yQh+LAs2Y4WkZV9/2xtaOFA91XDsu06qT8pYgYdk4j70NlZ4o0oU28BK4pbc
	rx5yyP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veylp-00000004Nat-1ltE;
	Sun, 11 Jan 2026 16:58:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veyln-00000004NaL-3rUd;
	Sun, 11 Jan 2026 16:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C289460197;
	Sun, 11 Jan 2026 16:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B94C4CEF7;
	Sun, 11 Jan 2026 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768150705;
	bh=2wbW41C2J76Sms115w/xbUlLwXKlyG+kYWdIrr/qsDc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P5PCNrhPcaJ6XgRJcU2TduO4WKsQM5ILv9aSb19pPv7i20fpDsJbn3GwB+TeRu6tk
	 HHlw8YPtqrKhjPnlMxNkxf7Q19UAEmtPdQIr0D1EiKipCQ7T9FTAlsYItaUriFDjXz
	 OXZBNgbYOY2gG4mwXfJDllKa2k7op7UVTYBmE9ZUetjvyx3ttHcq5DT6vNvpn04aNW
	 qvDiy2a+o0DG5yc6rGODRfJm4OgxGvY+98HjA2GFpwftHZ3XDOAaCD+rn7qr3dBrxn
	 ZxB0ByoBmt8MwSToF8OPf3y1B4Obiqrfi2OfJ7xD2vS+K2/LFec2tHqUpRQvORglcl
	 xoYYSIMBwFh5w==
Date: Sun, 11 Jan 2026 16:57:57 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter
 Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Kevin Tsai <ktsai@capellamicro.com>, Linus
 Walleij <linus.walleij@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Hans de
 Goede <hansg@kernel.org>, Support Opensource
 <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>,
 Iskren Chernev <me@iskren.info>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Matheus Castello
 <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Casey Connolly
 <casey.connolly@linaro.org>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Amit
 Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/2] iio: dac: ds4424: drop unused include IIO
 consumer header
Message-ID: <20260111165757.15d1a2bc@jic23-huawei>
In-Reply-To: <CAHp75VcX_z6q879gmWcb76SeFHtqMvpZ=y9PwNn0=eVFb06wAw@mail.gmail.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
	<20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
	<CAHp75VcX_z6q879gmWcb76SeFHtqMvpZ=y9PwNn0=eVFb06wAw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 9 Dec 2025 16:45:29 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Dec 9, 2025 at 10:26=E2=80=AFAM Romain Gantois
> <romain.gantois@bootlin.com> wrote:
> >
> > To prepare for the introduction of namespaced exports for the IIO consu=
mer
> > API, remove this include directive which isn't actually used by the dri=
ver. =20
>=20
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20
Picked this one up on the togreg branch of iio.git.  I'll sort out the othe=
r one
separately given I should do an immutable branch etc and that takes a little
more effort and time than I'm putting in today!

Jonathan



