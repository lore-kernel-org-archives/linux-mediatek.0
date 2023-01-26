Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB28CC54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmrQeacXzizb0P03YbyZaPk3g4XakrU1C5asaPGMTWc=; b=gFlpYkCkfHI22iI6Zzj7vMTGB4
	FehJiPbut2uJEJ33rWFyfMkHe462fdrTbi364/3p3bBDvYko5rI8ifTr+rTn9lXEGcCQlG8F+EDj0
	pl6wl/oscYFUPYdQnsCaODF/ZbeVIpYWIM14H8uw4NTAhAcqcUA6h3SOS+j9Fm3lwxF56ikOwREFx
	arfmXf4TKsn5WeUTn580FXbsM0fe4YCL/LEzZqq/V8BAqGYxmopoJJQRK0ZVDzHxx3YlwkoOMmkOw
	fUm04c1oMJhX+Kyo+NLcBCMnhrrdpJhgo+0c+i+Asf6sihlm/mPKomhTZEwVGFgqBc34nIpItC20Z
	+OAJQlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKspd-009VWO-Bn; Thu, 26 Jan 2023 03:21:45 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKspT-009VVi-2K; Thu, 26 Jan 2023 03:21:36 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pKspJ-00049s-1B;
	Thu, 26 Jan 2023 04:21:25 +0100
Date: Thu, 26 Jan 2023 03:21:21 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Jianhui Zhao <zhaojh329@gmail.com>
Subject: Re: [PATCH v4 3/3] clk: mediatek: add MT7981 clock support
Message-ID: <Y9HxsXOtqBg5JWpI@makrotopia.org>
References: <cover.1674401764.git.daniel@makrotopia.org>
 <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
 <b204674234451a9ab81e834b90244d82.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b204674234451a9ab81e834b90244d82.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_192135_126737_2BF5E252 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, Jan 25, 2023 at 06:23:16PM -0800, Stephen Boyd wrote:
> Quoting Daniel Golle (2023-01-22 07:44:00)
> > +       GATE_SGMII1(CLK_SGM1_CK1_EN, "sgm1_ck1_en", "usb_ln0", 4),
> > +       GATE_SGMII1(CLK_SGM1_CDR_CK1_EN, "sgm1_cdr_ck1_en", "usb_cdr", 5),
> > +};
> > +
> > +static const struct mtk_gate_regs eth_cg_regs = {
> > +       .set_ofs = 0x30,
> > +       .clr_ofs = 0x30,
> > +       .sta_ofs = 0x30,
> > +};
> > +
> > +#define GATE_ETH(_id, _name, _parent, _shift) {        \
> > +               .id = _id,                              \
> > +               .name = _name,                          \
> > +               .parent_name = _parent,                 \
> > +               .regs = &eth_cg_regs,                   \
> > +               .shift = _shift,                        \
> > +               .ops = &mtk_clk_gate_ops_no_setclr_inv, \
> > +       }
> > +
> > +static const struct mtk_gate eth_clks[] __initconst = {
> > +       GATE_ETH(CLK_ETH_FE_EN, "eth_fe_en", "netsys_2x", 6),
> > +       GATE_ETH(CLK_ETH_GP2_EN, "eth_gp2_en", "sgm_325m", 7),
> > +       GATE_ETH(CLK_ETH_GP1_EN, "eth_gp1_en", "sgm_325m", 8),
> > +       GATE_ETH(CLK_ETH_WOCPU0_EN, "eth_wocpu0_en", "netsys_wed_mcu", 15),
> > +};
> > +
> > +static const struct mtk_clk_desc eth_desc = {
> > +       .clks = eth_clks,
> > +       .num_clks = ARRAY_SIZE(eth_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc sgmii0_desc = {
> > +       .clks = sgmii0_clks,
> > +       .num_clks = ARRAY_SIZE(sgmii0_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc sgmii1_desc = {
> > +       .clks = sgmii1_clks,
> > +       .num_clks = ARRAY_SIZE(sgmii1_clks),
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt7981_eth[] = {
> > +       { .compatible = "mediatek,mt7981-ethsys", .data = &eth_desc },
> > +       { .compatible = "mediatek,mt7981-sgmiisys_0", .data = &sgmii0_desc },
> > +       { .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
> > +       { /* sentinel */ }
> > +};
> 
> Actually not applied
> 
> WARNING: DT compatible string "mediatek,mt7981-ethsys" appears un-documented -- check ./Documentation/devicetree/bindings/
> #291: FILE: drivers/clk/mediatek/clk-mt7981-eth.c:103:
> +       { .compatible = "mediatek,mt7981-ethsys", .data = &eth_desc },
> 
> WARNING: DT compatible string "mediatek,mt7981-sgmiisys_0" appears un-documented -- check ./Documentation/devicetree/bindings/
> #292: FILE: drivers/clk/mediatek/clk-mt7981-eth.c:104:
> +       { .compatible = "mediatek,mt7981-sgmiisys_0", .data = &sgmii0_desc },
> 
> WARNING: DT compatible string "mediatek,mt7981-sgmiisys_1" appears un-documented -- check ./Documentation/devicetree/bindings/
> #293: FILE: drivers/clk/mediatek/clk-mt7981-eth.c:105:
> +       { .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
> 
> WARNING: DT compatible string "mediatek,mt7981-infracfg" appears un-documented -- check ./Documentation/devicetree/bindings/
> #506: FILE: drivers/clk/mediatek/clk-mt7981-infracfg.c:195:
> +       { .compatible = "mediatek,mt7981-infracfg", .data = &infracfg_desc },
> 
> Is there a binding update missing?

Right, I forgot to git add the changes in
Documentation/devicetree/bindings/arm/mediatek/, not very smart. I'll
resend with those included in a moment from now.

