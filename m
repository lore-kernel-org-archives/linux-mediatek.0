Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28174EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGJYHhuupeLvD7iUldP9gnEGkr9rwuBLn1dMa+Ew/24=; b=zzn5Mn5m2pTE0Bja+hg5vgjNUc
	Kkqmdu/UVdUWUVru7CIESqV6va4A2jo9GhQFQUXADblBF9+ZEYprM7njfH+w5GwlaE1DKmgU9RFkT
	6fuWX8FTWN2aEPTXZKxOFMJ0NCJ2ozWdCZBEFWTf9MS8YYVRSQi3Ev2+Ugic5e1E8OGmw7HsSGsXf
	SuagiDWuIh+9En7yJqODX35/n4endPAWJQmac+86IXMv/ozJ5DipvKn1g6BRo5/fJiQsDNqVlN7R7
	ZSb0LstxYKu9Oniv6fDuSuMXa5BHwLn654QecLEekLTs9lQAX+oBqUg7el1MiPKT9Uvp3CSV7NTUD
	6RtYVFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0vI-005ryn-0K;
	Wed, 19 Jul 2023 06:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0vG-005ry4-2O;
	Wed, 19 Jul 2023 06:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OGJYHhuupeLvD7iUldP9gnEGkr9rwuBLn1dMa+Ew/24=; b=SWPiCrpAvLlFAHJCHnvsHckJkO
	BinyXllBXernA6C7gsYrX6K76LrYbxHPrsUi72Y2I+IQqD62nwEUCgKtFf/9zjjdiuzC11xjrB2GV
	jwWrSB1THHG1/GAqGSuJLFcvM9JJJDgYgpIRb773tvvBCzycI3pSG0gWwAAtS34qU+UHU1joyiURA
	CqroJeaCUuLN3C1AI5F3HLk5kbY0ZUl+aowvcELc9bYx16gOzjJlKVXkpwFq6OK0mXmnaVO7c9RbK
	0SqoSDVOHKsSFBW75xw+mteXszwF+cjHHfu8adti9Zxf5xMYhBX+hlAcF73RtBkFMoSvlDmW7EXxK
	kD9N26yg==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLk7y-00BWc0-0n;
	Tue, 18 Jul 2023 12:48:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-993a37b79e2so764508566b.1;
        Tue, 18 Jul 2023 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684442; x=1692276442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGJYHhuupeLvD7iUldP9gnEGkr9rwuBLn1dMa+Ew/24=;
        b=VtcOZtNqJWG8/eO0W1GhqAZLKZOFgVOETWyaoKVn0z/TT2Ts9Tb1e3h933FhL10+ZZ
         DDMS6W2h5xtqTSg04fncdtozKVtCNJiTtgxuAt6iQyY+Q+ONFfWYWY+jl0Oq2wUZarCP
         +uQgony4GCEpdt+cIKVGX9obZkVXwGs/mreeaKjD84xFqP20y0/fQtDYIkTWOAtBm7vg
         MRXVINgDtCgfMyNrLjeAuMKMabGfhbtUlVSYqktym5jf2OPLNKxI7LZlKLg+T68up0YF
         uaHTSmgsC2n4yeJtoUIrSZ3r+nnzsZgA3jyrDF9zagZ4CKqBac+iVifM4xfdPylCGWQ0
         bD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684442; x=1692276442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGJYHhuupeLvD7iUldP9gnEGkr9rwuBLn1dMa+Ew/24=;
        b=eRvAhr7Qn9trV9kdVeNlszSqS7w0J7QAzdnMZjJV0hHSq3qvbkkz4xBCpiR98i4kW9
         BteKmM4c7gla4dkjQ8N48W2wAcPElbeopPRgatba8UrdYeiPeZ3bqq+1iX/7BMlo9jrE
         GvGsuFfaGa4eGpQ6SaSH36Uyc4Jw4rDGakyNTsRrXdwGHCFSPd1oLUbYi7+JksuGA8eT
         PDViqv/hRFpBcDlG9nXC3ZdI5yG0nk55q1MzCNdfQfwOXXUDgvek/XuANMv1051SZPU5
         cnBev3p1BvoPI6Uc0OOYiLFXX94S6qmbvg6zYmWMjlIL28l3gNwBnsrNUWyBjNE1loCG
         I7Eg==
X-Gm-Message-State: ABy/qLbJIVgxCWdquR4/dX42XmGjsE8jYVuZScdjlVPQ5A32PebI6J/S
	Y6z6wcN3UmEE3hUqh5F8uBI9wkobFgWb4jjZyfI=
X-Google-Smtp-Source: APBJJlFWv/5l9OJf010RuvZ9Y5zmoeMZFAeyTTu73opyEbrIbXnZfVJSDMIhH8II3cHyjZ0u2hBQXv0rFIDUJ2ed/J8=
X-Received: by 2002:a17:906:4987:b0:997:e836:6c4 with SMTP id
 p7-20020a170906498700b00997e83606c4mr559158eju.9.1689684441861; Tue, 18 Jul
 2023 05:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-8-andriy.shevchenko@linux.intel.com> <64741cb9-3bcb-ba50-6e09-f30847bda669@collabora.com>
In-Reply-To: <64741cb9-3bcb-ba50-6e09-f30847bda669@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jul 2023 15:46:45 +0300
Message-ID: <CAHp75VcEptnG7SvKNdnjW8xmS9z5VVUJvpyD1ygmm-6dCjgWNA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_134830_512887_B5A2658D 
X-CRM114-Status: GOOD (  10.10  )
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

On Tue, Jul 18, 2023 at 12:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 17/07/23 19:28, Andy Shevchenko ha scritto:

...

> > -static int mtk_paris_pinctrl_suspend(struct device *device)
> > +static int mtk_paris_suspend(struct device *device)

> > -static int mtk_paris_pinctrl_resume(struct device *device)
> > +static int mtk_paris_resume(struct device *device)
>
> What's the reason why you changed the suspend/resume function names?
> I don't really mind, but please at least mention that in the commit descr=
iption.

To put it on a single line. I will amend the commit message, thank you
for review!

...

> > +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops, mtk_paris_suspend, m=
tk_paris_resume);

...here ^^^

--=20
With Best Regards,
Andy Shevchenko

