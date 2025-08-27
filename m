Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A14CA0EFF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT9Qx0pL0526DK73EqyoLYw0wsYmSjn2bOtkKWj9+LI=; b=xLQ+DBh6lwAY5ltNUVlOT2BHcJ
	OqsoJnuRSujveGLel2mtDmvIa0AYglREZ31HKV0eMeSSrVkDzQR0ALE14cDDbQ0og4BpXuBOCww7Q
	MuekIQ1PuRaLYoMwcU9wOeLS/Lvg+2kYfHxbQGl90L4nwY7xQSkjRRLuxIs0nhwm1AO38Zo+df9VW
	vifMP4niAkIruRA57tAC2O2WQak5v/6xrsAyTpfB/HLDBS2VxJx+guBqbixve1ks/1L6/FGVWZyZf
	LSCzifG3lZ5yOF8Eh7T0ww5zIoiXMgllhLih+9DN5mj2ASgJy37eEnDvOtoq5UttGOMFgjhCjNrjv
	nV8A2+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIUm-0000000G5Ie-1U5P;
	Wed, 27 Aug 2025 15:55:32 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGtm-0000000FiIy-2Hwu
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Aug 2025 14:13:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-24895637fe1so10658575ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756303993; x=1756908793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9Qx0pL0526DK73EqyoLYw0wsYmSjn2bOtkKWj9+LI=;
        b=Ij25fi+g482SsILgQ4o9LKB7FKqDjFL4CV7TFrIRAtaucbnP6AohiwIOucZZUrTne8
         Pd3Kjmxou51iCMWZPKC9SXoNWNI2N8WXtUMmkx48gkF4ekxyl9XqL8D4ocaqtKSKUbUR
         A4X4PYBc5LxSLPEaeMPjTMAZuVKdqWImDIV113cqGUr0bKu5g5ArQwKDkX63oLvq9K00
         vDCY4/jTpapPqJvFwSB5RQb8oucz1xQhdKCnoG+YuByIBpWHvn0D1xiLvc+9nWXRm/KM
         W+wJeYBosTIXIoOYSsMUc6NzYr3W4qr5Y6OKsiIdQMTzRHSMrWZGD8tdw6dQHZcM5PJL
         Z8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303993; x=1756908793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9Qx0pL0526DK73EqyoLYw0wsYmSjn2bOtkKWj9+LI=;
        b=edaKT6B67NqSWDq+QGyV5PQms6BT4aGCnNg2IcHg8aSsilgf7FkmB8D0MgY4MYedag
         Rwu6OnnoiKMn0qa4eAIS9LDcG7sZ1dd7Cvr4b6iXD3zEsoVXNZzsDtcmppxOZq1jhU2s
         01WQy7xd0RLdnKhCO/TKCjIugL8IIQOFPZK5t4hW7KVVBsxRUFwyiAtJErKt9LH2lSx1
         E69BYlm4BGiMr/vHd9Y2Cn4Av9XYCzITBwZo3q2FHFPAePSEOmFUP+8kAlPbRddaDR/Q
         MkOcx2UvZTRs35NXCREuZoJsKhhUC3LuhShoV4ytOenA//OGWMQY8h3yxBq2sQrhp8TC
         YXgg==
X-Forwarded-Encrypted: i=1; AJvYcCWukFUSKLbe7BpDMp/LGZIvfUDqy0uZofZ2cOvsP9HU9Dzm42CfSYJmerGoSRMB/wtvkfCY1PNkVWl+I6SP9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAExVVYIWef+9Gt+hFW8a/MXcqm1T/J5Iv6uPCgcj84vlAsy1e
	ST4NGi0xs4eJNdaFueqqSB1VRkbnRw8TGNn3NQIVs5KfQik0p1q97OX3pzo6tUxRI6wP2XKW1w0
	xN64BlA==
X-Google-Smtp-Source: AGHT+IGTSg2J3odWqRi5DzWDmdBYNRXtpWLMNIy0mlgNYPFM/YLwHCJkE7ruCavXPIcZq+6RDeJTdDhPxa4=
X-Received: from plan10.prod.google.com ([2002:a17:903:404a:b0:248:7792:b8da])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a8e:b0:246:620:a0b9
 with SMTP id d9443c01a7336-2462efcaaa3mr229124795ad.61.1756303993097; Wed, 27
 Aug 2025 07:13:13 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:13:11 -0700
In-Reply-To: <20250827023202.10310-3-zhangzihuan@kylinos.cn>
Mime-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn> <20250827023202.10310-3-zhangzihuan@kylinos.cn>
Message-ID: <aK8Sd30K64mbN1Nt@google.com>
Subject: Re: [PATCH v2 02/18] KVM: x86: Use __free(put_cpufreq_policy) for
 policy reference
From: Sean Christopherson <seanjc@google.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Markus Mayer <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_071314_588795_E6543FAF 
X-CRM114-Status: GOOD (  22.76  )
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

On Wed, Aug 27, 2025, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  arch/x86/kvm/x86.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index a1c49bc681c4..2a825f4ec701 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9492,16 +9492,14 @@ static void kvm_timer_init(void)
>  		max_tsc_khz = tsc_khz;
>  
>  		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> -			struct cpufreq_policy *policy;
> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  			int cpu;
>  
>  			cpu = get_cpu();
>  			policy = cpufreq_cpu_get(cpu);
> -			if (policy) {
> -				if (policy->cpuinfo.max_freq)
> -					max_tsc_khz = policy->cpuinfo.max_freq;
> -				cpufreq_cpu_put(policy);
> -			}
> +			if (policy && policy->cpuinfo.max_freq)
> +				max_tsc_khz = policy->cpuinfo.max_freq;
> +
>  			put_cpu();

Hmm, this is technically buggy.  __free() won't invoke put_cpufreq_policy() until
policy goes out of scope, and so using __free() means the code is effectively:

		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
			struct cpufreq_policy *policy;
			int cpu;

			cpu = get_cpu();
			policy = cpufreq_cpu_get(cpu);
			if (policy && policy->cpuinfo.max_freq)
				max_tsc_khz = policy->cpuinfo.max_freq;
			put_cpu();

			if (policy)
				cpufreq_cpu_put(policy);
		}

That's "fine" because the policy isn't truly referenced after preemption is
disabled, the lifecycle of the policy doesn't rely on preemption being disabled,
and KVM doesn't actually care which CPU is used to get the max frequency, i.e.
this would technically be "fine" too:

		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
			struct cpufreq_policy *policy;
			int cpu;

			cpu = get_cpu();
			policy = cpufreq_cpu_get(cpu);
			put_cpu();

			if (policy && policy->cpuinfo.max_freq)
				max_tsc_khz = policy->cpuinfo.max_freq;

			if (policy)
				cpufreq_cpu_put(policy);
		}

But given that the code we have today is perfectly readable, I don't see any
reason to switch to __free() given that's it's technically flawed.  So I'm very
strongly inclined to skip this patch and keep things as-is.

