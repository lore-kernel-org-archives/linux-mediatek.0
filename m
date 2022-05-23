Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AD6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyc2lwbnAdMlb6sr+qGZrW5Co7N+z0O8JxOPLsmZmQg=; b=bSzZWISZ1EiFpR
	K6jRWteyZ2Qdtb1MdWp5un3hY6Al5kBWKm6naMqq6Em4GNsKKUuvUCS18kU8bzvAB6FbDGV8IFx8V
	vn+DySCrH30jynLz6EGwBsj+HdUJ8z2/w9CfXerlZq3oaCoXS9/nIDdc2USJNDRDDgfpTU6aAjNm/
	fpLL1Y3gM/mjBbVdnTy8oIySDbb6XMyYtANDUjarnvIBXi7AyntY/O6QuY4qYyCmxgleXlzz23j5G
	iT3eFTYdO4B82HNRu5JYQGlcnFWOS5dalVnidzf8IawbuTDw0f9vP7l33It4dWY0d45ayvjexZWU9
	O7475TZvy4ujLBRSmLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt63C-003cFl-B2; Mon, 23 May 2022 11:16:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5BK-003BqJ-0Z
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:20:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id er5so18433596edb.12
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVZuqJKxfK/LKRySxF+QMkbTfearZe0k0KO+kDBVY5o=;
 b=VKpvgn4WCt46NyC6Afa1B13yW2JftlOPDLNcTegz/NYS+RNaSOeNz0zuyoicV5TJor
 T3waBzR/q32WtORp9+t0DVglZCVQx/aTqUCoO7HiovOq3K+HxtvezFtLpz5wBf7OMSjn
 MbrpNZ6f/cvDkURYavv/cNIiy/3YXg5+bLXDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVZuqJKxfK/LKRySxF+QMkbTfearZe0k0KO+kDBVY5o=;
 b=bufzRwzD6ZK1CiCAMwwTHT1ZEFB6bf1LfYKhjnhBwYXS5Nvl/yHwAyJFZxJsAcjXwR
 Qulrbk+KX0DjX6khDmLf6TOZ+3zQ0JzN6mv9CtH4EnrExgy4CZpr0wOR5jzStsQgPbDr
 86Ibycl8tZAkpkue6jqsuuBCYXFURrfhpHwdmEKaczwco5t14Po8n1ZJzGHDsYzez78P
 mCTVYTA3d1wwtKtGhPUBaWo5PM3UUAu45FCqet9S7h0JSDRCwti/QS06o72k9Z7N6Wzm
 Rc9tP30+OUF+0OHBPJlc8HmBxyV3JJqU5t4//HVvv0SUdz+RZOkAcqwdhY/up7mOA3KQ
 4JAg==
X-Gm-Message-State: AOAM533Z+9HSWh2ysEK3ast0ZiMHFJ+0zJVw2sKlW2WDR5fksXGI0wJh
 3bBAGRjTVDRHhzx6wCmZTxcaOGfWDkixd1cvHVfk6w==
X-Google-Smtp-Source: ABdhPJwyPxH505ssPSiwcnGCp/gh53GQfd3OdkSl+YIKxP5ZwvhsNKaopABMSpb5F/H5ljruU7uWoZ/2wSR6xBTVs1s=
X-Received: by 2002:a05:6402:1704:b0:42a:c480:dcc8 with SMTP id
 y4-20020a056402170400b0042ac480dcc8mr23397872edu.59.1653301256295; Mon, 23
 May 2022 03:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220523085923.1430470-1-wenst@chromium.org>
 <20220523085923.1430470-4-wenst@chromium.org>
 <f6cd735b-2ba4-7456-684d-b20f0b46effe@collabora.com>
In-Reply-To: <f6cd735b-2ba4-7456-684d-b20f0b46effe@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 May 2022 18:20:45 +0800
Message-ID: <CAGXv+5EO+JFr0xrh5JhoLSL7uuEbwHc9xEtY9HFsao2nTzMNvQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: mediatek: mux: add clk notifier functions
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_032058_139985_9B746849 
X-CRM114-Status: GOOD (  39.29  )
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

On Mon, May 23, 2022 at 6:04 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/05/22 10:59, Chen-Yu Tsai ha scritto:
> > With device frequency scaling, the mux clock that (indirectly) feeds the
> > device selects between a dedicated PLL, and some other stable clocks.
> >
> > When a clk rate change is requested, the (normally) upstream PLL is
> > reconfigured. It's possible for the clock output of the PLL to become
> > unstable during this process.
> >
> > To avoid causing the device to glitch, the mux should temporarily be
> > switched over to another "stable" clock during the PLL rate change.
> > This is done with clk notifiers.
> >
> > This patch adds common functions for notifiers to temporarily and
> > transparently reparent mux clocks.
> >
> > This was loosely based on commit 8adfb08605a9 ("clk: sunxi-ng: mux: Add
> > clk notifier functions").
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/clk/mediatek/clk-mux.c | 42 ++++++++++++++++++++++++++++++++++
> >   drivers/clk/mediatek/clk-mux.h | 15 ++++++++++++
> >   2 files changed, 57 insertions(+)
> >
> > diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> > index cd5f9fd8cb98..f84a5a753c09 100644
> > --- a/drivers/clk/mediatek/clk-mux.c
> > +++ b/drivers/clk/mediatek/clk-mux.c
> > @@ -4,6 +4,7 @@
> >    * Author: Owen Chen <owen.chen@mediatek.com>
> >    */
> >
> > +#include <linux/clk.h>
> >   #include <linux/clk-provider.h>
> >   #include <linux/compiler_types.h>
> >   #include <linux/container_of.h>
> > @@ -259,4 +260,45 @@ void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
> >
> > +/*
> > + * This clock notifier is called when the frequency of the of the parent
> > + * PLL clock is to be changed. The idea is to switch the parent to a
> > + * stable clock, such as the main oscillator, while the PLL frequency
> > + * stabilizes.
> > + */
> > +static int mtk_clk_mux_notifier_cb(struct notifier_block *nb,
> > +                                unsigned long event, void *_data)
> > +{
> > +     struct clk_notifier_data *data = _data;
> > +     struct mtk_mux_nb *mux_nb = to_mtk_mux_nb(nb);
> > +     const struct mtk_mux *mux = mux_nb->mux;
> > +     struct clk_hw *hw;
> > +     int ret = 0;
> > +
> > +     hw = __clk_get_hw(data->clk);
> > +
> > +     switch (event) {
> > +     case PRE_RATE_CHANGE:
> > +             mux_nb->original_index = mux->ops->get_parent(hw);
> > +             ret = mux->ops->set_parent(hw, mux_nb->bypass_index);
> > +             break;
> > +
> > +     case POST_RATE_CHANGE:
> > +     case ABORT_RATE_CHANGE:
>
> I agree with this change, entirely - but there's an issue here.
> If we enter ABORT_RATE_CHANGE, this means that "something has failed": now,
> what if the failure point was the PLL being unable to lock?

I think this is a valid concern. But the MediaTek clk driver library doesn't
actually check if the PLL locked or not. It simply sets it and returns.

Also, if the notifier weren't there, there'd be no transparent muxing
either, and the GPU would always be clocked from the PLL, locked or
not.

Considering that muxing away is temporary and transparent, muxing back
simply restores the system to the way the CCF thinks it is. If the PLL
fails to lock, we need other fixes or constraints.

> In that case, we would switch the parent back to a PLL that's not outputting
> any clock, crashing the GPU, or a bogus rate, potentially undervolting the GPU.

For MT8183, there is no other "safe" PLL. The stable ones run faster than
the lowest OPP.

> I think that the best idea here would be to do something like..
>
>         switch (event) {
>         case PRE_RATE_CHANGE:
>                 mux_nb->old_parent_idx = mux->ops->get_parent(hw);
>                 ret = mux->ops->set_parent(hw, mux_nb->safe_parent_idx);
>                 break;
>         case POST_RATE_CHANGE:
>                 ret = mux->ops->set_parent(hw, mux_nb->old_parent_idx);
>                 break;
>         case ABORT_RATE_CHANGE:
>                 ret = -EINVAL; /* or -ECANCELED, whatever... */
>                 break;
>         }
>
> > +             ret = mux->ops->set_parent(hw, mux_nb->original_index);
> > +             break;
> > +     }
> > +
> > +     return notifier_from_errno(ret);
> > +}
> > +
> > +int devm_mtk_clk_mux_notifier_register(struct device *dev, struct clk *clk,
> > +                                    struct mtk_mux_nb *mux_nb)
> > +{
> > +     mux_nb->nb.notifier_call = mtk_clk_mux_notifier_cb;
> > +
> > +     return devm_clk_notifier_register(dev, clk, &mux_nb->nb);
> > +}
> > +EXPORT_SYMBOL_GPL(devm_mtk_clk_mux_notifier_register);
> > +
> >   MODULE_LICENSE("GPL");
> > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > index 6539c58f5d7d..506e91125a3d 100644
> > --- a/drivers/clk/mediatek/clk-mux.h
> > +++ b/drivers/clk/mediatek/clk-mux.h
> > @@ -7,12 +7,14 @@
> >   #ifndef __DRV_CLK_MTK_MUX_H
> >   #define __DRV_CLK_MTK_MUX_H
> >
> > +#include <linux/notifier.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/types.h>
> >
> >   struct clk;
> >   struct clk_hw_onecell_data;
> >   struct clk_ops;
> > +struct device;
> >   struct device_node;
> >
> >   struct mtk_mux {
> > @@ -89,4 +91,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
> >   void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> >                             struct clk_hw_onecell_data *clk_data);
> >
> > +struct mtk_mux_nb {
> > +     struct notifier_block   nb;
> > +     const struct mtk_mux    *mux;
> > +
> > +     u8      bypass_index;   /* Which parent to temporarily use */
> > +     u8      original_index; /* Set by notifier callback */
>
> I think that the following names are more explanatory:
>
>         u8      safe_parent_idx;
>         u8      old_parent_idx;
>
> ...because I see this as a mechanism to switch the mux to a "safe" clock output
> and then back to the PLL (like it's done on some qcom clocks as well).

The names were taken from the sunxi-ng driver, which always muxed to a
crystal clock, so in a way was bypassing the PLL.

ChenYu

> You're free to ignore this comment, as this is, of course, just a personal opinion.
>
> Cheers,
> Angelo
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
