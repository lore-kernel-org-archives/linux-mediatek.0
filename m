Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F935E77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS/zLNoMtbOmAlXztUQxM70zl6Vh6C5NkcTxONG7DqM=; b=azADnVg7Y3hhNpUWKwfz0kyca0
	X5aZBVF9S4bxyRb0zhkqvvc26FBPWAx9QykITiDjyaUirktHQ+2aOnhRRUiMtGdPyC8l9gFq3nw6a
	rss8uj2UaGbaxNI1Fbkvja1ZIbV2GMb9WmF5/pdRGiAq6/ilLI5SQAJ64BOiuvOEanP/0mmo/O6ij
	MG7NFI4F5ndNy5BeqwIBDVr1cTIf0A8Xwz7L0mqZMtpYHCZaATw3+lWE91zSpU5eSI4+R3SXpiDPA
	OJ/fSsoTt+2c0qg2q3Lpjj5ooLtxGAAd0bc047XcpRPwVfv1M8cD/9RvjkizU9BXMlGJq1KYTyxhn
	FTR98azQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJv7-0000000E0Of-0V3o;
	Thu, 16 Jan 2025 07:04:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJtR-0000000E0E0-1qIR
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 07:02:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-219f8263ae0so8716285ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737010937; x=1737615737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS/zLNoMtbOmAlXztUQxM70zl6Vh6C5NkcTxONG7DqM=;
        b=S31+CS+qFweKu8/cDgdeCCQtPNZeMOJEW4ZGzS9THB+f5FoXrCZDb+srQ8OdryrHIT
         9tvSe8HLDympqCZ/+asmTHHky4N0muh1hXGXfhv7MA+ZaE3+oputtGmLTo0D/7WwBi6E
         ezlHw6S/meVAobuiV0qbY99johpB7ks3nqdLsnxlBgtMMLNc38Y28xXbc0s7/ULb/gPv
         oQRGspqr6GSj1Edc/e9oryRR7Rf5XW5SKxHzZzCaViagoCOkhsSm5BXI3uap/OKqVUlD
         iyKC+XSDfnu+QKltEfiMjOWd/kCD7vbLy6I+jYrdS0Pu0vRDDb080qv0Fy2vOyLxdzYX
         DcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737010937; x=1737615737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS/zLNoMtbOmAlXztUQxM70zl6Vh6C5NkcTxONG7DqM=;
        b=ilgYBrTaoVeAIrUDX1R/YO5vyoIZiqDvgWxJboV+gX5td7p28ZJ9ManI5NMMIeJL/O
         VTwyM/onMnxHqFgkYmrwyhuvfUdng2+Q8pj3nofngypR4Ebo+6hfUXhnEtrB9A+VHhpO
         Dh3sbGTvBagsUd26mAQOAJ/wHyhxguXLMknL2HealslzYa/KZTWgMww24+/AeZ6YtptH
         UnG1wkMjl3vcDIMNc5SJrXGE++TomrHCN9q9HEOSitTJkZOFaijnBS0Z4/oXiV3BxtmG
         9mL9oTXZoNrsWXj3M2keOI1+HoiNcBG9G8K9NI1zNuS0wtTLecl5T7QY0o+EEH3I1NTz
         BKtA==
X-Forwarded-Encrypted: i=1; AJvYcCWCyS82tkSr09y03Y798e9ikdhYQqk3XaFF1u9s5JtU7sLhEkZoZbHDuYN8f3yV/nIL5DCYMKoxrZyiBye/3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLSkK+W34Z7Agx1OrOmwLScvaz+/RsL8F924jdMFA0t108pgRE
	uau5vI30HuP7vzOenJ193p+BzgJK/awoapfMk2o1uKc6jvhQXYfpsARyFQ25Lsw=
X-Gm-Gg: ASbGnctiGSLBv+4cBLmnEvR1piWTWGuVzGlY/u+w+bKLSjIdIFYZ4Ch3OAFCIUW07od
	TBiZwRkStlYWJqYrOoAMMNZteXdEmfJKcAACVCsPYyUQz02H5yodh+yi3FLdypgdHwKQlEI/w5/
	AdNbDu8xF5ntzfszsXnp/npSjMcSc2rWuJ9OrNvMdwP/8wJXu2w2ySnvJ07XFiZHliGkUlDPM0S
	9oOxNp2FlrEwdeVzxGje/3nzpUmV7egrALH1XwdkP6PFd93tShtkncfWd4=
X-Google-Smtp-Source: AGHT+IFlzrBcdUY0bs4/8Sj7xVrCBP3SbPdaZMKXeURQBEhXHLuZJom44Aw7mHBQtMkoxQPSA6dA9w==
X-Received: by 2002:aa7:88cc:0:b0:71e:4930:162c with SMTP id d2e1a72fcca58-72d21f4ac63mr45499683b3a.6.1737010936743;
        Wed, 15 Jan 2025 23:02:16 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549322sm10135399b3a.8.2025.01.15.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:02:16 -0800 (PST)
Date: Thu, 16 Jan 2025 12:32:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain
 support
Message-ID: <20250116070214.vdnbyyqnciifngha@vireshk-i7>
References: <20250109131313.32317-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109131313.32317-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_230217_476891_7074E90D 
X-CRM114-Status: GOOD (  12.08  )
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

Ulf,

On 09-01-25, 14:12, Christian Marangi wrote:
> Add Airoha CPU PM Domain support to control frequency and power of CPU
> present on Airoha EN7581 SoC.
> 
> Frequency and power can be controlled with the use of the SMC command by
> passing the performance state. The driver also expose a read-only clock
> that expose the current CPU frequency with SMC command.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v10:
> - Depends on HAVE_ARM_SMCCC
> Changes v9:
> - Fix compile error targetting wrong branch (remove_new change)
> Changes v8:
> - Add this patch
> - Use SMC invoke instead of 1.2

Any inputs on this ?

-- 
viresh

