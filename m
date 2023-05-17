Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF69C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjienxD+S7+oWNo3+nJFIPGjNyMflLcf+h1Ao7e4eNg=; b=WmM8bS5UwHuLuvocadYN4X8PmH
	IjTYc56mH+FyH8D8NSurUiW4jvTEDJEeDN/L9nZ5IqPLb3VWXXs+F7apFuvmV2NEahKWJnjfAX2VN
	n1UwgSnjWsulkP6vI562zmZsnezChruZ2H9MCRgy9t3waJgSAPd1nIi7NWaOkJDq3sKFcuMd+fKXA
	ien6wtB0JmI2NbWlEGAfasRHvwyxvohDJ7jmArBUu9Uwm9omBS+a2haBefFUyieDD//hciC6i06BS
	A9KKEVj7gmz9kc8dM4Jt0r3U1t89r5TqQ2qudd0xkNMJJdJ4Qi4zIqZtYhnL+QsQdhN+/IJW6pqy3
	rXfxIJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGd5-009rRJ-0t;
	Wed, 17 May 2023 12:51:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGd2-009rQk-1C;
	Wed, 17 May 2023 12:51:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DDB063DD8;
	Wed, 17 May 2023 12:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734CAC433D2;
	Wed, 17 May 2023 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684327898;
	bh=2JoCzAya4ozHUzDjJra+EnUuUPNieFhbiHSZyLF00PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psTl8xOZaaVdlSpsfzROkdJ3SFvhphHBtGtz60jb/YMXr4VTHVXNht91DgJqAKtwM
	 H8sgLo39VR+p56amkVM+nizUQfoThZu3vREL8JG9oFCQqTcQvl5XAltpW5aIjg+VyD
	 SXMVUJckERKd+j3EukP8dpqLSfgIEoR3G9omf+hXqvZqa4axZsItV3gonpk6A8s/pN
	 aRgAqwHumvaCfTdfM+T1i/wkM1+WA1WCZDXLbBAa4slFyzUdR07YpZ1fzVfvgAKnkF
	 hRjaRUQDDdRbbO8HXsql899236rOEs5v2FskSLs7JyqngQT+3AHoxSsRmt0EUEYCTP
	 OSzvA1yy38gsw==
Date: Wed, 17 May 2023 18:21:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] phy: mediatek: Avoid floating point constants
Message-ID: <ZGTN1vWnxmaR/XKM@matsya>
References: <20230419122131.2167122-1-thierry.reding@gmail.com>
 <89583b89-ea8c-8096-b083-6ab773e6c281@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89583b89-ea8c-8096-b083-6ab773e6c281@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_055140_497346_27B95FCB 
X-CRM114-Status: GOOD (  26.69  )
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

On 17-05-23, 12:59, Jon Hunter wrote:
> Hi Vinod,
> 
> On 19/04/2023 13:21, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > When building with old versions of GCC (6.3 in this case), the compiler
> > stumbles over the floating point constants in this driver:
> > 
> > 	: In function ‘mtk_hdmi_pll_prepare’:
> > 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:23: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> > 	  } else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> > 
> > 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> > 	 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
> > 		    ^~~~~~~~~~~~~~~~~~~~
> > 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> > 
> > Fix this by switching to the KILO macro instead and multiplying the
> > constants by 1000 to get rid of the floating point.
> > 
> > Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > index abfc077fb0a8..b10af26cad2f 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > @@ -239,9 +239,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
> >   		txposdiv = 8;
> >   	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> >   		txposdiv = 4;
> > -	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
> > +	else if (tmds_clk >= 148350 * KILO && tmds_clk < 296700 * KILO)
> >   		txposdiv = 2;
> > -	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
> > +	else if (tmds_clk >= 296700 * KILO && tmds_clk <= 594 * MEGA)
> >   		txposdiv = 1;
> >   	else
> >   		return -EINVAL;
> > @@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> >   		clk_channel_bias = 0x34; /* 20mA */
> >   		impedance_en = 0xf;
> >   		impedance = 0x36; /* 100ohm */
> > -	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> > +	} else if (pixel_clk >= 74175 * KILO && pixel_clk <= 300 * MEGA) {
> >   		data_channel_bias = 0x34; /* 20mA */
> >   		clk_channel_bias = 0x2c; /* 16mA */
> >   		impedance_en = 0xf;
> >   		impedance = 0x36; /* 100ohm */
> > -	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
> > +	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74175 * KILO) {
> >   		data_channel_bias = 0x14; /* 10mA */
> >   		clk_channel_bias = 0x14; /* 10mA */
> >   		impedance_en = 0x0;
> 
> 
> This is breaking kernel compilation with older compilers such as GCC7. This
> is now in the mainline and older compilers cannot build the kernel with this
> driver enabled. The kernel docs say the min version supported is GCC 5.1
> currently.
> 
> Can we get this merged as a fix for v6.4?

Sorry I missed this one but I have already applied 03262a3f5b5b ("phy:
mediatek: rework the floating point comparisons to fixed point") and
this is in linux-next and should be hopefully in Linus's tree in next rc

Thanks
-- 
~Vinod

