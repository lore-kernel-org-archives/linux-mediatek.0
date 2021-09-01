Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B126C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 07:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BA86109E
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 07:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2BA86109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nunH3iGRMtn6xfjG1LmVEAlNu/NpYejWEKf5QBUs4+A=; b=fxBskYqLuzl9ul
	G62TI0DXVI1Y87uhbenq/kYkhtx8ab51eIIqDfg80e4+9lZ/9ES6mBLvRiYGty96BO/B/MNarHnFR
	yeIXs/1WCSf6wNIjtIjKSxKkg4gErqEcRoxIDqxbZqKaIR6oJlc4Xiw6dz5CSBKW7kReFkr69wKfo
	OFw4Lh2UXEfM+RLNoqqEtz2TTvOs1V93X3DWXj5ID/TBij62pcqDaL5xqjp21omugh/XXcn0fytyN
	vGoKMWM+HWryl4CiIm7ZTdDskgu82qavLSHiBDIHwRNBJuiFxCSbZNNOhI6mfuIwpaYAjd5DG8XYA
	Z7oFwNeswtCY7zV1H3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKSr-004IyG-47; Wed, 01 Sep 2021 07:15:17 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKSd-004IwZ-8c; Wed, 01 Sep 2021 07:15:04 +0000
Received: by mail-vk1-f175.google.com with SMTP id g34so629760vkd.11;
 Wed, 01 Sep 2021 00:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QadCFZQ2SQPPYc3LZSgseGA9mPxC2ggiigDkQzPcZ7E=;
 b=WKBJx1a9kNuvahID2LoOaLN1VzOpPlisfXzvfMshAe6nNqk+kzPC8IbhZY/9yb3z5q
 CSAW6qpYkuTLyVA+7FsKInNSrXDCq+WHbZ2ApRW6412i/QgvtTZJ6a81yVjHq6OUsX3S
 SYvQiVCecN9Dde4PDiUp6/UZ+risZTMiXVTobOYQLrJW/4r+1E0E4Ehn7xAufFyYoTMb
 o4NMd9EsOMQqUhnyv2c8IoSfWLjKKAaaC2B+M4zlgh0rcHt18oBmX1zoDaFmsKEW1AFN
 fk5MX8ymTCAQ66HH8YlsW0hlrQBevjQq5a1XVkGeuEFJHoL/OKU1sQtvIs0iOKWUkxQU
 3+2A==
X-Gm-Message-State: AOAM531cWEWkI1bLZcgEX5d26yZ+mJeFrVe0zZf3bIeh9sjkhMDhNP8o
 GkMZ+JDgDPmtJUoCoBphPMoLR4Ts7V7SxS+PWHQ=
X-Google-Smtp-Source: ABdhPJwsjmzlnZudgyUqICpu9dUfkd2zTmDDo4gWcc2mlI2J0tB7JsSrjrkZZ5a9NdFjWFziJSe1eOA2qgj7wUlPqbA=
X-Received: by 2002:a1f:738f:: with SMTP id o137mr20861558vkc.2.1630480501855; 
 Wed, 01 Sep 2021 00:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
 <535478691c3a9ed31b508f59dc897be57c4213c0.camel@mediatek.com>
In-Reply-To: <535478691c3a9ed31b508f59dc897be57c4213c0.camel@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Sep 2021 09:14:50 +0200
Message-ID: <CAMuHMdUd+j7MYv3LXOH1C45UjEqVVjwm1mmyzpZyv+cuR3cDaw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 should depend on
 ARCH_MEDIATEK
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_001503_350330_FBFEB128 
X-CRM114-Status: GOOD (  33.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Trevor,

On Wed, Sep 1, 2021 at 5:48 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
> On Tue, 2021-08-31 at 15:18 +0200, Geert Uytterhoeven wrote:
> > The Mediatek MT8195 sound hardware is only present on Mediatek MT8195
> > SoCs.  Hence add a dependency on ARCH_MEDIATEK, to prevent asking the
> > user about this driver when configuring a kernel without Mediatek SoC
> > support.
> >
> > Fixes: 6746cc858259985a ("ASoC: mediatek: mt8195: add platform
> > driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  sound/soc/mediatek/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> > index cf567a89f421b4c0..c8c815f599da90bf 100644
> > --- a/sound/soc/mediatek/Kconfig
> > +++ b/sound/soc/mediatek/Kconfig
> > @@ -187,6 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
> >
> >  config SND_SOC_MT8195
> >       tristate "ASoC support for Mediatek MT8195 chip"
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> >       select SND_SOC_MEDIATEK
> >       help
> >         This adds ASoC platform driver support for Mediatek MT8195
> > chip
>
> Hi Geert,
>
> Thanks for your patch first.
> I really missed the dependency declaration.
> But we only test "depends on ARCH_MEDIATEK" internally, maybe removing
> "COMPILE_TEST" like other MTK series is better for the maintenance in
> the future.

If the driver compiles with CONFIG_ARCH_MEDIATEK=n, it is better
to enable compile-testing, as that may catch issues.\
I didn't change the existing MTK symbols, only new symbols.
(adding missing dependencies to existing symbols is in my (huge) backlog ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
