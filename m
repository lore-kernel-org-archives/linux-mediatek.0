Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A06BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibVf4fgUpsp094BSj+t/KspHP5qv1isTA1qw2IhaALE=; b=wwAcuPhO2u8CLx
	b3XBkTg20fM0tsI1oAm3DonBgBaNwQcq0Px+69cXVlR/USgJUatqJfgnV4f3hfYS0YraI2n/U7Uii
	MfI0RmilvaKnlRvzf8S23fHNhn3L51NRyaat0MTVI7Re3axxyZaHaFycgVoAA15xhT5tGX7Lp71fv
	4l09v+jLSF47PONpWHhgO8gKnCNxIKjHL9oE3q1q/0dDk/hk+NZA83gKMn+DpskCq2LJckNc81fqb
	e0hIYTGk2ydWha2MZaiW327GsEcXOXOqe5+4uhXrGL2tCkvw+qH05s0T9/ru87paPbZ3AZKzZQo/G
	LHVRvGJV8tR3LutkZ28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5vK-003YHN-Px; Mon, 23 May 2022 11:08:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4vc-0035Db-7O; Mon, 23 May 2022 10:04:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 695421F41C08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653300280;
 bh=nikwer9gVP1aMdWQqAPZU00MWdHcjPiQkcZmJpOI/6c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P7YTLX+Ym2FYe6eT9rDUdd8ETIPiIiYCbk00+vqVPBQtImH8hKHshZE/5KaFgW7Dq
 GloerK1d+zp5JuMNh3T+Z12lQNImk3xXtm4tSHjd1o5swfkAUyhztOu1cPGkMQQ2cK
 jecf4h2mzW29htMQYH1G42J4czNU3mvWlo49snE4tzvbOFqrQgKG//CkknAS7mr1mK
 DEDCkQTFIR7jPt8owr4oRvRmIeEv2Xt02dLr57SKdE7zz+kd2Cd+wmDOQE9+KUvU69
 TagWWRwuK470WQHtltpIUsHTLcJ2YpC9hDcJ5OfYZdZuxg3M8oSGKlxOlr9/7vGbUb
 kLl+OL6aZcglw==
Message-ID: <f6cd735b-2ba4-7456-684d-b20f0b46effe@collabora.com>
Date: Mon, 23 May 2022 12:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/4] clk: mediatek: mux: add clk notifier functions
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220523085923.1430470-1-wenst@chromium.org>
 <20220523085923.1430470-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523085923.1430470-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030444_685072_33BCF512 
X-CRM114-Status: GOOD (  32.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 10:59, Chen-Yu Tsai ha scritto:
> With device frequency scaling, the mux clock that (indirectly) feeds the
> device selects between a dedicated PLL, and some other stable clocks.
> 
> When a clk rate change is requested, the (normally) upstream PLL is
> reconfigured. It's possible for the clock output of the PLL to become
> unstable during this process.
> 
> To avoid causing the device to glitch, the mux should temporarily be
> switched over to another "stable" clock during the PLL rate change.
> This is done with clk notifiers.
> 
> This patch adds common functions for notifiers to temporarily and
> transparently reparent mux clocks.
> 
> This was loosely based on commit 8adfb08605a9 ("clk: sunxi-ng: mux: Add
> clk notifier functions").
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/clk/mediatek/clk-mux.c | 42 ++++++++++++++++++++++++++++++++++
>   drivers/clk/mediatek/clk-mux.h | 15 ++++++++++++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index cd5f9fd8cb98..f84a5a753c09 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -4,6 +4,7 @@
>    * Author: Owen Chen <owen.chen@mediatek.com>
>    */
>   
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/compiler_types.h>
>   #include <linux/container_of.h>
> @@ -259,4 +260,45 @@ void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
>   }
>   EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
>   
> +/*
> + * This clock notifier is called when the frequency of the of the parent
> + * PLL clock is to be changed. The idea is to switch the parent to a
> + * stable clock, such as the main oscillator, while the PLL frequency
> + * stabilizes.
> + */
> +static int mtk_clk_mux_notifier_cb(struct notifier_block *nb,
> +				   unsigned long event, void *_data)
> +{
> +	struct clk_notifier_data *data = _data;
> +	struct mtk_mux_nb *mux_nb = to_mtk_mux_nb(nb);
> +	const struct mtk_mux *mux = mux_nb->mux;
> +	struct clk_hw *hw;
> +	int ret = 0;
> +
> +	hw = __clk_get_hw(data->clk);
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		mux_nb->original_index = mux->ops->get_parent(hw);
> +		ret = mux->ops->set_parent(hw, mux_nb->bypass_index);
> +		break;
> +
> +	case POST_RATE_CHANGE:
> +	case ABORT_RATE_CHANGE:

I agree with this change, entirely - but there's an issue here.
If we enter ABORT_RATE_CHANGE, this means that "something has failed": now,
what if the failure point was the PLL being unable to lock?

In that case, we would switch the parent back to a PLL that's not outputting
any clock, crashing the GPU, or a bogus rate, potentially undervolting the GPU.

I think that the best idea here would be to do something like..

	switch (event) {
	case PRE_RATE_CHANGE:
		mux_nb->old_parent_idx = mux->ops->get_parent(hw);
		ret = mux->ops->set_parent(hw, mux_nb->safe_parent_idx);
		break;
	case POST_RATE_CHANGE:
		ret = mux->ops->set_parent(hw, mux_nb->old_parent_idx);
		break;
	case ABORT_RATE_CHANGE:
		ret = -EINVAL; /* or -ECANCELED, whatever... */
		break;
	}

> +		ret = mux->ops->set_parent(hw, mux_nb->original_index);
> +		break;
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +int devm_mtk_clk_mux_notifier_register(struct device *dev, struct clk *clk,
> +				       struct mtk_mux_nb *mux_nb)
> +{
> +	mux_nb->nb.notifier_call = mtk_clk_mux_notifier_cb;
> +
> +	return devm_clk_notifier_register(dev, clk, &mux_nb->nb);
> +}
> +EXPORT_SYMBOL_GPL(devm_mtk_clk_mux_notifier_register);
> +
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index 6539c58f5d7d..506e91125a3d 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -7,12 +7,14 @@
>   #ifndef __DRV_CLK_MTK_MUX_H
>   #define __DRV_CLK_MTK_MUX_H
>   
> +#include <linux/notifier.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
>   
>   struct clk;
>   struct clk_hw_onecell_data;
>   struct clk_ops;
> +struct device;
>   struct device_node;
>   
>   struct mtk_mux {
> @@ -89,4 +91,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>   void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
>   			      struct clk_hw_onecell_data *clk_data);
>   
> +struct mtk_mux_nb {
> +	struct notifier_block	nb;
> +	const struct mtk_mux	*mux;
> +
> +	u8	bypass_index;	/* Which parent to temporarily use */
> +	u8	original_index;	/* Set by notifier callback */

I think that the following names are more explanatory:

	u8	safe_parent_idx;
	u8	old_parent_idx;

...because I see this as a mechanism to switch the mux to a "safe" clock output
and then back to the PLL (like it's done on some qcom clocks as well).

You're free to ignore this comment, as this is, of course, just a personal opinion.

Cheers,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
