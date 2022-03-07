Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F8BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LveOrhFMRyJQz/BgRV2Zcr4bL74lI+WGYjO7fN6wYfE=; b=4js2hLHjMU0Hnj
	YwaQlsOURJ3HfDonKZRuXn4Yazk2AEF0+7AF3NP3wZNKlaEjQKhtSgyrU1UZYtYp3KAKuph/njMjP
	GlR/52VVpnHk1f7s8EE/0+UEK3qVNaZIQ5NpZll6O/dqyoWGiCBn+c1sD8fRGsrPkkEzbWcMyiBko
	Ys9M7U3fynd/CUli8B6Eg4IoLWTB4jIktlgkrLwUYmSTpPAt93yIdWhH/UruBlpMOMnN+/ZmvOlYe
	rB6mJZpSiUeOEE5BWCIr4d4KKepXxkHjM82MW0bt8M9CF3tT/j1wVv7d/dUBfIgmrTtDg+gvzLr15
	wKhpyzeqJiSdQpvSXVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRIdc-001Ial-4b; Mon, 07 Mar 2022 19:03:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRId3-001IM3-HS
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 19:02:48 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 723483F7DF
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 19:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646679763;
 bh=Vq+Wtj+GyJ+co0AT1jDLyXY4eOmwo/VOwm55xSz0z6A=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=CFSyg+POL+68nbwj7qPrBOLhj5PIrIze1EK4E1ZKo9GKb1yok7Sp8xH/RKVke/Uhz
 cTyg7lYGlogxW9UmT4ufiIVIeNSabwYemGHXvPNFrVrgqvTh2SevwBcUm5k9/6KNsV
 UTU80rv+YvRdSgAvKwit2KkZg6YliUqUFnyYEClK/Ai72w73sFvE5DBWZvKaQcYl6q
 njmvCniFRG5J/faS3xxOQn3U0ubpUJJEewSUzzhnswQQ6A4SewGWwXDS0S0wNe2n+U
 lEjGp1zif+pfR6+O14XPy6qp4Lq67AfgT+x42yjYAuL1X2Es+yGY9qldqw3kjlkltx
 ApFEOBRp1zW/w==
Received: by mail-ed1-f72.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso9158743edz.14
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 11:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vq+Wtj+GyJ+co0AT1jDLyXY4eOmwo/VOwm55xSz0z6A=;
 b=njyeHEiqR047lRGEMxoclk5+2pyom+yXwW6+4QfTvP3+L61jwhWCvebyKznSt1nQQh
 Cr9Okx66WNYzI1TdT2tVuE9Fjfo9G9x9zYJrDZHPgR/nU6stFDeFYAWqVSBUuI7MyBlN
 2IkDTnv2q3YYjpdqfdhHq9S66Xnpr1OwyXzwLFk4dHiRUp0Ov3ARXIpkMMIOPZ0UolPx
 ug5opBMCj75pY9q2wUF2hGtrt4lzErcN/C8aeRW3oKSiSu1I1isPKZPweWELk8bwFaHI
 wo2mBbz3Cu9vL9u2yuJIukKN78vcGhNYgY65SgJ3XlRdwrPf9HAzk5eHK/SQg/CbtR5l
 1ClQ==
X-Gm-Message-State: AOAM533O+/RG2UNd5TnvaH33LV214ruOUMEonYeqFhYM1mojpJsVP8qr
 HL65d88DPmGDf2rmu05W6FQGeBPfVX1oLiAaHv91oeEBZkkr/5KLXQ+1As+/wXRK/7MeV2+uX3N
 QxT6zU7LYuGfEz3hAtsu35369R952mxqMZ0z5R88e5miWNqDLjw==
X-Received: by 2002:a05:6402:168a:b0:3fb:600e:4cc3 with SMTP id
 a10-20020a056402168a00b003fb600e4cc3mr12645896edv.32.1646679761692; 
 Mon, 07 Mar 2022 11:02:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGHTRfZqI1f7NfmlXnfc8CnSpyAgiiBB+6cgpM2S/0teiqFrn9zZ+Tl1DI7G8Bi+m6XdPd9A==
X-Received: by 2002:a05:6402:168a:b0:3fb:600e:4cc3 with SMTP id
 a10-20020a056402168a00b003fb600e4cc3mr12645854edv.32.1646679761342; 
 Mon, 07 Mar 2022 11:02:41 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 n6-20020aa7c786000000b00410d2403ccfsm6699066eds.21.2022.03.07.11.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:02:40 -0800 (PST)
Message-ID: <0fa44005-158b-74ee-f4ff-f2694ffce38a@canonical.com>
Date: Mon, 7 Mar 2022 20:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] cpufreq: mediatek: clean up cpufreq driver
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-4-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122151.11666-4-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_110245_823962_C02AAFA0 
X-CRM114-Status: GOOD (  25.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/03/2022 13:21, Tim Chang wrote:
> cleanup of naming, print log and comments.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 487 ++++++++++++++---------------
>  1 file changed, 233 insertions(+), 254 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 8e9d706d8081..3f00c7eb01f1 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2015 Linaro Ltd.
> - * Author: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
> + * Copyright (C) 2022 MediaTek Inc.

Removal of authorship and existing copyrights does not fit into "clean
up". Please explain this thoroughly.

>   */
>  
>  #include <linux/clk.h>
> @@ -22,7 +21,7 @@
>  #define VOLT_TOL		(10000)
>  
>  /*
> - * The struct mtk_cpu_dvfs_info holds necessary information for doing CPU DVFS
> + * The struct mtk_cpufreq_drv holds necessary information for doing CPU DVFS
>   * on each CPU power/clock domain of Mediatek SoCs. Each CPU cluster in
>   * Mediatek SoCs has two voltage inputs, Vproc and Vsram. In some cases the two
>   * voltage inputs need to be controlled under a hardware limitation:
> @@ -32,7 +31,7 @@
>   * needs to be switched to another stable PLL clock temporarily until
>   * the original PLL becomes stable at target frequency.
>   */
> -struct mtk_cpu_dvfs_info {
> +struct mtk_cpufreq_drv {
>  	struct cpumask cpus;
>  	struct device *cpu_dev;
>  	struct regulator *proc_reg;
> @@ -40,45 +39,45 @@ struct mtk_cpu_dvfs_info {
>  	struct clk *cpu_clk;
>  	struct clk *inter_clk;
>  	struct list_head list_head;
> -	int intermediate_voltage;
> +	int inter_voltage;
>  	bool need_voltage_tracking;
> -	int old_vproc;
> -	struct mutex lock; /* avoid notify and policy race condition */
> +	int old_voltage;
> +	struct mutex lock;  /* avoid notify and policy race condition */
>  	struct notifier_block opp_nb;
>  	int opp_cpu;
>  	unsigned long opp_freq;
>  };
>  
> -static LIST_HEAD(dvfs_info_list);
> +static LIST_HEAD(drv_list);
>  
> -static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
> +static struct mtk_cpufreq_drv *mtk_cpufreq_drv_lookup(int cpu)
>  {
> -	struct mtk_cpu_dvfs_info *info;
> +	struct mtk_cpufreq_drv *drv;
>  
> -	list_for_each_entry(info, &dvfs_info_list, list_head) {
> -		if (cpumask_test_cpu(cpu, &info->cpus))
> -			return info;
> +	list_for_each_entry(drv, &drv_list, list_head) {
> +		if (cpumask_test_cpu(cpu, &drv->cpus))
> +			return drv;>  	}
>  
>  	return NULL;
>  }
>  
> -static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> -					int new_vproc)
> +static int mtk_cpufreq_voltage_tracking(struct mtk_cpufreq_drv *drv,
> +					int new_voltage)
>  {
> -	struct regulator *proc_reg = info->proc_reg;
> -	struct regulator *sram_reg = info->sram_reg;
> -	int old_vproc, old_vsram, new_vsram, vsram, vproc, ret;
> -
> -	old_vproc = regulator_get_voltage(proc_reg);
> -	if (old_vproc < 0) {
> -		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
> -		return old_vproc;
> +	struct regulator *proc_reg = drv->proc_reg;
> +	struct regulator *sram_reg = drv->sram_reg;
> +	int old_voltage, old_vsram, new_vsram, vsram, voltage, ret;
> +
> +	old_voltage = regulator_get_voltage(proc_reg);
> +	if (old_voltage < 0) {
> +		pr_err("%s: invalid vproc value: %d\n", __func__, old_voltage);
> +		return old_voltage;


Several different changes in one commit. Please read the document
"Submitting patches".

(...)

> -MODULE_AUTHOR("Pi-Cheng Chen <pi-cheng.chen@linaro.org>");
> +MODULE_AUTHOR("Jia-Wei Chang <jia-wei.chang@mediatek.com>");

Ekhm, why? He was not the author?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
