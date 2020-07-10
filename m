Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D138C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A4EF20786
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZhISAqK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TaxTMcAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A4EF20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=48qibzO+cP84CvAVBhs3HBQipDOuJEAa/jAVrl7dA5s=; b=FZhISAqK4GNW8JGewVFI0RdcL
	bd9Bmo4N3WRqvc35Xz0F4OgL6i7qOiCYl+1ihyPRb955eKQAuf6wkuUNemrPiHd8fWzYzmBO4rn2+
	oSyRZ83reIq8mIojMjeAd3/nbYpebC6uKmqbud72H24oPJKiNd+4FyQTYVCIxsnZ5c9tz/22y+phx
	eBHuKbLYm7kZlrXC8m9KVfXmdy7gb3LHUy2AKJbIlKHl5eXgVrKI7zLkv03j8vG/fKZolVSxBClHS
	82+j+4hOFXcNRVw+noMDRrdlqODdxJfFEp3yrjpVtG5SQGKKgTsfShfLeRfkPgBP4ncXZJRkg1Uq6
	eDlHqu0aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtq1Y-0002Ds-Vu; Fri, 10 Jul 2020 10:12:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtq1U-0002DG-C0; Fri, 10 Jul 2020 10:12:53 +0000
X-UUID: a56dc53956a74c269342bd6186ed7e24-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+4c74NVArRBIIoYLPPEccmW7RniPRSe9tGbNorQsXlU=; 
 b=TaxTMcAmZ+TLJLG8DosKFzMar+IxIKxLoGlhUtWrmpJIvNBoMnJsXj88EQ/uz9uZRw9+4VCWAxJK0ZR5r72XObEAgQ0N09lNKuvMOYU4HlAmlIolkPKcX4IIyUPgB1EnaGYaB+YAW2K5DNmLZXUEn4nhXqJz1NYj+7EB3sByFSA=;
X-UUID: a56dc53956a74c269342bd6186ed7e24-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1501275933; Fri, 10 Jul 2020 02:12:48 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 03:02:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 18:02:44 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 18:02:44 +0800
Message-ID: <1594375364.4941.7.camel@mtksdccf07>
Subject: Re: [PATCH v2 2/2] thermal: mediatek: add tsensor support for V2
 thermal system
From: mtk17045 <henry.yen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Amit Kucheria
 <amit.kucheria@verdurent.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, ".
 Zhang Rui" <rui.zhang@intel.com>
Date: Fri, 10 Jul 2020 18:02:44 +0800
In-Reply-To: <1588238074-19338-3-git-send-email-henry.yen@mediatek.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
 <1588238074-19338-3-git-send-email-henry.yen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_061252_680711_1A53EEF0 
X-CRM114-Status: GOOD (  29.15  )
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
Cc: Steven Liu <steven.liu@mediatek.com>, linux-pm@vger.kernel.org,
 Henry Yen <henry.yen@mediatek.com>, linux-kernel@vger.kernel.org,
 Michael Kao <michael.kao@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-04-30 at 17:14 +0800, Henry Yen wrote:
> This patch adds full support for ver 2 thermal system (e.g., MT7622 SoC).
> The new changes include reading calibration data, converting temperature
> and hardware initialization which are specific for version 2 system.
> Each platform decides which function to call according to its version.
> 
> Fixes: 3966be3c08c3 ("thermal: mediatek: add support for MT7622 SoC")
> Signed-off-by: Henry Yen <henry.yen@mediatek.com>
> ---
>  drivers/thermal/mtk_thermal.c | 132 ++++++++++++++++++++++++++++++++--
>  1 file changed, 125 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 10107d9d56a8..88620f7e9890 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -38,6 +38,7 @@
>  #define TEMP_MONIDET0		0x014
>  #define TEMP_MONIDET1		0x018
>  #define TEMP_MSRCTL0		0x038
> +#define TEMP_MSRCTL1		0x03c
>  #define TEMP_AHBPOLL		0x040
>  #define TEMP_AHBTO		0x044
>  #define TEMP_ADCPNP0		0x048
> @@ -133,6 +134,20 @@
>  #define CALIB_BUF0_O_SLOPE_SIGN_V1(x)	(((x) >> 7) & 0x1)
>  #define CALIB_BUF1_ID_V1(x)		(((x) >> 9) & 0x1)
>  
> +/*
> + * Layout of the fuses providing the calibration data
> + * These macros could be used for MT7622.
> + */
> +#define CALIB_BUF0_ADC_OE_V2(x)		(((x) >> 22) & 0x3ff)
> +#define CALIB_BUF0_ADC_GE_V2(x)		(((x) >> 12) & 0x3ff)
> +#define CALIB_BUF0_DEGC_CALI_V2(x)	(((x) >> 6) & 0x3f)
> +#define CALIB_BUF0_O_SLOPE_V2(x)	(((x) >> 0) & 0x3f)
> +#define CALIB_BUF1_VTS_TS1_V2(x)	(((x) >> 23) & 0x1ff)
> +#define CALIB_BUF1_VTS_TS2_V2(x)	(((x) >> 14) & 0x1ff)
> +#define CALIB_BUF1_VTS_TSABB_V2(x)	(((x) >> 5) & 0x1ff)
> +#define CALIB_BUF1_VALID_V2(x)		(((x) >> 4) & 0x1)
> +#define CALIB_BUF1_O_SLOPE_SIGN_V2(x)	(((x) >> 3) & 0x1)
> +
>  enum {
>  	VTS1,
>  	VTS2,
> @@ -143,6 +158,11 @@ enum {
>  	MAX_NUM_VTS,
>  };
>  
> +enum mtk_thermal_version {
> +	MTK_THERMAL_V1 = 1,
> +	MTK_THERMAL_V2,
> +};
> +
>  /* MT2701 thermal sensors */
>  #define MT2701_TS1	0
>  #define MT2701_TS2	1
> @@ -245,6 +265,7 @@ struct mtk_thermal_data {
>  	const int *controller_offset;
>  	bool need_switch_bank;
>  	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
> +	enum mtk_thermal_version version;
>  };
>  
>  struct mtk_thermal {
> @@ -258,8 +279,10 @@ struct mtk_thermal {
>  
>  	/* Calibration values */
>  	s32 adc_ge;
> +	s32 adc_oe;
>  	s32 degc_cali;
>  	s32 o_slope;
> +	s32 o_slope_sign;
>  	s32 vts[MAX_NUM_VTS];
>  
>  	const struct mtk_thermal_data *conf;
> @@ -398,6 +421,7 @@ static const struct mtk_thermal_data mt8173_thermal_data = {
>  	.msr = mt8173_msr,
>  	.adcpnp = mt8173_adcpnp,
>  	.sensor_mux_values = mt8173_mux_values,
> +	.version = MTK_THERMAL_V1,
>  };
>  
>  /*
> @@ -428,6 +452,7 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
>  	.msr = mt2701_msr,
>  	.adcpnp = mt2701_adcpnp,
>  	.sensor_mux_values = mt2701_mux_values,
> +	.version = MTK_THERMAL_V1,
>  };
>  
>  /*
> @@ -458,6 +483,7 @@ static const struct mtk_thermal_data mt2712_thermal_data = {
>  	.msr = mt2712_msr,
>  	.adcpnp = mt2712_adcpnp,
>  	.sensor_mux_values = mt2712_mux_values,
> +	.version = MTK_THERMAL_V1,
>  };
>  
>  /*
> @@ -482,6 +508,7 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
>  	.msr = mt7622_msr,
>  	.adcpnp = mt7622_adcpnp,
>  	.sensor_mux_values = mt7622_mux_values,
> +	.version = MTK_THERMAL_V2,
>  };
>  
>  /*
> @@ -514,6 +541,7 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
>  	.msr = mt8183_msr,
>  	.adcpnp = mt8183_adcpnp,
>  	.sensor_mux_values = mt8183_mux_values,
> +	.version = MTK_THERMAL_V1,
>  };
>  
>  /**
> @@ -540,6 +568,36 @@ static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
>  	return mt->degc_cali * 500 - tmp;
>  }
>  
> +static int raw_to_mcelsius_v2(struct mtk_thermal *mt, int sensno, s32 raw)
> +{
> +	s32 format_1 = 0;
> +	s32 format_2 = 0;
> +	s32 g_oe = 1;
> +	s32 g_gain = 1;
> +	s32 g_x_roomt = 0;
> +	s32 tmp = 0;
> +
> +	if (raw == 0)
> +		return 0;
> +
> +	raw &= 0xfff;
> +	g_gain = 10000 + (((mt->adc_ge - 512) * 10000) >> 12);
> +	g_oe = mt->adc_oe - 512;
> +	format_1 = mt->vts[VTS2] + 3105 - g_oe;
> +	format_2 = (mt->degc_cali * 10) >> 1;
> +	g_x_roomt = (((format_1 * 10000) >> 12) * 10000) / g_gain;
> +
> +	tmp = (((((raw - g_oe) * 10000) >> 12) * 10000) / g_gain) - g_x_roomt;
> +	tmp = tmp * 10 * 100 / 11;
> +
> +	if (mt->o_slope_sign == 0)
> +		tmp = tmp / (165 - mt->o_slope);
> +	else
> +		tmp = tmp / (165 + mt->o_slope);
> +
> +	return (format_2 - tmp) * 100;
> +}
> +
>  /**
>   * mtk_thermal_get_bank - get bank
>   * @bank:	The bank
> @@ -594,9 +652,13 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>  		raw = readl(mt->thermal_base +
>  			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
>  
> -		temp = raw_to_mcelsius_v1(mt,
> -					  conf->bank_data[bank->id].sensors[i],
> -					  raw);
> +		if (mt->conf->version == MTK_THERMAL_V1) {
> +			temp = raw_to_mcelsius_v1(
> +				mt, conf->bank_data[bank->id].sensors[i], raw);
> +		} else {
> +			temp = raw_to_mcelsius_v2(
> +				mt, conf->bank_data[bank->id].sensors[i], raw);
> +		}
>  
>  		/*
>  		 * The first read of a sensor often contains very high bogus
> @@ -698,9 +760,11 @@ static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>  	writel(auxadc_phys_base + AUXADC_CON1_CLR_V,
>  	       controller_base + TEMP_ADCMUXADDR);
>  
> -	/* AHB address for pnp sensor mux selection */
> -	writel(apmixed_phys_base + APMIXED_SYS_TS_CON1,
> -	       controller_base + TEMP_PNPMUXADDR);
> +	if (mt->conf->version == MTK_THERMAL_V1) {
> +		/* AHB address for pnp sensor mux selection */
> +		writel(apmixed_phys_base + APMIXED_SYS_TS_CON1,
> +		       controller_base + TEMP_PNPMUXADDR);
> +	}
>  
>  	/* AHB value for auxadc enable */
>  	writel(BIT(conf->auxadc_channel), controller_base + TEMP_ADCEN);
> @@ -803,6 +867,23 @@ static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf)
>  	return 0;
>  }
>  
> +static int mtk_thermal_extract_efuse_v2(struct mtk_thermal *mt, u32 *buf)
> +{
> +	if (!CALIB_BUF1_VALID_V2(buf[1]))
> +		return -EINVAL;
> +
> +	mt->adc_oe = CALIB_BUF0_ADC_OE_V2(buf[0]);
> +	mt->adc_ge = CALIB_BUF0_ADC_GE_V2(buf[0]);
> +	mt->degc_cali = CALIB_BUF0_DEGC_CALI_V2(buf[0]);
> +	mt->o_slope = CALIB_BUF0_O_SLOPE_V2(buf[0]);
> +	mt->vts[VTS1] = CALIB_BUF1_VTS_TS1_V2(buf[1]);
> +	mt->vts[VTS2] = CALIB_BUF1_VTS_TS2_V2(buf[1]);
> +	mt->vts[VTSABB] = CALIB_BUF1_VTS_TSABB_V2(buf[1]);
> +	mt->o_slope_sign = CALIB_BUF1_O_SLOPE_SIGN_V2(buf[1]);
> +
> +	return 0;
> +}
> +
>  static int mtk_thermal_get_calibration_data(struct device *dev,
>  					    struct mtk_thermal *mt)
>  {
> @@ -838,8 +919,15 @@ static int mtk_thermal_get_calibration_data(struct device *dev,
>  		goto out;
>  	}
>  
> -	if (mtk_thermal_extract_efuse_v1(mt, buf))
> +	if (mt->conf->version == MTK_THERMAL_V1)
> +		ret = mtk_thermal_extract_efuse_v1(mt, buf);
> +	else
> +		ret = mtk_thermal_extract_efuse_v2(mt, buf);
> +
> +	if (ret) {
>  		dev_info(dev, "Device not calibrated, using default calibration values\n");
> +		ret = 0;
> +	}
>  
>  out:
>  	kfree(buf);
> @@ -872,6 +960,28 @@ static const struct of_device_id mtk_thermal_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
>  
> +static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
> +{
> +	int tmp;
> +
> +	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
> +	tmp &= ~(0x37);
> +	tmp |= 0x1;
> +	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
> +	udelay(200);
> +}
> +
> +static void mtk_thermal_release_periodic_ts(struct mtk_thermal *mt,
> +					    void __iomem *auxadc_base)
> +{
> +	int tmp;
> +
> +	writel(0x800, auxadc_base + AUXADC_CON1_SET_V);
> +	writel(0x1, mt->thermal_base + TEMP_MONCTL0);
> +	tmp = readl(mt->thermal_base + TEMP_MSRCTL1);
> +	writel((tmp & (~0x10e)), mt->thermal_base + TEMP_MSRCTL1);
> +}
> +
>  static int mtk_thermal_probe(struct platform_device *pdev)
>  {
>  	int ret, i, ctrl_id;
> @@ -880,6 +990,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	u64 auxadc_phys_base, apmixed_phys_base;
>  	struct thermal_zone_device *tzdev;
> +	void __iomem *apmixed_base, *auxadc_base;
>  
>  	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>  	if (!mt)
> @@ -914,6 +1025,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	auxadc_base = of_iomap(auxadc, 0);
>  	auxadc_phys_base = of_get_phys_base(auxadc);
>  
>  	of_node_put(auxadc);
> @@ -929,6 +1041,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	apmixed_base = of_iomap(apmixedsys, 0);
>  	apmixed_phys_base = of_get_phys_base(apmixedsys);
>  
>  	of_node_put(apmixedsys);
> @@ -954,6 +1067,11 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  		goto err_disable_clk_auxadc;
>  	}
>  
> +	if (mt->conf->version == MTK_THERMAL_V2) {
> +		mtk_thermal_turn_on_buffer(apmixed_base);
> +		mtk_thermal_release_periodic_ts(mt, auxadc_base);
> +	}
> +
>  	for (ctrl_id = 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
>  		for (i = 0; i < mt->conf->num_banks; i++)
>  			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
Just gently ping.    
Many thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
