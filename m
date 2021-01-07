Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B37C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 03:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4355230F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 03:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4355230F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uv5ijIekvDXC5TflI5I4VocImTeiVapsu8iG/snRczw=; b=ARg5ZMQh69W1ZiPG2qnRq2pUz
	k3ETLbu8gR089743rI9jSxe+Whx7ht4Buy3oArorcdJf8bQuLzUObs1udn0fwYNWooMPRIblbSjql
	FdW1yQzvpoHRsMG+c5Fe/twDkemscIiEWx36Q2mMFiWkO7UgBdB5cwP0RTECnWKQVggCqId3ZbaTw
	ttlZUCHtrg/M59mw1dHF6QFU5oFLOnvycCJVAlCAiDVmlJ+5liACsfSned2t8qcL/HfTJU8YkpIJw
	p4IsKfSelgf0dgFeNg797HXpA2I3FtwrGom8yyEN6BCqPeIGasAY3QVoEr1ULBuv3uyKOpfOrjNO6
	S+xtRoLcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxLXf-0003PB-Qi; Thu, 07 Jan 2021 03:00:51 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxLXd-0003Nd-Nu
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 03:00:50 +0000
Received: by mail-pg1-x52a.google.com with SMTP id v19so3791059pgj.12
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 19:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRLNPuGfj3ivO2euUNkJ0P2eXIJZBKP4UpcEqnbsjb0=;
 b=nsQXvntr/Be1QwCn3rjuU1BaOepIKvGnGbEQIh9SeSgggzyGKOrNfuMv2lXfCE9Sfj
 1vBUuJFoYVD47AMsJHSjCt12FkTfEe+yVcYtY9rBnAb214XfC5F/SP9XOGhRQu3fZCph
 rQzBcKwgGFfsGTT3Cdl2x+49ENuaAVb4cs3NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRLNPuGfj3ivO2euUNkJ0P2eXIJZBKP4UpcEqnbsjb0=;
 b=p3dooCQtwSckMXuZUlC65s8dU98t6sJaKTMVHivtvw2aI3+PVBeQ4iGH1D+ZxZDZ25
 FfDDNRqG6MaUU5RtTACSUnlZjt0tfIWqzreQAL/JEGmGwApXDbcF9eTyBju8SGRXXu6E
 RXuYyMdwQk8GBwCMrZYlDpkqFZ/1XlzXK8Lfi8Vkh1UyY6mYz/D7yrfAS+h8hDk7U/vJ
 SkhSvkLC3CybRsc2JzrKhUoJ7OXhMozzVnEFz22G9vIpKO2u9PNhS6iXyL3uK6RPEnKR
 QFzZU2d8BpKhbz7hKYv3Z7UBql/n9kIC82Nm1PVTbFxelKKrEa1b3aCYLm7jmLXCBSUy
 HJVQ==
X-Gm-Message-State: AOAM532Ua1UJZRRNMakNdpJFS/KINRjRRf43x1BNz6QT23/S/R0iN4Cu
 PBxyKAdMS6S4ZROztLSKg4ynOhcCQ0Pm/NGEmuC/fQ==
X-Google-Smtp-Source: ABdhPJygrAgFZ2XgLIlhW5wQPGzTk6X7MBKbFeUG69GLIJhGNsa0p96qlju/S7+tGj+7yG58V+PkWBmJ9aWjsw6VpC8=
X-Received: by 2002:a63:5f93:: with SMTP id t141mr7558126pgb.299.1609988444001; 
 Wed, 06 Jan 2021 19:00:44 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
 <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com>
 <1609929721.7491.3.camel@mtksdaap41>
 <CAATdQgBJ7EVRJW7iJG63yW89fh5skpe9-UCd4pdZystV_JrvCg@mail.gmail.com>
 <1609931196.30620.3.camel@mtksdaap41>
In-Reply-To: <1609931196.30620.3.camel@mtksdaap41>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 7 Jan 2021 11:00:32 +0800
Message-ID: <CAATdQgCNV5RCQGDLFamFHsuZddQakxSyjzsja=ypSV7OL531Aw@mail.gmail.com>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_220049_876785_1D6628D0 
X-CRM114-Status: GOOD (  21.95  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 6, 2021 at 7:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On Wed, 2021-01-06 at 18:52 +0800, Ikjoon Jang wrote:
> > On Wed, Jan 6, 2021 at 6:42 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > >
> > > On Wed, 2021-01-06 at 18:25 +0800, Ikjoon Jang wrote:
> > > > On Tue, Dec 22, 2020 at 9:14 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > > > >
> > > > > Add MT8192 basic clock providers, include topckgen, apmixedsys,
> > > > > infracfg and pericfg.
> > > > >
> > > > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > > > ---
> > > > >  drivers/clk/mediatek/Kconfig      |    8 +
> > > > >  drivers/clk/mediatek/Makefile     |    1 +
> > > > >  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
> > > > >  drivers/clk/mediatek/clk-mux.h    |   15 +
> > > > >  4 files changed, 1350 insertions(+)
> > > > >  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> > > > >
> > > >
> > > > <snip>
> > > >
> > > > > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > > > > index f5625f4..afbc7df 100644
> > > > > --- a/drivers/clk/mediatek/clk-mux.h
> > > > > +++ b/drivers/clk/mediatek/clk-mux.h
> > > > > @@ -77,6 +77,21 @@ struct mtk_mux {
> > > > >                         _width, _gate, _upd_ofs, _upd,                  \
> > > > >                         CLK_SET_RATE_PARENT)
> > > > >
> > > > > +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,          \
> > > > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > > > +                       _upd_ofs, _upd, _flags)                         \
> > > > > +               GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,  \
> > > > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > > > +                       0, _upd_ofs, _upd, _flags,                      \
> > > > > +                       mtk_mux_clr_set_upd_ops)
> > > > > +
> > > > > +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                        \
> > > > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > > > +                       _upd_ofs, _upd)                                 \
> > > > > +               MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,             \
> > > > > +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> > > > > +                       _width, _upd_ofs, _upd, CLK_SET_RATE_PARENT)
> > > > > +
> > > >
> > > > conflicts, these macros are already existed in upstream.
> > >
> > > really? These two macros don't show up in 5.11-rc1 yet.
> >
> > yep, maybe this one: a3ae549917f1 "clk: mediatek: Add new clkmux register API"
> >
>
> The new macros in this patch are for the clock MUX without gate control.
> It's a little different from those mux macros with gate control in
> a3ae549917f1 "clk: mediatek: Add new clkmux register API"
>

sorry, my bad. it's just a simple context conflict from

> > >
> > > > >  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> > > > >                                  struct regmap *regmap,
> > > > >                                  spinlock_t *lock);
> > > > > --

your another patch,
2aeff9d8c8e "clk: mediatek: Make mtk_clk_register_mux() a static function"
was applied before this series.

> > > > > 1.8.1.1.dirty
> > > > > _______________________________________________
> > > > > Linux-mediatek mailing list
> > > > > Linux-mediatek@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > >
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
