Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBF7C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 12:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25AC960E52
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 12:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25AC960E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhUHpT+UPhOcOQKS7LY1qvhlw6ES/JWDhpfFDBwgDRo=; b=vCJMJUlO3+Bt3/
	iSwgI8VtiLKlR8XR7gnHSVzFd/ojY/V/4CmguM5WIeVC64VRG2N9h+mBK6g1gVf4eIgCU2DO61JQx
	sCVkXab+OjbkOxIKqoerCs5dHQ4Rc1UWeoWGLhgnYtkjqy5eiRNm0Uci8HvfXvzbljoUq+aPCwvXd
	qoo1dgXjCjRtrzbN3Ptrch9rb0h9OmGzgyUy5ynqDW6k3GkuwNn4DqWgKa7rMRtztguX+4up5IQyV
	8G5/Us96UEb9egq0emkeFDvGJK4Vk5XCLvN0AV3SQV8bQPkgQv4hT+Zi9fggAphuojhg+3wjvJuC3
	vs/NfDzSEuEYlG6uwrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEVvO-00CZVu-7Z; Fri, 13 Aug 2021 12:04:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEVv7-00CZVG-O2; Fri, 13 Aug 2021 12:04:23 +0000
X-UUID: 29e114870980475bbddefad8c10f33b3-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vUAOvzKSeucK2ubkFgtwhNsDy8US+nwjlSJMvKmjoe8=; 
 b=hQubkYd+a3OpgIJwHBVknm8+dvHphOIcGFMDqSo4zyo/6JB+tKfLw9SmgzEgSNjPet5KqtJ/16GEfAx79A9xM1Fb40ye7+MelYFZc21gR75shZsn3CzlzcOkBTjM+6sCBIcsnLMZ1jaMmVzLgE0zaNLMk0RO5NkQbhvhb9CqKZM=;
X-UUID: 29e114870980475bbddefad8c10f33b3-20210813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ben.tseng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1019925190; Fri, 13 Aug 2021 05:04:12 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 04:54:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 19:54:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 19:54:08 +0800
Message-ID: <c419fd718799cd2352d5deaadfb1eae805538e70.camel@mediatek.com>
Subject: Re: [PATCH v8] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Ben Tseng <ben.tseng@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Fan Chen
 <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Michael Kao
 <michael.kao@mediatek.com>
Date: Fri, 13 Aug 2021 19:54:08 +0800
In-Reply-To: <eeb2a96d-5cd0-ef11-b16e-872d9f3dcb09@linaro.org>
References: <20210603110042.21688-1-ben.tseng@mediatek.com>
 <eeb2a96d-5cd0-ef11-b16e-872d9f3dcb09@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_050419_241288_9922D4EA 
X-CRM114-Status: GOOD (  53.12  )
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

Dear Daniel,

Sorry for the late reply


On Mon, 2021-06-14 at 18:58 +0200, Daniel Lezcano wrote:
> On 03/06/2021 13:00, Ben Tseng wrote:
> > From: Michael Kao <michael.kao@mediatek.com>
> > 
> > Provide thermal zone to read thermal sensor
> > in the SoC. We can read all the thermal sensors
> > value in the SoC by the node /sys/class/thermal/
> > 
> > In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> > on the first read of sensor that often are bogus values.
> > This can avoid following warning on boot:
> > 
> >   thermal thermal_zone6: failed to read out thermal zone (-13)
> > 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > 
> > ---
> > 
> > This patchset supports for MT8183 chip to mtk_thermal.c.
> > Add thermal zone of all the thermal sensor in SoC for
> > another get temperatrue. They don't need to thermal throttle.
> > And we bind coolers for thermal zone nodes of cpu_thermal.
> > 
> > Changes in V8:
> >     - Rebase to kernel-v5.13-rc1
> >     - Resend
> > 
> > Changes in v7:
> >     - Fix build error in v6.
> > 
> > Changes in v6:
> >     - Rebase to kernel-5.11-rc1.
> >     - [1/3]
> >         - add interrupts property.
> >     - [2/3]
> >         - add the Tested-by in the commit message.
> >     - [3/3]
> >         - use the mt->conf->msr[id] instead of conf->msr[id] in the
> >           _get_sensor_temp and mtk_thermal_bank_temperature.
> >         - remove the redundant space in _get_sensor_temp and
> >           mtk_read_sensor_temp.
> >         - change kmalloc to dev_kmalloc in mtk_thermal_probe.
> > 
> > Changes in v5:
> >     - Rebase to kernel-5.9-rc1.
> >     - Revise the title of cover letter.
> >     - Drop "[v4,7/7] thermal: mediatek: use spinlock to protect
> > PTPCORESEL"
> >     - [2/2]
> >         -  Add the judgement to the version of raw_to_mcelsius.
> > 
> > Changes in v4:
> >     - Rebase to kernel-5.6-rc1.
> >     - [1/7]
> >         - Squash thermal zone settings in the dtsi from [v3,5/8]
> >           arm64: dts: mt8183: Increase polling frequency for CPU
> > thermal zone.
> >         - Remove the property of interrupts and mediatek,hw-reset-
> > temp.
> >     - [2/7]
> >         - Correct commit message.
> >     - [4/7]
> >         - Change the target temperature to the 80C and change the
> > commit message.
> >     - [6/7]
> >         - Adjust newline alignment.
> >         - Fix the judgement on the return value of registering
> > thermal zone.
> > 
> > Changes in v3:
> >     - Rebase to kernel-5.5-rc1.
> >     - [1/8]
> >         - Update sustainable power of cpu, tzts1~5 and tztsABB.
> >     - [7/8]
> >         - Bypass the failure that non cpu_thermal sensor is not
> > find in thermal-zones
> >           in dts, which is normal for mt8173, so prompt a warning
> > here instead of
> >           failing.
> > 
> > 	Return -EAGAIN instead of -EACCESS on the first read of sensor
> > that
> >         often are bogus values. This can avoid following warning on
> > boot:
> > 
> >           thermal thermal_zone6: failed to read out thermal zone (-
> > 13)
> > 
> > Changes in v2:
> >     - [1/8]
> >         - Add the sustainable-power,trips,cooling-maps to the
> > tzts1~tztsABB.
> >     - [4/8]
> >         - Add the min opp of cpu throttle.
> > 
> > Matthias Kaehlcke (1):
> >   arm64: dts: mt8183: Configure CPU cooling
> > 
> > Michael Kao (2):
> >   thermal: mediatek: add another get_temp ops for thermal sensors
> >   arm64: dts: mt8183: add thermal zone node
> > ---
> >  drivers/thermal/mtk_thermal.c | 100
> > +++++++++++++++++++++++++++++++-----------
> >  1 file changed, 75 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/thermal/mtk_thermal.c
> > b/drivers/thermal/mtk_thermal.c
> > index 97e8678..b6bee451 100644
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
> 
> How does it differ from 'struct mtk_thermal_bank' ?

"truct mtk_thermal_zone" is duplicated. It will be removed next version

> 
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
> 
> Please add the proper conversion function as a callback and set it at
> probe time, instead of checking at every call.
> 

Thanks for your advisement. V1 or V2 will be assigned to a function
pointer during probe.

> > +	/*
> > +	 * The first read of a sensor often contains very high bogus
> > +	 * temperature value. Filter these out so that the system does
> > +	 * not immediately shut down.
> > +	 */
> 
> If it happens only once, why not call this function at probe time so
> this test won't be needed.
> 

It's exist in previous upstream version, and old chips should be
compatible. So we need to keep this filter to avoid wrong sensor
reading.

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
> 
> How this can happen ?
> 

tz->id > 0 is always true. It will be removed in next version.


> > 
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
> 
> If the error is none of the above, the loop continues. Is that what
> you
> want ?

Next version, As soon as thermal zone register fail, break and return.

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
