Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3463C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpkUiv0lStcI6myKvePn2hxsPU7aGvSca03/mrEOCr8=; b=tSuCwwDyVLg1Sq
	PbK+HXlY4T5w1P4mUEQv24iCv1Pi3TUgMcNPdV6z5rELza5kySqXD3SOEazJ//sYIA75wfQk1J37M
	kUP0Zox4aOYsTDpXBLon3j6NYjJHm2iav1Q5lYTChW7UZptIKnAtxAYfmJ1gYC5zl6+9iLBA0JUu5
	2fqD+6Sli+BflpApUzEqBwYFDtmQAdzkhmMgiw38mtBuYGED6mexIzj5gTfd7/oJTRfKlhBRmYcmU
	P+uDUlxcWJstP+1Zlv6cWAUEiqnsheVxk2vSNGT4VNAvyPVXzWfau6n9f4Zm2dzjNqGHpJlv5BasS
	xUDoeiobKSi2+V5F2ZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKzG-000YWI-Go; Tue, 10 May 2022 08:12:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKz2-000YP2-0l
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 08:12:41 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso1448363pjw.0
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GgyywbUmtILgp/wvvcsqELPk8sbdswIe5sEtYfMivvE=;
 b=rNbeIahNNjFADBiapx76jRbHbwNwPqBjvbS/yGH4r1iAKLOzpPaEC9ZDc8hkixik73
 P5uD0eZRQv8jWs5/sV+8UV3bidqToM98pKnpRIuUkYOfhfstIwTJoPBxA/uz2PdvEQ9I
 K/m0YsAXA7u2zeUHjBxT7KL5oi8XIhwNZDjqLOxOEEC1GmumbHrC0W6UmwAJ5Nq6F40H
 ZneAzcK3oab6uJyxJMXx4u1MPuEDb9svPJ0VmuW/xJ2DAjoofz7pBDNWSY6YvAdglEAt
 GYPDfTst6IAi1aUPvylXif9IxulGpqXGh7TuOP3YdX/TJEfrA/GDsOodVmyIoqrMEjBt
 kBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GgyywbUmtILgp/wvvcsqELPk8sbdswIe5sEtYfMivvE=;
 b=ZvErEmLKOxVjKsDooh1gxhAt3q/mz2W4q+hG3M1pYh3r4Ytrbg5g4hVxJPjactNzwf
 wYC7iI9VS87Wv7+I58jmbIeotWxyUADzrZ7GiuwWkY9lGWcDA5Ce8bl14R8R49b2oPbG
 kqNRT7Im4nXHFWhTDN+EpIWPXmFl2EFH8WeuMrJpS1zl+48BKLQn/6ED+maw9J0uL0yu
 RIFfBRpPyUO6GpqW9qTTH7XkO2MxJlTcwyXchqLe5JM8nKWalWyoCTZAE43SaNcLjHbI
 i+znKYgP/6/35VvH1Gdy85FgN8jeoDqSGd5TAMwA3Jf7P6J8pgsctQn+XAGFBNfLXR9c
 aN3A==
X-Gm-Message-State: AOAM533ie3AOzlcjml6TWNh2FaqW7W2EoDcPBOjxNSGbdsjm1+WyeWrq
 gHD6GI/gmUpOPUmA9tgEb8lk6g==
X-Google-Smtp-Source: ABdhPJwcv12Soh8pLojrYlMpwtpxb8N7+SLb4GnvbtYHqs/lqRSoCcmiAtufKplJ/GKYTHrtAaj0QA==
X-Received: by 2002:a17:903:410b:b0:15c:fd57:aa34 with SMTP id
 r11-20020a170903410b00b0015cfd57aa34mr19368857pld.82.1652170354409; 
 Tue, 10 May 2022 01:12:34 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 b15-20020a056a0002cf00b0050dc762814dsm10011525pft.39.2022.05.10.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 01:12:33 -0700 (PDT)
Date: Tue, 10 May 2022 13:42:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Message-ID: <20220510081232.4u25qgryszzqblho@vireshk-i7>
References: <20220510080136.11950-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510080136.11950-1-wanjiabing@vivo.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_011240_074039_27A25166 
X-CRM114-Status: GOOD (  17.07  )
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

On 10-05-22, 16:01, Wan Jiabing wrote:
> Fix following coccichek error:
> ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line
> ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line
> 
> mutex_lock is acquired but not released before return.
> Use 'goto out' to help releasing the mutex_lock.
> 
> Fixes: c210063b40ac ("cupful: mediatek: Add opp notification support")

cupful ??

> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 75bf21ddf61f..4c6d53c99d79 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -196,7 +196,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  
>  	if (pre_vproc < 0) {
>  		dev_err(cpu_dev, "invalid Vproc value: %d\n", pre_vproc);
> -		return pre_vproc;
> +		ret = pre_vproc;
> +		goto out;
>  	}
>  
>  	freq_hz = freq_table[index].frequency * 1000;
> @@ -205,7 +206,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  	if (IS_ERR(opp)) {
>  		dev_err(cpu_dev, "cpu%d: failed to find OPP for %ld\n",
>  			policy->cpu, freq_hz);
> -		return PTR_ERR(opp);
> +		ret = PTR_ERR(opp);
> +		goto out;
>  	}
>  	vproc = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
> -- 
> 2.35.1

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
