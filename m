Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D9C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYXPRtlyuZWkjJkmWnNCNb2BL2D6zKPIk8f2SmGh4Io=; b=m3f/n6vwtXr9F/j62qVTxb2hxx
	jRUgM3cBaSSC0n/iiIM1JRc6JTFqxdRXWw11mimTGTAC/rCskfr1ONqpNQl+PtbytjHdxMWsLNceU
	M747afyvIo6J7VMMLDkyQwiYQvrTRzSQzje4rkJd+mgk+kfs6xxMto7kQj8erZNvPdKRZ/csvODco
	6UhJavKN8Dh2Cg9PfH4g7Zuzm8oW0253vG4TeTwGo0mzkS7P6OE2VnWTvPnBlYNOBa4BsnC5zggW9
	Zh6b2VoLACGJ0D8fZyRyXJVYEjaH4P2klvf1RhGz3beK0kcApaccBOHujH8ib3+fklikyQnFbLih+
	MkItseYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtSk-00DLAd-Im; Wed, 22 Feb 2023 18:03:30 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtSS-00DL5J-VF; Wed, 22 Feb 2023 18:03:14 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUtRz-0008DW-1e;
	Wed, 22 Feb 2023 19:02:43 +0100
Date: Wed, 22 Feb 2023 18:02:40 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	wenst@chromium.org, johnson.wang@mediatek.com,
	miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
	fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
	rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
	sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com, granquet@baylibre.com,
	pablo.sun@mediatek.com, sean.wang@mediatek.com,
	chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 34/54] clk: mediatek: mt7986-eth: Migrate to common
 probe mechanism
Message-ID: <Y/ZYwOoHhO0328qY@makrotopia.org>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
 <20230222092543.19187-35-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222092543.19187-35-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_100313_024857_DAEF3F31 
X-CRM114-Status: GOOD (  18.71  )
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

On Wed, Feb 22, 2023 at 10:25:23AM +0100, AngeloGioacchino Del Regno wrote:
> Convert this driver to use the common mtk_clk_simple_probe() mechanism.
> While at it, also remove __initconst annotations (as these structures
> are used also at runtime).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Daniel Golle <daniel@makrotopia.org>
(on BananaPi BPi-R3)

> ---
>  drivers/clk/mediatek/clk-mt7986-eth.c | 83 +++++++++++----------------
>  1 file changed, 32 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7986-eth.c b/drivers/clk/mediatek/clk-mt7986-eth.c
> index e04bc6845ea6..138ba0a47221 100644
> --- a/drivers/clk/mediatek/clk-mt7986-eth.c
> +++ b/drivers/clk/mediatek/clk-mt7986-eth.c
> @@ -25,7 +25,7 @@ static const struct mtk_gate_regs sgmii0_cg_regs = {
>  #define GATE_SGMII0(_id, _name, _parent, _shift)		\
>  	GATE_MTK(_id, _name, _parent, &sgmii0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
> -static const struct mtk_gate sgmii0_clks[] __initconst = {
> +static const struct mtk_gate sgmii0_clks[] = {
>  	GATE_SGMII0(CLK_SGMII0_TX250M_EN, "sgmii0_tx250m_en", "top_xtal", 2),
>  	GATE_SGMII0(CLK_SGMII0_RX250M_EN, "sgmii0_rx250m_en", "top_xtal", 3),
>  	GATE_SGMII0(CLK_SGMII0_CDR_REF, "sgmii0_cdr_ref", "top_xtal", 4),
> @@ -41,7 +41,7 @@ static const struct mtk_gate_regs sgmii1_cg_regs = {
>  #define GATE_SGMII1(_id, _name, _parent, _shift)		\
>  	GATE_MTK(_id, _name, _parent, &sgmii1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
> -static const struct mtk_gate sgmii1_clks[] __initconst = {
> +static const struct mtk_gate sgmii1_clks[] = {
>  	GATE_SGMII1(CLK_SGMII1_TX250M_EN, "sgmii1_tx250m_en", "top_xtal", 2),
>  	GATE_SGMII1(CLK_SGMII1_RX250M_EN, "sgmii1_rx250m_en", "top_xtal", 3),
>  	GATE_SGMII1(CLK_SGMII1_CDR_REF, "sgmii1_cdr_ref", "top_xtal", 4),
> @@ -57,7 +57,7 @@ static const struct mtk_gate_regs eth_cg_regs = {
>  #define GATE_ETH(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &eth_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
> -static const struct mtk_gate eth_clks[] __initconst = {
> +static const struct mtk_gate eth_clks[] = {
>  	GATE_ETH(CLK_ETH_FE_EN, "eth_fe_en", "netsys_2x_sel", 6),
>  	GATE_ETH(CLK_ETH_GP2_EN, "eth_gp2_en", "sgm_325m_sel", 7),
>  	GATE_ETH(CLK_ETH_GP1_EN, "eth_gp1_en", "sgm_325m_sel", 8),
> @@ -65,56 +65,37 @@ static const struct mtk_gate eth_clks[] __initconst = {
>  	GATE_ETH(CLK_ETH_WOCPU0_EN, "eth_wocpu0_en", "netsys_mcu_sel", 15),
>  };
>  
> -static void __init mtk_sgmiisys_0_init(struct device_node *node)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	int r;
> -
> -	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(sgmii0_clks));
> -
> -	mtk_clk_register_gates(NULL, node, sgmii0_clks,
> -			       ARRAY_SIZE(sgmii0_clks), clk_data);
> -
> -	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -	if (r)
> -		pr_err("%s(): could not register clock provider: %d\n",
> -		       __func__, r);
> -}
> -CLK_OF_DECLARE(mtk_sgmiisys_0, "mediatek,mt7986-sgmiisys_0",
> -	       mtk_sgmiisys_0_init);
> -
> -static void __init mtk_sgmiisys_1_init(struct device_node *node)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	int r;
> -
> -	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(sgmii1_clks));
> -
> -	mtk_clk_register_gates(NULL, node, sgmii1_clks,
> -			       ARRAY_SIZE(sgmii1_clks), clk_data);
> -
> -	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -
> -	if (r)
> -		pr_err("%s(): could not register clock provider: %d\n",
> -		       __func__, r);
> -}
> -CLK_OF_DECLARE(mtk_sgmiisys_1, "mediatek,mt7986-sgmiisys_1",
> -	       mtk_sgmiisys_1_init);
> +static const struct mtk_clk_desc eth_desc = {
> +	.clks = eth_clks,
> +	.num_clks = ARRAY_SIZE(eth_clks),
> +};
>  
> -static void __init mtk_ethsys_init(struct device_node *node)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	int r;
> +static const struct mtk_clk_desc sgmii0_desc = {
> +	.clks = sgmii0_clks,
> +	.num_clks = ARRAY_SIZE(sgmii0_clks),
> +};
>  
> -	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(eth_clks));
> +static const struct mtk_clk_desc sgmii1_desc = {
> +	.clks = sgmii1_clks,
> +	.num_clks = ARRAY_SIZE(sgmii1_clks),
> +};
>  
> -	mtk_clk_register_gates(NULL, node, eth_clks, ARRAY_SIZE(eth_clks), clk_data);
> +static const struct of_device_id of_match_clk_mt7986_eth[] = {
> +	{ .compatible = "mediatek,mt7986-ethsys", .data = &eth_desc },
> +	{ .compatible = "mediatek,mt7986-sgmiisys_0", .data = &sgmii0_desc },
> +	{ .compatible = "mediatek,mt7986-sgmiisys_1", .data = &sgmii1_desc },
> +	{ /* sentinel */ }
> +};
>  
> -	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +static struct platform_driver clk_mt7986_eth_drv = {
> +	.driver = {
> +		.name = "clk-mt7986-eth",
> +		.of_match_table = of_match_clk_mt7986_eth,
> +	},
> +	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
> +};
> +module_platform_driver(clk_mt7986_eth_drv);
>  
> -	if (r)
> -		pr_err("%s(): could not register clock provider: %d\n",
> -		       __func__, r);
> -}
> -CLK_OF_DECLARE(mtk_ethsys, "mediatek,mt7986-ethsys", mtk_ethsys_init);
> +MODULE_DESCRIPTION("MediaTek MT7986 Ethernet clocks driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 
> 

