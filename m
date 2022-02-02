Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N+dDHoYRi4epANayomdftAnPE6iwYGXcoRSleO+S18=; b=vEX3mJXzc1+r9W
	2+zXvsjavmoVC+EgcjWBUgLyN3sHPFVrxkj8oPH6MpvojoHOQXIzUfUQD79WWN5AatNtvwoVVD8Sw
	sXo5h1gcdPpxUD+Qi2NCRMvpiYsenAHX1um6fAkag2y11kDDMB800spZnlekCHtTeCc55RJ+QVbdr
	b1MQuDydXQ6ZDezsvha2syvpbLrS2oGon2Z101Ps1BMBk1+REcYdszhoyfiPMz6Q6LRpcughZl1+d
	D9LbsczJlZjv10e9dVkexi7setFzjKboCL/tN0D50PFTyY+e6bQ8ejG99weYb70PeTfnQ4PQwheuw
	7oXfvtWfMj8x2nyOL6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFFDN-00FHbM-J4; Wed, 02 Feb 2022 12:58:25 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFFDJ-00FHZF-0X
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 12:58:22 +0000
Received: by mail-yb1-xb32.google.com with SMTP id r65so60605398ybc.11
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 04:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dU/z995NUTHrMzTqiAvkMkdF79WLwDMcbs55TIijfcE=;
 b=fHDdFC5FWRcThCd0Tfbp/dR2XIbwHtRs9H3VgjSuG/yWGDTofEDHUBZnWEJs5mh1uT
 Doh4KUlfwdcL923Pp48pI6OQf4MfQ1kFgpj5kywLiYCCot7ZS/7GM4UexJ8o91/sRPcr
 kyLnSvmRXg0QtssqbGSnERTChrpShqxV90zKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dU/z995NUTHrMzTqiAvkMkdF79WLwDMcbs55TIijfcE=;
 b=kc33BaLKucHu7R6UwEdC5bTcPpVH+8VpsgMjdnPAHv5P+Wzukb2TbxPC52iBtps3OJ
 cXoz+qLANQfbEgdFCqQ2PpC76B9BSQAc9mq/MvUuU4bjQTjtfoGC/IkC3MWEnqy2pEdm
 dA5Tx7K0jvf7snOErQW5i3VcFXxKaYjupm97vPQpKOxQDFd/j8dPCjSLKPgmDpBY0HhB
 RV85pZK1of35x2AgV3OlTWDwR2ursPXVuJ5zlvJXs1qrB8UbNs3ofKcUkQpdCsLxRsX0
 y5uMmCfTbQ+MmCGj4vC5Sslh4GywoLV8pykYgFDN4fBQ2CpkogIZoAlHvHLPoNwEOg6Y
 nO3A==
X-Gm-Message-State: AOAM532mos3t0+4XKUTd4hViV08wuzJcPMETQPrlw0pQ0YiRI4nf2c2/
 1v7O5J07H/sbZ34VD1Iw3roVoMa6h2EtnC1e9ZZ39w==
X-Google-Smtp-Source: ABdhPJxOekHpFlkiPIYTTgHOA7chVTJIdKfOU7Gx9z5sD2o1KBdROJnYT6/dSYpbYolgkvDYcwWRm5+E1jZer/H+E00=
X-Received: by 2002:a81:1458:: with SMTP id 85mr937225ywu.199.1643806699120;
 Wed, 02 Feb 2022 04:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20220122091731.283592-15-wenst@chromium.org>
 <20220126063643.11544-1-miles.chen@mediatek.com>
In-Reply-To: <20220126063643.11544-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Feb 2022 20:58:08 +0800
Message-ID: <CAGXv+5HH0gsjNJcLoig=wt+QfjfJ7E9r8UAxm2PFjsR09x9NmQ@mail.gmail.com>
Subject: Re: [PATCH 14/31] clk: mediatek: pll: Clean up included headers
To: Miles Chen <miles.chen@mediatek.com>
Cc: chun-jie.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 mturquette@baylibre.com, sboyd@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_045821_093617_ADCE173D 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, Jan 26, 2022 at 2:36 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> > Some included headers aren't actually used anywhere, while other headers
> > with the declaration of functions and structures aren't directly
> > included.
> >
> > Get rid of the unused ones, and add the ones that should be included
> > directly.
> >
> > Also, expand the MHZ macro with spelled-out "1000 * 1000" to be able
> > to not include clk-mtk.h. The existing ternary operator is rewritten
> > in a shortened form to accommodate the expanded macro.
>
> I think MHZ is more human readable than 1000*1000,
> like SZ_4K in linux/sizes.h.
>
> MHZ is also use by other clk-mtxxxx.c (by including clk-mtk.h)
> , so maybe we should keep clk-mtk.h?

This seems like overkill. I'll define MHZ in the file instead.

ChenYu

> Miles
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/clk/mediatek/clk-pll.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index 081e0df8203e..9698d1c97cd6 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -4,15 +4,15 @@
> >   * Author: James Liao <jamesjj.liao@mediatek.com>
> >   */
> >
> > -#include <linux/of.h>
> > -#include <linux/of_address.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/container_of.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > +#include <linux/of_address.h>
> >  #include <linux/slab.h>
> > -#include <linux/clkdev.h>
> > -#include <linux/delay.h>
> >
> > -#include "clk-mtk.h"
> >  #include "clk-pll.h"
> >
> >  #define REG_CON0             0
> > @@ -162,7 +162,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
> >  static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
> >               u32 freq, u32 fin)
> >  {
> > -     unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
> > +     unsigned long fmin = pll->data->fmin ?: (1000 * 1000 * 1000);
> >       const struct mtk_pll_div_table *div_table = pll->data->div_table;
> >       u64 _pcw;
> >       int ibits;
> > --
> > 2.35.0.rc0.227.g00780c9af4-goog
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
