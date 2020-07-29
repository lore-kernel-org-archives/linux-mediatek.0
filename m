Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A4DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 11:04:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DEEE20663
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 11:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPn7UMOK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FwWqEJiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DEEE20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDjJd0p/XcD3ZkNghGn2DM/6jagQwgAsqbvgLq+QhAI=; b=mPn7UMOKFtXKYuccCLzmd3FhG
	Gvouxx+sc8dZOM2pZxuBlalNO8Fuh/DwCmkPMGmu9TTh6CmA8WM81fiSYbdy2tk5U2cJWcZZdcwtO
	tPZav4aE3Jaq+R1mhZUP8FRDtnW/5b2Dimzu9N1WHY7qnwaOEK6FgsG9mEHMp8Miwiy1Psnb2cM9r
	7Sx+HS2ZqKorxGbBNcFtTYZLqbV8R2opk5dFxVKU08F1trLO5kdveJmFXOQaYZGJFY9fs4On/YNI2
	cq07syaaQ5o5gjus/xboCCBfATH4OtToZA0S0iMS206mX8H8rcOLUlnTrYaMpX39FecC4k+B8eM99
	Srj7SGmOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0jsF-0006xM-6B; Wed, 29 Jul 2020 11:03:51 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0jrV-0006g4-1m
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 11:03:07 +0000
Received: by mail-vs1-xe42.google.com with SMTP id a17so11833485vsq.6
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2020 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwrmcmEFgHmE2elsCA3SQReEP7dtrnHUEc+lw41Ownc=;
 b=FwWqEJiqgTcRl9RLLuyH4qkEABEtXo3DtQFBEuq7WHwYZxqB3mG0CHZD3uUpi/uuMM
 pzPmDybDQpuYWZeaXue++7H72rsGLcrlC7pn9ApVJ/UKSCrB0GtfysxLOueCwUEyhQxa
 rbkTJ1SJlJJWU7SHFGVtQ/GXcEwJDweIJAP5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwrmcmEFgHmE2elsCA3SQReEP7dtrnHUEc+lw41Ownc=;
 b=SPlknwCYJ6SNEmosqiv4pqHX/vkNT5f9j94obXzhwl1uPsY0p14vi1fjCyCV+O/tih
 Ot1dNf1soMQkZQ3U/2P+7wrFELimRR3F96urYaC91qD8TfRjvQPzgZ64tDHF54Oxycy9
 YXUpOqKH/8cJKBrgbq56IWpmqUfm7vw7ARjtXwcxlJvZgmoBbwhmywiqsMltecb20BAl
 hw7HfdZCuORuq21kCDTTTqFWyrOEDfzcIz8S4IYfQz57GIzu9J/rvcaEm5mungS0nHjZ
 G4J2I4V3X1QvMhy841L8pOYzGB3+2tuEge5IfNWPJ0WE/LiiRWxA+IcH82czuq5Erruc
 BqoA==
X-Gm-Message-State: AOAM531P3Yq5ZqM1zndVGtuAY77ZZTBW1ATfqM+le4ySZ8vYVhujv118
 gskQYKI4Eyhz3uXABYFTVPcSWrmtZJMGSJxTLWnb1g==
X-Google-Smtp-Source: ABdhPJxf6gmq/1Vn4jyFC8rLBzVhmaXoarShTaaxIz+4CLlWEE/Ex5LiltCrFY4PE3r0Xot21uyjY+pVSlZu2o6pC5E=
X-Received: by 2002:a67:bb06:: with SMTP id m6mr379702vsn.54.1596020582972;
 Wed, 29 Jul 2020 04:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-4-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KBJ3QgpZ4EuSOWYTpOatsOte5sGkqtSZQs337x3fMFFYw@mail.gmail.com>
In-Reply-To: <CANMq1KBJ3QgpZ4EuSOWYTpOatsOte5sGkqtSZQs337x3fMFFYw@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 29 Jul 2020 19:02:52 +0800
Message-ID: <CANMq1KAYg2+RQiF0w7-2FKZj1QwoPDsXtmak-DHfserRjX-TWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_070305_181474_403BC6B6 
X-CRM114-Status: GOOD (  22.82  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2020 at 6:51 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Wed, Jul 29, 2020 at 4:44 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > The en_mask actually is a combination of divider enable mask
> > and pll enable bit(bit0).
> > Before this patch, we enabled both divider mask and bit0 in prepare(),
> > but only cleared the bit0 in unprepare().
> > Now, setting the enable register(CON0) in 2 steps: first divider mask,
> > then bit0 during prepare(), vice versa.
> > Hence, en_mask will only be used as divider enable mask.
> > Meanwhile, all the SoC PLL data are updated.
>
> I like this a lot better, most changes look fine, just a few nits.
>
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mt2701.c | 26 ++++++++++++------------
> >  drivers/clk/mediatek/clk-mt2712.c | 30 ++++++++++++++--------------
> >  drivers/clk/mediatek/clk-mt6765.c | 20 +++++++++----------
> >  drivers/clk/mediatek/clk-mt6779.c | 24 +++++++++++-----------
> >  drivers/clk/mediatek/clk-mt6797.c | 20 +++++++++----------
> >  drivers/clk/mediatek/clk-mt7622.c | 18 ++++++++---------
> >  drivers/clk/mediatek/clk-mt7629.c | 12 +++++------
> >  drivers/clk/mediatek/clk-mt8173.c | 42 ++++++++++++++++++++++++++-------------
> >  drivers/clk/mediatek/clk-mt8183.c | 22 ++++++++++----------
> >  drivers/clk/mediatek/clk-pll.c    | 10 ++++++++--
> >  10 files changed, 122 insertions(+), 102 deletions(-)
> >
[snip]
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index f440f2cd..3c79e1a 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -247,8 +247,10 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> >         writel(r, pll->pwr_addr);
> >         udelay(1);
> >
> > -       r = readl(pll->base_addr + REG_CON0);
> > -       r |= pll->data->en_mask;
> > +       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> > +       writel(r, pll->base_addr + REG_CON0);
> > +
> > +       r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;

One more question. I have the feeling that CON0_BASE_EN is what
enables the clock for good (and pll->data->en_mask is just an
additional setting/mask, since you could disable the clock by simply
clearing CON0_BASE_EN). Shouldn't you set pll->data->en_mask _first_,
then CON0_BASE_EN?

> >         writel(r, pll->base_addr + REG_CON0);
>
> As a small optimization, you can do:
>
> if (pll->data->en_mask) {
>    r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
>    writel(r, pll->base_addr + REG_CON0);
> }
>
> >
> >         __mtk_pll_tuner_enable(pll);
> > @@ -278,6 +280,10 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> >         __mtk_pll_tuner_disable(pll);
> >
> >         r = readl(pll->base_addr + REG_CON0);
> > +       r &= ~pll->data->en_mask;
>
> Move this to one line? (so that the code looks symmetrical, too?)
>
> > +       writel(r, pll->base_addr + REG_CON0);
> > +
> > +       r = readl(pll->base_addr + REG_CON0);
> >         r &= ~CON0_BASE_EN;

And ditto, ~CON0_BASE_EN then ~pll->data->en_mask?

>
> ditto?
>
> >         writel(r, pll->base_addr + REG_CON0);
> >
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
