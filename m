Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257C7C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 06:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kQJ/6S7OnJeLXEERXFsZeCcTJmPuTj5bk/YK1OP3Z8=; b=4DqwxTp1dmg9tx
	mhwBNk6+dK9R0j1ZYAA2aNCv1xpaaSF1CkpzAj2iypW0ydh1WJTeaLR6ee8Q2hyiadyJ7WOdXnKP5
	y5fpPJnbBOTrRorVucjdDFxBkQLkxYgQSYnVXZgrcNCPcfukuHE97lY95GScUcwtPNOu7WRaaj74A
	dBnARUVQo9GLNFHoMaZdajCa+mwVMxztbI7R2vEV8EqAsJ3SSSNGrPYpq0itKlJqzkYpSO4Befr6F
	pQy3cqlNL/uWDBFedfyAVj5wfH8MvdlDiEoq1xz55sqW2YyvVjfbIPqIdJjphPhb3A8H81Os+o5Wp
	euBmRQvRHuiZs93cMZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCbda-00AHTV-2h; Wed, 26 Jan 2022 06:18:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCbdM-00AHRB-UB
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 06:18:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id x11so61119065lfa.2
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 22:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpEABcwS975oei+Y9ttqKcy253wTKHzRhAN8k1S7oQs=;
 b=bV5dffUWZ6A29E8num3B1mZUkB6ga1sbxeYQIRibfvYYit7Be7VLIoA7zv9WwUyO+a
 ACKAoQ96NZRr8BC5766Jn6+iHAHsK58XJN1XbezWj0C/Ft2nJLBCvZswINNp8U74vsk+
 YHVG8kZrJodRtDYsAUYvIjvG2oGuPJrC29lPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpEABcwS975oei+Y9ttqKcy253wTKHzRhAN8k1S7oQs=;
 b=KV5pckvi2nOBRtUJo/IsEhuL5/Qx/cfP9jE9xUkF3Uy03s4KoP7Rb6CdeHVTrWg6N2
 s4UDVDnCuRGIQwglTGrnPOR+fery97Gq8vKKIltLV3sRPf8Y3QL/NC0geWvQHJf1T6s1
 YtBr3KBG9kKkXFSSD87jK8br435aJyB24Mjh/TD99pqQq7qPy3/Fal8fAweGpenLTWiX
 RDut7qi+iq25Oyy+UZC9e3dTyCSrxP447KUKUZA/M72cZCO48X9hqZbO3tQ108+sKzFE
 nVBZACOO7F9pOXD8xKKlvh8bzWpV+mGPzCUJRqDH0I1VCqg0KQeAxQxN33MwR82BlfS7
 lunw==
X-Gm-Message-State: AOAM531XjiMYkGzRYLbTB3IQ6c2lcGtrHVqlEXEPCGuH9+72ospuW2kj
 xJo8UPcKPfr+gQGS4JQGV8/G5h1+lBKC7+xCwmGLkQ==
X-Google-Smtp-Source: ABdhPJyqqlRpnlyel7jHSw11onS+UWB9JQwLpjdyosUsCKsRpEB8SXNv6Asj8uheBfdmuamJ4ijimL3uq2WC/H8caRg=
X-Received: by 2002:ac2:5442:: with SMTP id d2mr12853999lfn.482.1643177897972; 
 Tue, 25 Jan 2022 22:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20220122091731.283592-10-wenst@chromium.org>
 <20220126060449.24874-1-miles.chen@mediatek.com>
In-Reply-To: <20220126060449.24874-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 26 Jan 2022 14:18:06 +0800
Message-ID: <CAGXv+5GKmOrT=yOkadsKVz38vvAj1-1sBN8i86zMLv3yusZeQw@mail.gmail.com>
Subject: Re: [PATCH 13/31] clk: mediatek: pll: Implement unregister API
To: Miles Chen <miles.chen@mediatek.com>
Cc: chun-jie.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 mturquette@baylibre.com, sboyd@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_221820_984191_08A4851B 
X-CRM114-Status: GOOD (  23.30  )
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

On Wed, Jan 26, 2022 at 2:04 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> > +static void mtk_clk_unregister_pll(struct clk *clk)
> > +{
> > +     struct clk_hw *hw = __clk_get_hw(clk);
> > +     struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> > +
> > +     clk_unregister(clk);
> > +     kfree(pll);
> > +}
> > +
>
> mtk_clk_unregister_pll() looks different.
> Do we need to check hw before passing it to to_mtk_clk_pll(hw), like
> mtk_clk_unregister_mux()?

Good catch.

In theory we should, since __get_clk_hw() would return NULL if clk is NULL.
However the code already does that check before it calls
mtk_clk_unregister_pll(), so the code is safe. We should make everything
consistent though.

I might have written the code on separate days and thus introduced some
discrepancies. I'll fix it in v2.


ChenYu

> >  void mtk_clk_register_plls(struct device_node *node,
> >               const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
> >  {
> > @@ -388,4 +397,44 @@ void mtk_clk_register_plls(struct device_node *node,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
> >
> > +static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
> > +                                       const struct mtk_pll_data *data)
> > +{
> > +     struct clk_hw *hw = __clk_get_hw(clk);
> > +     struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> > +
> > +     return pll->base_addr - data->reg;
> > +}
> > +
> > +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> > +                          struct clk_onecell_data *clk_data)
> > +{
> > +     __iomem void *base = NULL;
> > +     int i;
> > +
> > +     if (!clk_data)
> > +             return;
> > +
> > +     for (i = num_plls; i > 0; i--) {
> > +             const struct mtk_pll_data *pll = &plls[i - 1];
> > +
> > +             if (IS_ERR_OR_NULL(clk_data->clks[pll->id]))
> > +                     continue;
> > +
> > +             /*
> > +              * This is quite ugly but unfortunately the clks don't have
> > +              * any device tied to them, so there's no place to store the
> > +              * pointer to the I/O region base address. We have to fetch
> > +              * it from one of the registered clks.
> > +              */
> > +             base = mtk_clk_pll_get_base(clk_data->clks[pll->id], pll);
> > +
> > +             mtk_clk_unregister_pll(clk_data->clks[pll->id]);
> > +             clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
> > +     }
> > +
> > +     iounmap(base);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_clk_unregister_plls);
> > +
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> > index d01b0c38311d..a889b1e472e7 100644
> > --- a/drivers/clk/mediatek/clk-pll.h
> > +++ b/drivers/clk/mediatek/clk-pll.h
> > @@ -51,5 +51,7 @@ struct mtk_pll_data {
> >  void mtk_clk_register_plls(struct device_node *node,
> >                          const struct mtk_pll_data *plls, int num_plls,
> >                          struct clk_onecell_data *clk_data);
> > +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> > +                          struct clk_onecell_data *clk_data);
> >
> >  #endif /* __DRV_CLK_MTK_PLL_H */
> > --
> > 2.35.0.rc0.227.g00780c9af4-goog
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
