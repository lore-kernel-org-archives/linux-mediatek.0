Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCFBC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 10:55:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C3420739
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 10:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C3420739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TJiHa6s7piGuZQVqqvT6YYxnU/NS0NneGPjvIERIvqk=; b=aTVs4yu6JkwUeJM0E/69K3PrS
	zTN5c3klnot2AreUk9N+XrKN0Bifwo9V4HfAuLr89oUqyyt1n+Wmpn1DUFbQzIz5pHhYmROIeXliK
	wOaMToyrzEdXvYl9vdVuB4Q7y3mLQDkFhBJlUm7cXXqYD2vUBZIXfHn96ynbcBP95bbkqqyQX7p/6
	P0vzHqObG7vJxnx8vAVhcDAWbkszSdvQwriRyBb0p8AvlrxMPVe8iLLnymvppAvBZMgqT8fhGmWvq
	R9wK1xgUpOiRHDm5un/RmrQKOqQF90Nk/vjfbCKEnm0Vh+Nm3itYpblG1f30BcOQUVo3Tb+rXYA49
	kSFzvjj5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2u6D-0000eW-5A; Fri, 22 Jan 2021 10:55:29 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2u5a-0000Bg-Ji
 for linux-mediatek@lists.infradead.org; Fri, 22 Jan 2021 10:54:52 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id e15so2772789vsa.0
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Jan 2021 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpsYHAdwN5j3WacuQ0BWujY+3R9jFAKUS6OekuCJX4Y=;
 b=bbpIfQMF/99HAQ+oXqoJwjlIxn2tGpU5i9hsS6DpESl9Ej/V84ojv/WsJxTEx0Kix+
 IcYSVVKZpFTMakz13XT2dDuqUuDUzeWjMBntRRW8ohc7r0S+fZIGJBK6BQGoNpvcIObh
 XwolAolG+dKYvsoPsYx+K4+pfJb2qWgiRTbPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpsYHAdwN5j3WacuQ0BWujY+3R9jFAKUS6OekuCJX4Y=;
 b=L/TeWP+pwlksTL512ht9idMFcBic7ZJaOcZ7wToMXyJMYr49dVL9q8o0d3wrsjyGfS
 fuAOJ8FQZwHQby9lPFYyvDwKoBmZqajFRZDwSSEDhrYgQeH0pVZhWEBxV8ZsFCup4K8D
 ASps3w4d800bXcFGds5Ci1dW8el3rTXUROGmkEhBjpA5gQyT+vTkkNBuqPaz1i6UT0wA
 6bicXQY6s7BymOHGHuM0PZZfwiq+59ZljoPikhB0zTN9RTbIJkNSvOFR2ivb0VuxYzlT
 p2jAjpX/6uAT/Xpc5jAwMMxk7Jo/Wwi5+ubWPeFPiveK7nbAN4gi43bYFpusB06p+93F
 kjjA==
X-Gm-Message-State: AOAM533KDP8MtjDzxfCFLy0QOjwdxPKvomEBcAfrg4fSU10C4XppdzBc
 juKn3ZcvZMnMuGQvMrkrmhVbRCGE+G98bYWz9wlXxg==
X-Google-Smtp-Source: ABdhPJxzxop195QKfUnrwXsxhnkgdkUVQCNadMDQOXSkAk02i/gmTtKh3+KUKkTdhYo+UZeN0AZp0UXR3ZEP4/awvLA=
X-Received: by 2002:a67:73c2:: with SMTP id o185mr376539vsc.16.1611312886546; 
 Fri, 22 Jan 2021 02:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20210121075149.1310-1-hailong.fan@mediatek.com>
 <CANMq1KBqKUofLaM+OEaTq6PSeYomNSLvn65c+Wyi1cKsLDNboQ@mail.gmail.com>
 <1611230975.2493.17.camel@mhfsdcap03>
 <CANMq1KCXrEGrNrOwivrchXyawzKySVzQoxA1goYC-eh-auNFCA@mail.gmail.com>
 <1611283438.2493.23.camel@mhfsdcap03>
In-Reply-To: <1611283438.2493.23.camel@mhfsdcap03>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 22 Jan 2021 18:54:35 +0800
Message-ID: <CANMq1KDa_aO_wtQAZofruN7r7BuvRTNGKkmfgTf2oM7ab9425g@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: mediatek: Fix trigger type setting follow
 for unexpected interrupt
To: mtk15103 <hailong.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_055450_709128_D4908CB1 
X-CRM114-Status: GOOD (  32.11  )
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
Cc: youlin.pei@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Chen-Tsung Hsieh <chentsung@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, zhengnan.chen@mediatek.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 gtk_pangao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 22, 2021 at 10:44 AM mtk15103 <hailong.fan@mediatek.com> wrote:
>
> On Thu, 2021-01-21 at 20:13 +0800, Nicolas Boichat wrote:
> > On Thu, Jan 21, 2021 at 8:09 PM mtk15103 <hailong.fan@mediatek.com> wrote:
> > >
> > > On Thu, 2021-01-21 at 16:55 +0800, Nicolas Boichat wrote:
> > > > On Thu, Jan 21, 2021 at 3:52 PM Hailong Fan <hailong.fan@mediatek.com> wrote:
> > > > >
> > > > > When flipping the polarity will be generated interrupt under certain
> > > > > circumstances, but GPIO external signal has not changed.
> > > > > Then, mask the interrupt before polarity setting, and clear the
> > > > > unexpected interrupt after trigger type setting completed.
> > > > >
> > > > > Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> > > > > ---
> > > > > Resend since some server reject.
> > > > > ---
> > > > >  drivers/pinctrl/mediatek/mtk-eint.c | 13 +++++++++++--
> > > > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> > > > > index 22736f60c16c..3acda6bb401e 100644
> > > > > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > > > > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > > > > @@ -157,6 +157,7 @@ static void mtk_eint_ack(struct irq_data *d)
> > > > >  static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
> > > > >  {
> > > > >         struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
> > > > > +       unsigned int unmask;
> > > >
> > > > bool?
> > > Yes,thanks.
> > > >
> > > > >         u32 mask = BIT(d->hwirq & 0x1f);
> > > > >         void __iomem *reg;
> > > > >
> > > > > @@ -173,6 +174,13 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
> > > > >         else
> > > > >                 eint->dual_edge[d->hwirq] = 0;
> > > > >
> > > > > +       if (!mtk_eint_get_mask(eint, d->hwirq)) {
> > > > > +               mtk_eint_mask(d);
> > > > > +               unmask = 1;
> > > > > +       } else {
> > > > > +               unmask = 0;
> > > > > +       }
> > > > > +
> > > > >         if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
> > > > >                 reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_clr);
> > > > >                 writel(mask, reg);
> > > > > @@ -189,8 +197,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
> > > > >                 writel(mask, reg);
> > > > >         }
> > > > >
> > > > > -       if (eint->dual_edge[d->hwirq])
> > > > > -               mtk_eint_flip_edge(eint, d->hwirq);
> > > >
> > > > Why are you dropping this? Aren't we at risk to miss the first edge
> > > > after mtk_eint_set_type is called?
> > > mtk_eint_unmask() will do it.
> > > If unmask != 1, user need to call mtk_eint_unmask() to enable the
> > > interrupt before use it, thanks.
> >
> > Makes sense, I just have one more worry:
> > https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek/mtk-eint.c#L122
> >
> > mtk_eint_unmask unmasks the interrupt _before_ the edge is flipped,
> > could this cause a spurious interrupt? On any unmask operation -- not
> > just on mtk_eint_set_type (so this is technically another problem,
> > that should be fixed as a separate patch)
>
> This situation will not happen.
>
> Spurious interrupt occur condition: edge irq polarity value is same with
> input signal.
> e.g.
> Default value: GPIO input is high, trigger type is falling_edge.
> User want modify trigger type is rising_edge under some certain
> circumstances, it will generate spurious interrupt but external signal
> maintain high.
> So we need ack interrupt after trigger_type setting is completed.
>
> mtk_eint_flip_edge is for dual_edge, the polarity setting based on
> current gpio input signal:
> if (input == high)
>         polarity = low; /* falling_edge */
> else
>         polarity = high; /* rising_edge */
> Then it's not cause a spurious interrupt.

Okay let me try to make sure I follow:

- Say interrupt is currently IRQ_TYPE_EDGE_FALLING (and GPIO is high and stable)
- mtk_eint_set_type(d, IRQ_TYPE_EDGE_BOTH)
- mtk_eint_mask(d)
- (no mask changed, just eint->dual_edge)
- mtk_eint_ack(d) (not actually needed in this example)
- mtk_eint_unmask(d)
  - HW reg unmask (can't generate an interrupt as anything that would
have happened is acked already -- even with different previous/new
types than my example)
  - flip_edge (will swap polarity as needed but can't generate
interrupt as it won't set the polarity to be the same as the current
GPIO state)

Okay, I think I'm convinced.

Please fix the nits and then you can add

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> > > > > +       mtk_eint_ack(d);
> > > > > +       if (unmask == 1)
> > > >
> > > > Just `if (unmask)`
> > > Yes,thanks.
> > > > > +               mtk_eint_unmask(d);
> > > > >
> > > > >         return 0;
> > > > >  }
> > > > > --
> > > > > 2.18.0
> > >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
