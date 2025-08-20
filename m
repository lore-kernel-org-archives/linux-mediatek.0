Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38706CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvWROpBEvhI9Tv+9ZqwNAydOJR1yKRjRd1nUvFdCDw=; b=t9Yd5a0TvN/UZ9/OiBvj95CKwe
	EX6fVIph9Y5xYNn+yhbDuIb2m9fVJjztlNrAAXv8B3ZAsrqOQ3fkHWiAIWI4FQFK18gsmSNFegs+F
	DNjH3fya/XS0cMWbQZumxarwzFBa6UXRTCKUjuiSgxu0P/sePxUHPD3kOioKj9nmjdiRNKEZsoeFn
	jD9tAMoZ7YxFSivKw9RS7SjcXfISn6G2/ltKug3M695x11nR8YNhUNUyUlL7AnJKcWMd9aaWRAVyF
	xbm6IwRP/4hhpoLex6YtrR1MZcZTKfCUINaop2odN03myXk/3hrXpcZRzZSXdWHWnnPTebJwddex4
	AEza1neA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopm9-0000000EuIh-3gZ8;
	Wed, 20 Aug 2025 20:51:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolgp-0000000EOpt-0hxM;
	Wed, 20 Aug 2025 16:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 953CC601D7;
	Wed, 20 Aug 2025 16:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF51C4CEE7;
	Wed, 20 Aug 2025 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755707370;
	bh=Qzu3sAyj5y1ZHEYtAgX6Nl+Q7wQ4tl5rXdQK2r2hq9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbgkpQOOkJMnf7YOfm3L+2WNCbvN5KEBLTDdwMgR39opZMxwb3V5MK73vcbQHirnK
	 WevPSToBA1Z2Bd1BJLSfJUjYuaTPfwrbFLBngxvVkBwusojgB7i28p0pf2CAjQGOTI
	 OWGI4RYaIQWxIe4yHc/B2L9MU3Oc48+TlxaqVGOJ28GF/EveSvbMI88t5jJUz/4gdL
	 nf1y1c9dXmjFaPj6ZVW4UfP4MnM2Kun7XmhFDsJkrQBpw2OmE8LzrNOto2vNhkkKLu
	 UZiKOWNEGnG9LzNAeH6ukYhQHtK47/+VD6Z4TrSDqQmwMgcGIcapZ+oEPd9Sevi3CG
	 OMAOYwUjQ3ETg==
Date: Wed, 20 Aug 2025 21:59:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Message-ID: <aKX35U4jX55W3W61@vaman>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
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

On 10-08-25, 18:45, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
>  	usleep_range(80, 100);
>  }
>  
> -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -				    unsigned long *parent_rate)
> +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
>  {
> -	return rate;
> +	return 0;

This does not sound correct to me? should this not check the requested
rate?

>  }
>  
>  static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
>  	.prepare = mtk_hdmi_pll_prepare,
>  	.unprepare = mtk_hdmi_pll_unprepare,
>  	.set_rate = mtk_hdmi_pll_set_rate,
> -	.round_rate = mtk_hdmi_pll_round_rate,
> +	.determine_rate = mtk_hdmi_pll_determine_rate,
>  	.recalc_rate = mtk_hdmi_pll_recalc_rate,
>  };
>  
> 
> -- 
> 2.50.1

-- 
~Vinod

