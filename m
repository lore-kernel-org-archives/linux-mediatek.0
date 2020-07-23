Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E494C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:52:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D01AA2086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cmt1nuM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D01AA2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NnmL+NzKgqKfNCoB0SJ+frChLHYi/uBd6cwVfLF9c+o=; b=cmt1nuM+NKkkfPfykVNvtEFBu
	/7RUmYV5h92X44R0cw0UHSqgluZlS3CaA53yvnspK/yv5Nn52iwZsOib/gXuSsirEU+lwH5YvD6N4
	nihxj7Mkc9Xxn3hplUr0ejOzW7WhQ8JobrSyHFVejz4RwKymxgkZGkFDB4uFVspBvqwqWtDe/O0I1
	y8iLFNR/L2Ppo69+rZYzc20AvX5yYnYvDPNY2KoV709vaO/R74RGfcVfp0ceGtpYj2rZo3krEIWse
	P/KhtrJr4jMJh9in5XBnmT2TG+2xaze/Yf2wfv2jeUMGhVZqsEQhxqMUu+Ime76wApe+sTLN0oRXW
	qMX7Tmgjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXti-0001ho-JS; Thu, 23 Jul 2020 09:52:18 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXte-0001gk-JR; Thu, 23 Jul 2020 09:52:15 +0000
Received: by mail-ej1-f68.google.com with SMTP id ga4so5675667ejb.11;
 Thu, 23 Jul 2020 02:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=puQQ+kEDvp4d2ixkulEX0wUmGQuAZ6n3qHTJVU/5Rzc=;
 b=EBn7cNz9TC//QL0mldmPioHfZm/A4vF5lhdDUQauLOYUJa+9K9yfpIJZuJ2cQcEu7F
 fGI9gpYMfzUm4OdsRQMsGsg9iKAkAToDAE3Q2VJDAR+fNU22iapyBV+luZct0YwWehTi
 lLfHUYnMTNtIEVtQuzO+iXcIMXvuzZQTjod0gx/8b86BeqcRh021OQQOcihqxVj4KEM8
 Fyu9BOsm7NEOvLdF0F7GkjaAgAB0y5rQ7NDwr70+Wl4ImgwaXie5gOROQeY3Lmeksxh4
 SqoBGtLoS/KRTpotDS9XVELCRajBt0awyGhN1qvcchqDryplkjpWLfNUIkd7qKb+SAN1
 lGdg==
X-Gm-Message-State: AOAM530qnCc4WPDnO2/zMDfYFQJA7OSUhhODIcfrQzoNz4r6OvIHD2In
 Eampii/jQKOhAm47jIKvuPU=
X-Google-Smtp-Source: ABdhPJyu48ABbekwvtALO2JO+gDw0IjhchbBRuiUgpHvsnkMl605uS9uQX1F3s0EVoraFKz+/aPreg==
X-Received: by 2002:a17:906:d9d9:: with SMTP id
 qk25mr3760460ejb.448.1595497933238; 
 Thu, 23 Jul 2020 02:52:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id bn7sm1713556ejb.100.2020.07.23.02.52.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 02:52:12 -0700 (PDT)
Date: Thu, 23 Jul 2020 11:52:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
Message-ID: <20200723095209.GA30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_055214_714322_D40138BD 
X-CRM114-Status: GOOD (  25.66  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
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

On Thu, Jul 23, 2020 at 11:31:02AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Dear All,
> >
> > The drivers/memory directory contains generic code (of_memory.c) and a
> > bunch of drivers.  Changes to generic code were coming usually through
> > different trees with the driver code.
> >
> > Over last days, memory drivers grew in numbers but not necessarily in
> > quality.  They lacked compile testing and code cleanup.  Also lacked
> > maintainer.
> >
> > I would be happy to take care about this part.
> >
> > If there are no objections, the patches could go either to Linus or to
> > arm-soc (most of drivers are ARM specific).
> >
> > Driver-specific changes in the patchset were only compile-tested. Tests
> > are welcome. The generic code was tested on ARMv7 Exynos based boards
> > with a exynos5422-dmc memory controller driver.
> 
> Overall this looks great, I had a look through the patches and commented
> on the few things that seemed slightly odd though harmless.
> 
> Thanks for picking up the subsystem. How do you want to proceed
> in the long run? I suppose you can send a pull request to soc@kernel.org
> to be picked up for the coming merge window as the normal way, since
> you are not yet listed as the maintained until the end of the series.
> 
> Afterwards you could either send the pull requests to Linus directly,
> or send them to the soc team (or to Greg) as well, the way we handle
> a couple of other subsystems like drivers/reset and drivers/tee that
> usually only have a handful of patches per release.

Most of the drivers are for ARM architecture so arm-soc seems like the
way to do it.  However BT1_L2_CTL and JZ4780_NEMC are MIPS specific and
maybe more would come in the future.  Are you fine taking them as well?

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
