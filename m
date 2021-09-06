Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C5AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 08:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41B660041
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 08:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C41B660041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kF6OaCBC9zH4lwhOehaGa1uFqaAufZ2VSBsvP+1d1fM=; b=1G+/nOl6nd0uvp
	wbQbNm/Aw1yX53iYOmk0MQJqbudS6hpUnsNrj848uVzSyDbI32/SNDVyHMB5EBrlWJxXSAbLzHxvW
	H0UIMrb7ZoKbQVltKokqheF6Oec53CQbuHO9zoMM8ifsrZMneBuJbKvr3H3Mm5Tl4LZSVlOVP7fWk
	/XMLG2KARfuc6dtrQIfFUNoRdqMDfwOrzbAH98dtOiURG22WX97jQwlho+6cC+XR7VQa+pVZ9I6li
	FvqpdPKDOWXE02NxJAJCZ+R6V2HwmzoXSarlpmnigihjq2k7Ri+2HAK+fXqQwODVRpjpyB9gZKriG
	HHXt7ZI7y2ie4slCvnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN9sF-000EKZ-Mx; Mon, 06 Sep 2021 08:21:03 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN9sC-000EJ7-0B
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 08:21:01 +0000
Received: by mail-lj1-x22d.google.com with SMTP id l18so9982708lji.12
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pmqwpCx8ZMQCEi7EjNBS3MHRQOj6SBBM2cu19SNWsGA=;
 b=PgxlW0+h5rASHGuALwkbIG5RRFW3/jgyS4BO8F516o+hGNXSVTYeNccCctmO1da4kJ
 frUBl+29CB+CWSi86Uk5iz7me22r6l9T2/HxGq1Skl/L+ZY7JZ/QeJrhUVQVfmeNwKdu
 7kqtZW/gBKJb539Z6hTPcSrua5/ZoYOcRuv+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmqwpCx8ZMQCEi7EjNBS3MHRQOj6SBBM2cu19SNWsGA=;
 b=W6kVhVZebJSNTDg/z+EudG7QaRMFfHivQT5xX6r4ZtPBacO5m+c6JXROdKhS4CLtrE
 QYxr9KaA3YSP37ScPvIIaa/wAeqtwoltf6QlX95JEER8gCzXMtFGBDJL1gKyp1JIgJtG
 jvryUERGRJGIEPPPJ2H60ovSTU7UsFeI3UPenUFgbm2KdG4KdFRsfd5OdWSK1V2y+Z+1
 jfsDZJKU24xysTfI7EtzXwg5fGvEVqfpQLnuXQJqvEOXqBRzhh+u4bgWdf5ahgJNwUf8
 GkVy6gDpDPg2LDkrtY1xSr/JojFuCDk2Yeu2nhRmGhKP0xLjAr769S4OezqlQd/cZXHF
 yhdA==
X-Gm-Message-State: AOAM530oZzLaxJX/R5h2IGKhojgkDEdisYWW1qi7pjV8EeYxhQHHYkvy
 Mcd3h43DQPnA9REOZv04Yf4pv62hitwhaGomzN1eyQ==
X-Google-Smtp-Source: ABdhPJwfhmdmbsJ7om87xlbz5He7kbU62NhVooKXWMG1vYyZ75Yh7Ze1Si4M2njIhE3vtjp0jSKm+d3IF/0k5nF26J0=
X-Received: by 2002:a2e:4951:: with SMTP id b17mr10106239ljd.414.1630916456951; 
 Mon, 06 Sep 2021 01:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
 <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03>
 <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
 <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
In-Reply-To: <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Sep 2021 16:20:45 +0800
Message-ID: <CAGXv+5H6Hj9tGkpMHs_uBTcztDBZ_YJ2PUV7J8+abR+5BEsV2g@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_012100_108769_6BFB1C1A 
X-CRM114-Status: GOOD (  41.38  )
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

On Sat, Sep 4, 2021 at 4:40 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Thu, 2021-09-02 at 11:35 +0800, Chen-Yu Tsai wrote:
> > On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <zhiyong.tao@mediatek.com
> > > wrote:
> > >
> > > On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > > > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <
> > > > zhiyong.tao@mediatek.com> wrote:
> > > > >
> > > > > This patch adds rsel define for mt8195.
> > > > >
> > > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > > ---
> > > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-
> > > > > bindings/pinctrl/mt65xx.h
> > > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > > @@ -16,6 +16,15 @@
> > > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > >
> > > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > > +#define MTK_PULL_SET_RSEL_111  207
> > > >
> > > > Could you keep the spacing between constants tighter, or have no
> > > > spacing
> > > > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so
> > > > on. This
> > > > would reduce the chance of new macro values colliding with actual
> > > > resistor
> > > > values set in the datasheets, plus a contiguous space would be
> > > > easy to
> > > > rule as macros.
> > > >
> > > > ChenYu
> > >
> > > Hi chenyu,
> > > By the current solution, it won't be mixed used by
> > > MTK_PULL_SET_RSEL_XXX
> > > and real  resistor value.
> > > If user use MTK_PULL_SET_RSEL_XXX, They don't care the define which
> > > means how much resistor value.
> >
> > What I meant was that by keeping the value space tight, we avoid the
> > situation where in some new chip, one of the RSEL resistors happens
> > to
> > be 200 or 300 ohms. 100 is already taken, so there's nothing we can
> > do if new designs actually do have 100 ohm settings.
> >
> > > We think that we don't contiguous macro space for different
> > > register.
> > > It may increase code complexity to make having
> > > MTK_PULL_SET_RSEL_000
> > > defined as 104.
> >
> > Can you elaborate? It is a simple range check and offset handling.
> > Are
> > you concerned that a new design would have R2R1R0 and you would like
> > the macros to be contiguous?
> >
> > BTW I don't quite get why decimal base values (100, 200, etc.) were
> > chosen. One would think that binary bases are easier to handle in
> > code.
> >
> >
> > ChenYu
> >
>
> Yes,we concerned that a new design would have R2R1R0 and we would like
> the macros to be contiguous in the feature. we reserve it.

I see. That makes sense. Do you expect to see R3 or even R4 in the future?
Or put another way, do you expect to see resistor values of 150 or 200
supported?

Maybe we could reserve 200 and start from 201 for the RSEL macros?

Some planning needs to be done here to avoid value clashes.

> We think that decimal and binary base values are the same for the
> feature.

With decimal numbers you end up wasting a bit more space, since the
hardware is always using binary values. I just found it odd, that's
all.

ChenYu

> > > Thanks.
> > >
> > > >
> > > > >  #define MTK_DRIVE_2mA  2
> > > > >  #define MTK_DRIVE_4mA  4
> > > > >  #define MTK_DRIVE_6mA  6
> > > > > --
> > > > > 2.18.0
> > > > > _______________________________________________
> > > > > Linux-mediatek mailing list
> > > > > Linux-mediatek@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
