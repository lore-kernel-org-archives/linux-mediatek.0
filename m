Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBA0C8303F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=; b=4ngWGr6jYHv4pZUJEuvhbjDPYp
	lruJ8BQ6dS9H0oOJcd8ZsDrqE/6LerZ4SQazb72vWzZfujsf+JUQJ+3LzoPzpxZA0Vc1dEOm8OXsz
	6Zfr68kS7sK6E6UksC3uLuJe8wU0dEiQdFsluOQnPbb7Djfem1rJmMpSo4bI8KzIm3bEOyd6W3CoD
	5BSudKKORZMkuqZF2UsKVMd0S3ryZ320dFAHX928KJcqgeud4Snv2zRxHWWsaJU1vrX1hPyVwKylU
	4N98ZYbcGiC08bnqKXpnCiogDmXjbUjbwEXcp0Nh93q0JqtVcogkkLWI7GcWs5oLos81BkBptVzfy
	pPTDi62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursBN-00000004Zw0-1FLx;
	Fri, 29 Aug 2025 06:01:53 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urs9M-00000004Zek-3xNt
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 05:59:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77201f3d389so1886705b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447188; x=1757051988; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=mUKyBdZnihG+GqRi2n9Xj8iLlN5GyrLWqPL+LONpw3WtBJ08YggqLQ+f/cAkGqLhZN
         i9HdKoXU8nq56v8tykpdg+lUHUGwCzYSFL/42i2AyQsuYqMfRiED6h1yUS4ZziL7DdmT
         5lPd9y6GTCsvA+kS+ggmJ9XnVMX8va9CnjJ8+pClRrUlXQ4HeyMN2JlE1x1mOSvgAZww
         OkauEnOPUG40svXP8frwp2CFqKClts0jgzI6TLG6VqAFkzJUKgGOqW76ujS+GNErFScY
         U4BPScng9RLvCdp7YwFriiPWqWPv9VNmZUPIo8qJ7lYG6FhufW6BDCVKCOiIHoVEJy6j
         MCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447188; x=1757051988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=ioItEmu+ZjsURiPCFlp4QkCahYlQvnrF17mhMAFNEsZIZ9VI/bKI/HBGpzWdAdNLQG
         QdoBZJlnIZYE82Do9w0m/tijqsPYCEsC/d+xy42MPA6cch7BmJtAp7so2ZVdhAT/J8jF
         bMmRxEXY1xXEvx0rxpKZ+PEjwW84aJc+StxduTkU0ID1NNaABjihTuoazFa8k7hHscg6
         HlyLqTI967lmfAppWuxtK78+DfNZOKiM8sypHRXHwE5zRXILo98+b9XSLDO7wW542Om1
         1cizZkQsxK8rcXYpY0SFjeuIgWae34GUOL2SZzsPeuCaiMZbw6Q8I5zFQO/2youecI6B
         em1A==
X-Forwarded-Encrypted: i=1; AJvYcCUanqZMXIMfUOvFv3qJEAuzikFgKKMDL2GG6H2RzOkr8MUja+J0xyxPAWGDMTYm5Tp5TRKGEEpDLmvTbqR6Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/SebIDvi8qL394g0jsiOjkCugiD3lsSmwhoZhmV6/DNduZ9jS
	ifERUAcR1lHBoFdlee2XiNZrxK6tsxWz/ILtWHJ3v+zcDTCpLgXyesuTuUFSbGYu3z8=
X-Gm-Gg: ASbGncuFRchO7rgP8XujBDM85G8HyULI2CY8wnkkrix4ErWHDWTCOG884Y8HqQu27oR
	Ysudo+KQ6aE/J+WzEvvgk0KpNiSMI/diBO/BMviFi97k815eMyc4zGkKJBJtCnZpLIMFEyzD59x
	tXvIhftkF2+dkoiHPfrk5MyRrTHawqjMFxg6tGYVF6Cqegrvexp6bHzrfGnMy6gJ3ivqM1qelUK
	Aw3h/JMI2vOiZcpHeuhWxZJvT/IqQuP9Ta0KJwbjyA7G3Yp+kT0zd0VANQnjsapNlEwSFFhk5LT
	oBSo1rorLuJYAdtCT5T4IN8eTuKHRWQ3P99OO+SaBZgkjuTau5s/6ZL+BnPT63SH7K3Wgej9dI6
	iieWvXcqIHppAx4pqjZ0T8TxBUph0o1OKSOQ=
X-Google-Smtp-Source: AGHT+IFsar3WOaSA9RKNM7TPFf9gG0iXTxdUF2CW8raU1SyelgEQswrlDbapLb2rA7PUFkb3M17NCQ==
X-Received: by 2002:a05:6a00:10d5:b0:772:2850:783d with SMTP id d2e1a72fcca58-772285079c4mr3285667b3a.22.1756447188084;
        Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b14c1sm1263485b3a.31.2025.08.28.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:59:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:29:44 +0530
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
Message-ID: <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-5-zhangzihuan@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_225948_986539_5F0AF0F4 
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
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

