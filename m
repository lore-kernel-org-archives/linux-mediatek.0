Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A5CA0EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=; b=ZbdjOd3HlfbDpY1N8ll0A90Ir5
	FXuCE5i4hekgcMGVHJOv7Gd9CELUk79Hv0ADUi5etaQODbdnNLVqQcVLeXRHliPciAFzhu5pJak3K
	Bh9uBzA8+x5FY8mGYxQErS5CF8a9AIHpw8Gw7Ibu4+lRW2F32gB44MEGVMenguYp6y3VPyQuBXY8O
	FBmK5ZBuRea68n3X/72fYX4efEHFWrAROtACh/M1Y+twm3EnEudtPATBLIlHM0efPUg50v2tlt26W
	fh2IIgz69R9jMWaW2MX2kLsbDQtzcH9y3wvsr4qsdSzlVk7nrNrFGmFrYkNiX6qA1s/6J3yxAI2zC
	ghsa+Geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursS4-00000004ccE-3b5F;
	Fri, 29 Aug 2025 06:19:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursMP-00000004biB-2SNd
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 06:13:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-248e3ef1641so9808695ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447997; x=1757052797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
        b=jrTl1wnKSe53W4nWyYdzr16G7guOmg4njL+nbQbR1zatqBPZd39Nkvm0w6tXQR1xcY
         piJbLToQBMq6A9XwYenkj3f2UgnIEwqlv0Hx8VZWztyiMZI2V+/PM8EZzCvh9KGjjTu0
         AmxEKUtc8FgGCcprheuY4pOho8TY+irpw4xNTpMNw6dwWYZWjirBtv9oajPr0mP/Y/8/
         z40E73NER6l0MmZ+lUH9ReK87jlOscvVceetweucr4oXq5d21YhM1eetBEA+sivomw3d
         GtUOIigJ+yR8GO3QK2WjC4l5gZVERIs+VJPYihhk3GZNfJ8INedXOmH7FQOQdzjkTfPq
         QRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447997; x=1757052797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
        b=c20rdc0rlcr0+AlhtAqdcwHaj0nZ0ciKaovGIJVrtguUQ5UIEtfMGBD4YXXTayFTek
         U+wF/2y45kpa9Na4WCbzwQ4lleRr5yFN26F2xjdsf0tyBnbTwvFGnPSemfX40vA74bNF
         bwb7vp3bqpaTZENcvzJcQ9E5XC7VKrt8h8ErFc4zQ1NF1bCPZeoBrGW0YOHan0xJDMIA
         kLVQTeg1L2IXpJYuuObvd7FYoRsEz9W2qHOd5CNr//ydXw60+Mja7ydfO5ESpDmDdIje
         hsHgNG3Iw9oKvc9ZWugxiktcN/4Y24treD+UmUMFvrkLSO+WSLnTWUvhS2zJzWye+0s0
         WVSA==
X-Forwarded-Encrypted: i=1; AJvYcCW3pv+bEhD9zpjvfBi0RgHB3wCSleG3tIA0R94gvwtA0lbM6pZJSvUnsYWvvhAs3W4ta9jwq/+M/6KvKpbgDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3GDeFbuc1ZIajHz8YF/XsOIGhkJEdjibiqC4dwh+MLyG4cWep
	DPp/u8hnGlcYYmIftLwJvbhsMAh0WG/x5psM9WfMhcJcRvvji/P5AcPhhRrK03lsN+I=
X-Gm-Gg: ASbGncts+LHSfC9uV7vGeIR9hNPi59JqLmI2HK0uhyE0mD9q/cU5L9QgaXv+AQeQLpH
	cbe2fRTNh+xlrdIbfLcqbX7LD6oBpOxnTtMtHxGjcuSLQVhGj8RnZ/bc2B/yndDoDaAUfC/azxo
	fB2rnLsloZD2XV1gV8oMDHqv7CsVC859cMVSJ4D3mJZOoUmj29PDtgCa7VJ5n8+yHsAGlayVbxY
	00sDCwNvcw3Lm+noEVetbvPcXqdrpFIHNzgSsdyYoReTuaWk5eKg9SY2vavvht8RrQMEYwKIPg/
	mNlugGInDLsstxmmtkhvgZbtXe2fskJZqxTRSPe6MHONUdlXj4Tjkz/B49wKOzynhwzF9MJDjRp
	/aerNGDP2A7Dvq24Uy5TH/hcHX0v3K7YhYDo=
X-Google-Smtp-Source: AGHT+IFWh4jzpCyQazo33Du3vwJOQK6BMtgUKuJSYiyNvSKeAM+9t6q52OKXzZUwBWVIjDVwh5LnnA==
X-Received: by 2002:a17:903:248:b0:248:7018:c739 with SMTP id d9443c01a7336-2487018c906mr177164055ad.28.1756447996693;
        Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm13362715ad.112.2025.08.28.23.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:43:13 +0530
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
Subject: Re: [PATCH v2 10/18] cpufreq: s5pv210: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061313.bloyct5htjym6b3j@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-11-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-11-zhangzihuan@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_231317_629200_C41AB8CC 
X-CRM114-Status: GOOD (  20.83  )
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
>  drivers/cpufreq/s5pv210-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index 76c888ed8d16..95f1568e9530 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -555,7 +555,7 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  						 unsigned long event, void *ptr)
>  {
>  	int ret;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  
>  	policy = cpufreq_cpu_get(0);
>  	if (!policy) {
> @@ -564,7 +564,6 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  	}
>  
>  	ret = cpufreq_driver_target(policy, SLEEP_FREQ, 0);
> -	cpufreq_cpu_put(policy);
>  
>  	if (ret < 0)
>  		return NOTIFY_BAD;

Merged with minor change:

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 95f1568e9530..4215621deb3f 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -554,10 +554,9 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
                                                 unsigned long event, void *ptr)
 {
+       struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
        int ret;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);

-       policy = cpufreq_cpu_get(0);
        if (!policy) {
                pr_debug("cpufreq: get no policy for cpu0\n");
                return NOTIFY_BAD;

-- 
viresh

