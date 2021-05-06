Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E75C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 05:14:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740A961177
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 05:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 740A961177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6zgw27f+OHEXYQFjwJj2Tk2NJa7HAQqrGmEaOlEM0Jc=; b=qWeAfEZ3QY0+9SObnUDFcrLSj
	SqdxY/z1zMc6j1wzPKP3hWhLxCpr+Din3lwlS0ZWWHa9FuV+d94ZDQ6tjaSQPDGgeBTI1+lGzRLCn
	AYiSxJAolfRWK300S/yjyBYYC6a0D/n/+0VP+85DMvDcieu15ZPWXI90A+ocEYzTzlz0gFZCU94/F
	L8BmjsmL/yZpHFzuwjjs9WyS/PHz84PIdNNfyaRWHAULMDUvZ/YKFGB/2N2uulpICaW54xHu2At8x
	e82hpDYgOCzONw5lkiR1cxHROsIJwZVUnMQHC+4jikMWavtJGxfJQikvy4jI/cTglZeg5iTf/rA14
	e1laHcdzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leWLW-003Dvk-IK; Thu, 06 May 2021 05:14:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leWLU-003DvG-69; Thu, 06 May 2021 05:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=17Jnw/ww2KDeqO9BQ4PypTwrYjq+s7T1OWaDGZZDDMw=; b=RHTI6dRfOd0SZEEOmGHsf9vy1Z
 zE6/GNBkV8CqfWU8FYxVSUmcv4HN/O16X3ZK8rT2z2eKwwtCdtxL+RLfb03Wl8iyqD5FOC2PsRiu8
 y50qQR/X9wtleTeDCrncLftzdwjnHP3qbViH87SX5WDWA8eu21AWw0E42ZwaLCXpzXHCvXoj3Qwrl
 /04luipUbHAfBUXL/wd6Vckt7f8yvXaMl1jLv1g+Xp3aNtltFVQeJbfZsCTte6AENvaJRb5ujgNq7
 +4cgFqqF2e6fb9/fPe7071GTG0+6Wel5w/4zanojbBW8afc3AEdW40u7X7Je6gNqQoLLWsgvnUNoK
 HX4yuL7A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leWLQ-005c0g-TH; Thu, 06 May 2021 05:14:42 +0000
X-UUID: bc6553cb34cb45b2af2143cf939ef7f3-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=17Jnw/ww2KDeqO9BQ4PypTwrYjq+s7T1OWaDGZZDDMw=; 
 b=IsfwPFlApIflRwtMSmzTEaWsXPsdzfdZdcV98OkFATB+DkuYyfSM08cv3BblIbhlMwMGB+ILTQsGr273ToANMQc7e8TIkTaChWh3ovFzl/UipUgDfcRvkkEedpCcgvy0P8TconGKynk5GNPQC+M0I0XhPWdiba+icDvVkeaFj1w=;
X-UUID: bc6553cb34cb45b2af2143cf939ef7f3-20210505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 401448768; Wed, 05 May 2021 22:14:35 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 22:14:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 13:14:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 May 2021 13:14:32 +0800
Message-ID: <729667920f755d073217a5c52bfe4e20166cce80.camel@mediatek.com>
Subject: Re: [v7,3/3] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <fan.chen@mediatek.com>, Zhang
 Rui <rui.zhang@intel.com>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <Ben.Tseng@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 6 May 2021 13:14:31 +0800
In-Reply-To: <dac1f9bc-6caa-9cb7-97d6-882a8bd20fea@linaro.org>
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-4-michael.kao@mediatek.com>
 <dac1f9bc-6caa-9cb7-97d6-882a8bd20fea@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F4DE87A9348A7639CFC7C76826AEE09D7E2C7CE38A45FDE8414C866EA4E0B3B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_221440_973741_8CA27C14 
X-CRM114-Status: GOOD (  38.06  )
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

Hi Maintainers,

Gentle pin for this patch.

Thanks

On Fri, 2021-04-09 at 10:16 +0200, Daniel Lezcano wrote:
> On 16/03/2021 08:01, Michael Kao wrote:
> > Provide thermal zone to read thermal sensor
> > in the SoC. We can read all the thermal sensors
> > value in the SoC by the node /sys/class/thermal/
> > 
> > In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> > on the first read of sensor that often are bogus values.
> > This can avoid following warning on boot:
> > 
> >   thermal thermal_zone6: failed to read out thermal zone (-13)
> 
> This patch is changing more things than described in the changelog.
> 
> Is it possible to share some technical details about how the
> sensor(s)
> are working or point to some documentation if any ? and possibly the
> layout ?
> 
> IIUC there is a fake thermal zone zero with the purpose of
> aggregating
> all the other sensors by taking the max temperature of all the
> sensors.
> 
> This patch adds a thermal zone per sensor, and each sensor is per
> CPU.
> CPU0 being actually the max of all the other sensors, right ?
> 
> 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/thermal/mtk_thermal.c | 100 +++++++++++++++++++++++++-----
> > ----
> >  1 file changed, 75 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/thermal/mtk_thermal.c
> > b/drivers/thermal/mtk_thermal.c
> > index 149c6d7fd5a0..57e4f08a947e 100644
> > --- a/drivers/thermal/mtk_thermal.c
> > +++ b/drivers/thermal/mtk_thermal.c
> > @@ -245,6 +245,11 @@ enum mtk_thermal_version {
> >  
> >  struct mtk_thermal;
> >  
> > +struct mtk_thermal_zone {
> > +	struct mtk_thermal *mt;
> > +	int id;
> > +};
> > +
> >  struct thermal_bank_cfg {
> >  	unsigned int num_sensors;
> >  	const int *sensors;
> > @@ -637,6 +642,30 @@ static void mtk_thermal_put_bank(struct
> > mtk_thermal_bank *bank)
> >  		mutex_unlock(&mt->lock);
> >  }
> >  
> > +static u32 _get_sensor_temp(struct mtk_thermal *mt, int id)
> > +{
> > +	u32 raw;
> > +	int temp;
> > +
> > +	raw = readl(mt->thermal_base + mt->conf->msr[id]);
> > +
> > +	if (mt->conf->version == MTK_THERMAL_V1)
> > +		temp = raw_to_mcelsius_v1(mt, id, raw);
> > +	else
> > +		temp = raw_to_mcelsius_v2(mt, id, raw);
> > +
> > +	/*
> > +	 * The first read of a sensor often contains very high bogus
> > +	 * temperature value. Filter these out so that the system does
> > +	 * not immediately shut down.
> > +	 */
> > +
> > +	if (temp > 200000)
> > +		return -EAGAIN;
> > +	else
> > +		return temp;
> > +}
> > +
> >  /**
> >   * mtk_thermal_bank_temperature - get the temperature of a bank
> >   * @bank:	The bank
> > @@ -647,28 +676,11 @@ static void mtk_thermal_put_bank(struct
> > mtk_thermal_bank *bank)
> >  static int mtk_thermal_bank_temperature(struct mtk_thermal_bank
> > *bank)
> >  {
> >  	struct mtk_thermal *mt = bank->mt;
> > -	const struct mtk_thermal_data *conf = mt->conf;
> >  	int i, temp = INT_MIN, max = INT_MIN;
> > -	u32 raw;
> > -
> > -	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
> > -		raw = readl(mt->thermal_base + conf->msr[i]);
> >  
> > -		if (mt->conf->version == MTK_THERMAL_V1) {
> > -			temp = raw_to_mcelsius_v1(
> > -				mt, conf->bank_data[bank-
> > >id].sensors[i], raw);
> > -		} else {
> > -			temp = raw_to_mcelsius_v2(
> > -				mt, conf->bank_data[bank-
> > >id].sensors[i], raw);
> > -		}
> > +	for (i = 0; i < mt->conf->bank_data[bank->id].num_sensors; i++)
> > {
> >  
> > -		/*
> > -		 * The first read of a sensor often contains very high
> > bogus
> > -		 * temperature value. Filter these out so that the
> > system does
> > -		 * not immediately shut down.
> > -		 */
> > -		if (temp > 200000)
> > -			temp = 0;
> > +		temp = _get_sensor_temp(mt, i);
> >  
> >  		if (temp > max)
> >  			max = temp;
> > @@ -679,7 +691,8 @@ static int mtk_thermal_bank_temperature(struct
> > mtk_thermal_bank *bank)
> >  
> >  static int mtk_read_temp(void *data, int *temperature)
> >  {
> > -	struct mtk_thermal *mt = data;
> > +	struct mtk_thermal_zone *tz = data;
> > +	struct mtk_thermal *mt = tz->mt;
> >  	int i;
> >  	int tempmax = INT_MIN;
> >  
> > @@ -698,10 +711,28 @@ static int mtk_read_temp(void *data, int
> > *temperature)
> >  	return 0;
> >  }
> >  
> > +static int mtk_read_sensor_temp(void *data, int *temperature)
> > +{
> > +	struct mtk_thermal_zone *tz = data;
> > +	struct mtk_thermal *mt = tz->mt;
> > +	int id = tz->id - 1;
> > +
> > +	if (id < 0)
> > +		return -EACCES;
> > +
> > +	*temperature = _get_sensor_temp(mt, id);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
> >  	.get_temp = mtk_read_temp,
> >  };
> >  
> > +static const struct thermal_zone_of_device_ops
> > mtk_thermal_sensor_ops = {
> > +	.get_temp = mtk_read_sensor_temp,
> > +};
> > +
> >  static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
> >  				  u32 apmixed_phys_base, u32
> > auxadc_phys_base,
> >  				  int ctrl_id)
> > @@ -992,6 +1023,7 @@ static int mtk_thermal_probe(struct
> > platform_device *pdev)
> >  	u64 auxadc_phys_base, apmixed_phys_base;
> >  	struct thermal_zone_device *tzdev;
> >  	void __iomem *apmixed_base, *auxadc_base;
> > +	struct mtk_thermal_zone *tz;
> >  
> >  	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
> >  	if (!mt)
> > @@ -1080,11 +1112,29 @@ static int mtk_thermal_probe(struct
> > platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, mt);
> >  
> > -	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> > -						     &mtk_thermal_ops);
> > -	if (IS_ERR(tzdev)) {
> > -		ret = PTR_ERR(tzdev);
> > -		goto err_disable_clk_peri_therm;
> > +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
> > +		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> > +		if (!tz)
> > +			return -ENOMEM;
> > +
> > +		tz->mt = mt;
> > +		tz->id = i;
> > +
> > +		tzdev = devm_thermal_zone_of_sensor_register(&pdev-
> > >dev, i, tz, (i == 0) ?
> > +							     &mtk_therm
> > al_ops :
> > +							     &mtk_therm
> > al_sensor_ops);
> > +
> > +		if (IS_ERR(tzdev)) {
> > +			if (PTR_ERR(tzdev) == -ENODEV) {
> > +				dev_warn(&pdev->dev,
> > +					 "sensor %d not registered in
> > thermal zone in dt\n", i);
> > +				continue;
> > +			}
> > +			if (PTR_ERR(tzdev) == -EACCES) {
> > +				ret = PTR_ERR(tzdev);
> > +				goto err_disable_clk_peri_therm;
> > +			}
> > +		}
> >  	}
> >  
> >  	return 0;
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
