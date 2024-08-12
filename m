Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56169C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM8hIk0Il1OoNYTiO69SEs09clvslubSlLyTOMarmXI=; b=l+bBIgVwgrv+t+xH7EpU/Gre0P
	TXdi0+vfpbJeYL93YK3aaP0Hhq+1sYF2L3lXv5oDLYR7UwyxTJZcltzLhh7ZcpFA6+lZI5Ivyot6A
	o+PipCOvE7jRmxAcm2cuwnxTXHX54OedS4RA012mmprWQl+crUF7zdb2cfWBytHedPQWi3EYbQy7p
	emfCNy+yxNuGEWnnefwR/NiB/8i9NZ3JOx9QEs0bskn1D2XCEriwa69yzDbvQ7ZJpofF1rSzsgrxg
	ttQwT/J3lMx/xxXzkYsR9o0vmSTuXQH5xONhXuv8nC66d1KE84STDgkUS++y0UlNUumnpP/AGy4p2
	xo4daiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdN4x-0000000GtFG-3gUD;
	Mon, 12 Aug 2024 04:54:47 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdN4u-0000000GtEX-2Mej
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Aug 2024 04:54:46 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7c3e0a3c444so698333a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 21:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723438483; x=1724043283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mM8hIk0Il1OoNYTiO69SEs09clvslubSlLyTOMarmXI=;
        b=y6UIZfzbuWzZWjcVa6KNyeoQmG4CfA7a7Y/FTV0QyyyDTPB/rrTyxmWxk3ckQqzt1A
         fVIcXbwC+kDgryij6KWHnSH7xuwW8XNELo7QO95OWuhc6ckoSs4Q0xiiHvKmoUmum0+S
         bSvKbiYHZcyPCGgXKm1+oKa+Oz14eCE1rYD2UKrptw1s+9DzRh6pcxa7mO3h4lVnuZm1
         9m2/Clqx8idSo0ptTkEdYv5DmKoXgr29/p53aS1mhInFWCj0u/lx+tmz/TNTT9ewKMQ7
         Lr5U+HgEvCMvHDLI84FBW04f1hLdCBchJyCGpG8xQ3miYktGb06TLggXvNYSkfs0UXIb
         Eluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438483; x=1724043283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM8hIk0Il1OoNYTiO69SEs09clvslubSlLyTOMarmXI=;
        b=pcrS4+HcFgsOu1ZGHV9nV6Q0mIRjTEnhFnPpZnMmK9U3xAb+aP85qOJpygeL1qG/DG
         2eDWOzUC1aP8DgxJW1lGxvPjVjKrSXBFAZJ8wB57K+mFMFX1TZJDswpmkaEWtP921D1Y
         83DSz57sxru9MyyQPBEdmiRrHmKuaPs/VpvFbs59KzCdywo0gYvfEphm+Ry36q3elJrw
         EYmPrO2SIYB6N+KNccvBlOaiko17AzoCC54v3STWgHe7Qd4VwuSypRXweZRpCJe6N9fn
         dvbyozeBL4dkAo1g0j1gTwp+/usMMhaoIVpW1Lwl9mGdvTmKMYwaDJ6SMOgaV8sFhAoo
         PHdw==
X-Forwarded-Encrypted: i=1; AJvYcCV0tMlVzN67huIZfp4zdhcW3GmU8kkxAOIq0kSugh0oLCOBhnj+0qPpQI8jEkgE/a6WWH2fk/hsV/Hm1nlNwgQHYIW8NYLGJ0L/SaX1ljZTugi0
X-Gm-Message-State: AOJu0YyPj63IjBrKZXjuLti++vx86cHmkk3IqPLEybOIS2RLzvvK+4K+
	n4ilP1H4oykniYVH3t2lwBm3SHgpH1gDUk0ui/JaKsWRH0Wl4kFMOBkjsHDnXW8=
X-Google-Smtp-Source: AGHT+IG9Hm7mz2IYGlrpM4SuzTL62Qbzr6jN0CUn18M/7AjFxPVmd28eUBvkwj+lz/oTj1+27nZaOg==
X-Received: by 2002:a17:902:e845:b0:1f9:e2c0:d962 with SMTP id d9443c01a7336-20096baa066mr174277115ad.31.1723438482987;
        Sun, 11 Aug 2024 21:54:42 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9fd0dfsm29338335ad.202.2024.08.11.21.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:54:41 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:24:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ilia Lin <ilia.lin@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel test robot <lkp@intel.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: Fix warning on unused of_device_id tables for
 !CONFIG_OF
Message-ID: <20240812045439.tbdsbdwcxntoafdh@vireshk-i7>
References: <20240809172439.908092-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809172439.908092-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_215444_636513_D6507B94 
X-CRM114-Status: UNSURE (   9.32  )
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

On 09-08-24, 11:24, Rob Herring (Arm) wrote:
> !CONFIG_OF builds cause warnings on unused of_device_id tables. This is
> due to of_match_node() being a macro rather than static inline function.
> Add a __maybe_unused annotation to the of_device_id tables.
> 
> Fixes: c7582ec85342 ("cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408090714.wcrqU6Pk-lkp@intel.com/
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Note that 0-day only reported 1 warning, but x86 W=1 build gave me these
> 4.

Applied. Thanks.

-- 
viresh

