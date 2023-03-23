Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6215C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oy2xH0R7xNUpyhjhZEjLCXOpz15cnO10nQ7ByCS1aEM=; b=MwN7yy9/347JswRRf5ErqQ7Qtb
	2LbbMOFs3Cn8DjUn6+mNZ5OvPkdzOCGKH0y7GKdIH1T3Gh6oqnmJsA6heIgohJOjfJLa3xgIDeN09
	TAP87PaDwY5UPe+zlLOgrSOlu7Ag8Dh1+HoEmkc7O81qwxlcWzUVfppN7FS5TL/hr0cNQLoK9o8vO
	9qStp8L+CEGOTQC+JPXEGR9n3MD1Y7OcZ9+4+1nvx36UdLkdcohD/xhLULvUhBpDj9fiiGCL+T14F
	RWX2D5AgtGzOtWrSL5VLvxvEJPjXzf+s97RrEGu9/ZTvqRFiQ2wwCX5p1qSlspgk3X8ycvTyOIWeP
	5tSOVDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJMT-001lnV-1t;
	Thu, 23 Mar 2023 11:44:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJMO-001lm4-2a;
	Thu, 23 Mar 2023 11:44:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3519366030B7;
	Thu, 23 Mar 2023 11:43:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679571836;
	bh=40CudmEZ80ffRNlrSfZD49rg1pKabWucP0ROERdjI/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l+7QJ5qUCIJ7KE1zlge63WJbhjG9XmELWynJnChfqRAbIxyTMI9jKFkfVrJPnutrP
	 sAWxqyt4BvQQoVobctCM6gsP8PXEYEp9Lb+cb1GWoJ5wm6TW/cYfdIUJ8HK5GMzBMG
	 lJXq7fU2M4Fv6l7oN+4jUz4Vk+uhxp97D+1RIvBetDNOQEWT3AvpbU1fAeESQSiH+9
	 G4EBgB12nIf8tEYeXP11TKmaTfrPIk5DSotjqtLJYGG5S4RwKmwECz5mcyw/NYKYTo
	 MuvhYEnkS6vFtEAfc188XreHClWI9e/zNIKVC0h2gLRV4+daeo1R+zoadEs5Dmf60Z
	 veJGurWztwB1Q==
Message-ID: <9e08ad33-ef86-6e49-2ef8-f697d2b82f04@collabora.com>
Date: Thu, 23 Mar 2023 12:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] cpufreq: mediatek: guard error paths to avoid kernel
 panic
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, John Crispin <john@phrozen.org>
References: <ZBwyN7NwZ2zqHygr@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZBwyN7NwZ2zqHygr@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_044401_049216_686E865C 
X-CRM114-Status: GOOD (  16.71  )
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

Il 23/03/23 12:04, Daniel Golle ha scritto:
> Guard pointer access in error path of mtk_cpu_dvfs_info_init() to
> make sure info->proc_reg and info->sram_reg are valid pointers before
> accessing them, which would result in kernel panic e.g. in case of
> them being set to -EPROBE_DEFER.
> 
> Fixes: 4b9ceb757bbb ("cpufreq: mediatek: Enable clocks and regulators")
> Reported-by: Sam Shih <sam.shih@mediatek.com>
> Suggested-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 4466d0c91a6a..980a31ddd0f2 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -579,10 +579,12 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
>   
>   out_free_resources:
> -	if (regulator_is_enabled(info->proc_reg))
> -		regulator_disable(info->proc_reg);
> -	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
> -		regulator_disable(info->sram_reg);
> +	if (!IS_ERR(info->proc_reg))
> +		if (regulator_is_enabled(info->proc_reg))
> +			regulator_disable(info->proc_reg);
> +	if (!IS_ERR(info->sram_reg))

For both, actually, if you suspect that (xxxx)_reg may be NULL, then you should
use IS_ERR_OR_NULL() instead...

> +		if (info->sram_reg && regulator_is_enabled(info->sram_reg))

...otherwise, here it's useless to check if it's not NULL?

Regards,
Angelo


