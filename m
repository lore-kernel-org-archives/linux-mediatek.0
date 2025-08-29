Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A865CA0EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CokGLX1/yeX4DJMWAz1LmKt9I3G7o4FsQeoqSBuvVPY=; b=t5shmAL8E6umR17KlpgHrmHcIi
	xjKwp1Aq2bNIN84G+d1vwNVyKVFeyiKBR7hCYpG+UvmTH5fUm0qaUUOz8W6H3Sggf9r7+bNIzPTsW
	mO4VTUhBy4qaiPB+VEonFCJ/VLXxLKg2BAAiZ/nnCZXEwkVtJCr5PXH5EjN5ccA/pLTkwvjWIFnGc
	sgwGwI5PDSAXJZzHC3HvZyoh+xhGbOmUL3y/lj5ncMdqXXwrXdJVuZPxQlfA9Z4mBUuRGlu1qk0aU
	BLDF0YzW1HGz8C6tIhzxlN4laTxOwEEzyipsJusiN1Fi1QoEBo2eJ9+sYOY22xusIviCafYCahPtw
	18IvdNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursdu-00000004eAV-42MT;
	Fri, 29 Aug 2025 06:31:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urscV-00000004duS-0yCF
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 06:29:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2445826fd9dso21220355ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448994; x=1757053794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CokGLX1/yeX4DJMWAz1LmKt9I3G7o4FsQeoqSBuvVPY=;
        b=njFt9pLdqsxIa2RKGsBwZneuxlyHVsJgv5DRf8Om4D4lukQdbxIap8ZqmrzsYvrnXw
         mm/8XqGQRZesctIeSLJ9PNMlz8iuRgdJ/kkfJulCNAWvs3czlteq1os74c1ijkn10LuL
         x3R2/XkTEw6EdqbhjD3JUzwIjkaS3RYgUxVKUAfeISh5agU7xyeYs4kzImmFA6Jz4vwY
         EqlUI4aWKvpoBbUY4aTDkcD/dIJx5G1BnNdvJSe71rMEI25VtCkj8NqXu4ATa7Qi86AX
         JHHrbNdQnWEybq5SVeSVUBhiT7SzTGYLmjlsRNkcX5Aax+qmCWtw1XIbzGhbX5sPCnsi
         na8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448994; x=1757053794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CokGLX1/yeX4DJMWAz1LmKt9I3G7o4FsQeoqSBuvVPY=;
        b=ZFjTzcIv/4a5gsYZi2lwjiwZKHpgdfaoMtX8zXK18AZDrI8dUCSCP1tJXQoPVQTx4k
         OZF/FThmGmi+jIWVM0BPF2/t53ZGwXWn8uzrFluQ4vRGrJ89N+rg7MZMxNb9+sNGRzTZ
         51+/VTtLkA6kMb2Z0MLcanXlemm+wCer8gIwkvprHzabCfS8OOW6Esm6vFvgaotQI9pl
         CdvGGhOh+MaEYUylROCgWnlOT+3RMMLRwmWJH80m3I2RmY56ch6Zdlqoz6mQhIQ5+Skj
         nEaSgKcehn5w40tGeYgMqpqv2S553gzTDhE75sKDDS4byhZm8QnrwYfmdX0/7mQE2L98
         ZGYw==
X-Forwarded-Encrypted: i=1; AJvYcCWibn46Q1Q8dj12PbALVBrdNx26duwOuD/wjf0DHBjvMvfkrBZSOOvuBhS3kKpy78/dCq1yh7XENn+t/lOTeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrdZw6cwoy8vcT+6YPkISUHp8JvXwOi3FalP/Vv/Do0BZJa45T
	cjCwg3GIBbHuF59mwT+Aw/kERK2XVRXNVFoo/0IwRxaLvkeUrzcwnUN+86GF1OcvgPg=
X-Gm-Gg: ASbGncv03HB97DpZ/xYUUvC/JUqaN+hxqlJUWOhxXbgroyzi+t1f7KETWxFYWQEQY1n
	Md9KcP92b8gpyZJZgVYP6Pbo4xhwxYK7VFrzBSCZc1kziFjfH64vPaFWByW5qAIckK4N/llS5qq
	Q+Di96wpN8cIhvSeIhw1XOBvDvUgD6/mHbgvAO3DmSR5So7R1BCFKQY+aQXxVWE5rOShj0JJp7v
	scwRuf2S9dmRWwgRrdO0GgkNHIcO8aHzY65Ct+2Xw7Z8tfSyCbz6S2Q6UO9E/DJjBwvuouZxn/W
	nNHz6ux4TSHKvqU+qGdZNnWy0m8cqrdWqqXK/ylc38kjCx1YxXs26Cp01CJPEClm9suRtn97m/q
	KGbwtMu7YRQE+iRZSLtpDSOg6
X-Google-Smtp-Source: AGHT+IFbX3s0aoe3pqEivfWfaakWxvchfFFbfgXfyIlcOqslqMMZIBk7FeaK/V2UaSwtVV106XuK4Q==
X-Received: by 2002:a17:902:ec89:b0:245:fa00:6e25 with SMTP id d9443c01a7336-2462ef1ea0bmr386065885ad.28.1756448994426;
        Thu, 28 Aug 2025 23:29:54 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903705be3sm14571325ad.18.2025.08.28.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:29:53 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:59:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/18] cpufreq: tegra186: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829062951.ximauv2so442q4gv@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-12-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-12-zhangzihuan@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_232955_278053_2CAB505E 
X-CRM114-Status: GOOD (  20.73  )
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

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index cbabb726c664..4d71e262a729 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -105,7 +105,7 @@ static unsigned int tegra186_cpufreq_get(unsigned int cpu)
>  {
>  	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
>  	struct tegra186_cpufreq_cluster *cluster;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	unsigned int edvd_offset, cluster_id;
>  	u32 ndiv;
>  
> @@ -117,7 +117,6 @@ static unsigned int tegra186_cpufreq_get(unsigned int cpu)
>  	ndiv = readl(data->regs + edvd_offset) & EDVD_CORE_VOLT_FREQ_F_MASK;
>  	cluster_id = data->cpus[policy->cpu].bpmp_cluster_id;
>  	cluster = &data->clusters[cluster_id];
> -	cpufreq_cpu_put(policy);
>  
>  	return (cluster->ref_clk_khz * ndiv) / cluster->div;

Merged with:

diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
index 4d71e262a729..4270686fc3e3 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -103,13 +103,12 @@ static int tegra186_cpufreq_set_target(struct cpufreq_policy *policy,
 
 static unsigned int tegra186_cpufreq_get(unsigned int cpu)
 {
+       struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpu);
        struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
        struct tegra186_cpufreq_cluster *cluster;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        unsigned int edvd_offset, cluster_id;
        u32 ndiv;
 
-       policy = cpufreq_cpu_get(cpu);
        if (!policy)
                return 0;
 

-- 
viresh

