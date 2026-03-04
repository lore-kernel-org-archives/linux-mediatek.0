Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F30EFCE3B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=; b=QB68xuWUyXKjZ5LaorLO3Iwunq
	dSJLGrlqT3nLoSfQEZAiUnLJ7kcz0n6kF0dZa86+hczBctHmv5lzDrW8pWmJybMdOkdz+4zoN1QgI
	svxo7iH92423R8HKfBjf5Ol4/vrvrSaZoFitTAKlUtRp9TMs3rvTGuHLorEagH+SmilCJE2EOE7pG
	jEq+lWsFEEg44jkUgki3M7XtCEdVdO0Z+YlrRBx/851Slk+CoOx2d/f34EbiPPLqJd9y3VkHjGMli
	kbDhPw4tznbfMdFKAJErd2P0QRT2HdJ+ncjdzos7SVZm3WMfEj8pOD96HxXRb6XSgBvBVHhhDNw6Z
	P/9vOmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrUa-00000000NBC-0q2J;
	Wed, 04 Mar 2026 19:02:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrUX-00000000NAW-385H
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 19:02:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HH7vX3837886
	for <linux-mediatek@lists.infradead.org>; Wed, 4 Mar 2026 19:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m3ID+Rt3thScCZWKCweYCrtA
	tGByTHZygFo61zkltu0=; b=kdbduWmAuOxgRJDnWHrdmZx794TiSXGoPs0P835a
	UMhWh3w9ExHrKJeno627eEYKhycPJQuEWxv+WeQMflCAKS29mFtKPfc9B3UZFkHd
	OdIBMrpmBn/Lkm7FWLFyH56RcYiS7X7a/CB4XXwZCi7xpwgCL/QRqWs3bpm/J9wc
	aETs6Mcq/4ycqyxL0GOK915RX8Cq6fBRdtU4x526NEnNL6tW0KUm7z8kFHkVYAEi
	vwFbJtZn8H2TD6IzTJYKCCNYmyf5T7XJ+azBvJiJY6+Echrw1NCNt6D3K1W0r04x
	MGKGz+K+plTRLHayID98c8ZeQETBPmNQJ0xQmWoIPK/RRg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m0aw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 19:02:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56aefd47f1aso1263879e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772650959; x=1773255759; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=;
        b=OhOBt1gAONW07KP1fpYKV7egSBho5vfI4X9gXM0b8cWAE4XT65/ZE8ns9qsjl65PaW
         SnTvRiBtk778ouogm6jUoaEt0TK1oSaOXCj5l60ioDSA4upPw6WO9QwDlIlY/PPuo33X
         MrLPi45eH6pNK6kLvqKn4KnB44qS7KZcyMo+5L+I7TkCkB4Rai6f0yU2DsO1cCI9rLaC
         MfvXrn/5Jq0+nnn8QTaU8R+QjY8iXMRn/11b7j9ViA4Oa26nTi5lc2ORpYUV1gKHN3jV
         X+aM8lSit/eHO8mNSZqTUszvbnJFItl4tV4TZ47GRmcE1V1UaZX/thpO2svaluACnUvB
         cabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650959; x=1773255759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=;
        b=nAeeMfvp4OCVH3NHCKHBQLqacuI0IvlCOFPLp5mMz8LUJGf6UmFfroPt2IUGnKhp62
         oajAVhhT5TZiUS0hrFxquJ2vKTMqUasGR4MCwKFy3tfZuZXPrmYNemYZNMbVE+IOr1Yp
         KFVhfFx8MVvfFDJTzQ8jE5MEhJPIzWPYV4xzVDIMLzgZLzSAjwvR4WWcUo9EaEAdjv40
         qqFxfPsUnSO6G5dFeQ563GmA+CWmPhG94fhpf+fS2ViBNYLht8gETRl1riy+w48k7iyo
         hRd0/m3mZmsk5IgBeOdvi5j2mXLe5ghBXUrzVR2cdDGbPfd0zaer8Rcp418QLXosCHfF
         dprQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd4l7IS0AdjVMlgRgGWEWsFeJWGsvYw4kJRXJtfvelDZV7PhQEqPiyjrRVtRRG0bH1y++/EoFCAuqoPO0aoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg8Y5d/tK9J40TwRQ81Bntyg84PqoCQydE03MxfDdULTDSH9nl
	hf7lvoGbDgTIXAZKfoLVgkw1utyUz28t/3wEZJPfHXFO58/T/g7+0N/XyNR4Gagdqd/eHwMa9up
	Z7C0NQGbZzxlzEyliIsnRfHTjOe9ltAj++kJxLJPc8huKn19pe1Z0kBeKwESUfyqUePte0e0fFn
	4=
X-Gm-Gg: ATEYQzxI0MHX1hB2w2p05n4SmwQttIBww9DwleEHo6tfhUMR3x9gjPNnrQVvm/Uhs6b
	wYAeKY+VR2aeBY5FINCCtzFDNlVRd8Zbjv0QQ+4lDVd4K5k61g9zHeSKVBAkdFour8ipRxsd4uq
	hwnnJZ0ArxvyCsFFlRvGb4eNV/In3R3xWm2SaHhr464OE4R+KgBuJNNl1Q1vx458/E3O/dw0gBd
	eO2GMDfJMjPaHspLYhg8kvwDZEUuMe8e6dsGxw6Zuiig6f3fnb3TX0i0QFBZ1llPnDNMMtAe7rq
	fZFNCXeGVm4HuekfC23vPzb9Y6pV3nlh18nFwe4/l83P9J7qgZGVo9bYBRzSPDWKyPOvnC1q0iv
	n2AEozbvvem9iDmpO2zDqe9W1fX6f
X-Received: by 2002:a05:6122:3d03:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56ae77c396bmr1558847e0c.14.1772650958811;
        Wed, 04 Mar 2026 11:02:38 -0800 (PST)
X-Received: by 2002:a05:6122:3d03:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56ae77c396bmr1558806e0c.14.1772650958386;
        Wed, 04 Mar 2026 11:02:38 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8a9542sm39209755e9.1.2026.03.04.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:02:36 -0800 (PST)
Date: Wed, 4 Mar 2026 20:02:34 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
Subject: Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
Message-ID: <aaiByowtXrTxPsd7@mai.linaro.org>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a881cf cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8
 a=8AirrxEcAAAA:8 a=4XJdlQNtnODeGaihWlIA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: BuDWm64T_5-Tow-cHURUpbtkEVdjzRkr
X-Proofpoint-GUID: BuDWm64T_5-Tow-cHURUpbtkEVdjzRkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1NSBTYWx0ZWRfX1JbLFayv+H48
 KYBDF+d8gD1DPKlFeOFwECT0B+wa0QwGbhtYs0tHhMPxne//W8Qe0loxr279N4Mt8vh0SiZ94GT
 SWXUJq+ADmwCz/hxOqiNyAiYELMGM4LvWRrTOX6vKUVVknnT47TN3sEX+n+fxew0ZajMVZP5C0e
 VFHKTlsjfjKFae+eU3wjVDDbTqfktPiTULjU4SVbBtfD/JECyksCL/L6z+1MIcBA7sYZPp8uZUL
 eX8ASO9Yo23hjYysbxUXiHODr7+NMjyrw3L5e+SVT86lkA3VJe1GwyQ2PCKlLxaWMEjPCoQVkgi
 L3092S3nc+M4oX/l+6yVj3NdkKSLg5XjlZjWUDn/N2bpNPDx3UEeBMy9/+3OOZkK6F7xfY9H0vP
 tbKGeqJOwnrxHnRi1ozglo45cfDGCTp5pQcU9PopbxAZq3UgCOo2Z5hVvZBcrkjYiJkzvPmPDc6
 sivaWrMW0qvBiKuuYfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_110241_836953_70799BA2 
X-CRM114-Status: GOOD (  27.80  )
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

On Wed, Mar 04, 2026 at 05:12:06PM +0900, Zhipeng Wang wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Convert the timer-mediatek driver into a loadable module so that it
> can register an always-on timer as the tick_broadcast_device on
> MediaTek SoCs. This helps support GKI(Generic Kernel Image) modular
> configurations.
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

What do you think about the approach found here:

https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/

> -- 
> 2.34.1
> 

-- 

