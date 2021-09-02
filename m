Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A023C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 03:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D5060243
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 03:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6D5060243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+x3LcGK4yXsL1xrLormQjkO6BuEYU1vyxTFFgGYLOY=; b=iJhYxlZJU5ahkf
	qHwmeTK9TpXGs02wOWBIQ0snwqpy6q56ou6qTSrqIaRUcmBf2KaorkbSuA4syhSfiMZTwD7SYgUy8
	lxk11camvkfn3CO4xBEBtFc9g/mV1L5NMAsUIkyPNuwnw0WPQXR54EOG7QGs7kLHyFUfZMxKCqLdI
	a54RslbWbyUmfJbMTpWoNuvG2MAbOWD9MDe/EUVxos055s1CGhy7JyzJhX+JK2PKsC1RsZ0xJhJOR
	u0Dp0ZwVoykaNYKipgibBDGWrfTEhrWbnZ9r1xi8iZW8UQA9COmHpNAve16OsMk0XaPEhxfwTZuXD
	avbFjqGOztnFouPMKZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLdVa-008Ldz-1W; Thu, 02 Sep 2021 03:35:22 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLdVU-008LcH-3L
 for linux-mediatek@lists.infradead.org; Thu, 02 Sep 2021 03:35:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id t19so1047664lfe.13
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Sep 2021 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gL2ilJvS9thJPKxvfAwKwluP8VS/DzvajJ4jaGSJwc=;
 b=IRTZFjZoogEmBBaugLy0pzf0q5DcgA5uSZSobTaya5fjXwJUzC/oaRDfW2PJI57wq1
 ZBLPCOC8jN6KWXUZfsU6pMwRya5y/VUp/Qzh6O//ItwBo9cnEW868KU+FCAlMdkIbxuT
 gGGKlCW3txze91xJPv10X0akUda4/uNz21Xoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gL2ilJvS9thJPKxvfAwKwluP8VS/DzvajJ4jaGSJwc=;
 b=mDaJTSaXQ39wcC9Y0+g/XOWiKk4tmQR6wt3Ud+/QUrdVtGBA7pX5gozat+hepCHmwI
 sjxZYdVUwAsMsr0PwHD2x0+ml2X9IeKgqYB7Fl4smlcGN5MeVsqCi3ORoRx9dRL44kYq
 HAc5JqtzOunyilTh6RPMPzPs78bLocJ8+6cmAevIq7p90LV648lDvRINpCc/5iqr9kWi
 HbOgVfqwS0laBhLgHu1MJ4epcZDQ9SEJTaSqO7wpq9IH/E1wORdnD+TEXJuOBtDqZPv7
 DdVP2d3SvvEMqwPe5LNjzehdOMPY30u14gFtxtsKGMAO6+lA8tJB40hxgKJVyURXm1ZG
 yQPg==
X-Gm-Message-State: AOAM530K1Z6mrr8rar1s8qwbwwq6GAxVAy2z4x7jXJ40NRUyzxoKrLVg
 t66AoFDHvcS1raZT/QUTWRCxxizMeA7ZCXogO72YfQ==
X-Google-Smtp-Source: ABdhPJwp8Zka/IVZHD5rJYhSAvF9EYBibqi1JlXlE5eSLcADyhgkokl5Wumq+rdTbEutCChOFvC3Elh8L79u+yN5V5g=
X-Received: by 2002:ac2:4116:: with SMTP id b22mr894820lfi.587.1630553713975; 
 Wed, 01 Sep 2021 20:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
 <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03>
In-Reply-To: <1630551265.2247.11.camel@mhfsdcap03>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 Sep 2021 11:35:02 +0800
Message-ID: <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210901_203516_213544_B05D3B1C 
X-CRM114-Status: GOOD (  30.09  )
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

On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> > >
> > > This patch adds rsel define for mt8195.
> > >
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > @@ -16,6 +16,15 @@
> > >  #define MTK_PUPD_SET_R1R0_10 102
> > >  #define MTK_PUPD_SET_R1R0_11 103
> > >
> > > +#define MTK_PULL_SET_RSEL_000  200
> > > +#define MTK_PULL_SET_RSEL_001  201
> > > +#define MTK_PULL_SET_RSEL_010  202
> > > +#define MTK_PULL_SET_RSEL_011  203
> > > +#define MTK_PULL_SET_RSEL_100  204
> > > +#define MTK_PULL_SET_RSEL_101  205
> > > +#define MTK_PULL_SET_RSEL_110  206
> > > +#define MTK_PULL_SET_RSEL_111  207
> >
> > Could you keep the spacing between constants tighter, or have no spacing
> > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so on. This
> > would reduce the chance of new macro values colliding with actual resistor
> > values set in the datasheets, plus a contiguous space would be easy to
> > rule as macros.
> >
> > ChenYu
>
> Hi chenyu,
> By the current solution, it won't be mixed used by MTK_PULL_SET_RSEL_XXX
> and real  resistor value.
> If user use MTK_PULL_SET_RSEL_XXX, They don't care the define which
> means how much resistor value.

What I meant was that by keeping the value space tight, we avoid the
situation where in some new chip, one of the RSEL resistors happens to
be 200 or 300 ohms. 100 is already taken, so there's nothing we can
do if new designs actually do have 100 ohm settings.

> We think that we don't contiguous macro space for different register.
> It may increase code complexity to make having MTK_PULL_SET_RSEL_000
> defined as 104.

Can you elaborate? It is a simple range check and offset handling. Are
you concerned that a new design would have R2R1R0 and you would like
the macros to be contiguous?

BTW I don't quite get why decimal base values (100, 200, etc.) were
chosen. One would think that binary bases are easier to handle in code.


ChenYu

> Thanks.
>
> >
> > >  #define MTK_DRIVE_2mA  2
> > >  #define MTK_DRIVE_4mA  4
> > >  #define MTK_DRIVE_6mA  6
> > > --
> > > 2.18.0
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
