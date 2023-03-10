Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECB7C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U3LGDYZaMNI4jto1OIAQl29hH/m2ZSBhimukRjvdWM=; b=3BDIa2oxE+NIrF4F0zc1jHETL3
	VURWja1Vq5kbC4DIQzB3PuRI+Ywst9GKSNxYczjJPlR8g9WEf0OiZOFDIBF3gmDKEvtfGw3DtqfI9
	F2BwmzInOjER2KeqllZT3uOsqICT4/vrwLZ4mT9JG2Zu2BsRigcl41vDFPQCFa2MV5N04d1ijs2S5
	mIM7DKNeEjCMsSj+t8HXnGE2zzUeo8jEP61CUSt1BwBRMLhv7z+8uj0pZVQ471yhnU4l6hfKbiKHC
	Jv31yu4Asl9SxgfrwI0F/WY0srkIr+Ya4rD539L/Sx8pw17jrTvdn7XtpBfmRPLD/mzmjqg6D4hPa
	qConZGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZ7Y-00DwH3-H1; Fri, 10 Mar 2023 09:33:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZ7A-00Dw5n-Aa; Fri, 10 Mar 2023 09:32:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64AF9660305C;
	Fri, 10 Mar 2023 09:32:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678440759;
	bh=LjZ/H1yvENw4kQILyRX+BuGBgVhVeRRqw9ZZ3x2z6Lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n4m3XOtujNI0wBekC6tFT+w6CiJAMJ1jJ8bCGTrNkFT+T+42tocqiilxktRUEKwa0
	 MylK9Rl9uvy4WvKVTFoSteMnXblXJI0Hzqx2lOclykxBqaTUENjFgQcNq9x+rMiBdI
	 UqerTkByI39fbeGByTziQSiNu45/aJvIbi4Ccgz6V9nxFXbcqqhkZQvjpj/chw4pSw
	 UFfIRuxKvCP7fl4gT67rUVo+35dPxaiatNbfPKPwPIGTOrY7Yem1z3QvzzIZVZCS8q
	 3izr+kGoZiUwExPD0YnLc/B2a3NhxOl4nDYrvuWDkJhSJythgByNrgCY4N9cmdzKeh
	 gxfKefewvLosA==
Message-ID: <18a8e134-6f16-51a5-e600-f68aa85118db@collabora.com>
Date: Fri, 10 Mar 2023 10:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] cpufreq: mediatek: raise proc/sram max voltage for
 MT7622 and MT8516
Content-Language: en-US
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Nick <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
References: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
 <20230310051750.4745-4-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310051750.4745-4-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_013240_548148_34A8589C 
X-CRM114-Status: GOOD (  18.92  )
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

Il 10/03/23 06:17, jia-wei.chang ha scritto:
> From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
> 
> Since the upper boundary of proc/sram voltage of MT7622 and MT8516 are
> 1350 mV and 1300 mV respectively, both are greater than the value of
> MT2701 1150 mV, we fix it by adding the corresponding platform data and
> specify proc/sram_max_volt to support MT7622 and MT8516 individually.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
> Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
> Reported-by: Nick Hainke <vincent@systemli.org>
> Link: https://lore.kernel.org/lkml/75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org/T/

that's 2/3 my patch, 1/3 your patch.....
...in that case, send my patch as it is and add one more for MT8516.

Regards,
Angelo

> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index cb8b76f9c2c3..f6824d4bf85d 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -707,6 +707,15 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
>   	.ccifreq_supported = false,
>   };
>   
> +static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
> +	.min_volt_shift = 100000,
> +	.max_volt_shift = 200000,
> +	.proc_max_volt = 1360000,
> +	.sram_min_volt = 0,
> +	.sram_max_volt = 1360000,
> +	.ccifreq_supported = false,
> +};
> +
>   static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
>   	.min_volt_shift = 100000,
>   	.max_volt_shift = 200000,
> @@ -725,20 +734,29 @@ static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
>   	.ccifreq_supported = true,
>   };
>   
> +static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
> +	.min_volt_shift = 100000,
> +	.max_volt_shift = 200000,
> +	.proc_max_volt = 1310000,
> +	.sram_min_volt = 0,
> +	.sram_max_volt = 1310000,
> +	.ccifreq_supported = false,
> +};
> +
>   /* List of machines supported by this driver */
>   static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
>   	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt8167", .data = &mt2701_platform_data },
> +	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
> +	{ .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
> +	{ .compatible = "mediatek,mt8167", .data = &mt8516_platform_data },
>   	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt8176", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt8183", .data = &mt8183_platform_data },
>   	{ .compatible = "mediatek,mt8186", .data = &mt8186_platform_data },
>   	{ .compatible = "mediatek,mt8365", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt8516", .data = &mt2701_platform_data },
> +	{ .compatible = "mediatek,mt8516", .data = &mt8516_platform_data },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);


