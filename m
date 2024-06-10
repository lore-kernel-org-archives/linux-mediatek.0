Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362E6C27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c51N0TVRjxVMvcqr4bXD5v2jvKFvgxBjo0lRz/PUzKg=; b=ZdtcFr9OO0cpwhzlM8XlBN+ECs
	0+5UENA5ZA7Hz8LYNHWKeCPcx62AgWjNs4uRjteiej+q4u+BJZM2M0eiJ/I+RxqqSl+Y+12dd8DPr
	/BECSchSottFNruDZDT8S+AUR8mEUmVSrtv4SDzvCn8yzneADFbQL/60Oz2v6fkouO1Glml6AjzFq
	y5VgQefo7K9rzAk3skHtAYvY+LOZsktElPoGGq6f8qN7McDhZ1xDSb4eIk8jbQKSAfatTdpvoJU5L
	5rc83U64GDij6okAznYkx5Eb8EzIum2hmUYxZOJD369c7ebd/JahnRXs1byZAng8XjGDFcXgRBYeD
	eW/YcSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGa3P-00000004Aco-2jAb;
	Mon, 10 Jun 2024 08:06:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGa3L-00000004Ac6-1iaE;
	Mon, 10 Jun 2024 08:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718006811;
	bh=Io/Z8pmSrin1ufDf1pTTnqKm0on+4xHG0V02DJ6G6fo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fbc2JGTXECrFLODOjNn5zPCS+TLlAAFYhQsu2hcMV7wlYO+4bYbR+S8HFQTxnSQVJ
	 6Lw4UXYbpVRg64axJD5r39bybViwB7dZRlj7x84GupRvj2cbdsQ5+UjO4joFxWbFhQ
	 hYssLYCiK4OTf/t3g9+LVyhiaJx5dVOusA3Cm3KCXl9wJh6gQ3Vb0vLY0Gr1MPMKpz
	 mnHV33QC32ZPJinIxRZ+yjf/gyt9Wkzqwg/4amvXJz/uAbjzenkmBekdVnWkxylBMS
	 ZxGV0Hb/jugOFt00Svd/44yfxnsSyv+M3SA+WB21BMhiEogAj5jYLtDvdyuG9e4S9F
	 mQrVlBtltHCxA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E36503780575;
	Mon, 10 Jun 2024 08:06:49 +0000 (UTC)
Message-ID: <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
Date: Mon, 10 Jun 2024 10:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_010655_639713_B3EC1E05 
X-CRM114-Status: GOOD (  15.94  )
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

Il 07/06/24 18:02, Jeff Johnson ha scritto:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-lgm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediatek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-visconti.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This addresses all of the issues in driver/pwm
> 
> Let me know if you want any of the individual module changes
> segregated into separate patches.
> ---
>   drivers/pwm/pwm-imx1.c      | 1 +
>   drivers/pwm/pwm-imx27.c     | 1 +
>   drivers/pwm/pwm-intel-lgm.c | 1 +
>   drivers/pwm/pwm-mediatek.c  | 1 +
>   drivers/pwm/pwm-pxa.c       | 1 +
>   drivers/pwm/pwm-samsung.c   | 1 +
>   drivers/pwm/pwm-spear.c     | 1 +
>   drivers/pwm/pwm-visconti.c  | 1 +
>   8 files changed, 8 insertions(+)
> 

..snip..

> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 19a87873ad60..0b5d68a90e83 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -395,4 +395,5 @@ static struct platform_driver pwm_mediatek_driver = {
>   module_platform_driver(pwm_mediatek_driver);
>   
>   MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
> +MODULE_DESCRIPTION("MediaTek Pulse Width Modulator driver");

MediaTek SoCs have got two different PWM IPs, one of which is used exclusively
for the Display PWM, and it is located in the DDP block.

So, there are two PWM IPs in one SoC:
  - A general purpose PWM IP
  - A DDP PWM IP

This driver is for the general purpose PWM IP.. so, please, can we change this
to "MediaTek general purpose Pulse Width Modulator driver"?

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   MODULE_LICENSE("GPL v2");


