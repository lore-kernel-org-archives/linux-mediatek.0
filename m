Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4367DC8303F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=; b=khxQL+BbyAYbnY1BFuHd1gf6O8
	T9165oM1I5BGYBBKbkkL/BrOrCfs7jlrggy1HsAqFBjCiqyJMAqqLjWj1bPcVIHZFsdiyNki4XNNW
	F3qM8vSbAQbwTUtk0zfN8I4jA79OX6VGhg6Aj/zwVsBDvjab3lkY6KIXKUiBpM3Z/SvjaEExuc1u8
	nSjuoE/I/42DpzyYlOGscav/h1mJ5/+d2tWbSwIuS4kt2PfZFRKTdLe4Rhv8hePihAW/eMwwo7Wtl
	+1wj/nsa+Exc1H7Gsd93qryGAWqXx0WbfRDyvLVFoefaMj42QCoJYMtIh+Tt4z0TuRFh7Tk3B2sJ2
	rfO7bjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursdu-00000004eAH-2koO;
	Fri, 29 Aug 2025 06:31:22 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursZ9-00000004dYf-3RSB
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 06:26:29 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so1420892a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448787; x=1757053587; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=nAcyXqwJMBntI6Up+pQPq6vATl7ABAX/p04NgJfXLHxgYZdgWz+JEumiBtCxYVJ7lh
         5jj8dawUWLRThdT43BKIYuqhmR03RgT+YGuKIqey4WjOlovIJYaAtYBm+v2fFBIaxzf0
         U7I8km0dO26K4d9oyCfxwH71N6pMZQFzb7gbo0FPu7T7RDv8S4md8An6kl/7TQiK4K6q
         1T7Xv37DgirMLBnJPkE/HdoFgK21vst1lhEmOEUVsL9X68ZsRz4ryDd0o311lbikUePf
         n8H90IEUqBheVZp1IFJBRlyf+gkRHPAkmmTH9DL/Zg7qjp79AN0YTXCEn62F/VoKsjMu
         W6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448787; x=1757053587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=i+e6A8gmp9ZkZ3MHcqLAjcG8yBu/UvJxgqTH2rQkmEXRPvoKSMG6cdQC47iCmGaLiW
         jGHW6Afo57hoST74cxtOD3RRig883fekVMY93eHVY5PZ8ULAOjTHlA3dUnXIXWRk8O9x
         LMQMLrRCG6jHbG/m04PmAqSXXo4Lvd5tiY+Tk1FPyh23QIJZ2w7+m8O+Pg4uEW9Uy5Zu
         euKCYml1vljKjRD6LM6epah1cTxIbDrFzDmJ/5vwYsiT6KAYfUELohoFaY9rbP9bC2Nh
         0cH0CMEKCrOwHHU55zocAHbWElhVBW8+zNl7n4QJl7O5aHOb1iukiyODbJQw81Xg/dq7
         mvdw==
X-Forwarded-Encrypted: i=1; AJvYcCXaAbDnrC34rX9LFGb4IjYqsmOF9MPHKTrZcm7d/7UCmgCJkVj0AgGQZdgYKRfVpVtFo5vV6MHCsTmHlvgmLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq8iNVC+gReyfpoPpCa3CPMqSkn9czfYXiWNZcI0FdJXVjoFSo
	Si6xAmB3/8XeKUXpM20w7XneElinCTmy9ore3VUDvzzfXaReDRtBC8kNLQntQsF04h4=
X-Gm-Gg: ASbGncvZwFrn+6VG55M9LI18v5r3S2zdnhEiY8721/JakwwMnAhnc55McwZ0MMGJqTZ
	l+ECfDFtp47EGwSd5I+rm9RUjnbzpuvnJCj5EMa4vBKvCfZ0N5WNYiOgQ6q/Ahc2OFCEs02T5eB
	fWm7ZenDGntEOBhXHKf168yHn3dSVDfKATKlsky9cqtgZHiykA4xsrFvlDjNoasMui1jaAI/2pK
	LPOuA0SjFUbMoRqhtSkCi+jhnTAJjwagpXZW8kB8puHXastw+AOq/r/g/zG7oaGJUIR5WYiqxJS
	NaD3P8OPMqOCqWvy5C9I1pvDOMrkdkMhNFFpxB1gedQYlCYWHkal1OQIkfvCY2/FD6ovDYjjtJw
	HxAUSjSZOROVApygZaYSs8LJ0
X-Google-Smtp-Source: AGHT+IFHYb22k9tJefksk8Ol8WzLcbkUpFNWBPL7w5JQ2Y92t38N6cXrTs0utCYM4huh3xQWCdkxbA==
X-Received: by 2002:a17:90b:57ce:b0:31f:210e:e34a with SMTP id 98e67ed59e1d1-32515eacfddmr32147827a91.8.1756448787009;
        Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd4bd6sm6984417a91.15.2025.08.28.23.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:26:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:56:24 +0530
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
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
 <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
 <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_232627_876889_0040E879 
X-CRM114-Status: GOOD (  14.94  )
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

On 29-08-25, 14:16, Zihuan Zhang wrote:
> Thanks for applying the patch!
> 
> I’ve been thinking further — instead of using __free directly, maybe we
> could introduce a small macro wrapper around it to make the release scope
> more controllable and consistent.
> 
> Link:
> https://lore.kernel.org/all/6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylinos.cn/
> 
> Do you think this would be a better approach, or should we just stick with
> the current use of __free?

Lets keep it simple for now and use __free directly. And keep this
similar with other parts of the kernel.

-- 
viresh

