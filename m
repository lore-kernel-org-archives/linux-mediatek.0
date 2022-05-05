Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65818C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kfU8BAbaAdhDfLJGwz54G7zAfFAXwF7q/VaKToWCVk=; b=1EQmp04aJus1nL
	r6c4EQSg1YBj+VDmD7J6TFAXMYfUCQr2aL6dWQXzt6FcMgQrfCHYBg/Jr5LBKyJE6bsTu1wQ3U+Qy
	kvb0RE8KfywA4JW5CvR2xoE9lJ/yu9a1/d5kNc/jFYCYctbrqYi65K5hxwouCKgxzDvGKHrWNGoX8
	DzUfxoN34NqQW+AlDSc/CdfsTQrEoVcPN5fgQ23hrW9/RQTGH7lkUiuOXEGqh4JKkuR2nYXukBFPE
	NEjZlyyStVS5bF95+N/DUhnafZPNAG83On4J/XZt5R8qoVIL9NuZeZQFyfvwSExmmxQoUolFvPwX3
	w0xP+GaAzMRhlS0we55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmbaZ-00G3Gv-Tk; Thu, 05 May 2022 13:32:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmbaK-00G37f-Ux; Thu, 05 May 2022 13:32:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b19so6119142wrh.11;
 Thu, 05 May 2022 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5pSUK+NARKQGP0RSfhMDxUAusxVl8fziSm0RmmnAc6E=;
 b=bretBRaPEZmVMji52YIT2cPIghpPUcOUPpBAKJc5YUPDThrBkg42K5pCLeNarY+bxW
 17Kof9p/ykq91o+GLZ6upG204f288SaZmouWEERoOkA3JVyL/+I8lYCAsxCsvXAzSiK6
 YQUZs7GQZed3srmxxNEKyXoD3mjbkSwvELw5yX4A/0hQ1wTlNAaF7hRs6nIkEPjBaRli
 UydZcr4EHMgsFPIt0gvmmkM8PK1ZWa5Dzkl4UUTAFCoW6d9puNs82UtG8dHweLdcGeU8
 pcIoKLh9o2TiGNDb9LdiQtI9TP7L6G6A3wIjD4EFRVJ7c0VR1oKEKYzvhUH28cxyeHfd
 FmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5pSUK+NARKQGP0RSfhMDxUAusxVl8fziSm0RmmnAc6E=;
 b=O59fAoUcSmKF8TV/Y5ZYRRB6lhMAVucHfGRNJWlZT3q86SfcNfUgGpUEuZiWGKdGl/
 Qvx+nHkF/oKTP9y8QJIiRFAGqhaGzFZqNLE86Xirv7bSojimTl+QQs13vtOWZCr+YFEN
 FWvg1YN+qM08R7lHNaDXIVJQVdSRBpQQgDB8YazKNs6A1m3bzDr2NyAlFetOyyGiFaJm
 uaQq2YEDdtFU5adQRwMSCimx6Qk3TkNi595JjQYJIXbm8pSupbq6d6wYxheoGw29Hv/9
 ojUGjRcTRhuKCUWM3VwKRf2ts7nO0qIk1XqMmIO5TbiKuo57N58pqJku1b4a+EWEPDWt
 fGlg==
X-Gm-Message-State: AOAM533hh9tUDaH1UW8HMZ2CQviwnIEb4BtUDffxsmeuHElp+vL11hwq
 gSQloQOqXjE2rwWO1L4NtvMus7uBIOtF1A==
X-Google-Smtp-Source: ABdhPJy6T3JY2QzQ/ndLAhrjpHqo9Ok+/mi3IOHf5OfKw5JxhwBq4ViMM7UYjpOnxVCjgszbhN88aw==
X-Received: by 2002:a05:6000:100c:b0:20a:c68a:e9a with SMTP id
 a12-20020a056000100c00b0020ac68a0e9amr21047454wrx.314.1651757516554; 
 Thu, 05 May 2022 06:31:56 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a7bc24f000000b003942a244ecfsm1422829wmj.20.2022.05.05.06.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:31:56 -0700 (PDT)
Message-ID: <0b9e332d-f479-ed3d-78ce-6386383d827b@gmail.com>
Date: Thu, 5 May 2022 15:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki
 <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_063201_060418_6E7E7AF3 
X-CRM114-Status: GOOD (  21.70  )
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



On 04/05/2022 10:21, Viresh Kumar wrote:
> For some platforms, the frequency returned by hardware may be slightly
> different from what is provided in the frequency table. For example,
> hardware may return 499 MHz instead of 500 MHz. In such cases it is
> better to avoid getting into unnecessary frequency updates, as we may
> end up switching policy->cur between the two and sending unnecessary
> pre/post update notifications, etc.
> 
> This patch has chosen allows the hardware frequency and table frequency
> to deviate by 1 MHz for now, we may want to increase it a bit later on
> if someone still complains.
> 
> Reported-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/cpufreq/cpufreq.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0d58b0f8f3af..233e8af48848 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -28,6 +28,7 @@
>   #include <linux/suspend.h>
>   #include <linux/syscore_ops.h>
>   #include <linux/tick.h>
> +#include <linux/units.h>
>   #include <trace/events/power.h>
>   
>   static LIST_HEAD(cpufreq_policy_list);
> @@ -1708,6 +1709,16 @@ static unsigned int cpufreq_verify_current_freq(struct cpufreq_policy *policy, b
>   		return new_freq;
>   
>   	if (policy->cur != new_freq) {
> +		/*
> +		 * For some platforms, the frequency returned by hardware may be
> +		 * slightly different from what is provided in the frequency
> +		 * table, for example hardware may return 499 MHz instead of 500
> +		 * MHz. In such cases it is better to avoid getting into
> +		 * unnecessary frequency updates.
> +		 */
> +		if (abs(policy->cur - new_freq) < HZ_PER_MHZ)
> +			return policy->cur;
> +
>   		cpufreq_out_of_sync(policy, new_freq);
>   		if (update)
>   			schedule_work(&policy->update);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
