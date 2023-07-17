Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE8EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz4KDI7jQOgLySCmtxM7bAVvDERRvoZFslEeJrBr46U=; b=QnvhpcYfeslhE3YdcU/NEaZk21
	Ev0oyIQ861DFn6eIi0ZYMKuNiWMayIG7nWub4/ipb4Z9G0ndANnklPytH2GzrSSQM4HmUBgdtAw6T
	mx4SOfJbAdSXIpmO1K++fos8253vudbbpbB0rjGu7cLGEMgW3YvKXMiJop/S1he8CHO90AVgdQ9lZ
	xNgUciahRQ20vohyJHZfeYgUCnMZB0R/W+O2sRq5Dlr4n6P0PsJcAD0A+6hjqsPhiwsmHvGQ+Vxrp
	W54Z9U+jj4nJiyI00k97Fu3PH4Jx4oqsXqugf0/66YnvJKYKboKDM24JjUTfHcvmmFOrMwRLOkTel
	xVZhPEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM06x-005RYu-04;
	Wed, 19 Jul 2023 05:52:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM06u-005RW6-1H;
	Wed, 19 Jul 2023 05:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cz4KDI7jQOgLySCmtxM7bAVvDERRvoZFslEeJrBr46U=; b=LP7YFv6gd94HThgEAmS+NdwFEw
	B43i9nQBv76k4AFGvbVAFF4I8Ci6pGE5jBxsACJ8jarIdbsDnz19xXOtVoLpMd6T8hel40CQDaoOR
	wzxeqL3YrQ5TjL+cizvqh7FBMLCIq8au1jSvFGoZRma52sxGGzOxczU/TxwUOmXkk1qB5IdNgHGEj
	Q12+zYUng6XfBri8Ak8hPscy9gqwPyCAK5o7bbRh+/D6rXu9WzLElpiEsRyk4gW0pPoMTOtjJSxCg
	17k8LClQXetdJcDFJ3FNRzVJeBT4shSnqwLhKqDhopO0Q04jDOkl9PUhbNZYVtoH7i8YH9sNidLh2
	UtF8//Fg==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTuK-009EuG-0R;
	Mon, 17 Jul 2023 19:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689622129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cz4KDI7jQOgLySCmtxM7bAVvDERRvoZFslEeJrBr46U=;
	b=sCx4iMgLzSLx3zOM1pOieQ9sC68QbskB0MC3rPnMo1elWfZ1FJsj24vyXNFc8foPawL3El
	rDVHj9lfLqqEYWgwpVJ8XTCZTKS7W0EvIs8ceg6v1aQnlUswXOVmS9zRLcFb4yvZckdJoM
	6v8Jm4jG4nog3qpVDQ5eJ3FfI8rnEO4=
Message-ID: <c9e57723425f77f3720301b55db460f9be1783f6.camel@crapouillou.net>
Subject: Re: [PATCH v2 03/10] pinctrl: cherryview: Switch to use
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
Date: Mon, 17 Jul 2023 21:28:46 +0200
In-Reply-To: <CAHp75Vc6yYz94dZmf2QJ3jV1Yqqw-7_47sm5hSSU2M9B2O_BQg@mail.gmail.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-4-andriy.shevchenko@linux.intel.com>
	 <73161288a07eb34a458061151d9d9a5c10d79c1b.camel@crapouillou.net>
	 <CAHp75Vc6yYz94dZmf2QJ3jV1Yqqw-7_47sm5hSSU2M9B2O_BQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_202921_845463_B3C5302A 
X-CRM114-Status: UNSURE (   9.36  )
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

Le lundi 17 juillet 2023 =C3=A0 22:27 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> On Mon, Jul 17, 2023 at 10:22=E2=80=AFPM Paul Cercueil <paul@crapouillou.=
net>
> wrote:
> > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9cr=
it :
>=20
> ...
>=20
> > > +static DEFINE_NOIRQ_DEV_PM_OPS(chv_pinctrl_pm_ops,
> > > chv_pinctrl_suspend_noirq, chv_pinctrl_resume_noirq);
> >=20
> > That's over 100 characters, please break this line.
>=20
> If it's a problem, I prefer to shorten the names of the callbacks.
> Would it work for you?
>=20

That works.

-Paul

