Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345D8CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 04:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=; b=T8g8NOVdCqvWkp4jU/VzufgKu7
	u8Se2FLJ7NwQyraSpY4A9tpzERSMmsBel36bTXDGqDIaqWD7Lk8DY4n4lIoGpjhsK8pNqiNudoGa+
	kjDc+c5Bd24szxnzEm+4kRJ2zlF4ijnBhHjE2RJvlsdI7/W1f+YtlL79Z+eT2Gz0pKDeLUrjW2FRq
	fegAjBKN8qiW3QWrRXVdBChJF6afqb42k5BDWXHq3P4Nr1WEsUFFnEyjohbPUSDKNAQh3y3ZPQnLp
	1VFHsEEPvZy/jw9bZLx40hnz/wLr/BbOWYXEDOXfsEbHejClvy0BtFUwwfTTCDg8pcefItk7StZ/x
	Vt36aggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZzg-0000000Fdye-3TB2;
	Mon, 05 Oct 2026 04:08:04 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZze-0000000Fdy0-2sR4
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 04:08:03 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33c11ef641aso2280383eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2026 21:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791173281; x=1791778081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=yOmalqbLJ3eRVsrbmp2RDV8lvbf5a8e0dTsbF3V+d6Ar2ZwKm8DCUTVPCWf7a8IAn6
         mMs0jW5BdHaGUXAHQoAJmH5bfZvJ7QOwer/CDqhCa1RBEsJ5WDmIrBoH4dMEV7syLVsS
         VnZfy/R+5eVzRZDOZ1CL7qfKnr/26PTScM2OSH4Fxu5ZBSTJ2pnRloOPyFotPsHZHBUj
         fxRPcmwEyZC2t+lDNofSuyg1uyUivRxSgd0TAlyRNYYxQJUd7a74EAM4RSilMRzMqU9Q
         haDRNMw9/3rZMvF2JBuOrMaswDG7s0q33/YJtUbPIbgYcm+xAlCcBZqP+/QJurKvk93W
         OWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791173281; x=1791778081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=o84R77zIolrKbvqytveXMv7ImhO+/kJhOb7PxiLtNnTAa60hFD9Bj1Hmsx59mMiUxD
         bDmcWla4eFoyZdHGo+c8+eNVpui0SW+m88y/bDO8HclNfqdiEZDhD/ZR93Psn2cDcFrc
         r3DkyqMf0BXRPtM33niqKcBwhyBMccnlTOT5Ws8v3fyo3TFNfVb2tWaYTKu7r9jLPgW8
         05cc2aV8I5J5wFNeacSAHeB2b0Wosn5v1pOCJBIvEc6ctbCNjlBF2fvQ4ISKtz0LzI3C
         ouBtAgklDPWBe8PoqDVjZsMJzMqNXjMo5yiUBgRpK8bD9jueM4+HTylt0tpehT+D4nRP
         pGuA==
X-Forwarded-Encrypted: i=1; AKwUvByGX7xE2r8JlHCINIY13cH2QX1t04guxxBCN8J6AsXaEtLzpGyhnre9rf6/Ll4t4ynil4hN82pJaNoRrOA73g==@lists.infradead.org
X-Gm-Message-State: AFuF++mA6D6+xy+n2n5W0N7tCq9XJ396HVzjKikHjTbhdRisCgKm8TFt
	3hFciNO8WhEK3Ht1yUZlS/CAHYjk64ONG5D72wch9a4aHgW3anaymuXo1h12CAbb+Zw=
X-Gm-Gg: AYBFou0CKYFzoTAtwn1FXrmmkLh3xdWkLtkjLFfaSlKlPfhVQdyN4bPsgIC1yqsv2JC
	RS/8JcojnkZgCONqkJ/9VTsfwKUBD16GKXe+cFB3UMxe75tjUxDwZYb1uNhbzPFsc0ecRvTlVr8
	R67UGSDtbDL+mIFegQ9FFfvCKP9leZi8hLzX23bnD0Azii7d3KHCJ2BS4JgpRMzq1mP/jBGcYQS
	dKIZz12ftvmgGe36UIsd7TCGSZraSlpcjO6rQR1KAZydGo7EbWdMGGCXwGARWg+Nb5wDzRpPaey
	bR4Cnq9LaC0JkxYgJvmrgCg6GrUiOVYYJH30obQImrdGdA8pVbxxDDJ71r3EJIgViHgX/hsRZ3S
	Ya1uj6lIV4rGMQFgWhsqgchoIiJHAhUZ7nSOD/7wDdL4EeH5yTpGcsoEVuBzMmxGRfgzu/xH1DE
	qv6AZCqsEAyUvScJ/1GXmZg3QM5tSrAjiX7BcdeqLGMVWVa1WP7gSzqDCcFSCRT3+xfE5m6eyz
X-Received: by 2002:a05:701b:2810:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-14f58de5451mr12982932c88.3.1791173281135;
        Sun, 04 Oct 2026 21:08:01 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm18805270c88.15.2026.10.04.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:08:00 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:37:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com,
	talel@amazon.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, mmayer@broadcom.com, sumitg@nvidia.com,
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
Subject: Re: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers
 symbolically
Message-ID: <asMinVwyd7gcvRlo@vireshk-B250M-D3H>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-4-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912191156.185448-4-sumeet4linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_210802_724821_F3CA739C 
X-CRM114-Status: GOOD (  16.24  )
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

On 13-09-26, 00:41, Sumeet Pawnikar wrote:
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
> 
> diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
> index a8e35bc75fb2..389fff5e6f65 100644
> --- a/drivers/cpufreq/bmips-cpufreq.c
> +++ b/drivers/cpufreq/bmips-cpufreq.c
> @@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	freq_table = bmips_cpufreq_get_freq_table(policy);
>  	if (IS_ERR(freq_table)) {
> -		pr_err("%s: couldn't determine frequency table (%ld).\n",
> -			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
> +		pr_err("%s: couldn't determine frequency table (%pe).\n",
> +			BMIPS_CPUFREQ_NAME, freq_table);
>  		return PTR_ERR(freq_table);
>  	}
>  
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 80893844353c..f767898ebfb5 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
>  
>  	kworker_fie = kthread_run_worker(0, "cppc_fie");
>  	if (IS_ERR(kworker_fie)) {
> -		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
> -			PTR_ERR(kworker_fie));
> +		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
> +			kworker_fie);
>  		fie_disabled = FIE_DISABLED;
>  		kworker_fie = NULL;
>  		return;
> diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
> index 42edb41ad459..0652e5df0278 100644
> --- a/drivers/cpufreq/qoriq-cpufreq.c
> +++ b/drivers/cpufreq/qoriq-cpufreq.c
> @@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
>  	/* get platform freq by its clock name */
>  	pltclk = clk_get(NULL, "cg-pll0-div1");
>  	if (IS_ERR(pltclk)) {
> -		pr_err("%s: can't get bus frequency %ld\n",
> -		       __func__, PTR_ERR(pltclk));
> +		pr_err("%s: can't get bus frequency %pe\n",
> +		       __func__, pltclk);
>  		return PTR_ERR(pltclk);
>  	}
>  
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
> index 9cef71528076..9a01592425ee 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
>  
>  	policy->clk = clk_get(NULL, "armclk");
>  	if (IS_ERR(policy->clk)) {
> -		pr_err("Unable to obtain ARMCLK: %ld\n",
> -		       PTR_ERR(policy->clk));
> +		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
>  		return PTR_ERR(policy->clk);
>  	}
>  
>  #ifdef CONFIG_REGULATOR
>  	vddarm = regulator_get(NULL, "vddarm");
>  	if (IS_ERR(vddarm)) {
> -		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
> +		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
>  		pr_err("Only frequency scaling available\n");
>  		vddarm = NULL;
>  	} else {

Applied. Thanks.

-- 
viresh

