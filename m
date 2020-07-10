Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D14EC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 09:59:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06F420767
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 09:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CVYo+3B6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IXs9dnjz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06F420767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u4scO1CH7lCSbY6cxK9F4tG1VAvUehyU0HJH91ypNj8=; b=CVYo+3B6R8Q9Y+F5aPWaW3va9
	rvv0X7GvTWsYnqLmDpHMdqsn0fmGFxRDbsfN64Gv0Nez4kOjl1JNvnmauNCkfM4mXjJKVmw3fnQw8
	tHamLnqS0gX/LbJDbn7lEGAchECtk+5PL7wdOm13q1IwiNIifNpa1ymffu9zA5zsLB2Ax2HNxSNyV
	MnMLkyQhj3hhc2Vf6t09Go9q393wPfrATPhfsxOgxHQhsED6bywWsGWs8BFPALsvbENIB6cq4Py3P
	OJaYXOs8mhlzr+LfiBhiGQfq2gBFl63N2cKJ6p4pjcsc8/t3t19sou1RqS3R5y8i3KKDDa2dKFDYC
	QKAIFytWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtpoH-00011n-In; Fri, 10 Jul 2020 09:59:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtpoC-0000zw-4V; Fri, 10 Jul 2020 09:59:09 +0000
X-UUID: 85a91a02e58549b9b0ec6a804f835308-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9cnTTLygirc/3dYNOomZLWUoDSDdQ7ZAA5TnMPkOnZM=; 
 b=IXs9dnjzRhhd8xUEzx/zajdX4WxTOmHLxGF7Bc+PpV9ayOn8wMHutIx0+Iorrz2qhn3A9VzKceIItlBnv1THYuiprVF9jEy5qk6o3UR6xQJ/hMG0VgduwNFB0Ltt5xmiMB/W8yxcl6gc2IsUxbAV6bIi4yV606YHC8LpqIzvNzE=;
X-UUID: 85a91a02e58549b9b0ec6a804f835308-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 653229048; Fri, 10 Jul 2020 01:59:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 02:58:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 17:58:57 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 17:58:57 +0800
Message-ID: <1594375137.4941.5.camel@mtksdccf07>
Subject: Re: [PATCH v2 1/2] thermal: mediatek: prepare to add support for
 other platforms
From: mtk17045 <henry.yen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, ".
 Zhang Rui" <rui.zhang@intel.com>
Date: Fri, 10 Jul 2020 17:58:57 +0800
In-Reply-To: <1588238074-19338-2-git-send-email-henry.yen@mediatek.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
 <1588238074-19338-2-git-send-email-henry.yen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_055908_314272_22FCEADB 
X-CRM114-Status: GOOD (  25.82  )
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
> It is known that Mediatek owns two thermal systems, which only differ
> in the way of reading calibration data and converting temperature.
> MT8173, MT8183, MT2701 and MT2712 belongs to version 1 thermal
> system, and MT7622 belongs to version 2.
> 
> In order to handle both systems, the suffix _V1 is appended to the
> current code, and then the second patch will add _V2 functions with
> the same purpose but different implementation.
> 
> Signed-off-by: Henry Yen <henry.yen@mediatek.com>
> ---
>  drivers/thermal/mtk_thermal.c | 114 ++++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 76e30603d4d5..10107d9d56a8 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -120,18 +120,18 @@
>   * MT2701 has 3 sensors and needs 3 VTS calibration data.
>   * MT2712 has 4 sensors and needs 4 VTS calibration data.
>   */
> -#define CALIB_BUF0_VALID		BIT(0)
> -#define CALIB_BUF1_ADC_GE(x)		(((x) >> 22) & 0x3ff)
> -#define CALIB_BUF0_VTS_TS1(x)		(((x) >> 17) & 0x1ff)
> -#define CALIB_BUF0_VTS_TS2(x)		(((x) >> 8) & 0x1ff)
> -#define CALIB_BUF1_VTS_TS3(x)		(((x) >> 0) & 0x1ff)
> -#define CALIB_BUF2_VTS_TS4(x)		(((x) >> 23) & 0x1ff)
> -#define CALIB_BUF2_VTS_TS5(x)		(((x) >> 5) & 0x1ff)
> -#define CALIB_BUF2_VTS_TSABB(x)		(((x) >> 14) & 0x1ff)
> -#define CALIB_BUF0_DEGC_CALI(x)		(((x) >> 1) & 0x3f)
> -#define CALIB_BUF0_O_SLOPE(x)		(((x) >> 26) & 0x3f)
> -#define CALIB_BUF0_O_SLOPE_SIGN(x)	(((x) >> 7) & 0x1)
> -#define CALIB_BUF1_ID(x)		(((x) >> 9) & 0x1)
> +#define CALIB_BUF0_VALID_V1		BIT(0)
> +#define CALIB_BUF1_ADC_GE_V1(x)		(((x) >> 22) & 0x3ff)
> +#define CALIB_BUF0_VTS_TS1_V1(x)	(((x) >> 17) & 0x1ff)
> +#define CALIB_BUF0_VTS_TS2_V1(x)	(((x) >> 8) & 0x1ff)
> +#define CALIB_BUF1_VTS_TS3_V1(x)	(((x) >> 0) & 0x1ff)
> +#define CALIB_BUF2_VTS_TS4_V1(x)	(((x) >> 23) & 0x1ff)
> +#define CALIB_BUF2_VTS_TS5_V1(x)	(((x) >> 5) & 0x1ff)
> +#define CALIB_BUF2_VTS_TSABB_V1(x)	(((x) >> 14) & 0x1ff)
> +#define CALIB_BUF0_DEGC_CALI_V1(x)	(((x) >> 1) & 0x3f)
> +#define CALIB_BUF0_O_SLOPE_V1(x)	(((x) >> 26) & 0x3f)
> +#define CALIB_BUF0_O_SLOPE_SIGN_V1(x)	(((x) >> 7) & 0x1)
> +#define CALIB_BUF1_ID_V1(x)		(((x) >> 9) & 0x1)
>  
>  enum {
>  	VTS1,
> @@ -525,7 +525,7 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
>   * This converts the raw ADC value to mcelsius using the SoC specific
>   * calibration constants
>   */
> -static int raw_to_mcelsius(struct mtk_thermal *mt, int sensno, s32 raw)
> +static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
>  {
>  	s32 tmp;
>  
> @@ -594,9 +594,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>  		raw = readl(mt->thermal_base +
>  			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
>  
> -		temp = raw_to_mcelsius(mt,
> -				       conf->bank_data[bank->id].sensors[i],
> -				       raw);
> +		temp = raw_to_mcelsius_v1(mt,
> +					  conf->bank_data[bank->id].sensors[i],
> +					  raw);
>  
>  		/*
>  		 * The first read of a sensor often contains very high bogus
> @@ -758,6 +758,51 @@ static u64 of_get_phys_base(struct device_node *np)
>  	return of_translate_address(np, regaddr_p);
>  }
>  
> +static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf)
> +{
> +	int i;
> +
> +	if (!(buf[0] & CALIB_BUF0_VALID_V1))
> +		return -EINVAL;
> +
> +	mt->adc_ge = CALIB_BUF1_ADC_GE_V1(buf[1]);
> +
> +	for (i = 0; i < mt->conf->num_sensors; i++) {
> +		switch (mt->conf->vts_index[i]) {
> +		case VTS1:
> +			mt->vts[VTS1] = CALIB_BUF0_VTS_TS1_V1(buf[0]);
> +			break;
> +		case VTS2:
> +			mt->vts[VTS2] = CALIB_BUF0_VTS_TS2_V1(buf[0]);
> +			break;
> +		case VTS3:
> +			mt->vts[VTS3] = CALIB_BUF1_VTS_TS3_V1(buf[1]);
> +			break;
> +		case VTS4:
> +			mt->vts[VTS4] = CALIB_BUF2_VTS_TS4_V1(buf[2]);
> +			break;
> +		case VTS5:
> +			mt->vts[VTS5] = CALIB_BUF2_VTS_TS5_V1(buf[2]);
> +			break;
> +		case VTSABB:
> +			mt->vts[VTSABB] =
> +				CALIB_BUF2_VTS_TSABB_V1(buf[2]);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	mt->degc_cali = CALIB_BUF0_DEGC_CALI_V1(buf[0]);
> +	if (CALIB_BUF1_ID_V1(buf[1]) &
> +	    CALIB_BUF0_O_SLOPE_SIGN_V1(buf[0]))
> +		mt->o_slope = -CALIB_BUF0_O_SLOPE_V1(buf[0]);
> +	else
> +		mt->o_slope = CALIB_BUF0_O_SLOPE_V1(buf[0]);
> +
> +	return 0;
> +}
> +
>  static int mtk_thermal_get_calibration_data(struct device *dev,
>  					    struct mtk_thermal *mt)
>  {
> @@ -793,43 +838,8 @@ static int mtk_thermal_get_calibration_data(struct device *dev,
>  		goto out;
>  	}
>  
> -	if (buf[0] & CALIB_BUF0_VALID) {
> -		mt->adc_ge = CALIB_BUF1_ADC_GE(buf[1]);
> -
> -		for (i = 0; i < mt->conf->num_sensors; i++) {
> -			switch (mt->conf->vts_index[i]) {
> -			case VTS1:
> -				mt->vts[VTS1] = CALIB_BUF0_VTS_TS1(buf[0]);
> -				break;
> -			case VTS2:
> -				mt->vts[VTS2] = CALIB_BUF0_VTS_TS2(buf[0]);
> -				break;
> -			case VTS3:
> -				mt->vts[VTS3] = CALIB_BUF1_VTS_TS3(buf[1]);
> -				break;
> -			case VTS4:
> -				mt->vts[VTS4] = CALIB_BUF2_VTS_TS4(buf[2]);
> -				break;
> -			case VTS5:
> -				mt->vts[VTS5] = CALIB_BUF2_VTS_TS5(buf[2]);
> -				break;
> -			case VTSABB:
> -				mt->vts[VTSABB] = CALIB_BUF2_VTS_TSABB(buf[2]);
> -				break;
> -			default:
> -				break;
> -			}
> -		}
> -
> -		mt->degc_cali = CALIB_BUF0_DEGC_CALI(buf[0]);
> -		if (CALIB_BUF1_ID(buf[1]) &
> -		    CALIB_BUF0_O_SLOPE_SIGN(buf[0]))
> -			mt->o_slope = -CALIB_BUF0_O_SLOPE(buf[0]);
> -		else
> -			mt->o_slope = CALIB_BUF0_O_SLOPE(buf[0]);
> -	} else {
> +	if (mtk_thermal_extract_efuse_v1(mt, buf))
>  		dev_info(dev, "Device not calibrated, using default calibration values\n");
> -	}
>  
>  out:
>  	kfree(buf);
Just gently ping.    
Many thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
