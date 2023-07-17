Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA533EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJG8CKg5RsX9ZJHlhcpEkkjn9nE0Nq+cmtnZoKDZkDU=; b=ONhaIPNUl3jrbz4DhTnG9SE4zK
	kZL8ki0zrPTW9jsn6xia4Hl7lhotG3UEqtLMrt1c7AchE5CIHi2nRHPGIhbX58UY5xjmq8b+pU2NU
	aXeF65wZ7liP0e5QG3onuGqBuaaltI6vxk0d8cDaaixckptDBFGdt/0XCR0lRjLAvFvx3jOH2YjsE
	TSXNT2vC1McDff7SbL9KZjH1pONfUpvR2HgpIbd6O21BDr3pUZn3qk/SBh0m/jfvGfhagQjxSBsIk
	kaGBKYPIg58JaN3HWqz4xsxmd+/6AzMVn1s1D0vx3i0zMAVJZhHTuDKRFYUvUQwpaLCT25cP4xUmh
	QTXfrdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Jm-006GL2-2z;
	Wed, 19 Jul 2023 08:13:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Jk-006GJh-2y;
	Wed, 19 Jul 2023 08:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bJG8CKg5RsX9ZJHlhcpEkkjn9nE0Nq+cmtnZoKDZkDU=; b=AGXsNXyutL/+e4Yt467Ulx/+2R
	6U4fICQXxqFWzenR+7IyT4H9GroZWxeQ3DJAZ4H2wC2P9AUH/nCZfRuCDLz7QuTvEG7u7SZcX9N2R
	OydwkOjPaPkHPBUr4oyIFka0HjUvOx0uQ2PQRvd1zjQh5OJEA6rsKgMPgzsPnLgVUaG31i/9OPgmE
	Zm9rKbKBJPLpjhK/ARusVVDFHY8RBpnjfwGBUSfdDwqFdXkAGQky9jzjFxXP2n9qHq7SqTbuuBE9j
	k7sjzET+6V7nyDAPf0Br2g7NY8GtU7BXwIoVw5XLnRjm+jtBQn0sxsDALVtTfsK3/yk4Ef/bUWAU1
	Bnpfw8Cw==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLUVw-009Iha-0K;
	Mon, 17 Jul 2023 20:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689623855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bJG8CKg5RsX9ZJHlhcpEkkjn9nE0Nq+cmtnZoKDZkDU=;
	b=FBGREnIdCWQho1a6phhQNfoJXlzN7h2e4HUCIz3VoIJ5kf25agL+cnSxm0BC3JI07TuUyu
	kTCb0WDz6ha1JrdvqbU5OV6cx0Qesx9W78p8Jmyu+tQNwZESkqF327E+C2zTAlmbbI6nvX
	TwzMQtIgrr/nWUa1lGlu9+FhjJykyQ4=
Message-ID: <5e24b9afd2677454b21a93de872582788a327935.camel@crapouillou.net>
Subject: Re: [PATCH v2 09/10] pinctrl: renesas: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Balsam CHIHI <bchihi@baylibre.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
  Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-pm@vger.kernel.org, Andy Shevchenko
 <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 17 Jul 2023 21:57:32 +0200
In-Reply-To: <CAHp75VetZ-+AFGzEQzx42cmTrHxyr7pGBy8kSxHUM9cJzp2o=A@mail.gmail.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-10-andriy.shevchenko@linux.intel.com>
	 <03592cf5d6854dd5e534e0416de946fd38e4380c.camel@crapouillou.net>
	 <CAHp75VetZ-+AFGzEQzx42cmTrHxyr7pGBy8kSxHUM9cJzp2o=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_210812_564630_291FD21B 
X-CRM114-Status: GOOD (  12.22  )
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

Le lundi 17 juillet 2023 =C3=A0 22:38 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> On Mon, Jul 17, 2023 at 10:12=E2=80=AFPM Paul Cercueil <paul@crapouillou.=
net>
> wrote:
> > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9cr=
it :
>=20
> ...
>=20
> > I think you could do:
> >=20
> > .pm =3D IF_PTR(IS_ENABLED(CONFIG_ARM_PSCI_FW),
> > pm_sleep_ptr(&sh_pfc_pm)),
> >=20
> > Then you wouldn't need the #if defined(CONFIG_ARM_PSCI_FW) guard
> > either
> > (as long as the code still compiles fine when that config option is
> > disabled), and you wouldn't need those dummy callbacks.
>=20
> Thanks for the hint, but it's ugly looking code.
> If we go this direction, we would need local arm_psci_fw_ptr() macro
> or so.
>=20

Sure, a small macro works too.

-Paul

