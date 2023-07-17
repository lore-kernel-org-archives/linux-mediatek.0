Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3499EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEo4GP83lIE+lgHyH0OgrfVUmqIaUGHnS8773OANhBk=; b=Skylpxkefn3tqY1Ear0DRZhurt
	viQZVB4y7Lk1L4TX9jGGE7wieI9xSCmofqaKIjTNz/j/lnOUUp9PWX5wFkAztKb/qd1StDgY1Gi2A
	7RSg+d2D4ibWOq5fuJx/Cvx/QwAolBx38QwfZI2BAinLnD4rBel7k8DNj3gPQRsRWvPLgUKdvDggr
	/7218UqnNH88TDirfY0c6SO0g5Z3uCv34mcXQwqJ1pGQWDgfSqOj+GRbARb5eWSj9HazmcG64K6Uj
	i2H3u6JBggB3iuQvefFNaMbu3uHZ0vO87VAfzfKOAe7bw+l0x6Z6ncz/Wxwt7LY1FvDPmGtTN/cP7
	1dV0jwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0D7-005UT7-1n;
	Wed, 19 Jul 2023 05:58:53 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0D1-005UOV-1X;
	Wed, 19 Jul 2023 05:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fEo4GP83lIE+lgHyH0OgrfVUmqIaUGHnS8773OANhBk=; b=Dx6nfa+XSfCvk83zwJI25R3Ewy
	QZOfMzfDEhAWKU79O6z35pnUisag78vUUCrukG4rzMEH1nxwHo1Glrt7Bz+Vlpda4NyQhPA/Tqhk3
	n8dw1+JTZnLw/30KXJBNx4lM9FcqwcIrK5LVpqs3TSMk5El0Tmd30j82FIGWAyFhWWHmEk5aEOgsA
	G1LkMyAQOTY7WlJZY9OfIAifltPOvy4b8UyhmS+nDmzDP3msTskZREnv3fBfE9EbW6rQ2LHFUttke
	hlP/wKHq7HgJZpBycGrNlvmEkEdOG3d5Isk4YB3/6ByxFNIhF2FH5eeSVml4mrK+BHs3xPcws3jN5
	H2JBIXqA==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLUKi-009HGT-2X;
	Mon, 17 Jul 2023 19:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689623760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fEo4GP83lIE+lgHyH0OgrfVUmqIaUGHnS8773OANhBk=;
	b=l0iyJWMpe6xSAJOeof6UhbOiLwEzGtfdQOenOHe7x1WEX87oLs/sqcILqWR/6F6vYNbyxW
	0jHoBbsL1LxSF1a8umousHQ+ObYLfz2FWrXHnM3il1OBsIaAXM+DyopoqtpVwrV8RDMkRz
	nihLU0iVibpyCgWAkHsF50Li29isdlU=
Message-ID: <8c66f79025ddd8388eeb9bdb3f0e789fe9f362d9.camel@crapouillou.net>
Subject: Re: [PATCH v2 04/10] pinctrl: intel: Switch to use
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
Date: Mon, 17 Jul 2023 21:55:57 +0200
In-Reply-To: <CAHp75Vcjq9=Q2_fsGJ9oCw=WYR3p3ot_cNLiDJV93psNcXXHLw@mail.gmail.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
	 <c47c26ba7ea5bcbdcbe1d001b6cc527cee6c7d03.camel@crapouillou.net>
	 <CAHp75Vcjq9=Q2_fsGJ9oCw=WYR3p3ot_cNLiDJV93psNcXXHLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_205638_240423_28837AEA 
X-CRM114-Status: GOOD (  22.38  )
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

Le lundi 17 juillet 2023 =C3=A0 22:33 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> On Mon, Jul 17, 2023 at 10:02=E2=80=AFPM Paul Cercueil <paul@crapouillou.=
net>
> wrote:
> > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9cr=
it :
>=20
> ...
>=20
> > Unrelated change.
>=20
> OK.
>=20
> ...
>=20
> > So the correct way to update this driver would be to have a
> > conditionally-exported dev_pm_ops structure:
> >=20
> > EXPORT_GPL_DEV_PM_OPS(intel_pinctrl_pm_ops) =3D {
> > =C2=A0=C2=A0=C2=A0 NOIRQ_SYSTEM_SLEEP_PM_OPS(intel_pinctrl_suspend_noir=
q,
> > intel_pinctrl_resume_noirq),
> > };
>=20
> This looks ugly. I didn't know that EXPORT*PM_OPS designed that way,
> but it seems pm.h in such case needs EXPORT for NOIRQ case as well.

It's designed so that when CONFIG_PM is disabled, the dev_pm_ops is
garbage-collected along with all its callbacks.

I know it looks ugly, but we already have 4 variants (regular,
namespace, GPL, namespace + GPL), if we start to add macros for
specific use-cases then it will become bloated really quick.

And the "bloat" I'm trying to avoid here is the extreme expansion of
the API which makes it hard for people not familiar to the code to
understand what should be used and how.

> > Then your two callbacks can be "static" and without #ifdef guards.
> >=20
> > The resulting "intel_pinctrl_pm_ops" can be marked as "extern" in
> > the
> > pinctrl-intel.h without any guards, as long as it is only
> > referenced
> > with the pm_ptr() macro.
>=20
> I'm not sure I got this. Currently drivers do not have any guards.
> Moreover, the correct one for noirq is pm_sleep_ptr(), isn't it?
>=20

The EXPORT_*_DEV_PM_OPS() macros do export the "dev_pm_ops"
conditionally depending on CONFIG_PM. We could add variants that export
it conditionally depending on CONFIG_PM_SLEEP, but we're back at the
problem of adding bloat.

You could use pm_sleep_ptr() indeed, with the existing macros, with the
drawback that in the case where CONFIG_PM && !CONFIG_PM_SLEEP, the
dev_pm_ops + callbacks are compiled in but never referenced.

Cheers,
-Paul

