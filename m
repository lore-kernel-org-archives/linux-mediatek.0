Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 03:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYnibosyNwWlSZR1g9/UV/cY/AZQ4L2f6IqjIEKHwpM=; b=uGiZk6lynIcrBu
	GvseES2kvDweLk8xmSucxWcg88/fNAcyO4z6jJuAnF12Ie2IMBp2z0RI5hHEg4pwlSwCifZK3guZl
	xI0VeKTpjoOXGqBkMEBOsilZ17DhPGVU4/oorUM2WeGb8tHFLJ2jUhjwv3qf1p1dbuzVjPCifHv/L
	PTxYSZfpFxJ9IO7Lpud+aq1MEEVvTxc/hosmPudAqioo7DkPyRmjx4zmecIuCVGDaErXJDgaVgXqx
	62Hn5HbyaWCEXN3JPJ0KvdowP1DSXHbVDAn9adPxEsrredeLEZBAMuh3XxKrOcK8pGQrc+0S406cv
	akeE95yj7yO5Krp47MiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHdPy-00G4Tg-DZ; Wed, 09 Feb 2022 03:13:18 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHdPv-00G4T4-TK
 for linux-mediatek@lists.infradead.org; Wed, 09 Feb 2022 03:13:17 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 192so2145462ybd.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 19:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/R2LriswMiHtMayk3cQe3ZgDGVpDn6vfPdguZ1VAL8c=;
 b=Z4htK1PvPjLN2hbBeC6YYrji+agQMuMV5YG42X2kwEw2dpzm0JxFKo8hsFa2C1Jfx6
 aiqSpFNGQmDBS2DDI+xB/nArXQTRf8UlOzrFaZGH+fyy6IVPwIXsISWvJMcGQ6vwcd4N
 brBY26HkIFXOwhYOm+A2RznepAOysyGRvyKdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/R2LriswMiHtMayk3cQe3ZgDGVpDn6vfPdguZ1VAL8c=;
 b=Ab6XxZdJ776WEYh5hEsLpbJ1f2ZRttJKV22CE8givZ0Wpk8usIT9DlcH4ENleWErXj
 bjCYHBgYpFRIqQ4sn3eJV5pEtde+qLzxNEdUpkcLsNRVDv24zlxnqWAeUhhbCyFytVyR
 5DH/cOI1vK08hmkMaN0hC2pqEHi31zymL9sbYyRe2ED+HwA/Vr3ExNbcMZ2KpgWtrQhQ
 ugC6buGi8srMWmzWnXeHbHNJHSOjkyhz1pucfUtEacdeA7u/WxtEEpXtZ5U+6EGmagWi
 zx44ebM2waW3rUX9+2BJcN5LjX11m/AOEWRzkzVA7Ne9uWppH/YvY9ux6aCkxiu5y+iG
 Jjqg==
X-Gm-Message-State: AOAM530p8GNUMJo/rOcHEy0Xi5uftKBfkVnxZ3CzgZQEVHgtN2LZjJSl
 BBg+yOr2aEACZXqIRQnYxz2EBWPRQZcODE/b7LO1hw==
X-Google-Smtp-Source: ABdhPJxTxvn/1WdP/keqrM63kkqlFYBObLI54gDsNyXkQOm6LGSkEX7oidm2bg05AxRzM3cqFgbOsLGSQybe+5qqx+o=
X-Received: by 2002:a25:5382:: with SMTP id h124mr384351ybb.291.1644376394583; 
 Tue, 08 Feb 2022 19:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208223252.7f179c63@pc>
In-Reply-To: <20220208223252.7f179c63@pc>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 9 Feb 2022 11:13:03 +0800
Message-ID: <CAGXv+5Hz6-aZpisXuFqdez5CQBtsg-h7H6yOAWUwBP-L8L=qkw@mail.gmail.com>
Subject: Re: [PATCH v3 00/31] clk: mediatek: Cleanups and Improvements - Part 1
To: Boris Lysov <arz65xx@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_191315_972949_761B4EA8 
X-CRM114-Status: GOOD (  23.19  )
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

Hi,

On Wed, Feb 9, 2022 at 3:32 AM Boris Lysov <arz65xx@gmail.com> wrote:
>
> Hi, I couldn't find a particular patch to reply to so I'm replying cover
> letter to give some input on the PLL subsystem.
>
> On Tue,  8 Feb 2022 20:40:03 +0800
> Chen-Yu Tsai <wenst@chromium.org> wrote:
> >  drivers/clk/mediatek/clk-pll.c                | 100 +++++-
> >  drivers/clk/mediatek/clk-pll.h                |  57 ++++
>
> In clk-pll.c there is an mtk_clk_register_pll function which at some point
> executes this:
>
> > init.ops = &mtk_pll_ops;
>
> In my opinion there should be a possibility to define a custom mtk_pll_ops for a
> given SoC instead of using a hardcoded one because not all Mediatek SoCs share
> the same PLL startup/powerdown flow. For example, the existing mtk_pll_prepare
> implementation won't work for the entire Mediatek Cortex-A9 SoC family (this
> includes but not limited to mt6515, mt6517, mt6575, and mt6577).

Ack. My scope is limited to SoCs used in Chromebooks. However Miles and
Chun-Jie, who are Cc-ed on the series, should know more.

That said, we can implement support for these varying parameters as we
see them, not before.

> > static int mtk_pll_prepare(struct clk_hw *hw)
> > {
> >       struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> >       u32 r;
> >       u32 div_en_mask;
> >
> >       r = readl(pll->pwr_addr) | CON0_PWR_ON;
> >       writel(r, pll->pwr_addr);
>
> This code sets a bit to 1 to start a PLL but the SoCs I mentioned above would
> need to have that bit cleared (set to 0) [1] [2].
>
> Another interesting thing in mtk_pll_prepare is
> >       udelay(20);
> Is 20 ms a settle time for PLL? If yes then it would also be cool to specify an
> arbitrary value easily as some PLLs have longer settle time [3] [4].

This is a question for whomever upstreamed the driver.
> Worth noting the SoCs I mentioned aren't in mainline yet, and I think there are
> more modern mainline-worthy Mediatek SoCs that might also need these changes in
> the future.

Again, we can implement varying parameters as they appear.

Thanks
ChenYu


>
> Thanks.
>
> [1] MT6577 HSPA Smartphone Application Processor Datasheet, pages 1212-1227
> (*_CON0 registers).
> [2] MT6515 GSM/EDGE Smartphone Application Processor Datasheet, pages
> 1202-1216 (*_CON0 registers).
> [3] pages 1303-1306 of [1]
> [4] MT6589 HSPA+ Smartphone Application Processor Datasheet, page 1344
> (MDPLL1 & MDPLL2)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
