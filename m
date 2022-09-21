Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98199ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbP07g1noMtBwAovb+f0lmPWi5E4lDqv0e8jXEcwP6s=; b=eYJ+stRTTxADqRE+S1WC4UVd+3
	/6fGgd9rD1tOfEUHOpUx/Hq+rDTRccvK+lE9x544OFbKYrP0mI4yRSIBa+49+Q+y9Igj3+Gl8pD3D
	kZ/kyPInMO2dLuziDPKgVFKm2jR5ztkA4YlnWcS50TWZ1rDUHzaYeRjpx5HBa5Sqi6PLAt83YSmU9
	sOIoS1MLigxyOGdkF3y1oDnAcUHV3aKN8Asq6wn9bp5KDG9X48be4f6WXEoiifN88qWp2yJmr6+e2
	Yw7QSshDbTmVcOQr9LDMXYTQfbBfZM9aIkL/cI0fs+TnzxKQPjY45K5ZnMC9mSUGuWbKVXJY1CZt7
	3m2nmo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oau1N-009XjM-T0; Wed, 21 Sep 2022 07:19:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oau0t-009XVu-Hp
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 07:19:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id c24so4788058plo.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=mbP07g1noMtBwAovb+f0lmPWi5E4lDqv0e8jXEcwP6s=;
        b=oQbEPWxAcGvQuj9r0zyTmcLJVaJrtHFahYYDBAVBgeb4unPu9qypUBqPWBsRRYPyT+
         XslA0Pr4C39y/TT04dqc4q8GwXoB3QMXnc++pX+TS6Kr9B7TejCZzLO1VTCpbXuZemEk
         HBTUGHu4LwPimDuPK/IeEuVhqP9ir2/fDHIrJwSBtaMocBm/WhL2B2jAHUdpQ5xifvJX
         Nk3iLbIOwQs/cP3V27vT0TZGMv0XT29YdV4lNlQM/tIQP+3YDiA5TJMIeK73CyUL15Gt
         mltNWdNbJ3eQHdolr2RGjdocrPblT4MHt6xkrEyRTgMeflRwQwdauJBikrO1qqy9Qg+F
         Rv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=mbP07g1noMtBwAovb+f0lmPWi5E4lDqv0e8jXEcwP6s=;
        b=k7jmdn3WDrhmMpxuKqYTe6u75V3gojq2T6wTsTAyebJaRQPaTb6SUUEaQa/6a3WNCv
         gW7k1+kJKtbRZIp69fQLVH4m5wcPKwORzup5XK0iAU1VQCllQitAS4SUPLzdVoIOzu7k
         Ht4d2Ql2/gn1L4RWR+3AFA5jlEAe9e8+Mie4ShLEmb8nXpKnNXeDHIYXxslEgSvYk9XJ
         2jgUETnBc+ziNlzS6tjtZi7aXq/UxJMatFPha7N28KBwabwFQVo2O6Z87Gn3/BbLYfaa
         JU/Nh8GpTzetF5Nau5Ogv2MM9IZ7soIBydTdIXadrRM3K95/wQiugb2PsrVV6CceVBp+
         w/tQ==
X-Gm-Message-State: ACrzQf1/NIpQYVqj+v9X/ReGEPQfhbSp98EixFo34CrMvUC+uDKpuB+B
	YFe7C0W7iR5gxD+ZsSPlHhxwww==
X-Google-Smtp-Source: AMsMyM6s2EteCzlJrPISAF0j3JIEyARdyuJl1a5kIdKFotyiQw8rJN1Kx6iEB4hdoanME+dtrQjWqA==
X-Received: by 2002:a17:902:c941:b0:177:e69a:a517 with SMTP id i1-20020a170902c94100b00177e69aa517mr3413184pla.144.1663744756561;
        Wed, 21 Sep 2022 00:19:16 -0700 (PDT)
Received: from localhost ([122.171.20.238])
        by smtp.gmail.com with ESMTPSA id c10-20020a170903234a00b001743ba85d39sm1212084plh.110.2022.09.21.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:19:15 -0700 (PDT)
Date: Wed, 21 Sep 2022 12:49:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: jia-wei.chang@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, andrew-sh.cheng@mediatek.com,
	rex-bc.chen@mediatek.com, nfraprado@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Fix KP and lockups on proc/sram
 regulators error
Message-ID: <20220921071913.p7kwsjnnuad2jgvk@vireshk-i7>
References: <20220909093724.40078-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909093724.40078-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_001919_662024_1A0FA12A 
X-CRM114-Status: GOOD (  15.86  )
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

Jia, do you want to reply to this thread as the Fixes patch was added
by you ?

On 09-09-22, 11:37, AngeloGioacchino Del Regno wrote:
> Function regulator_get_optional() returns a negative error number on
> any kind of regulator_get() failure: failing to check for that in the
> teardown path will lead to a kernel panic due to a call to function
> regulator_disable().

I don't see how this can happen. The code does check if the regulators
are enabled earlier or not.

> Besides that, the "proc" regulator does actually provide power to the
> CPU cluster(s): disabling it will produce a lockup on at least some
> SoCs, such as MT8173.

We are just dropping the count that we increased earlier, how will
that disable the regulator which was already enabled ?

> That consideration is also valid for the "sram" regulator, providing
> power to the CPU caches instead, present on some other SoCs, such as
> MT8183, MT8186 (and others).
> 
> Resolve both situations and by simply removing the entire faulty
> branches responsible for disabling the aforementioned regulators if
> enabled, keeping in mind that these are enabled (and left enabled)
> by the bootloader before booting the kernel.

This looks fishy, we just keep on increasing the ref count of the
regulator but never take it down.

-- 
viresh

