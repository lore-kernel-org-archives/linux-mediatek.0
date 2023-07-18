Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4662FC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIIcx1SGAw9uYYN1avMxPsLqak5l24gEpGFmCR8wXQs=; b=X8qaVFLIeLouzy/x2H1WkZ7BwU
	sTdnaE2j971giHs4bQwCvpXqBwPunoE65HrBOf2toPEsDwDwkzOgLGj9yE4zpsYBakd2Cj0YPB93I
	0sz7fh/nA4U9OfwkhZwYq5zFoqKEAuvok712aY3u010IsQ3RltmKqzrCoT5EwXgIKXg/lPVaU9u7Z
	BRH8OARlAAhpU+7+YEJKhixAXqEVZzDBZ7OVq0kjOQsURfPEfjMdGPFt3/yZXRRhsOEV+PWYPEuda
	fzUBKs0yxRr+Ur/F3S9XXNPUeWuV+Wa28s925sX+uKC78ASs+e+5cKRogMlSV0/Dgv/kURlWj4XCE
	EXkEkHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzL6-00580U-0I;
	Wed, 19 Jul 2023 05:03:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzKy-0057x8-2S;
	Wed, 19 Jul 2023 05:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dIIcx1SGAw9uYYN1avMxPsLqak5l24gEpGFmCR8wXQs=; b=gwfhlAfxXe2lkpul5TLd/IQp5C
	gkdwYhcyw7idjIaaOKU+o2ezUPAvw2NbhhAmKNt6oy91A7utmErBYMUgqo7XNpPNLmb3PZVSFEGHZ
	jwCQkUZG2K3Lwk16LhEJHtcakktdauszi6BsK6EKVu+Z0Bx5FB2Hs+HFJnnHF7jZseCzZt0RD1ZKy
	x5vEPHJucyS5ocUrYdwQpEccwAC3YuwUE2lIYnFiKahgEVs0+up8tVRNzZByhIFgojPNDtdFriIWq
	3wSW1L7e2i1/RVP7+3D8Mhsx0Zw78ix+tyt380iCs6JwACqmsUtEmNI5cSQP0JImUa0iew/3o2O6H
	z6ANgMfw==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlB2-00BbIW-06;
	Tue, 18 Jul 2023 13:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689688538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIIcx1SGAw9uYYN1avMxPsLqak5l24gEpGFmCR8wXQs=;
	b=MeGV0ommnDXY0bZLzz2aUDd3eORngKqqpm/czs4W5fC56SGEpuHkxL+e3H80XeL4olpT4w
	1ApOAoo+UVumdCRRcw4QCgk1bWX8vFzXQhxjA1hdPhx0ybjBisPaXhX4AezSFzKDJcy2CL
	4umq/NBxiWzrvybq7Sv34wmBua/EBa4=
Message-ID: <d674ed791e4e7a71b671d1a66a03796cd6867fde.camel@crapouillou.net>
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
Date: Tue, 18 Jul 2023 15:55:35 +0200
In-Reply-To: <CAHp75VdPNCvhVSeKESbd7VNVPa8GVXVnw04jaE4HMUjK_b8+dA@mail.gmail.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
	 <c47c26ba7ea5bcbdcbe1d001b6cc527cee6c7d03.camel@crapouillou.net>
	 <CAHp75Vcjq9=Q2_fsGJ9oCw=WYR3p3ot_cNLiDJV93psNcXXHLw@mail.gmail.com>
	 <8c66f79025ddd8388eeb9bdb3f0e789fe9f362d9.camel@crapouillou.net>
	 <CAHp75VdPNCvhVSeKESbd7VNVPa8GVXVnw04jaE4HMUjK_b8+dA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145544_257589_9C4DE802 
X-CRM114-Status: GOOD (  37.52  )
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

Hi Andy,

Le mardi 18 juillet 2023 =C3=A0 15:57 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> On Mon, Jul 17, 2023 at 10:56=E2=80=AFPM Paul Cercueil <paul@crapouillou.=
net>
> wrote:
> > Le lundi 17 juillet 2023 =C3=A0 22:33 +0300, Andy Shevchenko a =C3=A9cr=
it :
> > > On Mon, Jul 17, 2023 at 10:02=E2=80=AFPM Paul Cercueil
> > > <paul@crapouillou.net>
> > > wrote:
> > > > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=
=A9crit
> > > > :
>=20
> ...
>=20
> > > > So the correct way to update this driver would be to have a
> > > > conditionally-exported dev_pm_ops structure:
> > > >=20
> > > > EXPORT_GPL_DEV_PM_OPS(intel_pinctrl_pm_ops) =3D {
> > > > =C2=A0=C2=A0=C2=A0 NOIRQ_SYSTEM_SLEEP_PM_OPS(intel_pinctrl_suspend_=
noirq,
> > > > intel_pinctrl_resume_noirq),
> > > > };
> > >=20
> > > This looks ugly. I didn't know that EXPORT*PM_OPS designed that
> > > way,
> > > but it seems pm.h in such case needs EXPORT for NOIRQ case as
> > > well.
> >=20
> > It's designed so that when CONFIG_PM is disabled, the dev_pm_ops is
> > garbage-collected along with all its callbacks.
> >=20
> > I know it looks ugly, but we already have 4 variants (regular,
> > namespace, GPL, namespace + GPL), if we start to add macros for
> > specific use-cases then it will become bloated really quick.
>=20
> Maybe macros can be replaced / changed to make it scale?

If you have any ideas, then yes absolutely.

>=20
> > And the "bloat" I'm trying to avoid here is the extreme expansion
> > of
> > the API which makes it hard for people not familiar to the code to
> > understand what should be used and how.
>=20
> So far, based on the rest of the messages in the thread the
> EXPORT*PM_OPS() have the following issues:
> 1) do not scale (for variants with different scope we need new set of
> macros);
> 2) do not cover cases with pm_sleep_ptr();
> 3) export symbols in case when it's not needed.
>=20
> Am I right?

I think that's right yes.

>=20
> > > > Then your two callbacks can be "static" and without #ifdef
> > > > guards.
> > > >=20
> > > > The resulting "intel_pinctrl_pm_ops" can be marked as "extern"
> > > > in
> > > > the
> > > > pinctrl-intel.h without any guards, as long as it is only
> > > > referenced
> > > > with the pm_ptr() macro.
> > >=20
> > > I'm not sure I got this. Currently drivers do not have any
> > > guards.
> > > Moreover, the correct one for noirq is pm_sleep_ptr(), isn't it?
> >=20
> > The EXPORT_*_DEV_PM_OPS() macros do export the "dev_pm_ops"
> > conditionally depending on CONFIG_PM. We could add variants that
> > export
> > it conditionally depending on CONFIG_PM_SLEEP, but we're back at
> > the
> > problem of adding bloat.
>=20
> Exactly.
>=20
> > You could use pm_sleep_ptr() indeed, with the existing macros, with
> > the
> > drawback that in the case where CONFIG_PM && !CONFIG_PM_SLEEP, the
> > dev_pm_ops + callbacks are compiled in but never referenced.
>=20
> And exactly.
>=20
> I don't think they are ready to use (in the current form). But let's
> see what we may do better here...

They were OK when Jonathan and myself were updating the IIO drivers -
but now they definitely show their limitations.

Cheers,
-Paul

