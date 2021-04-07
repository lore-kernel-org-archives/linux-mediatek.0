Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908B1C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 08:49:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33CAC61154
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 08:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33CAC61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r4TVtQwVpDknwCY6aVjkpebbxlMwksdiQqeq3K+/AXc=; b=e00Hxb+ezCipqt7Eo1jtQaS4d
	U9M76b02KiCJa96LQglYGsYmN1cvLCpYei/V78EEACPI4dCCYA2q909fN5xEOy9awc2fwfIkg3kLO
	1Jx8t2CFK5OANKOs57cvs5msAYCByDBU9y4HQzbMO+/ym4O09t6k7+4fFzRM8C0qIsUCdlxdhTiwD
	aKOBNFyAPsEy0ai6psY/yR1cVTaYZeQFBNmMaCan0TuA7xdQXdACBAIuqTrZJc9HNhZMSrO0Ulhk9
	ECFFnq9w0jTpOSkPwMbcIN39RwcvjiF4/hQ9kBoQ1dckjtnpX5gnnsso4hPEFJtKkD7T2dryYjiI6
	pGAUopaNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3sQ-004WuQ-LM; Wed, 07 Apr 2021 08:49:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3sK-004Wtk-R5; Wed, 07 Apr 2021 08:49:28 +0000
X-UUID: b27be23ee8b7402b90a45aea3926d4b9-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zplQN6NoPcssa1o1o1+M/kM9dwPi858NTpFtVnCbbak=; 
 b=Wdgq6hrnGMtH+WeYkjfzn+S0K5jm2zh0FX1byLz7I+qtgW794le7JLOIBHkqnA8fNifjBvGHtl5lexNA3McVT1Wxr3a3BcZrZlWN75rEICA1/9FClYUC90tQBckjE6affb9sTRtmGaN4oz14qbX2kZjSJ0x1xy8SaQCBKpkyzQE=;
X-UUID: b27be23ee8b7402b90a45aea3926d4b9-20210407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 968615776; Wed, 07 Apr 2021 01:49:17 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 01:49:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 16:49:13 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Apr 2021 16:49:14 +0800
Message-ID: <1617785354.12846.0.camel@mtksdccf07>
Subject: Re: [v7, 3/3] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, Eduardo Valentin <edubezval@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 7 Apr 2021 16:49:14 +0800
In-Reply-To: <20210316070144.28440-4-michael.kao@mediatek.com>
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-4-michael.kao@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_094925_782747_5B31AC3D 
X-CRM114-Status: GOOD (  31.96  )
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

On Tue, 2021-03-16 at 15:01 +0800, Michael Kao wrote:
> Provide thermal zone to read thermal sensor
> in the SoC. We can read all the thermal sensors
> value in the SoC by the node /sys/class/thermal/
> 
> In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> on the first read of sensor that often are bogus values.
> This can avoid following warning on boot:
> 
>   thermal thermal_zone6: failed to read out thermal zone (-13)
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/thermal/mtk_thermal.c | 100 +++++++++++++++++++++++++---------
>  1 file changed, 75 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 149c6d7fd5a0..57e4f08a947e 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -245,6 +245,11 @@ enum mtk_thermal_version {
>  
>  struct mtk_thermal;
>  
> +struct mtk_thermal_zone {
> +	struct mtk_thermal *mt;
> +	int id;
> +};
> +
>  struct thermal_bank_cfg {
>  	unsigned int num_sensors;
>  	const int *sensors;
> @@ -637,6 +642,30 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
>  		mutex_unlock(&mt->lock);
>  }
>  
> +static u32 _get_sensor_temp(struct mtk_thermal *mt, int id)
> +{
> +	u32 raw;
> +	int temp;
> +
> +	raw = readl(mt->thermal_base + mt->conf->msr[id]);
> +
> +	if (mt->conf->version == MTK_THERMAL_V1)
> +		temp = raw_to_mcelsius_v1(mt, id, raw);
> +	else
> +		temp = raw_to_mcelsius_v2(mt, id, raw);
> +
> +	/*
> +	 * The first read of a sensor often contains very high bogus
> +	 * temperature value. Filter these out so that the system does
> +	 * not immediately shut down.
> +	 */
> +
> +	if (temp > 200000)
> +		return -EAGAIN;
> +	else
> +		return temp;
> +}
> +
>  /**
>   * mtk_thermal_bank_temperature - get the temperature of a bank
>   * @bank:	The bank
> @@ -647,28 +676,11 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
>  static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>  {
>  	struct mtk_thermal *mt = bank->mt;
> -	const struct mtk_thermal_data *conf = mt->conf;
>  	int i, temp = INT_MIN, max = INT_MIN;
> -	u32 raw;
> -
> -	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
> -		raw = readl(mt->thermal_base + conf->msr[i]);
>  
> -		if (mt->conf->version == MTK_THERMAL_V1) {
> -			temp = raw_to_mcelsius_v1(
> -				mt, conf->bank_data[bank->id].sensors[i], raw);
> -		} else {
> -			temp = raw_to_mcelsius_v2(
> -				mt, conf->bank_data[bank->id].sensors[i], raw);
> -		}
> +	for (i = 0; i < mt->conf->bank_data[bank->id].num_sensors; i++) {
>  
> -		/*
> -		 * The first read of a sensor often contains very high bogus
> -		 * temperature value. Filter these out so that the system does
> -		 * not immediately shut down.
> -		 */
> -		if (temp > 200000)
> -			temp = 0;
> +		temp = _get_sensor_temp(mt, i);
>  
>  		if (temp > max)
>  			max = temp;
> @@ -679,7 +691,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>  
>  static int mtk_read_temp(void *data, int *temperature)
>  {
> -	struct mtk_thermal *mt = data;
> +	struct mtk_thermal_zone *tz = data;
> +	struct mtk_thermal *mt = tz->mt;
>  	int i;
>  	int tempmax = INT_MIN;
>  
> @@ -698,10 +711,28 @@ static int mtk_read_temp(void *data, int *temperature)
>  	return 0;
>  }
>  
> +static int mtk_read_sensor_temp(void *data, int *temperature)
> +{
> +	struct mtk_thermal_zone *tz = data;
> +	struct mtk_thermal *mt = tz->mt;
> +	int id = tz->id - 1;
> +
> +	if (id < 0)
> +		return -EACCES;
> +
> +	*temperature = _get_sensor_temp(mt, id);
> +
> +	return 0;
> +}
> +
>  static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
>  	.get_temp = mtk_read_temp,
>  };
>  
> +static const struct thermal_zone_of_device_ops mtk_thermal_sensor_ops = {
> +	.get_temp = mtk_read_sensor_temp,
> +};
> +
>  static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>  				  u32 apmixed_phys_base, u32 auxadc_phys_base,
>  				  int ctrl_id)
> @@ -992,6 +1023,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  	u64 auxadc_phys_base, apmixed_phys_base;
>  	struct thermal_zone_device *tzdev;
>  	void __iomem *apmixed_base, *auxadc_base;
> +	struct mtk_thermal_zone *tz;
>  
>  	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>  	if (!mt)
> @@ -1080,11 +1112,29 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, mt);
>  
> -	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> -						     &mtk_thermal_ops);
> -	if (IS_ERR(tzdev)) {
> -		ret = PTR_ERR(tzdev);
> -		goto err_disable_clk_peri_therm;
> +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
> +		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> +		if (!tz)
> +			return -ENOMEM;
> +
> +		tz->mt = mt;
> +		tz->id = i;
> +
> +		tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i, tz, (i == 0) ?
> +							     &mtk_thermal_ops :
> +							     &mtk_thermal_sensor_ops);
> +
> +		if (IS_ERR(tzdev)) {
> +			if (PTR_ERR(tzdev) == -ENODEV) {
> +				dev_warn(&pdev->dev,
> +					 "sensor %d not registered in thermal zone in dt\n", i);
> +				continue;
> +			}
> +			if (PTR_ERR(tzdev) == -EACCES) {
> +				ret = PTR_ERR(tzdev);
> +				goto err_disable_clk_peri_therm;
> +			}
> +		}
>  	}
>  
>  	return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
