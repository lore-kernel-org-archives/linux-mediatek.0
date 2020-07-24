Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84288C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:46:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49897206D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8d1xJ/r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49897206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DhglOyj+sn7v7Wu0ALrNVhxH1J4ZaRlfoQ7kyYHjsEg=; b=d8d1xJ/rJaxRRtApnwYe58a2p
	x3321RRUzjT28WkEn43n0JBrznMnrvOr6oiliaVM10yVkd3co8YosukVDQ/kswlVBYWPLych0Vf6L
	ywD0vG/hJZ5I8LXDzD2tlSmtwWiDPB+KMgZCoDEoLx8V9sBHK50Di8UxNzI/qSXOR8lkJB4R0l2UT
	bS7SHzwU6x9jEWAc/gt8CUxIz6zqi5hYUpxJEI1NoMmqfWsEF0d17VfOgveQp99m1ILcrYgwNqU1q
	/c0dbEdSKKOTiHbBVdSmwZKjaHTvSDCgCpBoGPSG7LYgS/O5dkIUNiXlloR+UZ+RBe4c2IaH7Tt8q
	fCeQT+dVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyy1V-0005KV-3i; Fri, 24 Jul 2020 13:46:05 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyy1R-0005JO-Rn; Fri, 24 Jul 2020 13:46:03 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MuDoR-1kojrV2oCj-00uVyM; Fri, 24 Jul 2020 15:45:56 +0200
Received: by mail-qv1-f52.google.com with SMTP id o2so4103025qvk.6;
 Fri, 24 Jul 2020 06:45:54 -0700 (PDT)
X-Gm-Message-State: AOAM530ipHLQRdRxHulaTTfCKPZyd9vx8IaMeNFenozbc9mRYJtPvzfz
 e3W4WAu6SmH+vXRYuAhp18PsEFU1Baco3540EC8=
X-Google-Smtp-Source: ABdhPJyEqdZ1Ds6rBzMmh7FhmiJq043DLd+gXjlj19IcD1ElA3GGqGC9iWVYViBP8To1mNjzEbIjhOKDCmec66ErY0E=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr9798584qvn.197.1595598353111; 
 Fri, 24 Jul 2020 06:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-6-krzk@kernel.org>
In-Reply-To: <20200724074038.5597-6-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jul 2020 15:45:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
Message-ID: <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
Subject: Re: [PATCH v2 05/29] memory: jz4780-nemc: Do not enable by default on
 every compile test
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:YFAWdktfDekK6hnG8PlM4oTiRS1PozV/6pjHVVhIrv81IaDNbIU
 lom303bkbcs1OHsb+otr8GhFfL3vU+qGQBZElq1KDtM2c4iZZRsDkIo0hSdvTRswcHnjShL
 M2yFQZM6gO4lig/t7SJhpt7DmTmBzPM8od/cnzERiLPK4lLybLstU4jmzoHtOJZKf3g8oMv
 GKHGltJwJG53UDMgkVuKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S8IMR6jl99Q=:9yGT9wwE7NSUKGl/4p+5Yd
 U5GZVGU92aIcfqwzeeX8WhoMyirTyUz7ArlZKLcMClk7sYT01o8jD+/siJH34PstybWEqqBcF
 vH+AvHkeX/nw80+ENq+0KQNKknFUMQjn/W0Fc6MSI6yri1F+dJ2DOQXONlbdcWwgJ+o9KzzXj
 PXEDH2FD4RxHSs960BFLa1cfYmzjzaDDqYvUlUi61+uJakxQU0t+vuQvva103hYV0N+DOR26O
 jblGOmv5skqBSYr1ZtTHgds2NPaqKCw2O5HzQBIk2mzHnFmBVYq7VXkeNzap2fkSHjujTJOCx
 ii+F5uB/iBzO6pGbnKwGTnrJpcqhtcfylppF6E3SuVeAA4FnKALVDsecVRea1EuMB+uClEuPL
 ODfs+IxWXOlRHj3yBva3xJCwn1JIJwEmyt9zTvqGGn/kXyVjiOcpdWz/Z3bVrKHvuKmgT7eeE
 0OnP2UwIgv3XCigoHTf4DOW/1e4BIxPt1pKRZByrZpig+CHIIo/eQAvK0xPFr0bqwHuTHhv0Q
 orNQiiTBB7VwpyeDtGJBOdMeGkSHd8uRHJp/I7xLhLG8re1bd3sQ5AZ7YVHR7ntMR4rK8dIRL
 mbMPmqEJ1rDOM2X0LrKP3SHAMTVbu8KXJcSp5jMsQTX5VE/uBYnZiTyH6mkpHZFX76tOfMlNk
 PGZrwRgNeou6jslURVLhEHl8KmThVsII+faWHxnfQyB/ZNuw108CcEcLaX5xeVOm94kTzwZd7
 CYi/8pnVvGI418HEg9/b4tvbrnxFMb8HQQAyoGujaW6t5I+CRYC2KE+njgOOEhR8uwV4v9d3S
 Bk6vBHyaM4rKdRg7KLxJHs+9L4i42Kdch4hoiH/fat4BiiOmJLQSYKskGOyZRrmbRAigVILAg
 KP99CoT0dSIrv4wCV1VHZlIug8ZwWIe3vijhTxOGX2nDqZVSGR9Dyi4javDPzeKAc8bg5Y9uA
 dQzPqLGJMi6OqoUh+ddQngM/DkuGsh/j05VL4eLkcp6Qb4qopP/gP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_094602_673057_3EB0975F 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> When compile testing, enable the driver by default only on MIPS
> architecture.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. New patch
 @@ -141,7 +141,7 @@ config FSL_IFC
>
>  config JZ4780_NEMC
>         bool "Ingenic JZ4780 SoC NEMC driver"
> -       default y
> +       default y if MIPS
>         depends on MIPS || COMPILE_TEST


Actually I think this should be 'default MACH_INGENIC',
and probably also 'depends on MACH_INGENIC || COMPILE_TEST'.

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
