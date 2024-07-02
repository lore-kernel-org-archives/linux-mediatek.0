Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F258C3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ8zplKEvkyqs0AhE9LwFp0KDkZC+KF7mrGUufJk6Ng=; b=rymKLTzB3lqPLs3C7VucWbEpko
	ILEuiSjNyyl+Eu68yJ9U+bRBxvzCHI/oGRariPPE9lBH9ljjP/sAZdjZqZAT/FeWN7RdNtcMUd6RQ
	d/Kj0a3x7tz4jreXsbxpyV2Xlp3vdN6P2jO78hILd+2BokBeQiUX2h4uFmb+48/vbbzmJZy6afEYg
	8W/yCatFdp15cPd9ayN/hsS1FfMThHQNYw7AMRh34WQ1w8lWdoiOMpjCl/OQhsHcKNQc+Mio83jGf
	XEXOHTEU6ERg9RaUUhLlicdgPAy9jlSKbDbBuuBaJnxRcUdh2sizBMsuO2DNhqkT9tHMqh2L9eLAs
	sjJTua6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZ6X-000000060qZ-2p9Z;
	Tue, 02 Jul 2024 08:43:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZ6V-000000060po-0JKl
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 08:43:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f480624d10so29574815ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jul 2024 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719909790; x=1720514590; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQ8zplKEvkyqs0AhE9LwFp0KDkZC+KF7mrGUufJk6Ng=;
        b=QZSceWsdAz3dogEWLr6d3ctjpeM6qK4MWPs4QL0fSX15kxVmWO4Rw6BZJ97xA+/s0n
         9HXq4xI78LBGg+S7ODaEzUI+O8Lj5b+q0Ew23iT+mPNJy57FSioXRiKeb/D3h5z3oSns
         llT0MH8DWUEwZ+u7KQ6o6OEN5Sw4tQpuylXlohY+hESs4VAYAVX2HzCaK7WQYwjUVMrY
         oTTR2bmHnCbJKbSR41ui6j1q8vgpwR+8jDF6EHCtc1UyCMKDm+IiqDrfNaab1eeKqzKm
         6XpUNKT/XWIEDzQ1nwaPHpcUSPSJ/xj6Y0zimJn6NSe3LsDDZXDTi+LGDSyZVJnqC+4I
         ZXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719909790; x=1720514590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ8zplKEvkyqs0AhE9LwFp0KDkZC+KF7mrGUufJk6Ng=;
        b=pjRW7pfCzkCf2hhDLAFa1bYIkmS7i8FBg4aWqVN2jgQS6ZewQURVGn49A+yC9i+laS
         cmGNRBYgJDf02C5j8/AxEu9G1NDsHXR+haTuwpM4tfT8lDAh4on/a6A9nUcywueyRjCZ
         uO7ZyAQ9CoO/yLUqOgfKHAxtL2Nmt7zUXSmzUEtkoS23EFJl/cUbUE5iVPbWmBeh+D+f
         jBLoqLCH1hvsps5pBfiAz/IGHva6qKu+5gjZ9MfWsaJxibfNGZ0xugrThNCBz0v2Nzuw
         ljXl7dnhDUEAQQRIAEWJCT8uipsouqgfvS2MTnvDihiLaVOQB+fJdr+tBq37G7GU+P8t
         9QXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJTz3BXQDp45fT0atm+OpQ7nBfjbdaDV5MRW1pD7bpeY3L1Yk8I2mrs8ay/XUsE3ah8oyszg1WDcayMlpq2lScwoMXkrxtLmJJ6X4u3mv/bjsc
X-Gm-Message-State: AOJu0YwIKx3p3A+3SAizzQ7n19CxsiEo/A8xvG1RJYduaIy1KI1t7m+d
	nxys9Izt12I4j4ckSAyApd4/ImaSNDJbWKY4/o9qCHAqovrz2Z/ThSIuLAZ4TQk=
X-Google-Smtp-Source: AGHT+IEmIv2vGdHXLm2ZvbXST6X7Il1ZBsG0xUxf3z1Ipxyow451EWanRYVGWaC0ZCem1Pikt0Jlng==
X-Received: by 2002:a17:902:d488:b0:1fa:a68:47a8 with SMTP id d9443c01a7336-1fadbca042dmr72974405ad.28.1719909789985;
        Tue, 02 Jul 2024 01:43:09 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac156957fsm78805885ad.228.2024.07.02.01.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:43:09 -0700 (PDT)
Date: Tue, 2 Jul 2024 14:13:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
Message-ID: <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
 <20240702055703.obendyy2ykbbutrz@vireshk-i7>
 <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_014311_151631_AE6A75F1 
X-CRM114-Status: GOOD (  19.26  )
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

On 02-07-24, 10:26, AngeloGioacchino Del Regno wrote:
> Il 02/07/24 07:57, Viresh Kumar ha scritto:
> > On 28-06-24, 15:48, Nícolas F. R. A. Prado wrote:
> > > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> > > @@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
> > >   	int cpu, ret;
> > >   	data = dev_get_platdata(&pdev->dev);
> > > -	if (!data) {
> > > -		dev_err(&pdev->dev,
> > > -			"failed to get mtk cpufreq platform data\n");
> > > -		return -ENODEV;
> > > -	}
> > > +	if (!data)
> > > +		return dev_err_probe(&pdev->dev, -ENODEV,
> > 
> > What's the point of calling dev_err_probe() when we know for sure that
> > the error isn't EPROBE_DEFER ?
> > 
> 
> Logging consistency, that's all; the alternative would be to rewrite the dev_err()
> messages to be consistent with what dev_err_probe() says, so that'd be
> dev_err("error %pe: (message)");

That would be better I guess. There is no point adding inefficient
code.

> > > +				     "failed to get mtk cpufreq platform data\n");
> > >   	for_each_possible_cpu(cpu) {
> > >   		info = mtk_cpu_dvfs_info_lookup(cpu);
> > > @@ -643,24 +642,21 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
> > >   		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> > >   		if (!info) {
> > >   			ret = -ENOMEM;
> > > +			dev_err_probe(&pdev->dev, ret, "Failed to allocate dvfs_info\n");
> > 
> 
> By the way, forgot to point that out in my former review: to make it shorter,
> instead of "ret = -ENOMEM; dev_err_probe()" you can write it as...
> 
> ret = dev_err_probe(&pdev->dev, -ENOMEM, ".... message");

`ret` will be  be used I guess with the `goto` statement to return
error and so the change was like this.

-- 
viresh

