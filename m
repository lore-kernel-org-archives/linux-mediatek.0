Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2734BCAC58C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zftH1OFDMW2jW27I963MhGeDeriTV1wGejbhpnPTHcs=; b=wxlOL1YXGdIq+f8mwNzVM1OOUn
	+03GynbKBWtKtkaFJWhDdKQdldHXxs5czA5DSpR2chaHSG6gxFNK+YMIxHrRc2O8CZPdPpUZvcdw6
	b+Z0r6hatqF0330Mbd8xq/j0nsKDRPmVefrhHt0SX9c21aV2BW3+ltrbBsdc2jdUVqOTqke6gjMP9
	USDX6FjEwcDatWrY4sNhZsgsTlKsWikb2mhDxWoJc5PaKJdhvGRTumNqZHfw9R0Yf67N0ILmC6oRP
	fVI+zV3HvkDRh+WzrYFI6SUJXfudDUABysAfTFnLg1dzDeTWt3iWapA4foJ6OZJ6DXQNL6Osi+zEt
	t2cvXygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v9-00000008md7-1cWw;
	Tue, 09 Sep 2025 17:14:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvnX-00000006TcP-1YNX;
	Tue, 09 Sep 2025 10:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D4F43F59;
	Tue,  9 Sep 2025 10:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129D3C4CEF4;
	Tue,  9 Sep 2025 10:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757414522;
	bh=ZjvOrSWVcVf5YAynr8zKeTMjoU2jc4ng9s5RPK12NbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McfoQ4gDFpUfqvvhW8JCPU0Bouf+Ecc5S6c8dckZKyY4c93J2zLEBGGPZ9yGoDqKE
	 vs98zwJ4COzBUGJeEPzWquI0PKQ5nDm8VJGCFjDma0+3b/RVPGPhGijdgYZVnFfD1z
	 uT8q70OB34x6Hvrpw7bsZzPBYjnsqIuXaN1lUvSdESIusdwOLULICBk5c8riNhB4n6
	 9ygtRErF5j0YtL6ssCAulrrqcHEHc8tK3aJFfb6ciJHQFWutMTV70Gw/4PgUAc+XEk
	 c1uDjgXyLOtMeKhALfDs5C1ZgVJ4B++KLdoBpO5loJe5J2zaZJxz6Re5atOi+WIXLK
	 o9KfNg2k1SBcg==
Date: Tue, 9 Sep 2025 12:41:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, 
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <c3d57np3hns3yoklgkbpc2ivx7jrd5qwz76wcwxhnef3ermdve@3ejfxfwg3acq>
References: <20250906082652.16864-1-leilk.liu@mediatek.com>
 <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
 <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_034203_454866_E2A95768 
X-CRM114-Status: GOOD (  28.51  )
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

On Tue, Sep 09, 2025 at 11:50:15AM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 9, 2025 at 6:17 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > > index ab456c3717db..dee40704825c 100644
> > > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > > @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
> > >  {
> > >       int ret;
> > >       int left_num = num;
> > > +     bool write_then_read_en = false;
> > >       struct mtk_i2c *i2c = i2c_get_adapdata(adap);
> > >
> > >       ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> > > @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
> > >               if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M_RD) &&
> > >                   msgs[0].addr == msgs[1].addr) {
> > >                       i2c->auto_restart = 0;
> > > +                     write_then_read_en = true;
> > >               }
> > >       }
> > >
> > > @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
> > >               else
> > >                       i2c->op = I2C_MASTER_WR;
> > >
> > > -             if (!i2c->auto_restart) {
> > > -                     if (num > 1) {
> > > -                             /* combined two messages into one transaction */
> > > -                             i2c->op = I2C_MASTER_WRRD;
> > > -                             left_num--;
> > > -                     }
> > > +             if (write_then_read_en) {
> > > +                     /* combined two messages into one transaction */
> > > +                     i2c->op = I2C_MASTER_WRRD;
> >
> > i2c doesn't change for the whole loop so that it can be set only
> > once outside the loop instead of setting it everytime.
> >
> > Something like this:
> >
> >         if (i2c->op == I2C_MASTER_WRRD)
> >                 left_num--;
> >         else if (msgs->flags & I2C_M_RD)
> >                 ...
> >         else
> >
> > looks cleaner to me and we save the extra flag. Am I missing
> > anything?
> 
> It looks correct to me, though I think it requires a comment explaining
> that "in the WRRD case there are only two messages that get processed
> together, and the while loop doesn't actually iterate", and reference
> the block where the WRRD op is set.
> 
> Otherwise someone is going to look at this snippet and think there's
> some corner case where all messages (# of messages > 2) get handled
> using the WRRD op.

Agree, indeed I wanted to write it somewhere that a comment would
have been nice.

I'd appreciate a comment even with the boolean flag. I think
boolean flags are often a forced solution and we always need to
describe their need.

> So maybe it looks cleaner, but it requires more context to understand.
> Whereas in the original patch, the extra variable sort of gives that
> context. In this case I prefer the context being more visible, since
> the original corner case this issue fixes is also from missing context
> and assumptions.

I think both solutions are clear in a different way. Anyway, I'm
not very strong on this comment, I just see that from a code
perspective looks nicer. If you guys insist, then I will let this
go as it is.

Andi

