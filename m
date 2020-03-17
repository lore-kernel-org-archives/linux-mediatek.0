Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3A6C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 19:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E281320714
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 19:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/0mHB3W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErekzIio"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E281320714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjMP6b36/b57hdkb0Rwt67gL0+i8RjK42sp7nY95Z9U=; b=A/0mHB3WWf5Lt7
	A1JNiMgC0YWhQpXcrge38ZbenduBGzqK01/+OMvFb9ELj1NMT4yBG5uf/bKFUi2XlTAa66xPnnXIq
	DMbyGQ/R5vx+AtGILey17OC3SCW3QfQiGjJyixalaYgGwBTF4+DK7i9+tAqLP031bZCkrIrVr8K+b
	37PvEpp40c3iwuIZFiD+/zrOqQwfsj+jCxwJCekgLhmMmxy3qPo76TsHkpQuYxA/ecEn6TT4CXIbE
	QijpR3HARBIvaLTEri6rpFXKzZ8ZuJqgndcx/pB9685kBe5Tv+1tq7RRzsl/6ZxCkbWEhjvc00Fbe
	8B5HZVJWgFbyZvZicp8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEILo-0005Oz-DG; Tue, 17 Mar 2020 19:58:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEILl-0005OB-DJ
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 19:58:06 +0000
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 090E72073E
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2020 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584475084;
 bh=4ktS7vkXbvWPqEkGLuhwSvTcermavdaiwrVzlyvDMTU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ErekzIionC/I7zFmUNqh7MxcljAySREdp8+XSrVaIt2HsegDI9CUw2Q9Ay+w0gLyW
 6unmLPpaIgjirEHSIzlZ3SpkFSF/a26BjhaOk7/fNMrx1IW8zjF2uatw753SUDT8EN
 Q6W+2DCAe6qxa2Sggc+xveh3nGbdqzVHUNkvlC9g=
Received: by mail-il1-f178.google.com with SMTP id v6so10200489ilq.2
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2020 12:58:04 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1iNevrULaUGNr8RxHcnYK0zIxiYplx4UOSk+bMzXKKu4/2GDwq
 9Rp7g+FEAPe28jpuJddvkA3WnHHAwYUhYf6516g=
X-Google-Smtp-Source: ADFU+vskZaQmZn/HUDvAI0R1yO/yTvGjvDEnMeLhFaqNGK4UcwDiZkQLGNE8fGZ58Cs1uMLUqtdXJCc5dza1ryNDO9g=
X-Received: by 2002:a92:4b0d:: with SMTP id m13mr514342ilg.43.1584475083400;
 Tue, 17 Mar 2020 12:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
 <1583825986-8189-2-git-send-email-light.hsieh@mediatek.com>
 <CAGp9LzpJTYXp9R6SKjauemPYMd9wfoacD_czQBVgWtJoMcPFKg@mail.gmail.com>
 <1584437292.12211.9.camel@mtkswgap22>
In-Reply-To: <1584437292.12211.9.camel@mtkswgap22>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 17 Mar 2020 12:57:52 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoQoWyrMSYQaqH=OL9iCeakBvosZO5T3c757x3pBwwMJw@mail.gmail.com>
Message-ID: <CAGp9LzoQoWyrMSYQaqH=OL9iCeakBvosZO5T3c757x3pBwwMJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: make MediaTek pinctrl v2 driver ready for
 buidling loadable module
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_125805_495343_45E2A3E4 
X-CRM114-Status: GOOD (  24.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Light

On Tue, Mar 17, 2020 at 2:28 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> On Sun, 2020-03-15 at 14:35 -0700, Sean Wang wrote:
> > Hi, Light
> >
> > On Tue, Mar 10, 2020 at 12:39 AM <light.hsieh@mediatek.com> wrote:
> > >
> > > From: Light Hsieh <light.hsieh@mediatek.com>
> > >
> >
> > Correct the prefix of the subject with "pinctrl: mediatek".
> >
> > > In the future we want to be able to build the MediaTek pinctrl driver,
> > > based on paris, as kernel module. This patch allows pinctrl-paris.c, the
> > > external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
> > > be loadable as module.
> > >
> > > Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > ---
> > >  drivers/pinctrl/mediatek/Kconfig                 | 13 +++++++++++--
> > >  drivers/pinctrl/mediatek/Makefile                |  5 +++--
> > >  drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
> > >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
> > >  drivers/pinctrl/mediatek/pinctrl-paris.c         |  6 ++++++
> > >  drivers/pinctrl/pinconf-generic.c                |  1 +
> >
> > Separate the patches for the device driver and for the core respectively.
>
> Since the patch for pinconf-generic.c had been done in  b88d145191ad
> ("pinctrl: Export some needed symbols at module load time").
> I will remove patch for pinconf-generic.c.
>
> > >  6 files changed, 54 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> > > index 701f9af..4cd1109 100644
> > > --- a/drivers/pinctrl/mediatek/Kconfig
> > > +++ b/drivers/pinctrl/mediatek/Kconfig
> > > @@ -3,10 +3,12 @@ menu "MediaTek pinctrl drivers"
> > >         depends on ARCH_MEDIATEK || COMPILE_TEST
> > >
> > >  config EINT_MTK
> > > -       bool "MediaTek External Interrupt Support"
> > > +       tristate "MediaTek External Interrupt Support"
> > >         depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
> > >         select GPIOLIB
> > >         select IRQ_DOMAIN
> > > +       default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
> > > +       default PINCTRL_MTK_PARIS
> > >
> > >  config PINCTRL_MTK
> > >         bool
> > > @@ -17,23 +19,30 @@ config PINCTRL_MTK
> > >         select EINT_MTK
> > >         select OF_GPIO
> > >
> > > +config PINCTRL_MTK_V2
> > > +       tristate
> > > +       depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS
> >
> > PINCTRL_MTK_V2 doesn't have to depend on PINCTRL_MTK_MOORE or
> > PINCTRL_MTK_PARIS to work and it can build on it own so that lets us
> > remove the dependency.
> >
> The usage of PINCTRL_MTK had been describe in cover letter:
>
> 1.4 PINCTRL_MTK_V2: add this tristate config which depends on
>         PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in
>         defconfig file.
>       * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
>         PINCTRL_MTK_MOORE is y.
>       * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
>         PINCTRL_MTK_MOORE are n.
>       * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
>         PINCTRL_MTK_MOORE is n.
>
>
> Without PINCTRL_MTK_V2, we cannot specify whether
> pinctrl-mtk-common-v2.c is built-in or loadable kernel module.
>

What I was actually meaning is

config PINCTRL_MTK_V2
          tristate

with that should work for your case.

> > > +
> > >  config PINCTRL_MTK_MOORE
> > >         bool
> > >         depends on OF
> > >         select GENERIC_PINCONF
> > >         select GENERIC_PINCTRL_GROUPS
> > >         select GENERIC_PINMUX_FUNCTIONS
> > > +       select EINT_MTK
> >
> > The original design of PINCTRL_MTK_MOORE doesn't have to work with
> > EINT_MTK coupled tightly so that let us remove the reverse dependency.
> >
>
> Actually, PINCTRL_MTK_MOORE use EINT_MTK in the following call flow:
> mtk_moore_pinctrl_probe() -> mtk_build_eint() -> mtk_eint_do_init().
> mtk_eint_do_init() is defined in mtk-eint.c.

CONFIG_EINT_MTK is actually an option to Moore pinctrl since Moore
pinctrl has already carefully considered the condition with
CONFIG_EINT_MTK=n in mtk_build_eint.

>
> > >         select GPIOLIB
> > >         select OF_GPIO
> > > +       select PINCTRL_MTK_V2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
