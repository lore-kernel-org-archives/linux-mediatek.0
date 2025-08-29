Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B1CA0EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=; b=k2lKuYdCXtnmQU6e/CSkDfJIpr
	F5N6X7V99eWHDmBH/azbKPyhIlTS/DBFvB9sW5YiHi1wYmxVA/H/nox/6Qg5M1Ic2dNwb81vtNorO
	4QjqrjweplryFmL9GhZvDVuwaHpfsND3pRVQoaAFUlo3niL8PYaUDvXUb1G6rhP29l9VICRl5hiw4
	6Md+d1zxK7Af2xFGt52V+yCjDRGzZKrvPezVvD41a9S8uCft7vfFafqXdmhbugp1mlIg+2khN2wF0
	Y5XcaTKl/XToGulbEz5KUo3gGH7iebr7gG2gDMQQdV2rWQTFcJc988jcw+U+oulsSXIu3xj7HJeOb
	SaL3NfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursMj-00000004bpK-2Vo6;
	Fri, 29 Aug 2025 06:13:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursDw-00000004aUE-02wo
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 06:04:33 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-327f87275d4so10561a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447471; x=1757052271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=yHCYt3fu2ZG8z3OYSY/NLZl9m2swFMLSHMcNyTcsoDEyZFDkMKvlGu/oW7Py33Q7Rp
         lc0/ZUFgljV8tGvakMoguSR4TKsuIZn580qKOvyAn2swsPeYAxPN4vAP6bBK/o8UMrcJ
         /Cj8MLf5qwOQOkpaEUpu4THxH5wpiHAEptG3kbsJpm/IMngG3jLFUOfNJSWR8v+ceGgv
         H3kCNrpjxa3YTZyG0HdhE5aPJ7daJb74tQw7XAQMHyUBIsEkZNeghay1uZKe5f8nNSty
         wCrg5ToGB6xEMB3bxrOTqhkMcJWXprVx3bJlt2S5WMS5H3pOG9MLvYCJoO8MWwSI3kiv
         gdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447471; x=1757052271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=kmxN9xKbXz/HFb6yh/GKkmZUdl96gFl2YHlw3WFf8QQfucuo9oJ0BVwpIut1mIxxBu
         4SUt6PaBQU7yYMHaRTQHdE6Q5RYPJLGQtlLzakkjQLrrRmRS0zPVf6L9U5vGVRxCO/M8
         4ZlbrflpeMVF9P4p5FkzdgLZUTA4ocZDYkdhwjO//lTQcDUePNBQPh9MuMtwv7CXosTn
         QRrBVEmE9MFzro+C9Ud32AtQoeHGwmgNT61pESgEVKdYe8z9v0RXikiWw3XpGeWzcnw7
         4Yo2svDP4gbzOxVJhmfh2LgmeHbnnThpRV+kRYv44Kw3H2D79UvfKizmUACVQodwV0mK
         yvfg==
X-Forwarded-Encrypted: i=1; AJvYcCUchPJrpZq9kraD55QAD29ki2TznPVgleSNW4KLNPMhWi4JMXt8joXFpcm6bHImqAWf/dpIjGq0HUV6xvgzBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbGDEx6zGt/R4U3xf7vsuQ/L9tgm4FSLYJTmhWFz5swoyVrmc
	VRnbawzXppQGwVsBZl7sJbOkviNq9rXdwbsI1qY0GQV+QH5vqMO5AGOHpdA2MhkF79Y=
X-Gm-Gg: ASbGncv2FGJ6QdBBDuen9hw9jMUs4V1YiWu4yLDhEe/YSv8HnsCM+ZDCSw7BvdhmW//
	ANt/92U/BEtRACRog/ECOesJwKGWmQv3RqyURmWcBR6aL3Z540PekiXzrlehB6+9CZX8Ge3X3O+
	rvGDiZurJEa35UWx+s6qRevRt/1nXpgHcXPc4PWsXNdDcr+nU2ccwI43SfHWxJWjjoM1WCA/lXC
	Bq4I9XYVceO0UO2lztUbiEyB1lZ7onbnRWf1i/c+QUue85m7YOjKV6FVYCCfL+dQ9w2Kj5MLtPf
	YDmCMKbFE36LUr8Okz/d0ZKAYeW/jiB7ZthL45PEusfThN7d1u4cf0/EtBOPMB0IB/C/oQInjEV
	HSjRMNpksWq71g+nl7e/nfERe
X-Google-Smtp-Source: AGHT+IHJm0ouStNvxO+mrh5P3XbGCZbjhM83KCGZEDW+lDzAXYoH2OUF1pt2Xet0QmziR4vBgyThHQ==
X-Received: by 2002:a17:90b:4ec7:b0:31f:42e8:a896 with SMTP id 98e67ed59e1d1-32518b8233amr31504637a91.34.1756447471082;
        Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57ab9esm7074127a91.4.2025.08.28.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:04:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:34:28 +0530
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
Subject: Re: [PATCH v2 05/18] cpufreq: CPPC: Use __free(put_cpufreq_policy)
 for policy reference
Message-ID: <20250829060428.aoo4wlp67celupv5@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-6-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-6-zhangzihuan@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_230432_063436_C69387A2 
X-CRM114-Status: GOOD (  13.18  )
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
>  drivers/cpufreq/cppc_cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

