Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFC8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:53:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1961820656
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y05utwkA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1961820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FYoiaEjxr4XU4oqo7zkzgjWtYvHF6OnKFmOKf+MTN0k=; b=Y05utwkA+jWt4LETKshS4qK2s
	UQTHaVd7HcMRQumZS7ZlrSkKM3u2sogg9k96J1CgRyVIKhUhnFWMeXN/x0tx502bLeCm9dO4de9F2
	PtgMSO70jB9SOzi4W24T7ONrwIwxfHF5WWmnn/UyRj+DCiVWEUSJ11RUJ2XPAlyrIp8yp4CWHF9bu
	7JedTsKOcgakqZVGK9/oxoed4rqOxyBsst4FKqpciyYDtSzzecP5x9psjzQT0dHLZIpP0Q/G6lzuC
	VD/XrFWHUgWXjxb9aeNtUA30WiTCIHjdEfDHaQjMuK4LSxtGZ0cr2hfU+DjHLlstFFBps9lmzu5Ee
	KkMxDw3ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyy8Y-0007Sh-Q2; Fri, 24 Jul 2020 13:53:22 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyy8U-0007Qb-Gc; Fri, 24 Jul 2020 13:53:19 +0000
Received: by mail-ed1-f68.google.com with SMTP id z17so7086181edr.9;
 Fri, 24 Jul 2020 06:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wHJM9ZNtQPPVokcpsCbdp5GsMdp3YHUZAH6Xvy0iTKM=;
 b=Gxk+ILqujQ4e7wA2lb+jUq7CkXWXy7FLEZWCRZg8IlnRWpeIP0ZUh4cS4GoWv48y0T
 73abiwnVm6YYECisGGOnKJV8Rt80rzBFJa/ziIWBdoae5JwNd5VOcwpnz1OYUakpeaUx
 CG4WvonhhAYf7jODk0U/S7wsdmSgP+A/N4b3GYS/eLdR6P4GIu4E2S1Ya4A5RW8wbmhY
 YNW7+hyZBQfXGaxKJoptwwlz9D5cBdtilS18I02mTcTDJ84dpXq/M0BavaOA9EdXQzd3
 Rggvm7Kg2835qV1nDXJg8pTXg1yG64SXiar2O7SQReh52nf4sLQv7Ek3GWLLMgEYSYwt
 Xjdw==
X-Gm-Message-State: AOAM5336Plhzorkhc0JPoE76yHSlnd/mMVh62WUK5DsD6vWqI/uSlJv3
 3IXOn2jvUjS4rZJLAH2IBHI=
X-Google-Smtp-Source: ABdhPJxQatp/16zc2FQj9pOk/YrBsNh8emgbUp3CY5xYniVLl6YIl4y8V3SdvTEG1nFeCNjq8TSdOA==
X-Received: by 2002:a50:dacf:: with SMTP id s15mr9448134edj.136.1595598795606; 
 Fri, 24 Jul 2020 06:53:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id x10sm737481ejc.46.2020.07.24.06.53.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 06:53:14 -0700 (PDT)
Date: Fri, 24 Jul 2020 15:53:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 05/29] memory: jz4780-nemc: Do not enable by default
 on every compile test
Message-ID: <20200724135311.GA13472@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-6-krzk@kernel.org>
 <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_095318_571211_448C47E7 
X-CRM114-Status: GOOD (  16.07  )
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

On Fri, Jul 24, 2020 at 03:45:37PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > When compile testing, enable the driver by default only on MIPS
> > architecture.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. New patch
>  @@ -141,7 +141,7 @@ config FSL_IFC
> >
> >  config JZ4780_NEMC
> >         bool "Ingenic JZ4780 SoC NEMC driver"
> > -       default y
> > +       default y if MIPS
> >         depends on MIPS || COMPILE_TEST
> 
> 
> Actually I think this should be 'default MACH_INGENIC',
> and probably also 'depends on MACH_INGENIC || COMPILE_TEST'.

Makes sense, especially for default.

For the depends, there is also MTD_NAND_JZ4780 (depending on
JZ4780_NEMC) which also requires MIPS. I could fix both then.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
