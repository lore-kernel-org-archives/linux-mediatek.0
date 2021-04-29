Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14506C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 02:39:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D8A6109E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 02:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D8A6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aoaV8YwlwhjUTeiIat0uyROLXl+swxXl8an6jbL905U=; b=Jk/cE9oyvi86Oq1tPawZEKKeF
	cslLIqcpwKx66qLPFawHPQyqaE5HKYM8jvQcuSjjTTaYC/cT+GcjzXVV+HrEgyvOl8TpYWqD7bYx1
	pM6cru45wrqQQ/5chNT3gzzbbGhHo3LPa9EhM/QexGTrDCmGwaXzyr2Qt2TwAHGtSweoOUlrg5MPY
	JgSOCbdWifLMZX1HY5Wid+OZQmn7dVYJIfYMj7ge804o4RjJI7fVotywvrR+7xNlf4Bmlx5nnxR3P
	hAhXefntdrLeYQnDM/6ikiik+xUQk7604A7pgKI8mJkWvVeUwtajAj2ngWYoHIhsjVDib0FN1cvoz
	ST+lcffsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbwaR-004iJ0-K4; Thu, 29 Apr 2021 02:39:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbwaO-004iHi-6Y; Thu, 29 Apr 2021 02:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=q/FaoQLv6QgSAico/USd2b8Yj3HsXw/rCw1Qjb021Po=; b=kTdGkX0dVrF2z3F/G+wK9SFHoB
 Lr2HiqKippcX+DHbe2MNOJvMeFpTXkci8VBgXMPe0VcURsiwTmPnUY4g+9iXWtP9KAOPhLBiA0R6k
 xjz9kr8X+RKimlbHhfb26ofSfOyhSxynL1bOzM+WAzcIKsjPdlg3omeKvJm6CRbeGhDDXByVHNSbv
 bADRbq7RRnXxk7qMOpFoz47bEYA3Cru7bRqfyF5mbUNskEI4lLelIOUYxoghBD2M7InZu3pHQP2pv
 /GDByHvPLQjKusof0ozPR34JoU7FxzX5XDxkIDiyWPeR9Fhe3vaJpPVyzH/6FXWw6YHdoEO+UqlkM
 rpaLERgQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbwaK-000KNx-FK; Thu, 29 Apr 2021 02:39:26 +0000
X-UUID: 627159dc45e34ad198adf53a12b3379e-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q/FaoQLv6QgSAico/USd2b8Yj3HsXw/rCw1Qjb021Po=; 
 b=X7EV4jaMhHqpnLFGkV978Aa/C9iPBgUUiYqfyNotb6WJIP+0WAm+IxihVabn6VzHbHiiwMny9SYyISE71ofMZzckGDTHEkH+QV7DC1BcMkLMwWZj61pWGVun1UMktmQcd4jvPX8FMRRABUctdH2/aaZ7jH1ADsPwsWou1N5fBas=;
X-UUID: 627159dc45e34ad198adf53a12b3379e-20210428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1153100359; Wed, 28 Apr 2021 19:39:20 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 19:39:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 10:39:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Apr 2021 10:39:09 +0800
Message-ID: <91163899840b5009a9e02c3b08a6f4fbe194b40b.camel@mediatek.com>
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
Date: Thu, 29 Apr 2021 10:39:09 +0800
In-Reply-To: <dac1f9bc-6caa-9cb7-97d6-882a8bd20fea@linaro.org>
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-4-michael.kao@mediatek.com>
 <dac1f9bc-6caa-9cb7-97d6-882a8bd20fea@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E88A581E76E76BF163A2CF2E64BBB0620794D4DF9058610DBE80509E5CC1BC332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_193924_544972_E14A1591 
X-CRM114-Status: GOOD (  40.15  )
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
Hi Daniel,

> This patch is changing more things than described in the changelog.
> Is it possible to share some technical details about how the
> sensor(s)
> are working or point to some documentation if any ? and possibly the
> layout ?
=> All these sensors are used in the driver, mtk_thermal.c.
We just register thermal_zone0 for the max value of the sensors in the
SoC before.
Now, the svs module need to read the sensor in the soc separately, so
we register all the sensor in the soc to thermal zone for other module
can read sensor value by get_thermal_zone_by_name.
This patch does not change the logic of read thermal sensor.
We still use auxadc and select bank to read sensors by thermal
controller.


> IIUC there is a fake thermal zone zero with the purpose of
> aggregating
> all the other sensors by taking the max temperature of all the
> sensors.

=> Yes, thermal_zone0 is fake zone that will show the max temperature
of all the sensors. The thermal throttle will reference this thermal
zone.

> This patch adds a thermal zone per sensor, and each sensor is per
> CPU.
> CPU0 being actually the max of all the other sensors, right ?
> 
=> For 8192 [1], we add these thermal sensors in the soc.
cpu_big1 
cpu_big2 
cpu_big3 
cpu_big4 
cci1 
cci2 
cpu_little1 
cpu_little2 
apu 
mlda 
gpu1 
gpu2 
infra 
camsys 

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20201223074944.2061-1-michael.kao@mediatek.com/


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
