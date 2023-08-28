Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57502C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 06:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/uI82MJmFahIjQ3JIe4Lm/fff5zAxsypmeNLjmcTDE=; b=LmRcx39skR4tiGmTeHQDEUY6D/
	11ySJ5AQYIh2hBrUfis3lvhikc2Yy2gQudOQgIOiK9tAncjsI8m5M5NQYnn+OeFyBYOTKbsm0Vp+9
	HM0ndVqb+zKSEcMBiO+73lZ+XGwts9iBZO1gfklCRtNyXZowDJOP/Jk4ERcTFNgmJaWMOtFNnYK1l
	u0PREooARwTVHhJe8KAyZaUuJe2qMyUoVkmIRSHRVoFThLkAeG8E8b5t+7S/dZQaDYnCpXRcd6aLH
	5xXOQcqFphZvVRZ3pPA64gPLz26GqVpqjsdv924trljAcRV+5J49xRguM+ytit8+Gj2A6iyb4F2ym
	n+J6iRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVu6-008xkD-3A;
	Mon, 28 Aug 2023 06:39:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVu2-008xjG-2j
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 06:39:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso14989735ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Aug 2023 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693204748; x=1693809548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/uI82MJmFahIjQ3JIe4Lm/fff5zAxsypmeNLjmcTDE=;
        b=s9C+ZlFeazbUHsuLdqVbqTcWGL7inOGxjhgY0n91bMfEi9IyuGAzKL4SJL9Z5PUg02
         oPVBLaPpy6rhMKu550XNryjD4rSMWqHK82cbVr4a0z8aezYDZNTmaVNatr8KKQvMl4tz
         plgS3qt7THxbKDQHp5qtZxzkkZ12wFx+VWGENJNH5/w8sPLV2m5zxjb66OmyMZ1sWs4J
         p/jtA8+39m+eGNnvwEdDoFoWe0R4VubfjzpdvHGKxvV9T0GDqgZRv6K9SdOCM0cjgT8C
         OzDgSnkb6LicIF9U2Yv9QWLxk8l3EeY6beW1xoApfi6RVMtN+ayyckvE+hK9MDYyFiyu
         NOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693204748; x=1693809548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/uI82MJmFahIjQ3JIe4Lm/fff5zAxsypmeNLjmcTDE=;
        b=QjylGNqe/AgLycDA1ASRJ0oGaFrDgZkHAWsmeOss4SiyXNZzQxJY1sV0uxH1+cUe0N
         +ncO1Ea0oVikNGuSwT2eKDZVYqML3rTAAmhrrgQ8lUoVUDSA2IvXWwusc4F58pzJ9RIR
         MMETZ3GporGouY071YK03GeD8m3Ig/r4V68pnybsDj+S1nuzt7XUnZxtvZYT1W4N36hw
         u/JtfxFeiQtfhFW8UyKQ9FZZIxCDIwthN76iIdKQ3EvAqsTe65Euu/lW2u2VVh1EaH6n
         TyfPiBG4ghzcixoWVVeua3ubeIXH/Nak0RkEJ/d045/I2u57wcbXIQDcaGycRbwLNN7p
         +YbA==
X-Gm-Message-State: AOJu0YwKmRfrrjlwGyn7bWqTpWuKIkHGnQFSxsGzK/DEmg8kooQglVV/
	uHQiAUwqFjRAKavysx22gQ4JSA==
X-Google-Smtp-Source: AGHT+IEfX5Ydlmw9kYOWkdoMlgp8wqv8sIE0zKMiecMdmtoZoTVKzBqDjPdf1q5fjId4zhZFW4u3qg==
X-Received: by 2002:a17:902:f814:b0:1bf:6ad7:2286 with SMTP id ix20-20020a170902f81400b001bf6ad72286mr16881098plb.43.1693204748067;
        Sun, 27 Aug 2023 23:39:08 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id z11-20020a170903018b00b001b89b7e208fsm6426112plg.88.2023.08.27.23.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 23:39:07 -0700 (PDT)
Date: Mon, 28 Aug 2023 12:09:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: rafael@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sumitg@nvidia.com,
	sanjayc@nvidia.com, rafael.j.wysocki@intel.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] cpufreq: mediatek: change transition delay for MT8186
Message-ID: <20230828063904.r7huxclehlblkkjx@vireshk-i7>
References: <20230818020616.4748-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818020616.4748-1-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_233910_904420_8A007377 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Mark,

I am not entirely clear by few things in the commit log.

On 18-08-23, 10:06, Mark Tseng wrote:
> For MT8186, it has policy0 and policy6 by different governor thread,so
> it may be call cpufreq->set_target_index() by different core.

Why does this matter ?

> In general
> case, it must check BCPU, LCPU and CCI together then take about 10ms.

BCPU is Big CPU ? LCPU is Little CPU ?

So are you saying that changing the frequency takes roughly 10 ms for
MT8186 ?

> Atfer 44295af5019f this patch, it may call cpufreq_out_of_sync() by
> cpufreq_verify_current_freq() because current frequency is bigger
> than clk_get_rate() ouver 1Mh. By the same time, it may call

s/ouver/over/
s/1Mh/1 MHz/

> cpufreq->set_target_index() again.

Where was it called for the first time ?

> So, the CCI freq may be too lower for
> BCPU cause BCPU kernel panic.

I am not sure how a low frequency causes kernel panic here.

> So, it should change the default transition delay 1ms to 10ms. It can
> promise the next freq setting then governor trigger new freq change.

There are few typos as well here, please fix them.

> Fixes: 44295af5019f ("cpufreq: use correct unit when verify cur freq")

I think you should drop this. The issue at hand may be visible now
after 44295af5019f is applied, but it certainly didn't cause it.

-- 
viresh

