Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcvtOtq8kwhEL072ONO5ytfvWZoN+QtDYn0eyPVwc44=; b=QbXDy+jbTXzv1q
	vw1B+D4+5XYqyBzzcYY8f/OcA6uZci3APUWcvn+JakCc1MSBOTlvVtw1UtEH19/ZzNDIHl2Ucd3MO
	1a+jzRHr4ayieYC2sa+6Jv+2x0jZzPjUm6uSlvAy6oavBha4cN/YcCSUpxo8EvK7Da2v2vLcDbeeT
	aTg2Aep1V5vfkhbbF0qTuTdm3lRKjlo/ZYCOFgcnaaOpbLiK1ehXoa2KOldp9GYLk8P4LpiyQpqy2
	4+qj0YTt6Y46u0fjCDBIn6i9XZjhUyLACNaCLvlZZppEoOlfwD3pZz/CvImMTCFOCBE8Ua5gSlIL4
	XiYY0ZCoPe4THgmeIBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAor-008GqC-Rn; Fri, 03 Jun 2022 17:10:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAob-008GlK-Pp; Fri, 03 Jun 2022 17:10:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 15F49B823AE;
	Fri,  3 Jun 2022 17:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2A6C385B8;
	Fri,  3 Jun 2022 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654276222;
	bh=Yhb8OPp1sSwZzVcLGVjDxYrN0vlwebO9faHuTNWhG4o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pJUj26xM3omq1XfJzae2/kNYP0GNrKZJAlX6qQvFkoORdgX2jatgBaZhjITDetyo4
	 6Ho3r8JCZNDTqYqTywpriBv1enouc70JPjw/sYrT7zAqOY3+TbCZUGrBVxnV0twFzb
	 vBFIAuE6Owl4SCoC0jyhKAh0Wkj62wDDrGkEYuY9ZHlH2kkn5YxDGMdMJ4lJ4ZJtOM
	 8FilAtIOaatwJZHh8x0+lYlCL4U9MemxvnRqpNaXZGP17ucBaA6OSj8utHuAIdF2Zq
	 mOVjuiYHKrUQzkdqfZZndqYO3gcqFcQLMxn6f/bbPrMbEy5YxC7w8yXCWqyVB3lzQC
	 zN8eYoz/vFcNw==
Date: Fri, 3 Jun 2022 18:19:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, lars@metafoo.de, lgirdwood@gmail.com,
 broonie@kernel.org, linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 deller@gmx.de, ChiYuan Huang <cy_huang@richtek.com>,
 alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [RESEND 10/14] iio: adc: mt6370: Add Mediatek MT6370 support
Message-ID: <20220603181917.3f737913@jic23-huawei>
In-Reply-To: <CABtFH5Lg43EXS7juhXQ2wQFZzkpD7YB8rM6UFT=U9BDOKcbaNw@mail.gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
	<20220531111900.19422-11-peterwu.pub@gmail.com>
	<20220531142102.00007df0@Huawei.com>
	<CABtFH5Lg43EXS7juhXQ2wQFZzkpD7YB8rM6UFT=U9BDOKcbaNw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_101026_168592_D9B6D3AF 
X-CRM114-Status: GOOD (  22.75  )
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

> >  
> > > +
> > > +#define MT6370_AICR_400MA            0x6
> > > +#define MT6370_ICHG_500MA            0x4
> > > +#define MT6370_ICHG_900MA            0x8
> > > +
> > > +#define ADC_CONV_TIME_US             35000
> > > +#define ADC_CONV_POLLING_TIME                1000
> > > +
> > > +struct mt6370_adc_data {
> > > +     struct device *dev;
> > > +     struct regmap *regmap;
> > > +     struct mutex lock;  
> >
> > All locks need documentation.  What is the scope of the lock?
> > Looks like it protects device state when doing setup, wait for read, read
> > cycles.  
> 
> This mutex lock is for preventing the different adc channel from being
> read at the same time.
> So, if I just change its name to adc_chan_lock or adc_lock and add the
> comment for this mutex lock, does this change meet your requirement

Yes

> 
> >  
> > > +};
> > > +
> > > +static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
> > > +                              int chan, int *val1, int *val2)
> > > +{
> > > +     unsigned int reg_val;
> > > +     int ret;
> > > +
> > > +     switch (chan) {
> > > +     case MT6370_CHAN_VBAT:
> > > +     case MT6370_CHAN_VSYS:
> > > +     case MT6370_CHAN_CHG_VDDP:
> > > +             *val1 = 5000;  
> >
> > This seems very large.  Voltages are in millivolts
> > as per Documentation/ABI/testing/sysfs-bus-iio
> > and this means each step is 5 volts.
> >
> > So value in mv is currently 5 * _raw
> >  
> 
> OK, I got it. Also, I will add the ABI file in the next version. Thanks!
Only add ABI documentation for anything non-standard.

The documentation scripts really don't like repeats!

> 
> > > +static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {  
> >
> > Perhaps define an enum with which to index this and the chan spec
> > and hence ensure they end up matching.
> >  [vbusdiv5] = "vbusdiv5", etc
> >  
> 
> Do you mean that I can refine this const char array to the following array??
> 
> static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {
>     [MT6370_CHAN_VBUSDIV5] =  "vbusdiv5",
>     [MT6370_CHAN_VBUSDIV2] =  "vbusdiv2",
>     ...
>     ...
>     [MT6370_CHAN_TEMP_JC] =  "temp_jc",
> };

Yes

thanks,

Jonathan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
