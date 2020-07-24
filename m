Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EB3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:04:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C784C2065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DWn5Z+W3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C784C2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EYgi1bf2eOnGycmrUyjmkkfmaDSVQHsuFJrb1Jm7pfs=; b=DWn5Z+W3XPlTn85JxSyyNUJv7
	dhtMZyJ2cEYVIW9U1emzGbkaak/F6VsXOC28zQql1MDLC4qKBTM1beUc+0J6hbuIjO2fMm0WnMOKN
	LHew+R1jHcgiuxBo8F+6/dshhgXvTtPjdzCBQSoKkiOWCIVVfhe0Zz/5onCjB/xGfHLy8QWNClRa6
	l1Ge/aTvNqiyRJhpe2CodfpaQ3N16mGGpLX4AJpqo9+Y8pErokgnTD6dLkGdElQv+8tc5scf76dTS
	LJNTTsflv6WtnhxVgWFDGL3VgYxfFA8xAJTSv7xUN6hllJaa1h34ZdoyfLxZ5RwMSYFLrw93+CvrU
	os8mZT7/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyIo-000243-RW; Fri, 24 Jul 2020 14:03:58 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyIk-00022O-5I; Fri, 24 Jul 2020 14:03:55 +0000
Received: by mail-ed1-f66.google.com with SMTP id by13so7092360edb.11;
 Fri, 24 Jul 2020 07:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TpZJ/ISFXgu5jBP5FbghkLZJiBtFOhQ1zwiBpuz8Qz4=;
 b=GKehfg3AImW7np5pczxUmHT2YtvSCXLoVeW30cQvQ4q2Yi7TjfLowW0xBI8ez6Xh17
 v/YOpQTB6CvFHuJ9qZFqPrx6VzyuZwSU+S2dR65Ri3W30a70svDMQ9PHRBJQoNDAcygZ
 eqATHiuOcbZyudmc2F6thjlD2OykKm6kBiRT+0D+nJdXCJ+8+52e7zQG2hztpQwDJSap
 LmNOsqO9K+zhmnwgT7uDh7XMv9/AY07hgwtMJ8xJzP8aIAMdGpU9SAiMAGBzDFOsv5ls
 V9G9J7BVlhfeid/nlzFxE13bHzpAD/SKaohoWJvZ/gLQhwFEtOtTyIlb6fIuXrtUHPUP
 BG5Q==
X-Gm-Message-State: AOAM533ozkIc7fNffpkcA/txR9LccfBrM+xYqb6kMBXXC2K9R6gV6kLc
 zjA04EhbrjfOo1n63j+EdNo=
X-Google-Smtp-Source: ABdhPJwl2mU8KmEpK8AFkahBSmMJ4Kn3RsrN9Ktb6p4HbAcUPjkoroNdJBTxS8QkKijbtd+6pGmUwg==
X-Received: by 2002:a50:ed15:: with SMTP id j21mr9386366eds.246.1595599429024; 
 Fri, 24 Jul 2020 07:03:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id o17sm710946ejb.105.2020.07.24.07.03.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:03:48 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:03:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/29] *memory: Cleanup, improve and compile test
 memory drivers
Message-ID: <20200724140345.GB13472@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_100354_233972_F1E5CB92 
X-CRM114-Status: GOOD (  22.28  )
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

On Fri, Jul 24, 2020 at 03:51:04PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Dear All,
> >
> > Changes since v1:
> > 1. Few new patches,
> > 2. Please see individual logs (per patch).
> >
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
> > If there are no objections, I will collect the patches and push them
> > through arm-soc maintainers.
> >
> > Driver-specific changes in the patchset were only compile-tested. Tests
> > are welcome. The generic code was tested on ARMv7 Exynos based boards
> > with a exynos5422-dmc memory controller driver.
> 
> Looks all good. Can you send a pull request for the patches that you don't
> expect to need testing for, while you still wait for more feedback on the
> others?
> 
> As the merge window (and my vacation) is getting closer, I would like to
> have most of the patches for v5.9 queued up.

Sure, I'll prepare a pull.

Thanks!

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
