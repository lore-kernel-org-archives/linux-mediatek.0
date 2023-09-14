Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB0DEDE99C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKFo4OmrD7JjsKU826Y0a5KsoIxlE2wDxb2Ojf4c1/w=; b=gBUTPaDWLkLVEJSGI5WhlV4cm6
	M38dB+as903xMD16y6M9zL5C4mi5mYc1yDk8beckuFin+6u2kJ+uUVh9hb/ak9qBA5o4H3uIBOg96
	eP3wqwvdvtPhXwmghDPQj1NThyke5mFqQT/TCwpMYlpvIo0xc65cHL3uin293wVpkHOxLG/SDYV8m
	VaZa2eF2NM7MS8CNv6CslQkV7/b1f2eaGVF/PDe0+cZ8Cgjgr/bwUL3VBTM7ELxe3hk7vJQIKC7St
	GJ6dcJ4zR8yu6/zsHl0rtn8mucaW1BmIMKOtLC0pb27eduH4vqyqS/csxmV3/dEsiLCSwKFymOXwi
	Z8FpuC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiKk-007ntU-0l;
	Thu, 14 Sep 2023 09:08:22 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiKg-007nod-2r;
	Thu, 14 Sep 2023 09:08:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qgiKE-0006O5-1c;
	Thu, 14 Sep 2023 09:07:50 +0000
Date: Thu, 14 Sep 2023 10:07:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <ZQLNWHKlIZNd7x4l@makrotopia.org>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
 <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_020818_942396_7E8C3507 
X-CRM114-Status: GOOD (  29.59  )
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

On Wed, Sep 13, 2023 at 04:00:53PM +0200, AngeloGioacchino Del Regno wrote:
> Il 27/08/23 04:13, Daniel Golle ha scritto:
> > Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> > be enabled. One of them, the pmic clk, is only enabled in case
> > 'mediatek,have-pmic' is also set which has other consequences which
> > are not desired in this case.
> > 
> > Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> > is not present and the bus is not used to connect to a pmic, but may
> > still require to enable the pmic clock.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 1a9b5a068ef1b..a8b5719c33729 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
> >   	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
> >   		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
> > +	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
> > +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> > +		dev_err(&pdev->dev, "cannot get pmic clock\n");
> > +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
> > +	}
> > +
> >   	if (i2c->have_pmic) {
> 
> ...but you're not changing speed_clk if !i2c->have_pmic, I'm not sure that
> this will work correctly. Perhaps you wanted to also set speed_clk if the
> clock is present?

No, if I wanted that I could have used the existing 'mediatek,have-pmic'
property -- however, all needed e.g. on MT7981 is to make sure the
clock is enabled, but still use I2C_MT65XX_CLK_MAIN as speed_clk.

> 
> if (IS_ERR...) {
> 	error handling
> } else if (clk is present)
> 	speed_clk = I2C_MT65XX_CLK_PMIC;
> 
> if (have_pmic && !clk_is_present)
> 	error
> 
> Regards,
> Angelo
> 
> > -		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
> > -		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> > +		if (!i2c->clocks[I2C_MT65XX_CLK_PMIC].clk) {
> >   			dev_err(&pdev->dev, "cannot get pmic clock\n");
> > -			return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
> > +			return -ENODEV;
> >   		}
> >   		speed_clk = I2C_MT65XX_CLK_PMIC;
> >   	} else {
> > -		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = NULL;
> >   		speed_clk = I2C_MT65XX_CLK_MAIN;
> >   	}
> 
> 

