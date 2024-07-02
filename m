Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE08C3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIGoN7Aor9G17LWovttEF9lgok/itZwGOx9FUjFJCW8=; b=Yj+tXjKRvmNpRawzs8FWwt+PXx
	yw2Z6i8lRWh3bsJIvpfY3IOq2mY+U8k6elRlZG8QCMNJ++SwW4HE+86/7EumQBhRORoKczW0l7Zvk
	w93oUM2z14QNMXme+XO+Xci2BbJXpVd0hIXa2LczJfo1LEzvxASr7vtXwRkIxGGTtEMjPCzFfqGIq
	xXOwHNvwWcbRfGUpOXIOtm9V9JD268M7MHVSdxB65RQVF3x/7STdyD5A+X+UyKwanZBUK9xl59h5k
	imDV36nu78dvPMLL7FmGE0dY2MF9DeedWJxAuFJYk0KEVrFodfxdB3JdaiKHL9nG23U44JQaTVTHu
	VKTym2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWN7-00000005cus-23yr;
	Tue, 02 Jul 2024 05:48:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWMw-00000005ctf-160A;
	Tue, 02 Jul 2024 05:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719899277;
	bh=Bn3wG4lA+xxGiSruiHBol9oYVeiEnMeIGUNym8g/cIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4L1OOc1CMaqgg0QIXjgIFNkXfJ0CecvLU2J0BI6d5vzQBkZQhz0yY2bR9K+YU0sor
	 GOHqzqFBN8NXvkwF3Sz8yft2ORq6G7wDqct3gu0wYmVY4dIE+L3xnuuEC/09vpcrrq
	 SPwsLiB437/77bdi6yDbrI/hFopyJI4vey7asWFl/y3ENpqKVhlY2hQQ73Vnm2P7Z/
	 IGvoEhoSJqsL6GVHjqKsg7mQMDZOqCHJG7OxmcPujOYn4GB+B4Xdb0lNApvmJ3xQpk
	 SOD5S+yyLGZiwY2MAUUuRdeSKuxmV63nRzZF8HmtlI3sWs+trb/wyHuyvk7/hVEg8N
	 PEEFRuxcTIidg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 81F9837811EB;
	Tue,  2 Jul 2024 05:47:56 +0000 (UTC)
Message-ID: <70b31b71-750b-4de0-9102-0852fef7d623@collabora.com>
Date: Tue, 2 Jul 2024 07:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_224758_454729_07F4E2AA 
X-CRM114-Status: GOOD (  18.07  )
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

Il 28/06/24 21:48, Nícolas F. R. A. Prado ha scritto:
> Use the dev_err_probe() helper to log the errors on every error path in
> the probe function and its sub-functions. This includes
> * adding error messages where there was none
> * converting over dev_err/dev_warn
> * removing the top-level error message after mtk_cpu_dvfs_info_init() is
>    called, since every error path inside that function already logs the
>    error reason. This gets rid of the misleading error message when probe
>    is deferred:
> 
>      mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 66 ++++++++++++++++++--------------------
>   1 file changed, 31 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 518606adf14e..b21425bb83be 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c

..snip..

> @@ -487,7 +488,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   	rate = clk_get_rate(info->inter_clk);
>   	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
>   	if (IS_ERR(opp)) {
> -		dev_err(cpu_dev, "cpu%d: failed to get intermediate opp\n", cpu);
> +		dev_err_probe(cpu_dev, ret, "cpu%d: failed to get intermediate opp\n", cpu);
>   		ret = PTR_ERR(opp);

I believe you want to first assign ret, and then use it in dev_err_probe() :-P

Please fix. After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

>   		goto out_disable_inter_clock;
>   	}
> @@ -501,7 +502,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
>   	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
>   	if (ret) {
> -		dev_err(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
> +		dev_err_probe(cpu_dev, ret, "cpu%d: failed to register opp notifier\n", cpu);
>   		goto out_disable_inter_clock;
>   	}
>   
> @@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>   	int cpu, ret;
>   
>   	data = dev_get_platdata(&pdev->dev);
> -	if (!data) {
> -		dev_err(&pdev->dev,
> -			"failed to get mtk cpufreq platform data\n");
> -		return -ENODEV;
> -	}
> +	if (!data)
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "failed to get mtk cpufreq platform data\n");
>   
>   	for_each_possible_cpu(cpu) {
>   		info = mtk_cpu_dvfs_info_lookup(cpu);
> @@ -643,24 +642,21 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>   		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>   		if (!info) {
>   			ret = -ENOMEM;
> +			dev_err_probe(&pdev->dev, ret, "Failed to allocate dvfs_info\n");
>   			goto release_dvfs_info_list;
>   		}
>   
>   		info->soc_data = data;
>   		ret = mtk_cpu_dvfs_info_init(info, cpu);
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"failed to initialize dvfs info for cpu%d\n",
> -				cpu);
> +		if (ret)
>   			goto release_dvfs_info_list;
> -		}
>   
>   		list_add(&info->list_head, &dvfs_info_list);
>   	}
>   
>   	ret = cpufreq_register_driver(&mtk_cpufreq_driver);
>   	if (ret) {
> -		dev_err(&pdev->dev, "failed to register mtk cpufreq driver\n");
> +		dev_err_probe(&pdev->dev, ret, "failed to register mtk cpufreq driver\n");
>   		goto release_dvfs_info_list;
>   	}
>   
> 
> ---
> base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> change-id: 20240627-mtk-cpufreq-dvfs-fail-init-err-0a662ca72de2
> 
> Best regards,



