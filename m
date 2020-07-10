Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85B2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 15:19:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953012065D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 15:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sq5OYEFU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNtM+doY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 953012065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HrJavq87DGk4JWtq13AaIhGyg0r3yKbkqCVYELt9tiw=; b=Sq5OYEFUNDkExs8n7s5GjrTF+
	nmLIgvebEBgIu2e3FBQ0PJ8rsuWoJmYsfPwoHAGGO2c+QmnA5SRa4gNC/JX9nUE5E+0wgnXd00zP1
	DofFJrufPn/vjxChPI8mG06UQx6gYuEmbSLmD52YixXqd1gdvd00dfUVs7JLzslhF5ZANtlTv0YTb
	swa8UaP3fYI/dbby/kLfMWNc6gFgx3RaqlUP7UsH6iB0/IfQjMv6o8c+oYHNwJxCfxTtHp2gbddCL
	IS0LRnD4ywoCnDbDg2tppZ94EqH2V/hzGadEDrMmoFy4AI4qKHQ+Cx1s595SpCdXJGwsotjgrBlwV
	kXZEEl81g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtunq-0007RT-W3; Fri, 10 Jul 2020 15:19:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtunp-0007R0-Ej; Fri, 10 Jul 2020 15:19:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id g75so6543737wme.5;
 Fri, 10 Jul 2020 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XrzFqDjZylNG+KL47kJnNsuvtb+1kxd+FPY+/i5mZt4=;
 b=UNtM+doYl8G3EzvIWbXAfCydIYtbFtA/G65jpu8mwF5//qs+MAlXc3y9qszbPU687D
 CYDVzXa2j2Q3IkfrxO+d/sRFSUEpP+FtA6lJISsji6Kx7ufcEJGzD4Ej6oO94KwzB63u
 sO1yqQuF4Fta7foJsA5tYSNCrtdbZX8Mb5V8VrM8/Yl+m88PJBesCAhnrkKOstjyODIf
 qjNHQsapydA7qW5u/AB0Etram1VzVzJL+zLiSZhH3ZXB84kpS/C756PaUXH24wtYfULd
 nOACW/fPGEPhSjHnfgROOQ1pGrgfesos7KeIznyfbEJVkxM6M8RpkkxOlnKHrtS/OkGg
 kZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XrzFqDjZylNG+KL47kJnNsuvtb+1kxd+FPY+/i5mZt4=;
 b=SGUkJluNjwDP1X8SzrMP+xdkxOAWrA7HqAyjzc/7OzWhhpfLTm3TRkMgnyfemHbwwD
 dmnTUEZAXFXDXnHsKikVHjd7ZopJfCE1kJgo+txU07IIqqNooLvF9gCK39GBX2SsQ6cn
 66LlTGBPJN6oNgHsT9dYwjyRI6bsp8NI7KZYxLlfjNksNpzXg1DjlBFNZBdHyqpSsUJR
 UcnBZKoD3rH7EoCwTIFHVqkExhXkI+5Hv6yD1I42Ha5Ed9WuUvPKTLfp8Vx16psKbBF3
 qHAMHndXGR8/h+RwbPMdZbNmC0V7+RkWMN1PYlZqKc4UYjZ8j9Hx12BxcxnkbQ+PofIW
 0bNQ==
X-Gm-Message-State: AOAM533ycHC/AK0HwpHJcyaFbqw8gyUYeqyYWEWQk9OPzj1q6sIRja7R
 fCEnqax0OH8mNiRYorp20Ts=
X-Google-Smtp-Source: ABdhPJzCkcfkGK+ERXI385yQy9ajXHjD/934EyflpmvQE2QG2B1P+YuyDCKd9EOc/U3LBtnDAZ1wBQ==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr5420848wmo.62.1594394343258; 
 Fri, 10 Jul 2020 08:19:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id r10sm10531744wrm.17.2020.07.10.08.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 08:19:02 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] thermal: mediatek: prepare to add support for
 other platforms
To: Henry Yen <henry.yen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amit.kucheria@verdurent.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
 <1588238074-19338-2-git-send-email-henry.yen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <94d81c8a-2710-98a1-4cae-040e9b51fcd9@gmail.com>
Date: Fri, 10 Jul 2020 17:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1588238074-19338-2-git-send-email-henry.yen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_111905_532853_A87CDA79 
X-CRM114-Status: GOOD (  27.84  )
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
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/04/2020 11:14, Henry Yen wrote:
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

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/thermal/mtk_thermal.c | 114 ++++++++++++++++++----------------
>   1 file changed, 62 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 76e30603d4d5..10107d9d56a8 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -120,18 +120,18 @@
>    * MT2701 has 3 sensors and needs 3 VTS calibration data.
>    * MT2712 has 4 sensors and needs 4 VTS calibration data.
>    */
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
>   enum {
>   	VTS1,
> @@ -525,7 +525,7 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
>    * This converts the raw ADC value to mcelsius using the SoC specific
>    * calibration constants
>    */
> -static int raw_to_mcelsius(struct mtk_thermal *mt, int sensno, s32 raw)
> +static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
>   {
>   	s32 tmp;
>   
> @@ -594,9 +594,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   		raw = readl(mt->thermal_base +
>   			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
>   
> -		temp = raw_to_mcelsius(mt,
> -				       conf->bank_data[bank->id].sensors[i],
> -				       raw);
> +		temp = raw_to_mcelsius_v1(mt,
> +					  conf->bank_data[bank->id].sensors[i],
> +					  raw);
>   
>   		/*
>   		 * The first read of a sensor often contains very high bogus
> @@ -758,6 +758,51 @@ static u64 of_get_phys_base(struct device_node *np)
>   	return of_translate_address(np, regaddr_p);
>   }
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
>   static int mtk_thermal_get_calibration_data(struct device *dev,
>   					    struct mtk_thermal *mt)
>   {
> @@ -793,43 +838,8 @@ static int mtk_thermal_get_calibration_data(struct device *dev,
>   		goto out;
>   	}
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
>   		dev_info(dev, "Device not calibrated, using default calibration values\n");
> -	}
>   
>   out:
>   	kfree(buf);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
