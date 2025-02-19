Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5A6C021AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRInsltroDfnSviS90CirrNU28rUPlNtIher41yQK9w=; b=B7wJMXACRWWeL3SLRi/VFYNPJD
	+bip7MBa1YoA15q6+fAK7w+o+KTaBatDiRtGg60JvSsfiRMAp1DaES420L7yQLWT+sX1p7vZxmqhv
	AN9tTl21n4BwsXDnHQNo7okd92LjVchotsiWPCyj72xaUrlGT+Hrc5gPtdakDn8TLFSDXTt3bQUuI
	P8Y33/4mQH74qaVcEWmkJmeiJltAd80lmKReg0XQDY5EF3OU2bWaZECHH4WuDpqjdKxYzoTdJdCLF
	ZKgnKDfpWSqaD4HLygElMSGF7U5ZpSPlxi8hUrzPVgneJ83UyAWFc3v7wA+uLaQgFE21r+7mmuc+t
	emwoqQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcu5-0000000Awl1-054U;
	Wed, 19 Feb 2025 05:45:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcu2-0000000Awk1-1lf3
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Feb 2025 05:45:47 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so8114215a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Feb 2025 21:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739943945; x=1740548745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRInsltroDfnSviS90CirrNU28rUPlNtIher41yQK9w=;
        b=Yt/WmwDPTDB7MDX6+kSrSTphf+v4iacAfdFhl3LHPjrzGIu6lwx2AA1SM6y5eIgtYR
         V5oqAwGKIl4vVndinF9x8/I+keiPE+5NepKyVU+5fXhvVEEmNCBPtAyFkGdJrHotiU+I
         8MZd8GqThYB1vCmItMPR3/7INYSbO45P5X8tcgwPTdrDIBXcufg5K+jsUK3cl3wEJy6M
         7PNbR/XDBukxafsGCI5SxpqRPW5PPO/8MDbnmBCjO5rnfiT8RdnU6L/uQl9tqGpbqfnW
         erpqAwdNdbQhLRLv1FBkkOC5lg4rFcaxHOHSfaGeAqZ1gSMkYidGKbyQ0dvHG6n5JUaI
         +YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739943945; x=1740548745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRInsltroDfnSviS90CirrNU28rUPlNtIher41yQK9w=;
        b=gFMO3Kwcy67LYQ52Lyrq/sZATMa49PBOC+YMv8ecfa6+mHMMfxYX86zKK38/r8tMeF
         gNvGGiuv8PXUohzpXQHvjKIeVx/iI5od+VuhzS/4KeEcKHizimehFHOev9GdvmPqmPMJ
         wdR3oQm5mfw+0B30DQRFaVBaqp85m5gIx2wh/7D8TnPyJWzwwHGo6brYY30t3BFRoU8R
         rHoFW/v5kICu/muoD1kWhvEFoIBqSVa5fpPPYxAgbROkgRQmgAsIzfJwyyJpJ2gAQ8WV
         vwPBjWuyZepymtSkeotB68fz2nfzkRIRvxrknPZdeiM6yBXRAlroHxJSwWN22ZOPKSQY
         M45g==
X-Forwarded-Encrypted: i=1; AJvYcCUc0xdfdFnKamBrVWzxRlFyBtjaF6+VD2okVHLn9gZBIDIcX3SOG8ZTTSKq+u/ndBBmghvbo6qb0v/Q4SWxqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC9ID9IRTuMtL5BziuqaGu841SETd0Dl4qYTKwS8UOx6EwOFua
	Z1kmGzsl22BZ3VgU9ePlacX6kkwhR7gLLqpnB+qTSWmBaKAH08XcSzXI/Wl8uRY=
X-Gm-Gg: ASbGncuLVVyGkQKXB32NQhS5XJPB7InfjTcLOvDT9ofXD3fEil1zqvfVXBsTs6TDBJW
	G7ZJ4yXVURruxK9WvQyPIpyQYlfgy2/541xO1EYukJuKirVRb8XLFA9/z/TyFi/HT0RL/HL1wD7
	w8sgvrgsz5K/X+4lNf6sSKAyOgqqRwfeQMMGqmuMJqA79w6h2M2FfG6MOYrrONBuGLhkHvSRMSI
	ferdOwKKjgPZor0N2GHApRNkNJZ0id0u52FESk3bLBigQl00P4R1hkqpgjaX0hVM1UEzBhQvose
	BnX4YVb1oflcZS2fEw==
X-Google-Smtp-Source: AGHT+IFDzea3Pp7rZ2dMCaYzxs9nrys/cZznA9NmmSQBwBK5duGLQELrvaTllazoUHAnVNqWR3kPyQ==
X-Received: by 2002:a17:90b:2fc3:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2fc40f21c49mr24036277a91.19.1739943945616;
        Tue, 18 Feb 2025 21:45:45 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf9757365sm13106540a91.0.2025.02.18.21.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:45:45 -0800 (PST)
Date: Wed, 19 Feb 2025 11:15:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 2/3] cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION
 flag
Message-ID: <20250219054543.4xt4tixsauwoqpst@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_214546_461247_99E825C0 
X-CRM114-Status: GOOD (  10.19  )
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

On 14-02-25, 15:43, Mark Tseng wrote:
> Add CPUFREQ_ASYNC_NOTIFICATION flages for cpufreq policy because some of
> process will get CPU frequency by cpufreq sysfs node. It may get wrong
> frequency then call cpufreq_out_of_sync() to fixed frequency.

That's not why CPUFREQ_ASYNC_NOTIFICATION is used. It is used only for the cases
where the target()/target_index() callback defers the work to some other entity
(like a workqueue) and it is not guaranteed that the frequency will be changed
before these helpers return.

I don't think your patch is required.

-- 
viresh

