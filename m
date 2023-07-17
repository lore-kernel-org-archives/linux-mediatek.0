Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30900EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLbtiM3Mg2ozARpSTeCbg9ZzYZDLdqZM0J85vmoD7SM=; b=A5o8ECDYk8BPgt1wtQA6b+hYn7
	u4HzH6qWwaA/DDmS26lClNZKkqZzQCDo/k0GeCTUF3aLitbEI9oRy+a3Yb+8CmxMMG7oOmGURgoV6
	f3DjqFo58rraMHMvQFhwBaNFMlnUnzD4r+rbOtUbidUrrt5Khrr4XQEumVwPiSoYlEmJ6yeCQNjhw
	D2r41HqOxdB3JkF/Y8/cwqnpwb2Zknt59EZbY/s3uyNbU6fOkVmuNLHOJ03lv8BRCEnl9n5i3+fQR
	E6Nqq6mBBmHBgDkXB5ByFWaNiuQmd9j4rrSk0gHRI0RNHhI/ACVwXwMaAHQ6aziWlhLd5U4eX5t0y
	jfu+d+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLznc-005KWI-2e;
	Wed, 19 Jul 2023 05:32:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzna-005KUT-1I;
	Wed, 19 Jul 2023 05:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YLbtiM3Mg2ozARpSTeCbg9ZzYZDLdqZM0J85vmoD7SM=; b=lSBO/Sy2EPB6B6sbQX3BCKOON2
	9AtbEniUf6ZQEMXrdipyqBfmzE8gGFtETBstMUpEzawaG9t1wOE/0JrSeyjDXLZYNdHbIv4bOMHjS
	JSSYNAJngoSWlEpCx9/a6qDN/lF+QOawPiDB4HQ6HTjq06qTe/3tX1UiTrGi+TWNSQPz9GFzaD04t
	SDxRC6UrDRDhOkQBfqFJyl2/Q3jswXk5DNjfzHKz8QsI33iLt+RqsN6wqQM4qH5w+B7OZe5lj6sXZ
	Qq2ZpQKEidtC0kGA9JNqLwliaFDC3I90IAaa5ShZCSolcoBBvgCLeWD124DP2EVDbDKm1b2k3jNzL
	QFg66ktg==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLULc-009HOl-1v;
	Mon, 17 Jul 2023 19:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689623821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLbtiM3Mg2ozARpSTeCbg9ZzYZDLdqZM0J85vmoD7SM=;
	b=wmzyKuhBLBCQrGjJqR3U+7snGQXMWADygmSKRYXKPpLXpiIILjUaJXc/cQwu3akJM/sgMi
	G5fwAxKthEkfhTtNEYo0NUzyvKSLXQUjEHg6jPYQU5bjP9hMkUDEgzSgJcSMgcCe1h1Gsv
	B9WmHBgwcHLSP6I2XCpK/+VG0owAMf8=
Message-ID: <7dc59ec83ceb6b7c101039570652fb9c8122d15a.camel@crapouillou.net>
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
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
Date: Mon, 17 Jul 2023 21:56:59 +0200
In-Reply-To: <CAHp75VfSd6giH0Hvt4m_cai5+qhhBfMa6R0fDhzpN4U7WxYzSw@mail.gmail.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
	 <f48a35d596694839665bc5883260cbae3ae01d9c.camel@crapouillou.net>
	 <CAHp75VfSd6giH0Hvt4m_cai5+qhhBfMa6R0fDhzpN4U7WxYzSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_205733_158592_A3CD3296 
X-CRM114-Status: GOOD (  12.83  )
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

Le lundi 17 juillet 2023 =C3=A0 22:36 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> On Mon, Jul 17, 2023 at 10:07=E2=80=AFPM Paul Cercueil <paul@crapouillou.=
net>
> wrote:
> > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9cr=
it :
>=20
> ...
>=20
> > > +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops,
> > > mtk_paris_suspend,
> > > mtk_paris_resume);
> >=20
> > It's a bit more work, but I think you should use
> > EXPORT_GPL_DEV_PM_OPS
> > (or even better, EXPORT_NS_GPL_DEV_PM_OPS) so that the dev_pm_ops
> > is
> > conditionally exported. All callers would have to be updated to use
> > pm_ptr().
>=20
> Why pm_ptr()? What did I miss?
> The rest is OK.
>=20

Or pm_sleep_ptr(). As I said in my answer to the other patch,
EXPORT_*_DEV_PM_OPS() currently only exports on CONFIG_PM, so it
doesn't really matter which one you use.

Cheers,
-Paul

