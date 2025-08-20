Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2104CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 04:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61TbShyZGmEFoOQMK1FLzfzRsfZunqsPJaTJZw2MfRg=; b=opISSi9+IlRo1WCyy8vO2iHJEs
	jbmfUzauDjdXjyyQgGrgT/c8t0qGw0Nb8UVfz4SUqNhhT3vsqtkPQyTEPG3KCz21ILzpiJfZX5OBL
	v4lqPRjK6fGwwiyhPHKPfqORyxn9k3oq+3FwThLyb+98AoYIlyQM/x5BfnKWeerrTA0SdkYCknnHu
	mND5jstcKSbDZEynvK0OGuP5ACYx34GaHxDxJ60pyf5ZFYs5rvrHEBAyTx5Pl06R1ARjqvg8pH1NW
	c+mG/9xyB/uhH4Zj1lnq+nn1mnF0/moBjI8RXXmIcJJ/bkmVLPqSVNrqkh+jp6mrTEIOi6Dawfi+b
	YbBKQRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoa6i-0000000CKXV-1HTL;
	Wed, 20 Aug 2025 04:07:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoa6g-0000000CKWq-1HUx
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 04:07:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-245f3784edcso818355ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Aug 2025 21:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755662845; x=1756267645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61TbShyZGmEFoOQMK1FLzfzRsfZunqsPJaTJZw2MfRg=;
        b=N7g2ofJ17FZ1An9DZHB5hKfypfudl08iI3agEndtApXYefcmNvb+u6kkhldEaFNHP6
         VxjVec9YQmpEif8kPyyGGG7K0tpZ5edCCVsBMPiB0XkiMf3bpILeFsPX+/FylWVm5EzR
         ABM07XtKtZXhDo3g3oxB4FQFOoHqAdSpVHmOTEpSpaeOAfwZgedikqhHNF1MPBm6bUsJ
         oQODGqj0sgPfZ4GBdiiXUA7oMyr8ooV9rn57LNkzm8Uq8g2xlhJiVMT4yrPEiiMHi9DK
         0ibcQUm8YQofgzYMkqJprMB8efAe/Uu6KGFcGEaHnuJH1S6fqLYEeCYVMZO/UIyQeMhZ
         eiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755662845; x=1756267645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61TbShyZGmEFoOQMK1FLzfzRsfZunqsPJaTJZw2MfRg=;
        b=oAGy+u3sOxqXqzhyeum89bbHlGfm4vIm+QR6E/U2tW9gVrwp0T83IYCDZK5LL3JgnN
         TuWdVjMLsLKiRsWOKse4Y2JGsD/YRKOkbO28789Y/jfY/a7WYXPiopAZ6wLHocVtXJQi
         RdKOhlI9yeaGrzN6wwac/cMfAfQ6/i8m4ODHC7Du3v4EhmJyK+mxW8gPv/172/SdgD9o
         VfJfRzCS6cby/G0/LR7scu2anA0NS53suvoOI+1mIZnGMJSSzH9G3cGDfj7Ng/n7qA2C
         pEJcIpoucoqujwugrfj2RUnPXTWOlColg29QQdDkWOW5skdCuAH1kraM5CxulbcjXEFv
         eCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsIkSaIR1/kjgxo/VxRgr08YB1dRHXPdSdNby9pCAsU6EBY1t/FyyMaYvsxdFP+RPUdtIgduH9ba/8zVXROw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+SV8Y+SUlmvrOASjEd+8Tb74PFU+7F8+g+eXxkmtztxAeUzBX
	sLX75cZhBCzajL5RYfwkp34sw4BpPURwJnU9Kv199dxvWhwBquimZ/BNzyg0492p7JM=
X-Gm-Gg: ASbGncuhZVu2XIkqORQcaznOHFANJezs3kHhBKU7e/ck50icabYV9tviuxmtLcE6hfA
	OQm7k5KPVs4UIcMDzrKrrg4H6nxYNtcolig1zqt/fClNWoT4JQBDIJ82tZO3AXy5hlVsGje59a5
	BTvsNx4FmV5S3lScwyK0pNeUSCuSAkX4vc5MoAKnJkGQoqb6MfuZA5cHBVlMVTTlQSGFFtx48od
	yVCtakaUKzO5Y8DdlBUdjkKA1ExH378ogyjNZdhzamcf5DHjAsAjlHXMo2iPs9XQEK2WJLCxOyk
	28u4JaQzMzJdndmerj01ugMF+nE9pfqAnHcd/d6xpvAQKNOGkvY5ICxYyr0XJ8UKTz3EhaDqRA6
	3mo1bVzh1uZ3dPq+mWMlzY/2/
X-Google-Smtp-Source: AGHT+IEF8aL/OwClRkLK03kIO5ZYX/8TW6kXe9vwkD7+3xAbrkceAzbVpiAbQQ6RgDwBHRsjj6oH3Q==
X-Received: by 2002:a17:903:1ce:b0:242:29e1:38f0 with SMTP id d9443c01a7336-245ef14b770mr19823785ad.24.1755662845050;
        Tue, 19 Aug 2025 21:07:25 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4f3bfesm12339785ad.119.2025.08.19.21.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 21:07:24 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:37:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek-hw: don't use error path on NULL fdvfs
Message-ID: <20250820040722.fdf2544cdz6k6dcq@vireshk-i7>
References: <20250819-mt8196-cpufreq-fix-v1-1-adb60a3082dc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-mt8196-cpufreq-fix-v1-1-adb60a3082dc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_210726_333662_E146CDFE 
X-CRM114-Status: GOOD (  14.95  )
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

On 19-08-25, 13:21, Nicolas Frattaroli wrote:
> The IS_ERR_OR_NULL check for priv->fdvfs is inappropriate, and should be
> an IS_ERR check instead, as a NULL value here would propagate it to
> PTR_ERR.
> 
> In practice, there is no problem here, as devm_of_iomap cannot return
> NULL in any circumstance. However, it causes a Smatch static checker
> warning.
> 
> Fix the warning by changing the check from IS_ERR_OR_NULL to IS_ERR.
> 
> Fixes: 32e0d669f3ac ("cpufreq: mediatek-hw: Add support for MT8196")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-pm/aKQubSEXH1TXQpnR@stanley.mountain/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

