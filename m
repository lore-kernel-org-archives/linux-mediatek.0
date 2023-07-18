Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D20EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/2563u5cOH3TFQnC6K2RUUtmAlaSoZJQm9HbnJPi6A=; b=eDAQ9ECFJeIGbNT3DZSHznpLG8
	qIO/CTzmWjcFWCIdLgCE+Q45Qqw3pQCO7zFncr2ujx4q/frV1E+T6tnwEVrOt15yYuqliyYKEN9dA
	o5CGmKQRfsDC3LNJSBR6ZKAkKenRkx+5d8e1pwNzjWyOvQrOiaZqCF4T6/mZzo8q4GV++si8RKK0w
	GjRkzxWD+2gJuABgTLzzXpYDSHQ9GDc4y1xblbba8CkzVkwBTJxolftHt/8Eq9kbG5vGrfy4MnCDI
	CU6ZZfLRziaGKUSxZ2lrnTW32fTVNQRe2ReQAxVOnJoD27r3F3wAG4NRAmWQfZnNkBVf7MHf/ifPA
	hLZ0P6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0EA-005V8W-29;
	Wed, 19 Jul 2023 05:59:58 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0E7-005V5j-1k;
	Wed, 19 Jul 2023 05:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b/2563u5cOH3TFQnC6K2RUUtmAlaSoZJQm9HbnJPi6A=; b=iFODQGXcvewopxzVVrm67Aaf4w
	BunZWqtTC4ErP+qBJMWa1kAZ+4ZHLNgJ2/qasInBK6NmiSIB7yEn1dBAzjw3BFK3C+BhV0MeaOjyE
	CT5Q9C/fo03fRj5MtoBfJbDE0KI1nMtOwHilaXPqM/l28BWChzO24jaLIxC57pYJX5w4qwCOOUHRA
	aB3jd6tHWf6IpJC87jNi2PTKQuCb4TpxWkXdTLxrc+7smU0RI4TsLsjfn7sJSWtgAfk57lnwMXmkZ
	WktCFbxPtgI/OdoGpEWer8EEYo/RFKYC2Zd9iC3aJYwNYg5oblzsTIagMtPvBkMNm81ibD8wc5E+s
	1AYkbgQw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkBi-00BWgC-36;
	Tue, 18 Jul 2023 12:52:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992acf67388so701964066b.1;
        Tue, 18 Jul 2023 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684671; x=1692276671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/2563u5cOH3TFQnC6K2RUUtmAlaSoZJQm9HbnJPi6A=;
        b=iKKsUwLsrqwRmioG2l6VIuQCDdWIS+x7OvqTLH5gDfCTMpT+PYaav8SRQuyzIFdRK7
         xzPpn4SashCJNbr5fW/ErJIsUpoaGXJaa+RJDZXBKScdLc02p9LndavEuCl4RQRnTX9h
         3ZTYVLgnXzWVBt8H0toSOGPpXH28ikivdDHOj1voaDmtk6XEmYRXA+wPRH6qnqnMH4/M
         MPPAAXs/tmbovBrq6LkwpfZneVLY35A9HrthHuwr/Qwc9fyuZI/3MgISQ6meI/VrFnCP
         tCX7kFl6R7ED8YzzGfuqQfjnxbmJBTqYBWAXcYkNxgO+oztxChqdSdyATVA6ufkBPUId
         3lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684671; x=1692276671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/2563u5cOH3TFQnC6K2RUUtmAlaSoZJQm9HbnJPi6A=;
        b=bMRS1pPriHkdiFpObL45NvePMdeJM/4MVD386sFeX3x27QvTj1zTNPlrJNnM5KnnO8
         Q0YJ5TEure1uoF8bSUZ/rCGRuKX1E8BPMs5Yr9b++Tzun2P31RXvDhfJIK+LpPyiHnyi
         9LWqzmeUdmDqBSuanqxAvNwKSZ79YTRyU9q+1n+Al3tLUgebbGkgt9ydxfTZ7VbtQFLI
         IJypIZvi/0Hd22ylhy0E7FPnY6Bp+R5+9FKw1izQpFqykimdDtXELRbckfVMgnvS8L4x
         o+awKLWx9YHsENWj5ZOYsIuYxtY/5RDpFAIhz4Nd3xLqqWPxVhKHW8BQDXiZ2ksBC8mA
         k2nA==
X-Gm-Message-State: ABy/qLb4pn+iVX1zcnCmjQI3FCtDC8Ec9Z8OMVroT4zKK9cNNSKxCFQA
	kFPzTK0KEJKcNaAY9y2KQzrHYnA3OhBSWEogYIk=
X-Google-Smtp-Source: APBJJlEx07+dHAg1uNrR6U3SipVk2wgw6hkfeWbxoh6BDo4Hww7sGADxDz9h6Wu1gtnWGybAPUizheA0hRtDoVEKRpQ=
X-Received: by 2002:a17:906:749c:b0:994:5544:3aea with SMTP id
 e28-20020a170906749c00b0099455443aeamr10270194ejl.51.1689684671561; Tue, 18
 Jul 2023 05:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
 <ZLZDL27zzDpY4q8E@orome> <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
 <ZLZ6amp5HKUbm5w3@orome> <8f32cb8377808a073b043e0adf3ccf5ae5a84c92.camel@crapouillou.net>
In-Reply-To: <8f32cb8377808a073b043e0adf3ccf5ae5a84c92.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jul 2023 15:50:35 +0300
Message-ID: <CAHp75Vc7W1EcHSoCaRCbJEcWb4naOez6d=W+kJVtMSifkPAozQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_135223_216070_3CA6B4F3 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, Jul 18, 2023 at 2:55=E2=80=AFPM Paul Cercueil <paul@crapouillou.net=
> wrote:
> Le mardi 18 juillet 2023 =C3=A0 13:41 +0200, Thierry Reding a =C3=A9crit =
:
> > On Tue, Jul 18, 2023 at 10:42:47AM +0200, Paul Cercueil wrote:

...

> > Looking at the definition of EXPORT_GPL_DEV_PM_OPS(), it will cause
> > an
> > EXPORT_SYMBOL_GPL() to be added. So there very well is a change. And
> > it's a completely bogus change because no module is ever going to use
> > that symbol. If we were to ever support building the pinctrl driver
> > as
> > a module, then this would perhaps make sense, but we don't.
>
> In this particular case the EXPORT_SYMBOL_GPL() isn't really important,
> the rest of EXPORT_GPL_DEV_PM_OPS() is.
>
> I don't think having a symbol exported it is a big deal, TBH, if you
> use the namespaced version. If you really don't want that, we need a
> version of EXPORT_GPL_DEV_PM_OPS() that doesn't export the symbol.

Ah, I agree with Thierry and it is another point why I do not like
those EXPORT*PM_OPS() macros.
Polluting an exported space (even namespaced) is a big deal, so,
definitely no from my side.

--=20
With Best Regards,
Andy Shevchenko

