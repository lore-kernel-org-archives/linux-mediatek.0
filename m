Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF362C79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=; b=1aSsUvfg2G2NvJYyjl9Bl1d1vJ
	DMoipREgv0/S4hFyZ0I0zSaZj7U5POQPLOQ8eR5zqPLzBSfRH/7J+UfvlAoD77fRXYj99Me2Fpxet
	IaRLBGx96WfPSu1EBIDm4LcIh1L+5fl9z4jTKZFNbwKV6SNOord49//+e4D5z3aaJI9jQiZZZ249E
	EYJpY3ISY1gzifvB723gQJMxbfpV1/pDlHaf9QUnPxM7HlrezpIypYzV40R5EEKhDtCm/L8e/4IYZ
	d1r3oNrmoP1HY+x3m1AXys7ksber+VmgmDH6cxcO8XQ0yZFYUp50mIsi2ht9zcArpqdmPu4u9n1ts
	dWU/fqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8l-00000005rLW-1eRu;
	Mon, 07 Sep 2026 04:39:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8i-00000005rKl-1t7j
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 04:39:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d91518a63fso21887945ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788755967; x=1789360767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=PaVDPraB6M3UofMjk0Gr8GhvxcIuYYNKqPWpi/Z9RGnC4GDFZaNbsvr20+BmVGb1hx
         OW7G0Y/4iClNqNU8ho4tC/OtChayKZ0yC5PlTaO7x211MY5E4LP6amrTjyrWg8bmU+YG
         V2XI1VNwvh7ekavOHBNtcR2RJkr67VCUZLQcGjNpl4DO6KVpHvYp4zLiZs3JaNoN1Bl5
         wVFh9qzSPTy23fbRuPGXl1HHNwELCaN9tpErkh2RBT5LfLi0BYYPJIpsnDf3r45xvrso
         ve955Uavi02kiy+TJg7U7VJ42/oyk9g+f23PSTP7NsIAnYNrB53rcglVdPglvbrhUqq3
         XgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755967; x=1789360767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=ZcQaaTvTZJYVUjfNpXVDopAOO8XUIHu6YYvTJ6+S4wouPMt28trNhRlo+zyUxTGMlC
         kZ0ITUS5I3sDlgf4twwKV/GcEN+OK7/Lmt6d+iTecBir3tBBlWf1B43FmTQmDTFa5n/u
         5oYxRox1xgdUKnJYGuJS+3gIDxr5vSAqaslla5l2ctBWuaNxEadE78tj7fQkZ+EJJoPT
         SoohRh/F5c+EXg6dAGVqAqBxypDWfcaw5Nu32/4QTi2vdQMA6gvZOYBQQMTWUdQ4xsWX
         hBXuUKPUDfsuOdoPXkvQJtc0CwTvw+j/wT8eZxHqQeh8xRdfZDCZHopiVy5rY3iV6ARR
         4WGA==
X-Forwarded-Encrypted: i=1; AKwUvBzlghkyt7wdL3SQ4CczOV0DS77bhrjFPc7jpAVDLJVD7MTVoPeuJrF33jQkz7okz5oJLLEAh8Nt+htbeI+UfQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m/IqPLcQNkpl7MotibsSD2Wq/Qzz+Phu06WATMfvC9Xr/SESW5
	EXD30CTMEsTuMHmGotWAW0RI63oFUn6cOCTSoZ2XjjNTesi30rTT8UTB0JcgCcssd9I=
X-Gm-Gg: AYBFou2tpU1l2RI+pH3tKywnUFcmhEzYf8c+aXae/pGV+Ayc6H13oZ9RoBvyL+CR1Xg
	1c33iB/8Xl0axmlygspFdlbXgZI88zH2O/6j+3MPPPkzLIVf9eM9ozZBSSMlS9jqv3/kVhvuVSo
	v7RFWbORAqCesPnAPcFnd47CYkGgLZUoBWY5z5GsVQ8VraM/ATxDWoPu0enG8I4IPgi5se+70ID
	ozOZ5ipDNr1dJFucZHIrGCmuqa9FItIaWG5vv5AwMMF2GdrtvFuWzvmBjljTNk14kMMQYObnHsd
	g/W+qd//2OTuUnPqe/StkaE8j5x9TUVX5yzQ0iSJ7AtN9/56OSYxkADYln/zNOxmrSV6ucR1I9R
	mCbTzT00R6JKYCjfevpXtAyG80DT3+nOTcxGEKgvhDh2kGUDnWCdP/i3w03EBoEFG2uUZmUA4Vt
	XZ5vzMI7Ytl4X7BgoMWdILPWFHPHVLER43ABozliiLqj9CVV42J6eZKlbE6jIUgNY=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr299920485ad.16.1788755966732;
        Sun, 06 Sep 2026 21:39:26 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26643998eec.2.2026.09.06.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com, talel@amazon.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	mmayer@broadcom.com, sumitg@nvidia.com, krzk@kernel.org,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Message-ID: <ap4_-12ta7ThxEjc@vireshk-B250M-D3H>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-4-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906061755.5103-4-sumeet4linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_213928_537384_7F6B6C5C 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

On 06-09-26, 11:47, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh

