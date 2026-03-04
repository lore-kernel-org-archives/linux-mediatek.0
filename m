Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F1EDEC11
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=; b=Nq/Upsm5B2xYjrguZ4tokVLcC8
	wUTO4crmfNPxCxROdniurNjwXo5fpyfpObZacDLoenJx21Yqiu3JTFBYtYw+ymYrDyS8ptOXLBiPA
	3VEqCiOWAiflTOtkk31/9YHzkVHzxhuZX9rYERd4xy8fHOPoUwDuPHCmC/dPhizYxBxY1PpqPT3+O
	r3bHTRD/Hp1Vg6NA8vrUKiXQElM2A7zOL/zr5/G+UnTqpm57b/9IH/TlVVH1i7RZztmPi5oLH0brz
	Qx/s9u4ODwTFMZWvSyiT7Uu35ZyaBnVBNIgEq5uKmAElRglyiYbMb7HEFwWU+u9QGptMZGST59R78
	rn3G6+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxezb-0000000GUgu-29Uo;
	Wed, 04 Mar 2026 05:41:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxezX-0000000GUfH-3O7H
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 05:41:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SLHW2274966
	for <linux-mediatek@lists.infradead.org>; Wed, 4 Mar 2026 05:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=; b=Hnr/iguj6k1fVonc
	PMAh9YyYKduzxadaY/AQVRXix8kVklW20hbfs4s9mODekG0CB1q+tK+nwdzpG4tv
	CALIf/u+fFnncbs27+mzPwYkkLo10pZOh13kktkNVjony2scj/G2CTSNxLxYSs9V
	SciVKIbgmDOOXBeSO11pQXJyK4fjPh00JmzqmZ/sC82DDg/6WA8jp+CysQv7GG0e
	h11vKx2xJWXE9EuRanpgJqdxzmtLu5GErLbIYi7/bsTXCJT3ytr5+SxDUwULFcAi
	0EjgyKuJL9NlwZhkARQXP+HZMQES8LDxBBeR3SGt9l/R1WFlXdebYVCSqVbM4TPL
	be8xTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mrgmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 05:41:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be27d4e3e5so19597719eec.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Mar 2026 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602909; x=1773207709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=;
        b=fX2zJXMFs/NCp7bf1MJSmKODSx6QogyyoDVJEGyZlkQYe3aUy7OWD7zFmBoGcjoDsg
         kJaKbS4PVqrvaIshNoUDaMp4kfFViU1plCyAYUmX4SX1UjqcB8xQjcZgKDuvw0ghtG45
         9OO0sNz9e/whNPtY/l/YbpJSaMIL4S2w0pX6lpCra3p1CAmGAbUe0w1UTbczke9qdqGm
         i9rGLhhc38u5+c5uAWUxxNCSpFs1Xx+c6I0YK2sGxTGfaRWBu93NLAxhIrVVtUmarhCZ
         3WHSeXtjw7eH0VQ5YFmXl64XBbHv+TpoueeLG540wA+ktI1NMvrEqBQ2JO81uW/r3019
         kftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602909; x=1773207709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=;
        b=aTr15ZUMzsU4Q1o1s7lSlkQrlesOnHQnfI6seUYfCbMeWSE+UhhIG8wKxKmIsTQM6d
         8Q1d3sjSoZMG5w/OOM+tP0e9f/VYD78ZfUk53GIeky4IFZX9rIX0sRj08rUgl+85C0ZO
         OH7OPaKtqZRHw/6qqorO8WnT1IcNy9/BF7iiUm0Suxws8Qzfb8IVPDutVaThEKa4GwFx
         U2atfwF53noZqj0Rp/LE3Vb0cw5LzELSFDVJ+Ms88B20RIm8wS1nG5ucA5XmW5iYzYpw
         4URJmXCXRxbTI7m/H5w5y4srskVv+3UlGJgUxiYruH4HrxkH+uTx66R5rLdz7XRDu1z3
         4egg==
X-Forwarded-Encrypted: i=1; AJvYcCULWXJTl+VanJzmuqbD1++PbGsmK8udnSqj92oHTddxMTzxaokd2iHlJ8e31vdsj8CrhsQRj2z+tgBKIeauFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhpUKzygi8r9hpncsdLn6Oy7mPPZUCO98o0cciJxw922/UaoYY
	x8f6+U3JE/9ftXda2/zBuKzHnxCSPoj3tsc+FSTwDNl5UAnjEGhZkyuGv2uN/mcuIp5hjl1Yu40
	SxYWC1II1S8UCa859CFC+0zNSDJ4seFBU2DLKZTRgp/bvxbudwsgutYtZBZMt6PxUe6u2/pwXqr
	E=
X-Gm-Gg: ATEYQzwGabBEgTWOw8TIFEedxOEBlRQHu4qPvfkoMtMkbR2EH7Zk2V/eNImD2u5QSPA
	19yKYBRq753hVri4owzElUicv+QGXSYXW+0rbaRx6MXNjEt3LLzyEGtMB9o9BfFcN7nZnULgCKV
	h/pzOUR58dOuY1CHJtypzapSNSJIMXQMVWCP39oV9dwlxf+urJVcM5mvFWDhHs2Qmrn8q5xiI9n
	WeMJcNlAkda/fBp9ODaac+Vwb4c7rf/TZsJBeRJA+DrYJdrMEQWTbXEVALXnCaaHffEiFVC1l3Z
	IfGapa6PDvDpmTqJZl23eqDMLdtqsHgJPmlhaJ8cNHFJVkYFtOp+9mzOSo1Akvkv8sY+QU/WRZe
	2JiZh3HQnD8/xL9rz5+QZWDWCFcWDGTU1yQijYcgq+TTVE6lHXPWVto4=
X-Received: by 2002:a05:7301:1292:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2be30fccf2fmr316288eec.8.1772602908953;
        Tue, 03 Mar 2026 21:41:48 -0800 (PST)
X-Received: by 2002:a05:7301:1292:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2be30fccf2fmr316277eec.8.1772602908364;
        Tue, 03 Mar 2026 21:41:48 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1731b6b6sm6231081eec.5.2026.03.03.21.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:41:47 -0800 (PST)
Message-ID: <dc5191d0-831e-4da1-b498-da41a57b30b3@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:41:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
        tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
 <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: re059QqG4zWTl4CBIubhBs8Uab1UIrsx
X-Proofpoint-GUID: re059QqG4zWTl4CBIubhBs8Uab1UIrsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NSBTYWx0ZWRfX+t9LO8qd3aDN
 pTvC5y2o2A8Zinv0an2Loj2a3eq263H03e0CBER+4GuWWTMgwvE2CR8Re94xMn6Uj9OioEMmS9S
 jSsnkpmDlE+Q/FCCmFOZP9LoOZsXSTZ7sWRHICBlSZgR4lGSQ+3PvSBvITUynqapaX0KA7TldOi
 asgD2eMoYRtbUP4gvVnlDf11OJSJoMYkNQVZV6EI/pcj3k+4eNSHO93UU8CmUkjF50mjTIASm98
 yinv7tiCGcAPG20gcTeec8NWartvfnHsooybpg/ZUdGFXhj9nbhgg8A9+CDFLtLWC1h34M8hkjR
 A3FRv8MsPEwQDhzovGJc3HhbT8lSqhZkdki2+15uEFtOuc27LNtHgTsrYAWpa7rbVRVRPpPCRfM
 IRZoFm+M+ZuckTEw4vHogWj8eESW67DQsmhwxa086UmIiBhiPFpjDH+ZVRZXk5XLozidLcty42q
 Brma2zqBmiLu/fQzHZA==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7c61e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=8AirrxEcAAAA:8
 a=JS8otC1fTDAvhBOTJEIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=IawgGOuG5U0WyFbmm1f5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_214151_959763_D08EE0CA 
X-CRM114-Status: GOOD (  25.12  )
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

On 3/3/2026 6:57 PM, Zhipeng Wang wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Convert the timer-mediatek driver into a loadable module so that
> it can register an always-on timer as the tick_broadcast_device on
> MediaTek SoCs. This helps support GKI modular configurations.

You have expanded GKI in the cover letter but not in the commit text. 

Please add that in the commit text since this patch will be committed
and not the cover letter. 

> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Tested-by: Walter Chang <walter.chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/clocksource/Kconfig          |  2 +-
>  drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index fd9112706545..2112efb85029 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -488,7 +488,7 @@ config SYS_SUPPORTS_SH_CMT
>  	bool
>  
>  config MTK_TIMER
> -	bool "Mediatek timer driver" if COMPILE_TEST
> +	tristate "MediaTek timer driver"
>  	depends on HAS_IOMEM
>  	select TIMER_OF
>  	select CLKSRC_MMIO
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 7bcb4a3f26fb..4ad4bac6f34b 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> +
> +#ifndef MODULE
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>  TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +#else
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
> +	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mediatek-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Timer driver");
> +MODULE_LICENSE("GPL");
> +#endif


