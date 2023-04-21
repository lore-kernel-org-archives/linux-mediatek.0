Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FDC77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 22:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB9CO1O3ZiOZCJyEl0GBNbAHGnBbw66wtWbZnKs10ds=; b=QhOoifN01jdCa2KnMMVZr0lF5F
	ScPnLXdCZJv4FH3ZEBVSHOyONriGcKuZcrPe+vG5T3tEtUN+2AcL8VaEDxQy//YYryq+WRr7YJPLh
	M5YZ/qUajy0iAFf5petr6jmAz2DoR7UwpBuSrXfvY1b6LRp/moRrguuB53g/KVAXXtTloX5K/x8Gc
	NIjFJS5eYesw1N41DjZGDhBCpn1fhNEvsMhLooQVI1TniNRBu74dF04vw2NujTiYpcdiQNRnigyd0
	qDOjAQwZUqrDk1K+Q7KAgR8ao8U830SuJeQgqQdb7aZmRJvURb5MiUOCuvzZLYpfeYmch+0h0s71F
	N89RMxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppz0d-00Bvkr-0E;
	Fri, 21 Apr 2023 22:13:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppz0Z-00Bvjw-0d;
	Fri, 21 Apr 2023 22:13:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A4BD649A3;
	Fri, 21 Apr 2023 22:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB865C4339B;
	Fri, 21 Apr 2023 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682115213;
	bh=XZd3xOHh9hRBu/JySb+r9z3kK1JjV1tv32skF1cGDD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTwMl+eJzSMy03iFAPAUp2luKiUzmKPxD1vHfIkFe4Op2MvFaumks9ziuyiKumi0v
	 Kb/A8ohF449C24/uFul9iePPNOmLn95Zm4ndeWMsNRXj/rv9p/xW25pi4mfS/fVaTf
	 VFwB+RLND2DfSaBonTlBPJP1WiV8fiFmWzg4E84lUoQJzQ9GA+ndAvfyfCj0W1FnD4
	 m3EuUHMyJy4e15fVTJUwSxUh7WEUDFlfghF/VUXYforrGmxivzem48PrTb9o3XkUWl
	 qaF8VAirH/9KOwHFiHeOTm+Yga6UiorhrHPbmTSc+hc2glWjs/f1Eg5f/NB/e4vYra
	 wWAJqLWNq8X6g==
Date: Fri, 21 Apr 2023 15:13:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
Message-ID: <20230421221330.GA3657732@dev-arch.thelio-3990X>
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_151335_291641_B8DFA8D3 
X-CRM114-Status: GOOD (  20.22  )
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

On Fri, Apr 14, 2023 at 06:07:46PM +0200, Guillaume Ranquet wrote:
> The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
> by the kernel test robot.
> 
> Fix the issue by removing the variable altogether and testing out the
> return value of mtk_hdmi_pll_set_hw()
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can somebody pick this up? It fixes a rather obvious warning, which is
breaking clang builds (as evidenced by three versions of the same fix).

> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..054b73cb31ee 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
>  	u8 txpredivs[4] = { 2, 4, 6, 12 };
>  	u32 fbkdiv_low;
> -	int i, ret;
> +	int i;
>  
>  	pixel_clk = rate;
>  	tmds_clk = pixel_clk;
> @@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	if (!(digital_div <= 32 && digital_div >= 1))
>  		return -EINVAL;
>  
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +	return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>  			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>  			    txposdiv, digital_div);
> -	if (ret)
> -		return -EINVAL;
> -
> -	return 0;
>  }
>  
>  static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> 
> -- 
> 2.40.0
> 

