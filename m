Return-Path: <SRS0=0iLz=NF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC393C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Aug 2021 16:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 043CE60F39
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Aug 2021 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 043CE60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzksrIDh47OteqmNQr2SCOuGEoNviNysfLQIkOYNQKM=; b=IG1iBkd/NYXBGq
	XHaxnyLeS6D91yoIWlgVwKZDKEWukakBkW6x+chLj185i6yJWIDyigQIkD4xtb9qVeH7k7NFuMOw/
	Rb8PpvKVhJKjQi7qu+7729oBr4QwxIVX1yRQ9gFDLEqeUV5KGcplwSgiA5iXLwdq8gb8TYT4NZ9Ei
	GNmnekllO8TYRAnEj48rCZyhkk/hrWSFC2tz95hpd6XOfPtMMaw/2QE1L7B/III3ll4vut4IvsYrl
	mRl5J64At5+Kg8yZeslArBSZshKYsuDKpKIkaWCwruyscYkPwVxazLnIu89cIHwUs/4iqAlErhb26
	TQoKcQiivhvzsyAXpvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEwC1-00ENFN-No; Sat, 14 Aug 2021 16:07:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEwBo-00ENEi-Fs; Sat, 14 Aug 2021 16:07:17 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6B1660F21;
 Sat, 14 Aug 2021 16:07:10 +0000 (UTC)
Date: Sat, 14 Aug 2021 17:10:07 +0100
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
Message-ID: <20210814171007.6892ae94@jic23-huawei>
In-Reply-To: <042625639032bffe73b60a5c6274511e58e34ef4.camel@mediatek.com>
References: <20210812054844.30575-1-hui.liu@mediatek.com>
 <20210812054844.30575-2-hui.liu@mediatek.com>
 <20210812190725.00007449@Huawei.com>
 <042625639032bffe73b60a5c6274511e58e34ef4.camel@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_090716_621423_051E445F 
X-CRM114-Status: GOOD (  31.33  )
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

On Fri, 13 Aug 2021 11:46:24 +0800
hui.liu <hui.liu@mediatek.com> wrote:

> On Thu, 2021-08-12 at 19:07 +0100, Jonathan Cameron wrote:
> > On Thu, 12 Aug 2021 13:48:43 +0800
> > Hui Liu <hui.liu@mediatek.com> wrote:
> >   
> > > Add support IIO_CHAN_INFO_RAW case.  
> > 
> > Why?
> > 
> > We almost never support both RAW and PROCESSED as userspace should be
> > fine to use either.  There are a few reasons we've let drivers do
> > this but I would like know why it matters to you and it definitely
> > needs to be in the patch description.
> >   
> Hi Jonathan,
> 
> 1. To support ADC consumers' different types of requirement: some
> consumers want to call iio_read_channel_raw to get raw data, the others
> use iio_read_channel_processed to get voltage.

Give an example of the consumer using the raw channel readback (without
acess to any scaling information?)

> 2. In our origin driver, if consumer call iio_read_channel_processed,
> read back value is raw data. 
> 
> Could we use SCALE instead of PROCESSED in patch for next version, or
> what's your suggestion?

That would unfortunately be a userspace ABI change.  We can add interfaces
but taking them away is normally a problem :( 

Your reasons here are fine, subject to information on what consumer cares
about having _RAW, please resend the patch with this information added
to the description.

Thanks,

Jonathan
> 
> Thanks.
> 
> > > 
> > > Signed-off-by: Hui Liu <hui.liu@mediatek.com>
> > > ---
> > >  drivers/iio/adc/mt6577_auxadc.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iio/adc/mt6577_auxadc.c
> > > b/drivers/iio/adc/mt6577_auxadc.c
> > > index 79c1dd68b909..e995d43287b2 100644
> > > --- a/drivers/iio/adc/mt6577_auxadc.c
> > > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > > @@ -60,7 +60,8 @@ static const struct mtk_auxadc_compatible
> > > mt6765_compat = {
> > >  		.type = IIO_VOLTAGE,				   
> > >  \
> > >  		.indexed = 1,					   
> > >  \
> > >  		.channel = (idx),				    \
> > > -		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED), \
> > > +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |	   
> > >  \
> > > +				      BIT(IIO_CHAN_INFO_PROCESSED), \
> > >  }
> > >  
> > >  static const struct iio_chan_spec mt6577_auxadc_iio_channels[] = {
> > > @@ -181,6 +182,19 @@ static int mt6577_auxadc_read_raw(struct
> > > iio_dev *indio_dev,
> > >  	struct mt6577_auxadc_device *adc_dev = iio_priv(indio_dev);
> > >  
> > >  	switch (info) {
> > > +	case IIO_CHAN_INFO_RAW:
> > > +		*val = mt6577_auxadc_read(indio_dev, chan);
> > > +		if (*val < 0) {
> > > +			dev_notice(indio_dev->dev.parent,
> > > +				"failed to sample data on
> > > channel[%d]\n",
> > > +				chan->channel);
> > > +			return *val;
> > > +		}
> > > +		if (adc_dev->dev_comp->sample_data_cali)
> > > +			*val = mt_auxadc_get_cali_data(*val, true);
> > > +
> > > +		return IIO_VAL_INT;
> > > +
> > >  	case IIO_CHAN_INFO_PROCESSED:
> > >  		*val = mt6577_auxadc_read(indio_dev, chan);
> > >  		if (*val < 0) {  
> > 
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
