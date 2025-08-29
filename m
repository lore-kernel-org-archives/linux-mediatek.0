Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B235CA0FF0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=; b=PxeRCrozAgdi4P2H2sHzqGduP5
	4Pj97KtrT78cKUVszJm6ltmFX5kTbzjJvjmkDR9L2EVQV8ZgWIZnGzAhobgw0b+mNEliAryyGkD+c
	D4qVcviVvszAMCxz+iV3SapuMqZXCHbXYg1mASg6hCEyCa5DXYFSOA/00061DZ+dtpgUFbtB7L75u
	YwvepNRfSda9EE3D573GJ2QX4m/qgsjVPMA8rYNPv9WNnx6R1yqkDdFKXF58bnaNMk3OtJKkRW0BK
	/nbOjF+ZzZddPD7NhoNorNIpVkqo05fsklrBwGIHhICvPqHMKYDIZyyRotyGV4ZWEC68PTxD4SiKu
	YcGuY43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursS5-00000004ccg-27MH;
	Fri, 29 Aug 2025 06:19:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursRE-00000004cSz-11zd
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 06:18:18 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7720b23a49fso1980933b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448295; x=1757053095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=EdGp4sCDFaZJ5yBnYUr3ej+a4PcE2NV3GHeFU/+ifz534ZWZ8R1HVNpmCqmP/OBv6j
         Z5NU3wo7jSEDwKndotOdu468QVLBUS6oPyff9q2jO49zxav0hK/ebpNBAsgdv4+od8qW
         dnxscu5pBqqjGc5AdCNpLmMyaWRiz9axBfGfXdt4fPRfxGjQKdpVhxSJHSOwjrfgtGep
         yiv2ONNjDiV96LxDppvveF2ZXU+HQIVFYdLrUHM3hi/c8WAsy48ZTpAk0oPsumoTKs0D
         CYgDtH20jpRtMWo2FQRadYwlqZrx6tbFj56gOu25LaWVrfpYr7Xz7Zhr0wIAv/zvDDmI
         1vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448295; x=1757053095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=khAGQZwwsCuUiAUCRdD6U47FJ6w02ax2NC02sllFGjK3ifiE74fmups0bfiuxozWTf
         3jFVI1SABG2XyhsdCKyKFibhBF+6OYTY2nof2ffkiJbJrq1aiQpCSaL1NmOky4Z/ZIko
         kHK8vuxa6foYr7d8I0cJVCg8FLPkaXc2eAeQLHvQUoje4SuQiv/iYy/o9CI2JsVZ1KBk
         P58zcTYZzRZ667q+jxGzelBcl3QWonIojNB7tbasX2Z/FdwseOmcNTv9+iWbPqQIaqSY
         b6KTIx7/P4ArUyavxfC9M9DN2oKtjam9p44t0NGsu8llWlzzuntL9ASGdWFx8VRrTuAo
         gyig==
X-Forwarded-Encrypted: i=1; AJvYcCXYzM2tLw8W4UCAhcxFXtR7Gz3JjQo0kKDxjSyWDvcqJHJGLy2nDC+5B6lTyooUiSGSVT+Y1fwRrR0DGYeWdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ck/SfmuejRYGheoKndfNM1kDPRLtnTTRubOpX/aFCuE2BFxt
	scAvX2IZKz1W16pFWau657J2Irsf917VuLfkrraM0VVBcgqdQib6AOsMfC/m3LC9LZ0=
X-Gm-Gg: ASbGncsY1lxqvOxIBCxSIQn02Ok5NzSu2R+VmzyBETduEwKlPfyQDQ2qZAoTlKqkxoF
	Xo8yk+dtRdeRKkje3XohDvkW2SpL0VvVhweDkX5fz5dK8c3FX/d6hy+KJgeuiTtzfxEffRHRLJF
	H3LwZA0TquAOIbAiXhfeEglFYTgD8TimPanIrRETeC0+x9PyipW6CNNs6nwqYvBQK2Ob9OsKL4O
	I7nlb2MyfOV9TkZMK+ImnV7mV1FnwGaPcFuydH6oM86htFguy+oWSo0Mi4CoN/DVNYmoYEGJPWq
	Eq/U1GqCmm1GlCDdgA9vwsyI3pfGFjlg1B+I5acj/A85T8g3yo4hXZrQgbpiOT5UReeHRIkHDI2
	ynAtlFnr+OIyJbMqj8MieeSa5jhSCzblT4O8=
X-Google-Smtp-Source: AGHT+IEdwrBA8fEPouruiBjmjO1y+VLHrsJ6SO97Twxy5LbO1fb87iKCtpWKSDsewOGX8ikCQhJ2gQ==
X-Received: by 2002:a05:6a00:3907:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-7702faaf2acmr35042659b3a.18.1756448295215;
        Thu, 28 Aug 2025 23:18:15 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1b21sm1307488b3a.69.2025.08.28.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:18:14 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:12 +0530
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
Subject: Re: [PATCH v2 08/18] cpufreq: mediatek: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061812.fziokvashujzbtth@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-9-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-9-zhangzihuan@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_231816_298397_1A53BEB9 
X-CRM114-Status: GOOD (  20.71  )
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
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f3f02c4b6888..1fae060e16d9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  	struct dev_pm_opp *new_opp;
>  	struct mtk_cpu_dvfs_info *info;
>  	unsigned long freq, volt;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int ret = 0;
>  
>  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  
>  			dev_pm_opp_put(new_opp);
>  			policy = cpufreq_cpu_get(info->opp_cpu);
> -			if (policy) {
> +			if (policy)
>  				cpufreq_driver_target(policy, freq / 1000,
>  						      CPUFREQ_RELATION_L);
> -				cpufreq_cpu_put(policy);
> -			}
>  		}
>  	}

Merged with:

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1fae060e16d9..fae062a6431f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -320,7 +320,6 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
        struct dev_pm_opp *new_opp;
        struct mtk_cpu_dvfs_info *info;
        unsigned long freq, volt;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        int ret = 0;

        info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
@@ -353,7 +352,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
                        }

                        dev_pm_opp_put(new_opp);
-                       policy = cpufreq_cpu_get(info->opp_cpu);
+
+                       struct cpufreq_policy *policy __free(put_cpufreq_policy)
+                               = cpufreq_cpu_get(info->opp_cpu);
                        if (policy)
                                cpufreq_driver_target(policy, freq / 1000,
                                                      CPUFREQ_RELATION_L);

-- 
viresh

