Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A3C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxhlaudfrVWECFV1Jg1vpXKt16R6kpyS29S9patDTO4=; b=SU/FS9qoaNrBExhxZCOjMVSPVI
	npvAoVjmCQwBJtkHoFL2X6iq0fu/7D1WkjIo2YFLQL7a7Z2b3KC0LUvX5nEIdL63V5V8PiEwjKW0P
	RQvsQYRzYpHySK+MmAnlOwfi96wwhNjyDFVERSa71mPDaC1+cwoDVoNihO/sBE9fFNEctiznU/1vO
	QdWaWOUDy4Yf8crGO7og+nPF8QWg+VNulnGJ0gsTP1IPBGIqhFj8zOtbdhdgQFw6YcnuxvLND2uKT
	GI7eOMc7Wn8QVecucG2govs16DvsIqhwX8/xHmbc2Q4XYh5TPnpc/OEbHe2V8Eao/jLRKsgevdOZC
	LP9j5jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzyA-005Ob4-1h;
	Wed, 19 Jul 2023 05:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzy8-005OYe-1e;
	Wed, 19 Jul 2023 05:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wxhlaudfrVWECFV1Jg1vpXKt16R6kpyS29S9patDTO4=; b=Jdmo+l2cpsJA95TKekGx78Unuu
	sv1gY0GXLMXLQP9FxXLKSMQmj+A1kg321GjNvfzG30VmY6v7aEGy0rs6HmOb9Y7LZCzxmf6bg/soL
	evPlD97fe+09L4r0ZN8AFrUid2FbK9LueEl7iOMwgXEvV3MIB/t0+Q1C0W0ch8UlLXVv5flp7zjV9
	2sU9CNwSO8o0oSmleukVpq2fswtE40+MVw1TDXo69iH0hzuNjt6FCZvpPx9njqXCWQ22ulmrNTylf
	p0fVBUk0Au9e+t8FnKoljcfruVAa9z5MR30hkZLP0YWXOIpMEgoBXl6nSqsvaV6eZERXAu4sJbUMa
	1HbbZZqA==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLk95-00BWcr-31;
	Tue, 18 Jul 2023 12:49:42 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e526e0fe4so8592871a12.3;
        Tue, 18 Jul 2023 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684517; x=1692276517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxhlaudfrVWECFV1Jg1vpXKt16R6kpyS29S9patDTO4=;
        b=fVSpB/MPdEPpD5mWKQe0IChxg2s3WZfPkNpBCHhqpZjj648drB+NvNhNdLf85e3P+t
         0s63bmVRtfumS6L0d/MRmrwu86sA2uLxAKLyz9QRrK5/s49KBSJWYnmLYhpCXbqBCZvk
         RrP4iHQjDESXl09EiBVtu0DemVK/sav+ATktJDcFoPczdqpBsmXHqkwZGwlxhnFDTXSH
         bF/cPlbGrlKDRBayoydjMjGSuheaUtq9JXeABTLysP33Gm3Lvjc5E47bBTCAZ4AF9xgV
         IlAjyPE2P37RsWLGpAqO92h+UeQcyhh4GVGl0aAMp7GeO05y+zo1ltv4mE6txeUEiIhI
         CXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684517; x=1692276517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxhlaudfrVWECFV1Jg1vpXKt16R6kpyS29S9patDTO4=;
        b=i7zIdxVyBiH5z85TVqC04VW0x1bwdhg3ZNzxLRmbEaF07hVnBAKNxLwd+p54FQ8HDd
         4csxM1lUKotH4YkEwXHsTQD8/pOKq2aksDtx/j18C0QCL6tzuFcoSjHu/cdi5wjrAj1M
         z7OfnHhxYznv9P+g+fXXkVm9CPEKo8K2ecH04EWUx5hTA73sOhKDrpqL3B0D+At72s28
         wpDGkufsLXSlD0uEQYqGwXlc/EnVPEWccCOsndavkcsck5tTW26G+e9TmwgQbB2UQjsU
         /W4NvnpkxZ07ncAnxLgQeEdnnQvoPCWqhkw7PnBUx2+4SQ1eItn0FFBrZYTkB/010uVv
         RQvw==
X-Gm-Message-State: ABy/qLa43BU85qpU8slJE0m2qb68rB+cLxuWPuMGumwzbC5ntYWeO5tt
	CB6y6pTfMUD9G3NK8Bs8b+qmZagsRVNOfwQOl5w=
X-Google-Smtp-Source: APBJJlFHZoGo5cMXz5ZPoaXb8GQZF2yrH4fr5l8DeDddHglvOBiZmH4dtEo+coI2p2aE1zI2oNE0z2/uarXLB4bzRvc=
X-Received: by 2002:a17:907:e92:b0:975:63f4:4b with SMTP id
 ho18-20020a1709070e9200b0097563f4004bmr2250208ejc.36.1689684516758; Tue, 18
 Jul 2023 05:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
 <f48a35d596694839665bc5883260cbae3ae01d9c.camel@crapouillou.net>
 <CAHp75VfSd6giH0Hvt4m_cai5+qhhBfMa6R0fDhzpN4U7WxYzSw@mail.gmail.com> <7dc59ec83ceb6b7c101039570652fb9c8122d15a.camel@crapouillou.net>
In-Reply-To: <7dc59ec83ceb6b7c101039570652fb9c8122d15a.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jul 2023 15:48:00 +0300
Message-ID: <CAHp75VdehQnE+NvD1Pj_VZrj-gdHZow+kqyud_T8=3Z-YB-C7g@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Paul Cercueil <paul@crapouillou.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20230718_134941_050574_2EB11A04 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Jul 17, 2023 at 10:57=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 22:36 +0300, Andy Shevchenko a =C3=A9crit=
 :
> > On Mon, Jul 17, 2023 at 10:07=E2=80=AFPM Paul Cercueil <paul@crapouillo=
u.net>
> > wrote:
> > > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9=
crit :

...

> > > > +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops,
> > > > mtk_paris_suspend,
> > > > mtk_paris_resume);
> > >
> > > It's a bit more work, but I think you should use
> > > EXPORT_GPL_DEV_PM_OPS
> > > (or even better, EXPORT_NS_GPL_DEV_PM_OPS) so that the dev_pm_ops
> > > is
> > > conditionally exported. All callers would have to be updated to use
> > > pm_ptr().
> >
> > Why pm_ptr()? What did I miss?
> > The rest is OK.
>
> Or pm_sleep_ptr(). As I said in my answer to the other patch,
> EXPORT_*_DEV_PM_OPS() currently only exports on CONFIG_PM, so it
> doesn't really matter which one you use.

Yes, I need to think about it. I don't like the inconsistency the
EXPORT*PM_OPS() brings in this case.

--=20
With Best Regards,
Andy Shevchenko

