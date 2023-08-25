Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B6C6787B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SFmUXAYsem7iTnU68RPaQTJXrNLKxTUlTSWUKYfwJY=; b=NChhg+mTnVTnE/dbnzTfQSUfDy
	o4/Gsmv28rXiES+mLE+jmw34+o7JCJS4W5/TBzTcmkCx9k8v0MvwNv9ArbLLYrP+H7TSE8z4jSaSz
	aG6RIxaVFGMPmu2o8q4lcnvF7744S6+ZJk/03S7+nr2PXodK1MuB9nRjNLohgG1n3JGAX84b+lmmO
	wLayZwX99lKCGgoTY8ceft3TtgzJ2mvOhH9xyjHidyg0duZ54yjOlyagn8muTjyVP1irNU7A1O1jl
	d/txnbZt6gCR9GfcXRdWqwZvDzxQnZUtfzAvuJ9T4qadP9aou1j6yxnSagkwACrq4Y2E91PowLKvi
	45GC3nRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZb88-005pTj-32;
	Fri, 25 Aug 2023 18:01:56 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZb84-005pSo-1Z;
	Fri, 25 Aug 2023 18:01:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5009d4a4897so1818797e87.0;
        Fri, 25 Aug 2023 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692986508; x=1693591308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4SFmUXAYsem7iTnU68RPaQTJXrNLKxTUlTSWUKYfwJY=;
        b=eCx8WVfLLhKkDjYHE6LK5+wOPjcskGc2P+q8qCaMNCmGUkxVl2+Ou9LZVdTftBUBlK
         WpXKnv14V+1pUS0PkvDNEJCBz0zJQikC5MCQbj7G84AF0CAbJnWIKSnSW4kANFO1pOtV
         FrKHyo6IaRo6cvvrqZ0v9S3Qc76mA8gbqxXzLpiIsNWeFHqMgA4kZzEH8kQFq0kgZv8A
         P7qYMVbflmKM6lhcX9sznJ9AoVE5qbJNDtqb7ZBarvTN2crUZSw8+MMZdltbTIVGFIje
         1YzmEkg+K03iITsDY0VP7euhRoTy0IRUOcx1/Sh7StJvEm5yOeazBN/8ddHbzV3ggByZ
         7e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692986508; x=1693591308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SFmUXAYsem7iTnU68RPaQTJXrNLKxTUlTSWUKYfwJY=;
        b=UlDwyD1JH1dgvpLD255qr5s6ETYKH8mCW/ymAJVF75ehdS8pPWYjQPVHaC/Ytm5Yxn
         YAbm7NnTrqWagvR9Ow8+h9rD8hvW7imMWDHXIpWjfHxuLq7qU2Zycb17M2B9p17aWhMX
         cPSQbbNmLrakjnqXrNJi4snsgHiXp82Uch/by9ulzczMr7/vj+K38FPTolRDPu0kHI5m
         +dWZJdXx2hIgQj0sKimlHMpEf9ONMncCA12mWromB2CRSYxrQB0SnvjQ++PoxeMqTmcn
         gvhDkabzbkkoABoby7IwWrN0oRd+HlK/xPjyEe9SmVwL/zjfBq9xMJkOndxN7vfVqQ4a
         stEg==
X-Gm-Message-State: AOJu0Yw9XHS9z2bDANzB4huKsxUehQlpIESkYuPlcJbggMCnc25xXWvR
	TJ0TBwU+5OwQirHHFl1WZIk=
X-Google-Smtp-Source: AGHT+IH0lcoByGdkGAuuyTRpzPSqRVfYxYDuaWbs9bJOeWJsrinCWk1P2nZBUgaVHYuB9th1ImqFzA==
X-Received: by 2002:a05:6512:2303:b0:4fe:4e2c:8e52 with SMTP id o3-20020a056512230300b004fe4e2c8e52mr18884207lfu.42.1692986507967;
        Fri, 25 Aug 2023 11:01:47 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id a9-20020ac25209000000b004fba077e654sm366283lfl.194.2023.08.25.11.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:01:47 -0700 (PDT)
Date: Fri, 25 Aug 2023 21:01:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Li Zetao <lizetao1@huawei.com>, andrew@aj.id.au, 
	angelogioacchino.delregno@collabora.com, avifishman70@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	benjaminfair@google.com, broonie@kernel.org, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
	conor.dooley@microchip.com, daire.mcnamara@microchip.com, florian.fainelli@broadcom.com, 
	heiko@sntech.de, jbrunet@baylibre.com, joel@jms.id.au, khilman@baylibre.com, 
	linus.walleij@linaro.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com, neil.armstrong@linaro.org, 
	olteanv@gmail.com, openbmc@lists.ozlabs.org, rjui@broadcom.com, 
	sbranden@broadcom.com, tali.perry1@gmail.com, tmaimon77@gmail.com, venture@google.com, 
	yuenn@google.com
Subject: Re: [PATCH -next v2 11/25] spi: dw-bt1: Use helper function
 devm_clk_get_enabled()
Message-ID: <cgw2bpsh47p4vz3hectcwsz53dhmffpurufw2prxzg43ra2fpc@7xklvkozre6g>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
 <20230823133938.1359106-12-lizetao1@huawei.com>
 <xxosi2ymo7otqyfbmjlubezzedqw6ulwwhdmbdjbto7yaqw673@q673weupq67y>
 <20230823181344.000026bd@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823181344.000026bd@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_110152_528440_0EB11F18 
X-CRM114-Status: GOOD (  34.22  )
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

On Wed, Aug 23, 2023 at 06:13:44PM +0100, Jonathan Cameron wrote:
> On Wed, 23 Aug 2023 17:35:35 +0300
> Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > On Wed, Aug 23, 2023 at 09:39:24PM +0800, Li Zetao wrote:
> > > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> > > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> > > replaced by devm_clk_get_enabled() when driver enables (and possibly
> > > prepares) the clocks for the whole lifetime of the device. Moreover, it is
> > > no longer necessary to unprepare and disable the clocks explicitly.
> > >   
> > 
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Acked-by: Serge Semin <fancer.lancer@gmail.com>
> > > Signed-off-by: Li Zetao <lizetao1@huawei.com>  
> > 
> > Just for the record, the tags order is normally supposed to reflect a
> > patch route. Even though AFAICS it's explicitly defined for the Sob
> > tags only (see Documentation/process/submitting-patches.rst), but
> > almost all kernel developers apply that rule to all the tags. See the
> > kernel git log as the brightest example. So your Sob tag should have
> > been kept first, then either my Ab or Jonathan' Rb tags.
> 

> There have been far too many discussions about this over the years.
> There is an argument (I'm not saying I agree with it) that tags given
> on an earlier version than the one posted should be before the SoB of
> the author on basis that the SoB is occurring later (as it's on the new
> version).  That is a slightly stronger argument if there are changes
> to the patch, but then things get inconsistent between patches with minor
> changes and those without. *sigh*
> 
> So this pattern is fairly common if a bit weird in my view :)

Ah, I didn't know it was a holy-warring topic.) My judgement was based
on the vast majority of commits in the kernel git log and on my
experience in the patches review. Anyway in order not to raise it
again let's consider my comment as a general note with no obligation
towards the patch author.)

-Serge(y)

> 
> Jonathan
> 
> > 
> > -Serge(y)
> > 
> > > ---
> > > v1 -> v2: None
> > > 
> > >  drivers/spi/spi-dw-bt1.c | 23 +++++------------------
> > >  1 file changed, 5 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
> > > index 5e1c01822967..5391bcac305c 100644
> > > --- a/drivers/spi/spi-dw-bt1.c
> > > +++ b/drivers/spi/spi-dw-bt1.c
> > > @@ -269,43 +269,32 @@ static int dw_spi_bt1_probe(struct platform_device *pdev)
> > >  
> > >  	dws->paddr = mem->start;
> > >  
> > > -	dwsbt1->clk = devm_clk_get(&pdev->dev, NULL);
> > > +	dwsbt1->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> > >  	if (IS_ERR(dwsbt1->clk))
> > >  		return PTR_ERR(dwsbt1->clk);
> > >  
> > > -	ret = clk_prepare_enable(dwsbt1->clk);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > >  	dws->bus_num = pdev->id;
> > >  	dws->reg_io_width = 4;
> > >  	dws->max_freq = clk_get_rate(dwsbt1->clk);
> > > -	if (!dws->max_freq) {
> > > -		ret = -EINVAL;
> > > -		goto err_disable_clk;
> > > -	}
> > > +	if (!dws->max_freq)
> > > +		return -EINVAL;
> > >  
> > >  	init_func = device_get_match_data(&pdev->dev);
> > >  	ret = init_func(pdev, dwsbt1);
> > >  	if (ret)
> > > -		goto err_disable_clk;
> > > +		return ret;
> > >  
> > >  	pm_runtime_enable(&pdev->dev);
> > >  
> > >  	ret = dw_spi_add_host(&pdev->dev, dws);
> > >  	if (ret) {
> > >  		pm_runtime_disable(&pdev->dev);
> > > -		goto err_disable_clk;
> > > +		return ret;
> > >  	}
> > >  
> > >  	platform_set_drvdata(pdev, dwsbt1);
> > >  
> > >  	return 0;
> > > -
> > > -err_disable_clk:
> > > -	clk_disable_unprepare(dwsbt1->clk);
> > > -
> > > -	return ret;
> > >  }
> > >  
> > >  static void dw_spi_bt1_remove(struct platform_device *pdev)
> > > @@ -315,8 +304,6 @@ static void dw_spi_bt1_remove(struct platform_device *pdev)
> > >  	dw_spi_remove_host(&dwsbt1->dws);
> > >  
> > >  	pm_runtime_disable(&pdev->dev);
> > > -
> > > -	clk_disable_unprepare(dwsbt1->clk);
> > >  }
> > >  
> > >  static const struct of_device_id dw_spi_bt1_of_match[] = {
> > > -- 
> > > 2.34.1
> > >   
> 

