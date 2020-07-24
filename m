Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAD6C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9EC20737
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hAVW7WGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E9EC20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5EQdO52OfHTFDEmpf9mULrs9XO/usr3b4yvz6HUpK4=; b=hAVW7WGPlAtLw0n9ehVOM3x0N
	i+amf0G0cPGgEPQoPixTVc8jf7qHI35DXeCpiUp/mgOisALMvzop8/MPII0X8+cTubq0kjhaH4RWy
	oMTMMYQF7IDjEvlgHDUvmyT4RKSxBRuSAM6/Dd7dKUeIdPa1MDmq5kde2GMrpTnZb07p1qCN36kSN
	Jt2NRs8r5dqUFs2PulXyhBHdoy3g8BVLegP5wBqtSBBjbiSQykDnqPPtzVu0iSINORGrWAnN+Nm8n
	tBOyzhqWhE7Xb66gMKZKOzn8nkp16csCfYh5sZsAiSuaP1/Yyt9jGV00QGTWNGg2NUorlf8WvnzvO
	3fByPGoRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyy6l-0006yW-Fw; Fri, 24 Jul 2020 13:51:31 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyy6h-0006wg-Td; Fri, 24 Jul 2020 13:51:29 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MHoZM-1k3tWf3wIA-00Eskt; Fri, 24 Jul 2020 15:51:24 +0200
Received: by mail-qk1-f178.google.com with SMTP id x69so8654283qkb.1;
 Fri, 24 Jul 2020 06:51:21 -0700 (PDT)
X-Gm-Message-State: AOAM532ENFPHM57jJm6j0/s+xv396ZWQ+v8VcU01LTRGzF7Qd9JdqN9R
 f9sbFP7iX4wtmVwgVNqciLFp+G4v4thVrtxDhuM=
X-Google-Smtp-Source: ABdhPJxjGVar32Mo4zyo7czqW6vHPwVJvr9ZZ1aqSE80mAP36DQF09IVdxgsaflYW8FpBItG+23osrBEpNeTs3oF6bs=
X-Received: by 2002:a05:620a:1654:: with SMTP id
 c20mr10549815qko.138.1595598680633; 
 Fri, 24 Jul 2020 06:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200724074038.5597-1-krzk@kernel.org>
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jul 2020 15:51:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
Message-ID: <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
Subject: Re: [PATCH v2 00/29] *memory: Cleanup, improve and compile test
 memory drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:p9p18c+YneoaYA+/6clvhYtlWgCNyp9O3LqaKyeXfGcgwHDZdFp
 1zeXsTE1ALlmGR6OSqmbJ2pxr/Cuvtx730gDN+uLZDWE+ZOLbZvRObxkxN/AOlZuJrpLLpH
 gHvP7bKNu15eliorCA81PBml5XtExWaxsXUr+ni5VpUfaN4s7aQ7vcu6hcJdo/Ytj9VYpfx
 QVon7EXMn09S1NMr650rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f6yAx6YqLrg=:xjfetHUPauWmX6QqeRuMzB
 5ga5s7q9vMlwePWw8MBxfKYoRaSLBFCCQC8nsPYe6q79Y4E6aEaC1K+v+HiIp0/wuCcYM+Ou5
 yDCb9eUmmtl+hC4osMJE8SEOGMucFR4kJFuFcQ98os+USXm7gX60/kbO8c5S8aLXuPBaRn/ll
 cGRHBygwbo7YhYzUWlDe8KxIkrP1ZN3uYYgQIlVYyuiVD7PLDu09x2eSgiCOVZmcq4qeqPVl6
 esNdQkN73Nu5zaoqW+XazuR9S1JmRWTcoztqcIm09qXzQM+ZiqpdYlKvu39JWIwXDCy6K7jts
 zNEK6jbGiNafCBOCGZPj9hjwDuIwl7o7mY8gj1d7Jn8yZh/bTDQZcvOVgkVr2KAaSi0D3RZGw
 GL6aGxpR23xsZIjD0i86RdsBSEgSYVTXFIlmOO3BRO24oYfAuF6oTmIYY9z1XRiI7EWsV3iua
 0zO3zqHSvtkDHxdT2B8X/9R+VgX7dlLHtgE4VdkE+BvzhQ63QZ6H/mbRTDLIdsgYEGabhw/hI
 4PWp/2y/z6gVEo34QPHWUKQiyx4DK5BSXohtHrowf58Ie52RJSczNQvgXyyBF8Na8LvtTAaHC
 TTh5apsa6RFqn7+7Fc93I4LcgAB6X2x6VMmuV5I87pTV+b+fCLoyqf3O4Aj2CI2zt4YSuO/Z5
 nViPTvHPye5F9tB68wS2xKusyGqGXAMa3E8ZTYJd0MiEjhdCTwwrG7RbO1BWyA+2t6Oga7OVh
 V50y5+E6Yqi7u5/clHm2nGKphLj+2tE0J7kUARMyJoPIu7/i/Gva4d/cTatVVcoiLcVF5krV7
 S28WuRp3HZgjb59i4oibwHqy/lgZ/glm9kLer93+QT0yYzcZjGTIrsNO20zuX5EcdJCMFJt3F
 xmFwxlQ5GdtsPyqitfiBAniXPGIcK2uGLHd7/GpeifJzNb1pttu2UAt0uzDujiI6zvkJsmVD4
 yA/C856y4B/bEVMVc/3lNVbEXomVONpft20Sp6uqkVYksAJDloOub
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_095128_178041_3555BAD0 
X-CRM114-Status: GOOD (  18.57  )
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
> Dear All,
>
> Changes since v1:
> 1. Few new patches,
> 2. Please see individual logs (per patch).
>
>
> The drivers/memory directory contains generic code (of_memory.c) and a
> bunch of drivers.  Changes to generic code were coming usually through
> different trees with the driver code.
>
> Over last days, memory drivers grew in numbers but not necessarily in
> quality.  They lacked compile testing and code cleanup.  Also lacked
> maintainer.
>
> I would be happy to take care about this part.
>
> If there are no objections, I will collect the patches and push them
> through arm-soc maintainers.
>
> Driver-specific changes in the patchset were only compile-tested. Tests
> are welcome. The generic code was tested on ARMv7 Exynos based boards
> with a exynos5422-dmc memory controller driver.

Looks all good. Can you send a pull request for the patches that you don't
expect to need testing for, while you still wait for more feedback on the
others?

As the merge window (and my vacation) is getting closer, I would like to
have most of the patches for v5.9 queued up.

       Arnd

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
