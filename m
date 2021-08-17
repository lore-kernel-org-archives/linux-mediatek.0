Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4E7C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 15:51:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3445460FD7
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 15:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3445460FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/C8R969R09flkquH8pmFMwCXRQWQaENOmm6wussfgQI=; b=ZPDAT9YDVq3krT
	Wc1pjcuhjOYz2/1oy7ATlJGP3pesbhaTeaK8/AOPwF62hOJ+O15Id1zzbot8xNtWjr5Eseehl2kK0
	Oj84hRKwsqtPkamPoGMGny6Eu+kxvFYJKgBwN8bylhiSWCbV4MdkBsAjA6rOpGUd+KePZzyC0qecM
	bTdLKEbtXmxXznrGS7u+D3/3+cY0+88VmueDb9s7sLud+qh2P15QF5o5zrvpYpMf6Mv+GP26um3eF
	qRaWHlsFy4WmsJvxw7URSxIaY9B/AGbI7keptTGPOldcq/jXWdm7/XzE9ZJMvPWAsml1eaGVH2gur
	AYqvMAXnHwr94B5CTlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG1NN-002sht-1y; Tue, 17 Aug 2021 15:51:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG1N6-002seb-9E; Tue, 17 Aug 2021 15:51:26 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D860B60C3E;
 Tue, 17 Aug 2021 15:51:18 +0000 (UTC)
Date: Tue, 17 Aug 2021 16:54:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "hui.liu" <hui.liu@mediatek.com>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, <robh+dt@kernel.org>,
 <lars@metafoo.de>, <pmeerw@pmeerw.net>, <srv_heupstream@mediatek.com>,
 <zhiyong.tao@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <seiya.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 1/2] iio: mtk-auxadc: add support IIO_CHAN_INFO_RAW case
Message-ID: <20210817165418.4b1cfdce@jic23-huawei>
In-Reply-To: <470d4a7fbbcbcaa35aa9dcbaab6a2b77f98dc528.camel@mediatek.com>
References: <20210812054844.30575-1-hui.liu@mediatek.com>
 <20210812054844.30575-2-hui.liu@mediatek.com>
 <20210812190725.00007449@Huawei.com>
 <042625639032bffe73b60a5c6274511e58e34ef4.camel@mediatek.com>
 <20210814171007.6892ae94@jic23-huawei>
 <470d4a7fbbcbcaa35aa9dcbaab6a2b77f98dc528.camel@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_085124_428150_9C6A7A88 
X-CRM114-Status: GOOD (  42.94  )
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

On Tue, 17 Aug 2021 16:37:52 +0800
hui.liu <hui.liu@mediatek.com> wrote:

> On Sat, 2021-08-14 at 17:10 +0100, Jonathan Cameron wrote:
> > On Fri, 13 Aug 2021 11:46:24 +0800
> > hui.liu <hui.liu@mediatek.com> wrote:
> >   
> > > On Thu, 2021-08-12 at 19:07 +0100, Jonathan Cameron wrote:  
> > > > On Thu, 12 Aug 2021 13:48:43 +0800
> > > > Hui Liu <hui.liu@mediatek.com> wrote:
> > > >     
> > > > > Add support IIO_CHAN_INFO_RAW case.    
> > > > 
> > > > Why?
> > > > 
> > > > We almost never support both RAW and PROCESSED as userspace
> > > > should be
> > > > fine to use either.  There are a few reasons we've let drivers do
> > > > this but I would like know why it matters to you and it
> > > > definitely
> > > > needs to be in the patch description.
> > > >     
> > > 
> > > Hi Jonathan,
> > > 
> > > 1. To support ADC consumers' different types of requirement: some
> > > consumers want to call iio_read_channel_raw to get raw data, the
> > > others
> > > use iio_read_channel_processed to get voltage.  
> > 
> > Give an example of the consumer using the raw channel readback
> > (without
> > acess to any scaling information?)
> >   
> 
> > > 2. In our origin driver, if consumer call
> > > iio_read_channel_processed,
> > > read back value is raw data. 
> > > 
> > > Could we use SCALE instead of PROCESSED in patch for next version,
> > > or
> > > what's your suggestion?  
> > 
> > That would unfortunately be a userspace ABI change.  We can add
> > interfaces
> > but taking them away is normally a problem :( 
> > 
> > Your reasons here are fine, subject to information on what consumer
> > cares
> > about having _RAW, please resend the patch with this information
> > added
> > to the description.
> > 
> > Thanks,
> > 
> > Jonathan  
> 
> 1. We found afe/iio-rescale.c, dac/dpot-dac.c and multiplexer/iio-mux.c 
> call iio_read_channel_raw to get raw data. If they use our ADC driver,
> I think we should support _RAW case. 
> If we support _RAW case, we will add more information in v2
> description.

iio-rescale has recently gained support for processed.
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/drivers/iio/afe/iio-rescale.c?h=testing&id=53ebee9499805add3eef630d998c40812e6a1c39
dpot-dac is a rather obscure special case, so I doubt you actually have one of those.
If iio-mux is relevant then we should add processed support to that driver as well.

I would rather see those users of the interface fixed than us
having to tweak lots of drivers to provide _raw when it isn't appropriate for
that piece of hardware.

Jonathan

> 
> 2. Since we change _PROCESSED readback value from raw data to voltage,
> our consumer will make the changes synchronously. 
> 
> > > 
> > > Thanks.
> > >   
> > > > > 
> > > > > Signed-off-by: Hui Liu <hui.liu@mediatek.com>
> > > > > ---
> > > > >  drivers/iio/adc/mt6577_auxadc.c | 16 +++++++++++++++-
> > > > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/iio/adc/mt6577_auxadc.c
> > > > > b/drivers/iio/adc/mt6577_auxadc.c
> > > > > index 79c1dd68b909..e995d43287b2 100644
> > > > > --- a/drivers/iio/adc/mt6577_auxadc.c
> > > > > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > > > > @@ -60,7 +60,8 @@ static const struct mtk_auxadc_compatible
> > > > > mt6765_compat = {
> > > > >  		.type = IIO_VOLTAGE,				
> > > > >    
> > > > >  \
> > > > >  		.indexed = 1,					
> > > > >    
> > > > >  \
> > > > >  		.channel = (idx),				
> > > > >     \
> > > > > -		.info_mask_separate =
> > > > > BIT(IIO_CHAN_INFO_PROCESSED), \
> > > > > +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |	
> > > > >    
> > > > >  \
> > > > > +				      BIT(IIO_CHAN_INFO_PROCESS
> > > > > ED), \
> > > > >  }
> > > > >  
> > > > >  static const struct iio_chan_spec mt6577_auxadc_iio_channels[]
> > > > > = {
> > > > > @@ -181,6 +182,19 @@ static int mt6577_auxadc_read_raw(struct
> > > > > iio_dev *indio_dev,
> > > > >  	struct mt6577_auxadc_device *adc_dev =
> > > > > iio_priv(indio_dev);
> > > > >  
> > > > >  	switch (info) {
> > > > > +	case IIO_CHAN_INFO_RAW:
> > > > > +		*val = mt6577_auxadc_read(indio_dev, chan);
> > > > > +		if (*val < 0) {
> > > > > +			dev_notice(indio_dev->dev.parent,
> > > > > +				"failed to sample data on
> > > > > channel[%d]\n",
> > > > > +				chan->channel);
> > > > > +			return *val;
> > > > > +		}
> > > > > +		if (adc_dev->dev_comp->sample_data_cali)
> > > > > +			*val = mt_auxadc_get_cali_data(*val,
> > > > > true);
> > > > > +
> > > > > +		return IIO_VAL_INT;
> > > > > +
> > > > >  	case IIO_CHAN_INFO_PROCESSED:
> > > > >  		*val = mt6577_auxadc_read(indio_dev, chan);
> > > > >  		if (*val < 0) {    
> > > > 
> > > >     
> > 
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
