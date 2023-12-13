Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2782DC4167D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpqVj1KzeY4y0CqLsqiJlZoLGsy4Llt8gY+WcGUchrA=; b=yWOEFVym4Y+0z1FTlChMTpE8El
	/e4T7dlAViEi3ggFnw16XK0/fcNjTBIeVgYQWE0NwBmjhPCOMaLLheATpaXRB/JatqucTLJn+bk/k
	xTXQUaCHgJsusjsfr/1XH9IbNCnTc6l4NLjYpv2IyRTjIxl7V/cCmLjZsZJGrhRHVMms+1AQOtbnz
	le6ye7GWuCp9fatRBLwvHlTjTjhJI+JXQ6wPD6yL7OArllmaNLYB97pZQLxoa2A10t+XITR2j2kVs
	c22kHNEd4BivT3ealBpEP63btnpuLxCtuq/egxzt+r4vr87WaS0ySV8uM/Fo5Wo8IRrQqwk279m0D
	eBYk82KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMy8-00EImV-0G;
	Wed, 13 Dec 2023 11:00:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMy5-00EIlQ-0S;
	Wed, 13 Dec 2023 10:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702465195;
	bh=f7oFYjuEhLv10FZ/GqNK5bJ0ESqYP8VTVwEBkmP3swA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gHHBiUOUOcSbPaz/K/S2U4DuTzSymWsizm1pM1TZa+HqSLoOAs6MvS03PIDweWuAl
	 PXlloz159ssPpNd54D7CTbHR9kbGykVHN7chvbFFKQNRnNmcF72qLmYsKfItJ6Kv7R
	 Y+ZqweU2icahiC+e7vkLVKF2DHKF3K8GSlcV8U6hW4zlch23gKF8WBZ1F7v3KVOqG0
	 Bqm1YSfQcO+Yi4kWNn+Ljp4glJRRxNcto9Yhw7CUOgcVgvB0WMLu8NjOQTpHgVcauY
	 rq6blUpNs9EGg5J+922osEaVDyRwLYOYCo8WvrEsHqm6bp91cNLIl2Y5dPPTse+QWM
	 J/kDCOB3eUHXQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AAD6C3781453;
	Wed, 13 Dec 2023 10:59:54 +0000 (UTC)
Message-ID: <ecf4d4f8-8232-44bc-b1a0-c6bd4b579949@collabora.com>
Date: Wed, 13 Dec 2023 11:59:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Maramaina Naresh <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, stanley.chu@mediatek.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Stanley Jhu <chu.stanley@gmail.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com
References: <20231213103642.15320-1-quic_mnaresh@quicinc.com>
 <20231213103642.15320-2-quic_mnaresh@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231213103642.15320-2-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_025957_374170_C30CA62F 
X-CRM114-Status: GOOD (  19.47  )
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

Il 13/12/23 11:36, Maramaina Naresh ha scritto:
> Register ufs driver to CPU latency PM QoS framework to improve
> ufs device random io performance.
> 
> PM QoS initialization will insert new QoS request into the CPU
> latency QoS list with the maximum latency PM_QOS_DEFAULT_VALUE
> value.
> 
> UFS driver will vote for performance mode on scale up and power
> save mode for scale down.
> 
> If clock scaling feature is not enabled then voting will be based
> on clock on or off condition.
> 
> Provided sysfs interface to enable/disable PM QoS feature.
> 
> tiotest benchmark tool io performance results on sm8550 platform:
> 
> 1. Without PM QoS support
> 	Type (Speed in)    | Average of 18 iterations
> 	Random Write(IPOS) | 41065.13
> 	Random Read(IPOS)  | 37101.3
> 
> 2. With PM QoS support
> 	Type (Speed in)    | Average of 18 iterations
> 	Random Write(IPOS) | 46784.9
> 	Random Read(IPOS)  | 42943.4
> (Improvement with PM QoS = ~15%).
> 
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
> ---
>   drivers/ufs/core/ufshcd.c | 127 ++++++++++++++++++++++++++++++++++++++
>   include/ufs/ufshcd.h      |   6 ++
>   2 files changed, 133 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index ae9936fc6ffb..7318fa480706 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1001,6 +1001,20 @@ static bool ufshcd_is_unipro_pa_params_tuning_req(struct ufs_hba *hba)
>   	return ufshcd_get_local_unipro_ver(hba) < UFS_UNIPRO_VER_1_6;
>   }
>   
> +/**
> + * ufshcd_pm_qos_update - update PM QoS request
> + * @hba: per adapter instance
> + * @on: If True, vote for perf PM QoS mode otherwise power save mode
> + */
> +static void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on)
> +{
> +	if (!hba->pm_qos_enabled)
> +		return;
> +
> +	cpu_latency_qos_update_request(&hba->pm_qos_req, on ? 0
> +							: PM_QOS_DEFAULT_VALUE);

This fits in one line.

> +}
> +
>   /**
>    * ufshcd_set_clk_freq - set UFS controller clock frequencies
>    * @hba: per adapter instance
> @@ -1147,8 +1161,11 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
>   					    hba->devfreq->previous_freq);
>   		else
>   			ufshcd_set_clk_freq(hba, !scale_up);
> +		goto out;
>   	}
>   
> +	ufshcd_pm_qos_update(hba, scale_up);
> +
>   out:
>   	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
>   			(scale_up ? "up" : "down"),
> @@ -8615,6 +8632,109 @@ static void ufshcd_set_timestamp_attr(struct ufs_hba *hba)
>   	ufshcd_release(hba);
>   }
>   
> +/**
> + * ufshcd_pm_qos_init - initialize PM QoS request
> + * @hba: per adapter instance
> + */
> +static void ufshcd_pm_qos_init(struct ufs_hba *hba)
> +{
> +
> +	if (hba->pm_qos_enabled)
> +		return;
> +
> +	cpu_latency_qos_add_request(&hba->pm_qos_req,
> +					PM_QOS_DEFAULT_VALUE);

same here.

> +
> +	if (cpu_latency_qos_request_active(&hba->pm_qos_req))
> +		hba->pm_qos_enabled = true;
> +}
> +

Apart from that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



