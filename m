Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD0DCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWXUo8yCgMuDx89RGa0kAK4HpnZZTCnBiMnPnYY2pRQ=; b=jkSotBs/QEux90Q9z9kGRiqmqG
	kIIpueVGQvFEzzzUEDz1xhiiOSaynQKWkI0cxe3PaXTiYNc7yvaq/4NzSS4sj6tMIdhXzfd6hWPUY
	HK+XoVko8fWAovj0wm+enaK06EUNDmiXn865J83ZxsGqXXvHNO8WgOEW5040PTwbNGSFc42/CH5EA
	uYpv6jDEgq7vWyCuS+WVCe5ih/4P5AAj4XqQ9W1xVBqXeEbjwADHMv3Da+5uSGSmkzSeuY889EtIh
	IiAZiunigJLeSN08FUdrwyT4Ps4B+xvhDOyEf1eS4xHqHI0HIlIe8IkYc+n5D33YwQykH1Ovv845q
	Ke+hF7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quofF-006YLN-1w;
	Mon, 23 Oct 2023 06:43:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quofA-006YJ4-1R
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 06:43:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so407549966b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Oct 2023 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698043422; x=1698648222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWXUo8yCgMuDx89RGa0kAK4HpnZZTCnBiMnPnYY2pRQ=;
        b=UxgL4vtYyYd1r9H7+ZrVGlWGuOJwc7We1OlJVeTD/V9V0GvE7ZnMVeDNosTBXs/Yl1
         Zyvr11Ky0mPh+xiAP5bi+dg/T5vzTCgc8YP0j1HhofMYSBENmGJgzrimU6W/bkK2DszA
         6LNEH0sC6ULSbZFoF195vH7Jgru5i2pv4C2KAQhdoF8tluSRMi84CAlgg/VwjuYttHd8
         jhcx9giNwPF0NQRQrRxruJCbOthftcGjmvuCQ4xx7Xt0Jwtnz0aD7ARlqrcVyf096q3r
         KDKifigfalxZebYK/otq1WZgabBZJNlDNknawcIXY3y9nIe4WIyWsH0he46K/lAA9bYw
         BtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043422; x=1698648222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWXUo8yCgMuDx89RGa0kAK4HpnZZTCnBiMnPnYY2pRQ=;
        b=j7IXk1yvzBZsaBLbr7WEA3n8jl3xclSvgoEC07aEbvX0q8Uafe0VbKOV1qGq8+Aa6f
         kTbuRCy6qb6Dt7HKP4Dws4oObS26qzeY91ZlcrgKGBmKZ8afgmx7rYymuB46LUNaj4BT
         fazQvU8563Vmg6+RFFzi91EqMDMF0gLMK+bYzLEfqo2FvKS7FYLQQBSkTONMeVQWy1S3
         SB+eQ9yvDyQ9LugkCKv8AdzjRlCEY88lqLKpqjTWqN8MzihdRy3jaeQVIjNUALJEaBKN
         dELcb/5B/tEGepteL/oti3Rw+15LvgO+OeV1ytfRsMxLIsLzrQwGyzWGDGGS1jIbFytA
         tHdg==
X-Gm-Message-State: AOJu0YwhnqbZm1HSs/D2JVezh4dtRPmOOiKlp1FPFn4pYWhJFJhrBx41
	F9Duy/atRHOetoOeZJFxXVDddw==
X-Google-Smtp-Source: AGHT+IE2xY1XLdZ1hoY/wzt/KAdqJlDerMt0ySpo7bm5amO3+RX0ik8kud4565r/9WcFz81IXd6xhg==
X-Received: by 2002:a17:906:db0a:b0:9bf:270d:8c37 with SMTP id xj10-20020a170906db0a00b009bf270d8c37mr6654997ejb.58.1698043421658;
        Sun, 22 Oct 2023 23:43:41 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:81ba:bcf:e8b4:ca:c434])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906050c00b00977eec7b7e8sm6070287eja.68.2023.10.22.23.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:43:40 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:43:39 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
	wenst@chromium.org, amergnat@baylibre.com, yangyingliang@huawei.com,
	u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] clk: mediatek: clk-mux: Support custom parent
 indices for muxes
Message-ID: <20231023064339.xglriq6ycedjlyd4@blmsp>
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
 <20231018103546.48174-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231018103546.48174-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_234344_679793_E1AACBE1 
X-CRM114-Status: GOOD (  31.18  )
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

Hi Angelo,

On Wed, Oct 18, 2023 at 12:35:45PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
> 
> Example:
> - MUX1 (all parents)
>   - parent1; idx=0
>   - parent2; idx=1
>   - parent3; idx=2
> 
> - MUX1 (wanted parents)
>   - parent1; idx=0
>   - parent3; idx=2
> 
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
> 
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
> 
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 14 +++++++++++
>  drivers/clk/mediatek/clk-mux.h | 43 ++++++++++++++++++++++++++++++----
>  2 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index c93bc7f926e5..60990296450b 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -89,6 +89,17 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
>  	regmap_read(mux->regmap, mux->data->mux_ofs, &val);
>  	val = (val >> mux->data->mux_shift) & mask;
>  
> +	if (mux->data->parent_index) {
> +		int i;
> +
> +		for (i = 0; i < mux->data->num_parents; i++)
> +			if (mux->data->parent_index[i] == val)
> +				return i;
> +
> +		/* Not found: return an impossible index to generate error */
> +		return mux->data->num_parents + 1;
> +	}
> +
>  	return val;
>  }
>  
> @@ -104,6 +115,9 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
>  	else
>  		__acquire(mux->lock);
>  
> +	if (mux->data->parent_index)
> +		index = mux->data->parent_index[index];
> +
>  	regmap_read(mux->regmap, mux->data->mux_ofs, &orig);
>  	val = (orig & ~(mask << mux->data->mux_shift))
>  			| (index << mux->data->mux_shift);
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index 7ecb963b0ec6..943ad1d7ce4b 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -21,6 +21,7 @@ struct mtk_mux {
>  	int id;
>  	const char *name;
>  	const char * const *parent_names;
> +	const u8 *parent_index;
>  	unsigned int flags;

I think at some point it would be nice to have a documentation of these
fields.

>  
>  	u32 mux_ofs;
> @@ -37,9 +38,10 @@ struct mtk_mux {
>  	signed char num_parents;
>  };
>  
> -#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
> -			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> -			_gate, _upd_ofs, _upd, _flags, _ops) {		\
> +#define __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,		\
> +			 _num_parents, _mux_ofs, _mux_set_ofs,		\
> +			 _mux_clr_ofs, _shift, _width, _gate, _upd_ofs,	\
> +			 _upd, _flags, _ops) {				\
>  		.id = _id,						\
>  		.name = _name,						\
>  		.mux_ofs = _mux_ofs,					\
> @@ -51,11 +53,28 @@ struct mtk_mux {
>  		.gate_shift = _gate,					\
>  		.upd_shift = _upd,					\
>  		.parent_names = _parents,				\
> -		.num_parents = ARRAY_SIZE(_parents),			\
> +		.parent_index = _paridx,				\
> +		.num_parents = _num_parents,				\

I was wondering why you moved the ARRAY_SIZE() to the outer macros and
add another argument to the already huge list of arguments? I couldn't
find a use-case for this in the patches you sent.

Best,
Markus

>  		.flags = _flags,					\
>  		.ops = &_ops,						\
>  	}
>  
> +#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
> +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> +			_gate, _upd_ofs, _upd, _flags, _ops)		\
> +		__GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
> +			NULL, ARRAY_SIZE(_parents), _mux_ofs,		\
> +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> +			_gate, _upd_ofs, _upd, _flags, _ops)		\
> +
> +#define GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents, _paridx,	\
> +			 _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
> +			 _width, _gate, _upd_ofs, _upd, _flags, _ops)	\
> +		__GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
> +			_paridx, ARRAY_SIZE(_paridx), _mux_ofs,		\
> +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> +			_gate, _upd_ofs, _upd, _flags, _ops)		\
> +
>  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
>  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>  
> @@ -67,6 +86,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>  			_gate, _upd_ofs, _upd, _flags,			\
>  			mtk_mux_gate_clr_set_upd_ops)
>  
> +#define MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,	\
> +			_paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
> +			_shift, _width, _gate, _upd_ofs, _upd, _flags)	\
> +		GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,	\
> +			_paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
> +			_shift, _width, _gate, _upd_ofs, _upd, _flags,	\
> +			mtk_mux_gate_clr_set_upd_ops)
> +
>  #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,		\
>  			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
>  			_gate, _upd_ofs, _upd)				\
> @@ -75,6 +102,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>  			_width, _gate, _upd_ofs, _upd,			\
>  			CLK_SET_RATE_PARENT)
>  
> +#define MUX_GATE_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,	\
> +			_mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
> +			_width, _gate, _upd_ofs, _upd)			\
> +		MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name,		\
> +			_parents, _paridx, _mux_ofs, _mux_set_ofs,	\
> +			_mux_clr_ofs, _shift, _width, _gate, _upd_ofs,	\
> +			_upd, CLK_SET_RATE_PARENT)
> +
>  #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
>  			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
>  			_upd_ofs, _upd)					\
> -- 
> 2.42.0
> 

