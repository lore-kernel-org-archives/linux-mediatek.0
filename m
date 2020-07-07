Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E22C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:08:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0806320663
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJaMyt9+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LkwLLfSi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0806320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lk/3YN/mB6oRYvfcp58IR9qat0xsMs2dABpa+5Uet7s=; b=uJaMyt9+YB62lAPsU26dYcNCL
	yWpIBC0Br5w/FoIO/eGfenPeDq0LRLLq5L4FdKjhHgcuJ3w/kNRi55O8UqEzKxmgtCMpmfRJhRmIN
	DXJmKyc603w9ndAlerVnoxwzWrF0Kcdzm8NFh6bxireH/NeJYpFfToqXsNSdPZE35PQ//TBXcDZoV
	utJTtik/0iFDDdtbmZv/BoLMyBf4SVzKsfs5zzAIcRSaZBXDUafBfzxL/gYf5gnNYVS3ZqWvNCRpq
	Z0RAPHf4GfB0vFvjgB8HFFX02WLu/3o0ANTD2xgtK8WOSrQ8NHQHZZWkdO/3ywTA1VHyOiaw0PgqH
	UrA/7APdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsdxc-0003SA-Ln; Tue, 07 Jul 2020 03:07:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsdxY-0003RH-3J; Tue, 07 Jul 2020 03:07:53 +0000
X-UUID: eb1850ec95904eb09336345ed42228ed-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T+ZuskSCtDAA8wvmKSdUy+6kIp3oOV+tNxuPtAN8RIA=; 
 b=LkwLLfSif7S916Snxc0RHUvNY3tZB1YmzBpmcdLZnU0ScfDngkYuOWMxUEZBT/q2SbNzfXbDw8VJYqzo04rqkheH4/Eao9xUTVn8aG8ydIx1dRRsSRRFlgFFQFbAprNvNPlrP7294gxLTa9fYGCakv32lx2HlPOi9O9bEqm/2ls=;
X-UUID: eb1850ec95904eb09336345ed42228ed-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 951755377; Mon, 06 Jul 2020 19:07:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 20:07:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 11:07:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 11:07:25 +0800
Message-ID: <1594091245.20216.3.camel@mtksdccf07>
Subject: Re: [v4, 6/7] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 7 Jul 2020 11:07:25 +0800
In-Reply-To: <fa43c55b-96c2-30c8-eb7e-983177dad13d@linaro.org>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <20200323121537.22697-7-michael.kao@mediatek.com>
 <fa43c55b-96c2-30c8-eb7e-983177dad13d@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_230752_293217_FF702571 
X-CRM114-Status: GOOD (  26.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-05-22 at 17:32 +0200, Daniel Lezcano wrote:
> On 23/03/2020 13:15, Michael Kao wrote:
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
> What the source problem of the sensor returning bogus values?

> The thermal controller will depend on the AUXADC module to read raw data from sensor.
Sometimes it will report wrong value because the AUXADC not ready or
other issue.
The thermal driver should add the judgement to prevent wrong temperature
value to cause
system immediately shut down.
> 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/thermal/mtk_thermal.c | 74 +++++++++++++++++++++++++++++++----
> >  1 file changed, 67 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> > index 6b7ef1993d7e..9eaca432920e 100644
> > --- a/drivers/thermal/mtk_thermal.c
> > +++ b/drivers/thermal/mtk_thermal.c
> > @@ -225,6 +225,11 @@ enum {
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
> > @@ -607,7 +612,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
> >  		 * not immediately shut down.
> >  		 */
> >  		if (temp > 200000)
> > -			temp = 0;
> > +			temp = -EAGAIN;
> >  
> >  		if (temp > max)
> >  			max = temp;
> > @@ -618,7 +623,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
> >  
> >  static int mtk_read_temp(void *data, int *temperature)
> >  {
> > -	struct mtk_thermal *mt = data;
> > +	struct mtk_thermal_zone *tz = data;
> > +	struct mtk_thermal *mt = tz->mt;
> >  	int i;
> >  	int tempmax = INT_MIN;
> >  
> > @@ -637,10 +643,44 @@ static int mtk_read_temp(void *data, int *temperature)
> >  	return 0;
> >  }
> >  
> > +static int mtk_read_sensor_temp(void *data, int *temperature)
> > +{
> > +	struct mtk_thermal_zone *tz = data;
> > +	struct mtk_thermal *mt = tz->mt;
> > +	const struct mtk_thermal_data *conf = mt->conf;
> > +	int id = tz->id - 1;
> > +	int temp = INT_MIN;
> > +	u32 raw;
> > +
> > +	if (id < 0)
> > +		return  -EACCES;
> > +
> > +	raw = readl(mt->thermal_base + conf->msr[id]);
> > +
> > +	temp = raw_to_mcelsius(mt, id, raw);
> > +
> > +	/*
> > +	 * The first read of a sensor often contains very high bogus
> > +	 * temperature value. Filter these out so that the system does
> > +	 * not immediately shut down.
> > +	 */
> > +
> > +	if (temp > 200000)
> > +		return  -EAGAIN;
> > +
> > +	*temperature = temp;
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
> >  	.get_temp = mtk_read_temp,
> >  };
> >  
> > +static const struct thermal_zone_of_device_ops mtk_thermal_sensor_ops = {
> > +	.get_temp = mtk_read_sensor_temp,
> > +};
> > +
> >  static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
> >  				  u32 apmixed_phys_base, u32 auxadc_phys_base,
> >  				  int ctrl_id)
> > @@ -873,6 +913,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
> >  	struct resource *res;
> >  	u64 auxadc_phys_base, apmixed_phys_base;
> >  	struct thermal_zone_device *tzdev;
> > +	struct mtk_thermal_zone *tz;
> >  
> >  	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
> >  	if (!mt)
> > @@ -954,11 +995,30 @@ static int mtk_thermal_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, mt);
> >  
> > -	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> > -						     &mtk_thermal_ops);
> > -	if (IS_ERR(tzdev)) {
> > -		ret = PTR_ERR(tzdev);
> > -		goto err_disable_clk_peri_therm;
> > +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
> > +		tz = kmalloc(sizeof(*tz), GFP_KERNEL);
> > +		if (!tz)
> > +			return -ENOMEM;
> > +
> > +		tz->mt = mt;
> > +		tz->id = i;
> > +
> > +		tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i,
> > +							     tz, (i == 0) ?
> > +				&mtk_thermal_ops : &mtk_thermal_sensor_ops);
> > +
> > +		if (IS_ERR(tzdev)) {
> > +			if (PTR_ERR(tzdev) == -ENODEV) {
> > +				dev_warn(&pdev->dev,
> > +					 "sensor %d not registered in thermal zone in dt\n",
> > +					 i);
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
