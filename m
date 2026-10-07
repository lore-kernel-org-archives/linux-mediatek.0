Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173ECA5FF1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=; b=ho4R+EL+JnwTHa0eHAYE6mghIZ
	SghIViejvJ27JBJQ0wNu7YgyRSOJPWcQgXtGeLI6BYc7YeO/Z7a6e/GLg4UNhJ90+KjtB3ZC4jJiB
	vg2YuMEtd72Gk5HHZ5A4IiKy2WYOI/9TESujVq02asV8LT781MbYeSSAHjfoQXgUHWmCCrYVWL84h
	Nbb4v/SIcAdU1doFOkS+PndnKhErWbBo2f6oHqB5R1A9DE39xRaY3fElmdjr12ur7dv/9nLBUysr+
	vvKpPdK4hY04kH3e+K/8f/PfY1IwDlBSdcwrne+6Cax843HH1sB8Du/Zu1zPepvbsvei2S9SgTGSd
	vzeDGW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQBC-00000002OLD-3BkX;
	Wed, 07 Oct 2026 11:51:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQB6-00000002OJu-2sMx
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:51:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV8vx3821198
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Oct 2026 11:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=; b=jCpXFkwVbJv22Gtp
	PfcOpQJynVnz4u4uXnFSYjyjYXDH4dvY8rsSKtmSqpqJbRHlKFclK0AmuRD6ECe7
	tN6Gmb9HUAl5YF3oKIsZZc0Blymr3e30s74AHayPsChoqSO/ezS1V95lI3DhR/j7
	7c9YGqTA0yO2aJ0DrhgOWDG6du7LQSnsap1K5KenZhGsh+81c4RiYnHP1/2TSn5y
	NGJ1l+e7VCkN5Zhg0t7WD+p0b2blnDUj8kVhY6d4O4HMibIkK3mPxXRJKgtPOZ0G
	Z4h7xe5nWDangcEAg62F5ChmHJlewNj6B7dw2G/41n4XTAK1sxCwpu06rx7Wj31l
	cUtI7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623v84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 11:51:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so674781385a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373879; x=1791978679; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=;
        b=PaxsjEoNpJn15GHsAPhAgOPGeUP4mioP94GnUP4x3zc9+ghNsKzD0nipV8MMk+CLSf
         Oqb46QIjtzF/fT60pUKAT0eIXTOI5s97fEPvabPXHszTg476tSgqeU7QIm/GyAN1YU3d
         SK8BPeZukgPj8ESzexki60FToR50dy9FpkdI928+t+V1AxYV/upDzycnmXXzqmWA7Q52
         Scxg3Epnrhea4YeYWUSmP3w/4aBySFGzCMf3vWo1djvh49qKVYduYRKcHjuvv5QbrdyO
         SQqVSF+JNLvL9e1boEGVVdYfyWekDvBU+q3iTvGljCeX/g7g/FuRxnCjxZ2kWN6t6lxp
         ru9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373879; x=1791978679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=;
        b=h/SqLxgAtuLCi7aByutaZx56MGjWAC3dOw3BPv+xXUarEVOzRotjdO1j8v/gjkhnUd
         Q1Yuli/r0jsIXZFQMrpoj63tpQtgoQs/kIe5/5W71Hz110kS2EtQ05lv0OX4eS3Ng4CF
         rofTozKh4+uaEp++sFZkUntIzHkRkatfMCtaG3YvztrwMdaotndyuKjeRZLJA+6X13if
         xY4dEoUjAUX1yP6PhtA7v0edzNJwZIsK6iOKulNSBkW1Bw2mEkpQFwvIAcnmQd8z/Iub
         xZmdCyfHIESGYYq+gIOV+LotqNLtk+O9vac+yShAv3ko2qM73ALVtIwmfrX+LdcYfVn3
         l/TA==
X-Forwarded-Encrypted: i=1; AKwUvBxcObDODcoizpGt24ho6NZfElqNJ4BvQ4vy4PMW5n4kXNXTVwvZ4PPcWOKtpBk01DPqfKNFtc+nO6uVZGSMUw==@lists.infradead.org
X-Gm-Message-State: AFuF++nm7pshP/KsC18I8mviQQ80kFb2E5hNGF8EyVvMCZSmQNY8Gb9R
	q+PLgO55aTh3w40MMCnocnf3c6DCGByJk90duP24YAFv8unmajXEvUCNqVrA05d5PJmMO0B07Fg
	4XlUxdaWBO3iPTZbhLtZzYWTNsFqvQuGwWEceNYJlfCe9F7885w7pqNg96qLFXhq8d4W9oLT/Wx
	Q=
X-Gm-Gg: AYBFou0hjIGhhU4/hBZz4w7bQ42pTuIs5P0IHMGPgqTC4d0HnhYDSIpJHJy50hWJkBW
	9Sp4j0zGtDN2YZfGEs4LbcDzafXdGGPcw4KnREW4Ssw/YVT6JByphPF66JiMNY/vg8itS0vUJZO
	oMZ8HgpWn0g8GVgH+hRl6nkNsCXqFHOsnxEUYq/+Ud0DbhLJocEogslY+LLS0NS7mDBeQCz9+Zk
	S+hZhOQdB80NJXPdYp5vXXoY2en9DBc2I8DZRcVi9FLgzlxcXh/EaxETnYubP2WsvEBlNa3jvQm
	RV8JRpaSWtujytJ5PboWf/yG6fY7sZv879ePzFZQ50UVshmyWzrFJmelPut+QMzvAfbVl6mgf5o
	JZJNVgCNQjX8tpwV0LJxnwxU55+Taprjc4I0Pebj9OfNT
X-Received: by 2002:a05:620a:31a8:b0:93e:634a:99c8 with SMTP id af79cd13be357-93e9b71c00cmr339090885a.25.1791373878652;
        Wed, 07 Oct 2026 04:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:93e:634a:99c8 with SMTP id af79cd13be357-93e9b71c00cmr339084385a.25.1791373877989;
        Wed, 07 Oct 2026 04:51:17 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2d563sm4984894f8f.41.2026.10.07.04.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:51:17 -0700 (PDT)
Message-ID: <7bb74631-6703-4a30-a7a7-424ce6340a03@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] thermal/drivers/mediatek/auxadc: Register per-sensor
 thermal zones
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261006025410.506443-1-nils@buechner.me>
 <20261006025410.506443-2-nils@buechner.me>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261006025410.506443-2-nils@buechner.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 759Lnuq_nNo3KAyvt1woHydY946EEOTq
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac63237 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=twVTte8M8PIwAJgjBN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX3n4FpLTUpWCd
 a7alF61VJzK0cj3cqkPobNYlC0vUP4sctKJ0eunxGrFCkT7hOaND5b5gp09xFdHrTP4tUf/z7+6
 tUq8woTb3F3sITWipADsLqGLIox6mQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX2HM5eSfom5yv
 sLOA9GQz/RuhSu+EgSkXjxsOKmc7CgyIA9E8T7YHTfAXHv+iporR/19cU1uqGnfBFkMg3+CrNHn
 XRxRfK2S07IeOS4LM0HJctCHQAmWnBBCeHkUmhWTSQZXcxJAzQJwqR/pfG2QmJoOxKrv6aOszfh
 E269Cuf8K9PA46j4iTyZL8Bw0gSML96ZReqPU8xBI4ueM481wmkqMaloKcdYHoy+gTlZPaEJB8S
 dnK9HDN8bMv7TE6X+bk86VyefJCqfsIkBLfVYjYt0GjV/2TwheeUGRPbNCKNGl0gCI6wqj3glVi
 BqCqI1FoM62od+IF1LOzZ0u3Xyf1i3OoWJAzceoFT6mqLckF5HqcUaRbiJjseW+CEH7FHN2prn+
 3JVS4TLvSXXFEWmycl5CT1H3G7WaIEnSbQZ6ypptpDWzwHX6jeNwpYJ4PacCM0HrxNov/kvY1Fx
 E+cXukH1gJ9a1AuNIuQ==
X-Proofpoint-ORIG-GUID: 759Lnuq_nNo3KAyvt1woHydY946EEOTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_045120_777857_277F56D5 
X-CRM114-Status: GOOD (  32.47  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/6/26 04:54, Nils Büchner wrote:
> The driver registers only thermal zone 0, which reports the hottest of
> all sensors. The MT8183 devicetree also describes a zone per sensor
> (soc, gpu, md1, cpu-little, cpu-big, abb as sensor ids 1-6), and
> mtk-svs looks up the "gpu-thermal" zone for its GPU banks. Without it
> SVS fails to probe on MT8183:
> 
>    SVSB_GPU: cannot get "gpu-thermal" thermal zone
>    mtk-svs 1100bc00.svs: error -ENODEV: svs bank resource setup fail
> 
> so the SoC never gets its calibrated, lower voltages.
> 
> Additionally register every sensor that has a devicetree zone, using
> sensor id = sensor number + 1, read from that sensor's own measurement
> register. Sensors without a zone are skipped, so SoCs whose devicetrees
> only describe zone 0 are unaffected.
> 
> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=1. On the device: all six
> sensor zones register and read plausible values (31-34 C idle, close
> to the board sensors), and mtk-svs finds gpu-thermal.
> 
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.
> 
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils Büchner <nils@buechner.me>
> ---
>   drivers/thermal/mediatek/auxadc_thermal.c | 80 ++++++++++++++++++++++-
>   1 file changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 9ee2e7283..59c8eaf87 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -308,6 +308,13 @@ struct mtk_thermal_bank {
>   	int id;
>   };
>   
> +/* A single sensor, exposed as its own thermal zone (DT sensor id = sensor + 1) */
> +struct mtk_thermal_sensor {
> +	struct mtk_thermal *mt;
> +	int bank;
> +	int index;
> +};
> +
>   struct mtk_thermal_data {
>   	s32 num_banks;
>   	s32 num_sensors;
> @@ -870,6 +877,77 @@ static const struct thermal_zone_device_ops mtk_thermal_ops = {
>   	.get_temp = mtk_read_temp,
>   };
>   
> +static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *temperature)
> +{
> +	struct mtk_thermal_sensor *sensor = thermal_zone_device_priv(tz);
> +	struct mtk_thermal *mt = sensor->mt;
> +	const struct mtk_thermal_data *conf = mt->conf;
> +	struct mtk_thermal_bank *bank = &mt->banks[sensor->bank];
> +	int temp;
> +	u32 raw;
> +
> +	mtk_thermal_get_bank(bank);
> +	raw = readl(mt->thermal_base + conf->msr[sensor->index]);
> +	temp = mt->raw_to_mcelsius(mt, conf->bank_data[sensor->bank].sensors[sensor->index],
> +				   raw);
> +	mtk_thermal_put_bank(bank);
> +
> +	if (!mtk_thermal_temp_is_valid(temp))
> +		return -EAGAIN;
> +
> +	*temperature = temp;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops mtk_thermal_sensor_ops = {
> +	.get_temp = mtk_read_sensor_temp,
> +};
> +
> +/*
> + * Zone 0 reports the hottest sensor. Also register every individual sensor
> + * the devicetree describes (sensor id = sensor number + 1): MT8183 SVS looks
> + * up its GPU bank temperature through the "gpu-thermal" zone and cannot
> + * probe without it. Sensors without a devicetree zone are skipped.
> + */
> +static int mtk_thermal_register_sensors(struct mtk_thermal *mt)
> +{
> +	const struct mtk_thermal_data *conf = mt->conf;
> +	struct thermal_zone_device *tzdev;
> +	struct mtk_thermal_sensor *sensor;
> +	int id, b, i;
> +
> +	for (id = 1; id <= conf->num_sensors; id++) {
> +		sensor = NULL;
> +		for (b = 0; b < conf->num_banks && !sensor; b++) {
> +			for (i = 0; i < conf->bank_data[b].num_sensors; i++) {
> +				if (conf->bank_data[b].sensors[i] != id - 1)
> +					continue;
> +				sensor = devm_kzalloc(mt->dev, sizeof(*sensor), GFP_KERNEL);
> +				if (!sensor)
> +					return -ENOMEM;
> +				sensor->mt = mt;
> +				sensor->bank = b;
> +				sensor->index = i;
> +				break;
> +			}
> +		}
> +		if (!sensor)
> +			continue;

Please move routines into self-explanatory functions and make this 
initialization function simpler to understand

> +
> +		tzdev = devm_thermal_of_zone_register(mt->dev, id, sensor,
> +						      &mtk_thermal_sensor_ops);
> +		if (IS_ERR(tzdev)) {
> +			if (PTR_ERR(tzdev) == -ENODEV)
> +				continue;
> +			return dev_err_probe(mt->dev, PTR_ERR(tzdev),
> +					     "failed to register sensor %d\n", id);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>   				  u32 apmixed_phys_base, u32 auxadc_phys_base,
>   				  int ctrl_id)
> @@ -1294,7 +1372,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   	if (ret)
>   		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
>   
> -	return 0;
> +	return mtk_thermal_register_sensors(mt);
>   }
>   
>   static struct platform_driver mtk_thermal_driver = {


