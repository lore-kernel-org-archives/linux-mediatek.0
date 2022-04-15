Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F11C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ff7GXLSf4WELvrXv7OXwvWxzbY9bdGKPzlCvIwNcTrI=; b=upLVYD2BM1lpM5
	tc+inPryLrThN7DUWCFjF99VJRX9uu+oXU5EaI9NcdUCDk2GcId8Awf8MSp7zuGuky0+F6aNQTQ9H
	Y+Q2uu2lna3KoebbPtlcSWuQ21GyIrjTt/PGoPpIxMm7pQScUWy2Zt6LUvkuYiqmgPRf0Hn8axxwL
	B6D9WdZUiL84PeupRK1Ef4aQsFx/ruXXkgHEw6/4KvLkVx0TiZe9ktpr/VimdCGcBb7cEw6CVcL+Y
	b4gECroCy/i8WqC5QV2yoAgmNkFgddD4JSuwdgem7q9NLRA0c+H47q0DbiOsg0G0KjNI6oAwXGc5L
	SwwJueIfH956N0DrjyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL0P-009wbi-5Q; Fri, 15 Apr 2022 12:24:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKzl-009wJx-Dh; Fri, 15 Apr 2022 12:24:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 732181F47DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025451;
 bh=Bq4NmoaVsB4YvDD3gB8YAWRsceselSLBmwF7QkyDIDM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SevoovC1ZA4EiKW+q4c0Baopfh0Bd5gO7cZnenEzwZrAkQ3wpY9NQn/Ivt3oRc1b6
 A25/9rHtN/PEfU5ml8njuexOt0L7xQRtVCr2hTDpxVqWF2fNXqS/2+Ku+b78+0sBa8
 lKlNN1oACrPoze1YfbLkurm3/Hl457jxNwjshC79EkpRMb2pdVCKcsRM+jlUwfgNg6
 5jOimFoj6CN1F4gXymrw/RlsMIUxBxV0CZoIEeUgCZ07pw85cp+EVOaZ+UunYyvDDW
 QjYP4BSIbDUq4PmSOb//j6CqMKZxbo8HPW1F5LFD0JiVbxNjFhMaUcZ56vRrFd6Nuf
 rpsVUN619uYtA==
Message-ID: <9fccbb92-1832-bf5d-7804-80dd481663fc@collabora.com>
Date: Fri, 15 Apr 2022 14:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 11/15] cpufreq: mediatek: Link CCI device to CPU
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-12-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-12-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052413_648262_81F9BD25 
X-CRM114-Status: GOOD (  22.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> In some MediaTek SoCs, like MT8183, CPU and CCI share the same power
> supplies. Cpufreq needs to check if CCI devfreq exists and wait until
> CCI devfreq ready before scaling frequency.
> 
> Before CCI devfreq is ready, we record the voltage when booting to
> kernel and use the max(cpu target voltage, booting voltage) to
> prevent cpufreq adjust to the lower voltage which will cause the CCI
> crash because of high frequency and low voltage.
> 
> - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will start
>    DVFS when CCI is ready.
> - Add platform data for MT8183.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

I am enthusiast to see that the solution that I've proposed was welcome!

I only have one nit on this patch, check below:

> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 80 +++++++++++++++++++++++++++++-
>   1 file changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index d4c00237e862..dd3f739fede1 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c

..snip..

> @@ -225,6 +251,14 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>   	vproc = dev_pm_opp_get_voltage(opp);
>   	dev_pm_opp_put(opp);
>   
> +	/*
> +	 * If MediaTek cci is supported but is not ready, we will use the value
> +	 * of max(target cpu voltage, booting voltage) to prevent high freqeuncy
> +	 * low voltage crash.
> +	 */
> +	if (info->soc_data->ccifreq_supported && !is_ccifreq_ready(info))
> +		vproc = max(vproc, info->vproc_on_boot);
> +
>   	/*
>   	 * If the new voltage or the intermediate voltage is higher than the
>   	 * current voltage, scale up voltage first.

..snip..

> @@ -423,6 +484,13 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   	if (ret)
>   		goto out_disable_mux_clock;
>   
> +	info->vproc_on_boot = regulator_get_voltage(info->proc_reg);

This result is used only if we use ccifreq, so this should be enclosed in an if
condition: this will spare us some (yes, small) time on devices that don't use it.

	if (info->soc_data->ccifreq_supported) {
		info->vproc_on_boot = regulator_get_voltage(info->proc_reg);
		if (info->vproc_on_boot < 0) {
			dev_err(....
			goto ..
		}
	}

P.S.: While at it, since the maximum width is 100 columns, the dev_err() call fits,
so don't break that line!

After the requested change:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
