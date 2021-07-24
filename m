Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390EC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 17:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0786060E09
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 17:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0786060E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0qOdJXOlItlWj/UiWc3RvePJE+lrYTjF8QwbIb4IGI=; b=bUWO5tucl+ooV4
	qr6iNHxeeLOXs3G2ENIHR4EWb7sigUzo9UJtyzE3R8hnYnDGxVqUGcsq/RTpSkjq34KGNBSv9NtYT
	LclSw5YQd1TRjjGD/t+oVaaQ2gfIVX6b56pyFJrY2S2nh7AueXvzdZsOOrktCgF2q6Ifi61BrzSa9
	ODpWqzbVRSsv0yiEYQlXXhGqwnRZJQ5U+ACkd8WFNc+aAwQQ4ldk2Z6NFirUFgkUpIWEPp3vh+jjL
	igJS72P0J2Z5tBitUTBEsP3QTjzC2kidaOPIEJnz3EAmSU/6o6XvILlxGYZ969iuDIvJi5ajc6eIA
	n2zLmVqn0pvIyJ2Fz9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7LRH-007WZh-P8; Sat, 24 Jul 2021 17:27:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7LR4-007WY1-2R; Sat, 24 Jul 2021 17:27:40 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82F5F60E8E;
 Sat, 24 Jul 2021 17:27:32 +0000 (UTC)
Date: Sat, 24 Jul 2021 18:30:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "hui.liu" <hui.liu@mediatek.com>
Cc: <robh+dt@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <srv_heupstream@mediatek.com>,
 <zhiyong.tao@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <seiya.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] iio: mtk-auxadc: add mutex_destroy
Message-ID: <20210724183003.6f3bc1d5@jic23-huawei>
In-Reply-To: <1627042875.27985.15.camel@mhfsdcap03>
References: <20210715093523.29844-1-hui.liu@mediatek.com>
 <20210715093523.29844-2-hui.liu@mediatek.com>
 <20210717174432.7e69e4e9@jic23-huawei>
 <1627042875.27985.15.camel@mhfsdcap03>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_102739_191899_EF1C805D 
X-CRM114-Status: GOOD (  36.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 23 Jul 2021 20:21:15 +0800
hui.liu <hui.liu@mediatek.com> wrote:

> On Sat, 2021-07-17 at 17:44 +0100, Jonathan Cameron wrote:
> > On Thu, 15 Jul 2021 17:35:23 +0800
> > Hui Liu <hui.liu@mediatek.com> wrote:
> >   
> > > Add mutex_destroy when probe fail and remove device.
> > > 
> > > Signed-off-by: Hui Liu <hui.liu@mediatek.com>  
> > Hi Hui Liu,
> > 
> > We very very rarely bother to call mutex_destroy().  The reason is
> > that it is only a non noop in when mutex debugging is enabled and
> > that is only useful if there is a plausible route in which it could
> > be used after the mutex_destroy.   Given these are both at the ends
> > of removal paths, I don't think this is useful.  That's why you will
> > rarely find mutex_destroy() being called.
> > 
> > Thanks,
> > 
> > Jonathan  
> 
> Hi Jonathon,
> 
> I think this patch could assurance the integrity of code.
> mutex_init will be called when driver probe. If driver probe fail or
> device removed, mutex_destroy could set lock->magic to NULL.

I'm not seeing the use case here given the location doesn't leave
a huge amount of code that could have such a bug.  There might have been
something if we had any route to increment the reference count of the
structure this mutex is ultimately embedded in and so have it outlast
the remove function or error path. In this driver it looks like there is
no such path.  Hence you are protecting against a automated
cleanup of core code (nothing in the driver itself) which is obviously
not going to try taking a driver specific mutex.

A few side notes:

You are calling it wrong place in remove. The ordering in remove
should be the opposite of that in probe so the mutex_destroy should either
be a few lines earlier, or you should have a comment there to say why you
are doing it where you have chosen to do so.

The style of this probe is to do error handling in a block at the end.
So this handling should be there, not in the if statement.

Jonathan



> 
> Thanks.
> Hui
> 
> >   
> > > ---
> > >  drivers/iio/adc/mt6577_auxadc.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > > index 79c1dd68b909..d57243037ad6 100644
> > > --- a/drivers/iio/adc/mt6577_auxadc.c
> > > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > > @@ -289,6 +289,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
> > >  	ret = iio_device_register(indio_dev);
> > >  	if (ret < 0) {
> > >  		dev_err(&pdev->dev, "failed to register iio device\n");
> > > +		mutex_destroy(&adc_dev->lock);
> > >  		goto err_power_off;
> > >  	}
> > >  
> > > @@ -313,6 +314,7 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
> > >  			      0, MT6577_AUXADC_PDN_EN);
> > >  
> > >  	clk_disable_unprepare(adc_dev->adc_clk);
> > > +	mutex_destroy(&adc_dev->lock);
> > >  
> > >  	return 0;
> > >  }  
> >   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
