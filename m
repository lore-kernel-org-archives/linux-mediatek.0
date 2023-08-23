Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4243EC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQP21UiWnaaGe2w8JS+zK9Z7JfR5YDc7pI0zYHd0YXk=; b=D+/x2ILEfv8J68I3Y6+1JzPENq
	ItJEUSi8E+j0AjIVlg0IwkagtUQWXEHZ3QXUcLIweyj7UnKX1S+dljhPSg3fdjmIowYORidEV4WDL
	Oa70f9BK4my4WIS0L8vA3354jR2wouZzSlkhrYGUs8uTHw420kZLvFPWvfTXDBIxh4L7BT7TARb/I
	Q9zFlarxRDWwqEf3ZKtpReLRiZqpuumiVqR+so1xRW+ul+YV0IPKsKI1U0NTMRg1YWJuruEaPjsfZ
	ySRVTUO25owOzWl04YuBtg0r2X9xAqleubqJ2tO4vNQPp00RkGjH10JaawjcjoGvsKGlkgAu9sicc
	+3uID3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrQZ-001BwF-0e;
	Wed, 23 Aug 2023 17:13:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrQU-001BvA-19;
	Wed, 23 Aug 2023 17:13:52 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RWCTW26MVz6HJh9;
	Thu, 24 Aug 2023 01:13:03 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 18:13:45 +0100
Date: Wed, 23 Aug 2023 18:13:44 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Serge Semin <fancer.lancer@gmail.com>
CC: Li Zetao <lizetao1@huawei.com>, <andrew@aj.id.au>,
	<angelogioacchino.delregno@collabora.com>, <avifishman70@gmail.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <benjaminfair@google.com>,
	<broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<florian.fainelli@broadcom.com>, <heiko@sntech.de>, <jbrunet@baylibre.com>,
	<joel@jms.id.au>, <khilman@baylibre.com>, <linus.walleij@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<neil.armstrong@linaro.org>, <olteanv@gmail.com>, <openbmc@lists.ozlabs.org>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <tali.perry1@gmail.com>,
	<tmaimon77@gmail.com>, <venture@google.com>, <yuenn@google.com>
Subject: Re: [PATCH -next v2 11/25] spi: dw-bt1: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230823181344.000026bd@Huawei.com>
In-Reply-To: <xxosi2ymo7otqyfbmjlubezzedqw6ulwwhdmbdjbto7yaqw673@q673weupq67y>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
	<20230823133938.1359106-1-lizetao1@huawei.com>
	<20230823133938.1359106-12-lizetao1@huawei.com>
	<xxosi2ymo7otqyfbmjlubezzedqw6ulwwhdmbdjbto7yaqw673@q673weupq67y>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_101350_699661_D4482B03 
X-CRM114-Status: GOOD (  25.72  )
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

On Wed, 23 Aug 2023 17:35:35 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Wed, Aug 23, 2023 at 09:39:24PM +0800, Li Zetao wrote:
> > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> > replaced by devm_clk_get_enabled() when driver enables (and possibly
> > prepares) the clocks for the whole lifetime of the device. Moreover, it is
> > no longer necessary to unprepare and disable the clocks explicitly.
> >   
> 
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Acked-by: Serge Semin <fancer.lancer@gmail.com>
> > Signed-off-by: Li Zetao <lizetao1@huawei.com>  
> 
> Just for the record, the tags order is normally supposed to reflect a
> patch route. Even though AFAICS it's explicitly defined for the Sob
> tags only (see Documentation/process/submitting-patches.rst), but
> almost all kernel developers apply that rule to all the tags. See the
> kernel git log as the brightest example. So your Sob tag should have
> been kept first, then either my Ab or Jonathan' Rb tags.

There have been far too many discussions about this over the years.
There is an argument (I'm not saying I agree with it) that tags given
on an earlier version than the one posted should be before the SoB of
the author on basis that the SoB is occurring later (as it's on the new
version).  That is a slightly stronger argument if there are changes
to the patch, but then things get inconsistent between patches with minor
changes and those without. *sigh*

So this pattern is fairly common if a bit weird in my view :)

Jonathan

> 
> -Serge(y)
> 
> > ---
> > v1 -> v2: None
> > 
> >  drivers/spi/spi-dw-bt1.c | 23 +++++------------------
> >  1 file changed, 5 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
> > index 5e1c01822967..5391bcac305c 100644
> > --- a/drivers/spi/spi-dw-bt1.c
> > +++ b/drivers/spi/spi-dw-bt1.c
> > @@ -269,43 +269,32 @@ static int dw_spi_bt1_probe(struct platform_device *pdev)
> >  
> >  	dws->paddr = mem->start;
> >  
> > -	dwsbt1->clk = devm_clk_get(&pdev->dev, NULL);
> > +	dwsbt1->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> >  	if (IS_ERR(dwsbt1->clk))
> >  		return PTR_ERR(dwsbt1->clk);
> >  
> > -	ret = clk_prepare_enable(dwsbt1->clk);
> > -	if (ret)
> > -		return ret;
> > -
> >  	dws->bus_num = pdev->id;
> >  	dws->reg_io_width = 4;
> >  	dws->max_freq = clk_get_rate(dwsbt1->clk);
> > -	if (!dws->max_freq) {
> > -		ret = -EINVAL;
> > -		goto err_disable_clk;
> > -	}
> > +	if (!dws->max_freq)
> > +		return -EINVAL;
> >  
> >  	init_func = device_get_match_data(&pdev->dev);
> >  	ret = init_func(pdev, dwsbt1);
> >  	if (ret)
> > -		goto err_disable_clk;
> > +		return ret;
> >  
> >  	pm_runtime_enable(&pdev->dev);
> >  
> >  	ret = dw_spi_add_host(&pdev->dev, dws);
> >  	if (ret) {
> >  		pm_runtime_disable(&pdev->dev);
> > -		goto err_disable_clk;
> > +		return ret;
> >  	}
> >  
> >  	platform_set_drvdata(pdev, dwsbt1);
> >  
> >  	return 0;
> > -
> > -err_disable_clk:
> > -	clk_disable_unprepare(dwsbt1->clk);
> > -
> > -	return ret;
> >  }
> >  
> >  static void dw_spi_bt1_remove(struct platform_device *pdev)
> > @@ -315,8 +304,6 @@ static void dw_spi_bt1_remove(struct platform_device *pdev)
> >  	dw_spi_remove_host(&dwsbt1->dws);
> >  
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	clk_disable_unprepare(dwsbt1->clk);
> >  }
> >  
> >  static const struct of_device_id dw_spi_bt1_of_match[] = {
> > -- 
> > 2.34.1
> >   


