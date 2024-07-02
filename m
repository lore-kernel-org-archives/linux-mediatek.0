Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297ABC30658
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 05:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5rG7724QFwFDpF6Kn0xpJ+NJU0J1nnnGMkvWaoZGyc=; b=Xdgb1QUPIM+np7CFj4O8wHiOqR
	h+Nqwa/AjQN5v7eWJINvKY2lwRwpFfmaNWrV+3NdwuUkaxtpc1DRa5tliG+mYDkJ7yt6L9e92x4t9
	9ceWJL9gvd6a6aX/fQj9UkENjCBqZ2p/HZP2zjotuozuaci74Gr7VpiB2X5aolCYZncTrDu7wX60z
	lk+7/uECJJsk8UlVvnk8AHN82e22uAKBnKbMRuRCBANHlE1h3rA0k4dNigqE7kxmN+WMaOstfYmP7
	eWSXrLfAdGVqUfD/U62UU/S5YxuZDk1EMdPmZOH35vvusdRo8qRWFLtHBu4zR/cI4NxLGQekYkcTK
	bZuDPIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWVq-00000005ezy-1kZA;
	Tue, 02 Jul 2024 05:57:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWVm-00000005ez8-40L5
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 05:57:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f9de13d6baso22748615ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jul 2024 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719899826; x=1720504626; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5rG7724QFwFDpF6Kn0xpJ+NJU0J1nnnGMkvWaoZGyc=;
        b=LyRcj9gFXREkwyjhCFxEWWdLUNj7yj6RoLc/avyEm86gpfFUzpApn63iCjgpOvkjy0
         KhJjK1MyPkzP6mGsB9c36NNNX80SPz3dK0yZhC5d9iVw6arIclUZCPjOfIctemNfODB4
         6kfiYEjDi46bHItG12YRj6R0YiAktvCA5toDJomdI4uCJjG/srMlB900PIwFGuIhqw2s
         SaMT+V7GPv+gPy80ospFeNb8ZeuSMIjSRnJY9DpKqPUmP1nuK40us8BoUL0cumVGstac
         r1OrFhkXrKziTsCKvF825mXdTKAlTqrBd/WeihcD1ix424YYhEu2+/XZC3DsMAX8GDg+
         S3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719899826; x=1720504626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5rG7724QFwFDpF6Kn0xpJ+NJU0J1nnnGMkvWaoZGyc=;
        b=rcKqkHgx1sMHwgnif1H4sen3z9CQN5nxnYtIYJr+2vLhJHbzM4YpBnSwLSnHoRyeMb
         ZJ+nX8LPrFL51ypSQ2gQhzhp8ylQ7nyMcaB6q3nr95abuSt13zdZ9HEyHcYAjPDoPSZ8
         HiRAqoTc9C+UT/rYa9In0qsB6806DkygiaVI919DN4FmCpqEAyyNSwsBAtJGwDaZZrBd
         G5NR72+0srBjrchdL1yYcW4DclFK7ZtUuJChROgc3rhs9In6Jv1fhFsyYUDEXsfZ1KWY
         amB8NicboLxEtm+Dgh8JdWUP3CeB3GgE/S54SUDq4XtXPAAxL6/J7zEcdReZRu+O8cxg
         OpQg==
X-Forwarded-Encrypted: i=1; AJvYcCV7WnvuytxrOOZRFhomoC2iHPQh307FhJrXHDwlSZ8UM5IQw22VIL9KspIuQGCchWkVTOvEYkSjIsemcT/2kkOaqLSgaLLN6Wo5+Z6ehaNxba9b
X-Gm-Message-State: AOJu0Yyw2Ag18FhqB8YS+MsZ1qHrLQ37AmSo9F/tVJN6dMUxiBYcVbId
	EPQiehbwEJ7kOnCkrO1S/bHcdmck29sQEbCg2aI2Tgf9hpC+//PkIAgyZVyWOGA=
X-Google-Smtp-Source: AGHT+IHCa/XZ44PQvOPHK1Yiee37rkwXi6KHLsgAh7cZkOVdJcrPdLHRisJCUzRqNJuStcv8fmZSkw==
X-Received: by 2002:a17:903:2446:b0:1fa:d1df:d41e with SMTP id d9443c01a7336-1fadbcf4690mr46300745ad.58.1719899826024;
        Mon, 01 Jul 2024 22:57:06 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad067031fsm66279735ad.259.2024.07.01.22.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 22:57:05 -0700 (PDT)
Date: Tue, 2 Jul 2024 11:27:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
Message-ID: <20240702055703.obendyy2ykbbutrz@vireshk-i7>
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_225707_320142_89609BB1 
X-CRM114-Status: GOOD (  12.73  )
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

On 28-06-24, 15:48, Nícolas F. R. A. Prado wrote:
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>  	int cpu, ret;
>  
>  	data = dev_get_platdata(&pdev->dev);
> -	if (!data) {
> -		dev_err(&pdev->dev,
> -			"failed to get mtk cpufreq platform data\n");
> -		return -ENODEV;
> -	}
> +	if (!data)
> +		return dev_err_probe(&pdev->dev, -ENODEV,

What's the point of calling dev_err_probe() when we know for sure that
the error isn't EPROBE_DEFER ?

> +				     "failed to get mtk cpufreq platform data\n");
>  
>  	for_each_possible_cpu(cpu) {
>  		info = mtk_cpu_dvfs_info_lookup(cpu);
> @@ -643,24 +642,21 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>  		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  		if (!info) {
>  			ret = -ENOMEM;
> +			dev_err_probe(&pdev->dev, ret, "Failed to allocate dvfs_info\n");

Same here.

-- 
viresh

