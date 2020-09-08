Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A178DC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 13:00:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E6F221ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 13:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOUK2lqv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E6F221ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QPTZCJb6RQ2MrwEKxtiWLEygAL2ZO/jR6Ic8ALRU340=; b=tOUK2lqvy1JACuvRm3+iucRbA
	0Vd7hcgG1AoItEefO1JJIcbUtkgdas9r7pSiqURe6hkFKHWIDTKyom5cazB+Jou5dkbnyOJ4FZhsx
	fpycxg4ydEy21gqaRgOmInsPXG0dbi2nJp7sE54LOZzptT7BKsD4LQlL0OvBCzhzkW3k/LApQTABZ
	73/IedoTCu33FDWJjKBHQGdLNwXFGtWs/97GVXpFvbNB7hsfLorvAGR/YoFN8clSfJZuRGIkcTWVw
	7bII0xHlc2GUUZNRY2xcrVrNzdjeEBBj78S0gPL07o8AMuYrlpKxEYAz03B43NyRPy6ehTTbbV8Mb
	celMnNn6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFdEN-0008JS-9E; Tue, 08 Sep 2020 13:00:15 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFdEH-0008Hj-23; Tue, 08 Sep 2020 13:00:10 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 2D9084A06B02F02DB517;
 Tue,  8 Sep 2020 14:00:06 +0100 (IST)
Received: from localhost (10.52.124.38) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Tue, 8 Sep 2020
 14:00:04 +0100
Date: Tue, 8 Sep 2020 13:58:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 1/2] iio: adc: mt6360: Add ADC driver for MT6360
Message-ID: <20200908135830.00007b13@Huawei.com>
In-Reply-To: <CAE+NS35aQ3k2auYA+bmf6kMhm192oyg8_j5j=zzK0sn_NS6HoA@mail.gmail.com>
References: <1598259985-12517-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598259985-12517-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200829181157.1b653a88@archlinux>
 <CAE+NS36j4a6k-JSUbjxzpfbqtE-xMW7qxUUhHPAnc_9V-Lv7LQ@mail.gmail.com>
 <20200908100712.00007a7b@Huawei.com>
 <CAE+NS35aQ3k2auYA+bmf6kMhm192oyg8_j5j=zzK0sn_NS6HoA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.124.38]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_090009_332318_F7F5FB42 
X-CRM114-Status: GOOD (  47.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Jonathan Cameron <jic23@kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

...

> > > > > +#include <linux/completion.h>
> > > > > +#include <linux/interrupt.h>
> > > > > +#include <linux/iio/buffer.h>
> > > > > +#include <linux/iio/iio.h>
> > > > > +#include <linux/iio/trigger_consumer.h>
> > > > > +#include <linux/iio/triggered_buffer.h>
> > > > > +#include <linux/irq.h>
> > > > > +#include <linux/kernel.h>
> > > > > +#include <linux/ktime.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/mutex.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/regmap.h>
> > > > > +
> > > > > +#define MT6360_REG_PMUCHGCTRL3       0x313
> > > > > +#define MT6360_REG_PMUADCCFG 0x356
> > > > > +#define MT6360_REG_PMUADCRPT1        0x35A
> > > > > +
> > > > > +/* PMUCHGCTRL3 0x313 */
> > > > > +#define MT6360_AICR_MASK     0xFC
> > > > > +#define MT6360_AICR_SHFT     2
> > > > > +#define MT6360_AICR_400MA    0x6
> > > > > +/* PMUADCCFG 0x356 */
> > > > > +#define MT6360_ADCEN_MASK    0x8000
> > > > > +/* PMUADCRPT1 0x35A */
> > > > > +#define MT6360_PREFERCH_MASK 0xF0
> > > > > +#define MT6360_PREFERCH_SHFT 4
> > > > > +#define MT6360_RPTCH_MASK    0x0F
> > > > > +
> > > > > +enum {
> > > > > +     MT6360_CHAN_USBID = 0,
> > > > > +     MT6360_CHAN_VBUSDIV5,
> > > > > +     MT6360_CHAN_VBUSDIV2,
> > > > > +     MT6360_CHAN_VSYS,
> > > > > +     MT6360_CHAN_VBAT,
> > > > > +     MT6360_CHAN_IBUS,
> > > > > +     MT6360_CHAN_IBAT,
> > > > > +     MT6360_CHAN_CHG_VDDP,
> > > > > +     MT6360_CHAN_TEMP_JC,
> > > > > +     MT6360_CHAN_VREF_TS,
> > > > > +     MT6360_CHAN_TS,
> > > > > +     MT6360_CHAN_MAX,
> > > > > +};
> > > > > +
> > > > > +struct mt6360_adc_data {
> > > > > +     struct device *dev;
> > > > > +     struct regmap *regmap;
> > > > > +     struct completion adc_complete;
> > > > > +     struct mutex adc_lock;
> > > > > +     ktime_t last_off_timestamps[MT6360_CHAN_MAX];
> > > > > +     int irq;
> > > > > +};
> > > > > +
> > > > > +static inline int mt6360_adc_val_converter(int val, int multiplier, int offset, int divisor)
> > > > > +{
> > > > > +     return ((val * multiplier) + offset) / divisor;  
> > > >
> > > > Why could we not report these values to userspace or consumer drivers and let
> > > > them deal with the conversion if they actually needed it?
> > > > Mapping this to
> > > >
> > > > (val + new_offset) * multiplier would be a little messy, but not too bad.
> > > >
> > > > The advantage would be that we would then be providing the data needed
> > > > to get real units for values read from the buffers without having to
> > > > do all the maths in kernel (without access to floating point).
> > > >
> > > >  
> > >
> > > As above, if I use formula "(val + new_offset) * multiplier",
> > > the junction temperature channel multiplier will be floating point
> > > 1.05, i don't know how to express.  
> >
> > As Andy mentioned, we do this all over the place.
> > IIO_VAL_INT_PLUS_MICRO
> >
> > The key is that we want to push the burden of doing this maths to the user
> > not the source.  
> 
> ACK.
> Can I keep IIO_CHAN_INFO_PROCESSED function be reserved for user in
> kernel space?
> 

No. We have utility functions that will apply the multiplier as needed so
there is no significant advantage in doing this and it won't be consistent
with the majority of other drivers. 

> >
> > Often what is actually of interest is whether a temperature passed a threshold.
> > In that case, you can transform the threshold into the units of the ADC (so the
> > reverse directly to you would do with processed data) and only have to do the
> > maths once per change of the threshold instead of for every sample.
> >
> > There are helper functions to do the maths for you, should you actually
> > need SI units.
> >  
> 
> ACK
> 
> > >  
> > > > > +}
> > > > > +
> > > > > +static int mt6360_adc_convert_processed_val(struct mt6360_adc_data *info, int chan_idx, int *val)
> > > > > +{
> > > > > +     unsigned int regval = 0;
> > > > > +     const struct converter {
> > > > > +             int multiplier;
> > > > > +             int offset;
> > > > > +             int divisor;
> > > > > +     } adc_converter[MT6360_CHAN_MAX] = {
> > > > > +             { 1250, 0, 1}, /* USBID */
> > > > > +             { 6250, 0, 1}, /* VBUSDIV5 */
> > > > > +             { 2500, 0, 1}, /* VBUSDIV2 */
> > > > > +             { 1250, 0, 1}, /* VSYS */
> > > > > +             { 1250, 0, 1}, /* VBAT */
> > > > > +             { 2500, 0, 1}, /* IBUS */
> > > > > +             { 2500, 0, 1}, /* IBAT */
> > > > > +             { 1250, 0, 1}, /* CHG_VDDP */
> > > > > +             { 105, -8000, 100}, /* TEMP_JC */
> > > > > +             { 1250, 0, 1}, /* VREF_TS */
> > > > > +             { 1250, 0, 1}, /* TS */
> > > > > +     }, sp_ibus_adc_converter = { 1900, 0, 1 }, *sel_converter;
> > > > > +     int ret;
> > > > > +
> > > > > +     sel_converter = adc_converter + chan_idx;
> > > > > +     if (chan_idx == MT6360_CHAN_IBUS) {
> > > > > +             /* ibus chan will be affected by aicr config */
> > > > > +             /* if aicr < 400, apply the special ibus converter */
> > > > > +             ret = regmap_read(info->regmap, MT6360_REG_PMUCHGCTRL3, &regval);
> > > > > +             if (ret)
> > > > > +                     return ret;
> > > > > +
> > > > > +             regval = (regval & MT6360_AICR_MASK) >> MT6360_AICR_SHFT;
> > > > > +             if (regval < MT6360_AICR_400MA)
> > > > > +                     sel_converter = &sp_ibus_adc_converter;
> > > > > +     }
> > > > > +
> > > > > +     *val = mt6360_adc_val_converter(*val, sel_converter->multiplier, sel_converter->offset,
> > > > > +                                     sel_converter->divisor);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int mt6360_adc_read_processed(struct mt6360_adc_data *mad, int channel, int *val)
> > > > > +{
> > > > > +     u16 adc_enable;
> > > > > +     u8 rpt[3];
> > > > > +     ktime_t start_t, predict_end_t;
> > > > > +     long timeout;
> > > > > +     int value, ret;
> > > > > +
> > > > > +     mutex_lock(&mad->adc_lock);
> > > > > +
> > > > > +     /* select preferred channel that we want */
> > > > > +     ret = regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PREFERCH_MASK,
> > > > > +                              channel << MT6360_PREFERCH_SHFT);
> > > > > +     if (ret)
> > > > > +             goto out_adc;
> > > > > +
> > > > > +     /* enable adc channel we want and adc_en */
> > > > > +     adc_enable = MT6360_ADCEN_MASK | BIT(channel);
> > > > > +     adc_enable = cpu_to_be16(adc_enable);  
> > > >
> > > > Use a local be16 to store that. It will make it a little clearer
> > > > that we are doing something 'unusual' here.  Perhaps a comment on
> > > > why this odd code exists would also help?
> > > >  
> > >
> > > ACK
> > >  
> > > > > +     ret = regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG, (void *)&adc_enable, sizeof(u16));
> > > > > +     if (ret)
> > > > > +             goto out_adc;
> > > > > +
> > > > > +     start_t = ktime_get();
> > > > > +     predict_end_t = ktime_add_ms(mad->last_off_timestamps[channel], 50);
> > > > > +
> > > > > +     if (ktime_after(start_t, predict_end_t))
> > > > > +             predict_end_t = ktime_add_ms(start_t, 25);
> > > > > +     else
> > > > > +             predict_end_t = ktime_add_ms(start_t, 75);
> > > > > +
> > > > > +     enable_irq(mad->irq);
> > > > > +adc_retry:
> > > > > +     reinit_completion(&mad->adc_complete);
> > > > > +
> > > > > +     /* wait for conversion to complete */
> > > > > +     timeout = wait_for_completion_timeout(&mad->adc_complete, msecs_to_jiffies(200));
> > > > > +     if (timeout == 0) {
> > > > > +             ret = -ETIMEDOUT;
> > > > > +             goto out_adc_conv;
> > > > > +     } else if (timeout < 0) {
> > > > > +             ret = -EINTR;
> > > > > +             goto out_adc_conv;
> > > > > +     }
> > > > > +
> > > > > +     ret = regmap_raw_read(mad->regmap, MT6360_REG_PMUADCRPT1, rpt, sizeof(rpt));
> > > > > +     if (ret)
> > > > > +             goto out_adc_conv;
> > > > > +
> > > > > +     /* check the current reported channel */
> > > > > +     if ((rpt[0] & MT6360_RPTCH_MASK) != channel) {
> > > > > +             dev_dbg(mad->dev, "not wanted channel report [%02x]\n", rpt[0]);  
> > > >
> > > > This and the one below feel like error messages rather than debug ones.
> > > >  
> > >
> > > We have two function "battery zero current voltage(ZCV)" and "TypeC
> > > OTP" will auto run ADC at background.
> > > ZCV_EN will run VBAT_ADC when TA plug in, TypeC OTP will run TS_ADC
> > > when TypeC attach.
> > > We need to check report channel for ADC report data match is our desire channel.  
> >
> > So there is firmware messing with it underneath?  Oh goody.
> > Add a comment explaining this.
> >  
> 
> ACK, I try to write a comment as below
> 
>         /*
>          * There are two functions, ZCV and TypeC OTP, running ADC
> VBAT and TS in background,
>          * and ADC samples are taken on a fixed frequency no matter
> read the previous one or not.
>          * To avoid conflict need set minimum time threshold after
> enable ADC and check report
>          * channel is the same.
>          * The worst case is run the same ADC twice and background
> function is also running,
>          * ADC conversion sequence is desire channel before start ADC,
> background ADC, desire
>          * channel after start ADC. So the minimum correct data is
> three times of typical
>          * conversion time.
>          */

Looks good.

> 
> > >  
> > > > > +             goto adc_retry;
> > > > > +     }
> > > > > +
> > > > > +     if (!ktime_after(ktime_get(), predict_end_t)) {
> > > > > +             dev_dbg(mad->dev, "time is not after one adc_conv_t\n");  
> > > >
> > > > Does this actually happen? If feels like we are being a bit over protective
> > > > here.  I'd definitely like to see a comment saying why this protection
> > > > might be needed.
> > > >  
> > >
> > > When ADC_EN and MT6360_CHANx_EN is enable, the channel x will keep
> > > running again and again
> > > I supposed to get immediate data which is generated after I start it.  
> >
> > Just to check my understanding.
> >
> > This is an edge triggered interrupt and it triggers every time a new sample
> > is taken.  Those samples are taken on a fixed frequency irrespective of whether
> > we have read the previous one?
> >  
> 
> Yes.
> I use LEVEL_LOW trigger in latest review MFD patch.

I'm not sure I follow that comment.  How can you do that if it's a repeating
edge trigger? 

> 
> > >
> > > When I disable ADC_CHANx_EN, the H/W logical ADC is still running.
> > > If I run the same ADC immediately, I may get the old result about this channel.
> > > MT6360 ADC typical conversation time is about 25ms.
> > > So We need ignore which irq trigger below 25ms.  
> >
> > Normal trick for this sort of case is to just not use the interrupt.
> > Just read after 25+delta msecs and you are guaranteed to get the right answer.
> >
> >  
> 
> ACK, I will try to use polling
> Is the pseudocode correct?
> 
> mdelay(predict_end_t);
> while (true) {
>     read adc event is occured
>     check report channel is the same
>     if the same, read report ADC data and break while loop
>     else msleep(per ADC conversion time)
> }

Looks correct to me.  We should 'know' the event has happened but
still need to check the channel is the expected one.

...


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
