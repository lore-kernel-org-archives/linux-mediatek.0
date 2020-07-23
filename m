Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5C5C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC8BC2086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jm9pm1u0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC8BC2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wiarc3/zB1O6Q3OuxGO1bqs3rLMydqZ863V7sv11gtc=; b=jm9pm1u0vNb9YQLw73O7p6eLH
	JKFiZ9m202EJEJ1S+qJGTMJc1VBVEekCoUzE5abuCHTX2ptFSg+0/cmmbCD6MEcP70XBsXHbSJxOU
	PWIOtjnu0D5E4HcUzlS0WI4SDHJJpphTGpRoki9x3p6p3/30ip+56XAgP8u9QPPEVdk3ZUbbI00J6
	IkjICTciwfq3DCZtHUjLrcBS3TKJcC1oLQRM22HRYq45do3MEEEAW63YVR0kncHS3EQ5uYqupLTWt
	VdT/lDD575X/vClYPukL0c0zf+M4e775u6cU1DV2MLMFb8R1LEC9tUbUVPga8BM/gJNeR84v0o2xD
	vcKAPIbLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyX7t-0000y4-Q8; Thu, 23 Jul 2020 09:02:53 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyX7b-0000pu-4b; Thu, 23 Jul 2020 09:02:38 +0000
Received: by mail-ej1-f65.google.com with SMTP id gg18so2161664ejb.6;
 Thu, 23 Jul 2020 02:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SP17WTfOStR1f/zhDqqAukFagjGeQ43CPtbR6JVcAtM=;
 b=rgQRFWgdEtW2fshRlo+jwJYnspJrvyTJMUlkK3DXLg0Z//GgRnLaN6TqIi6b3h5V2l
 6HEbPs2aGZsEF41CDgX4gjjqXbfy7oy1m6mkypFwy9wjTZkN19LJt9OvjvIfonPef4Ql
 sH43lr6pb2R/ZaH1iSwOBmmKglZnjUDh+FDU1YbbuytfWlO9/XQCui4U1aPktP8IcoMH
 mqQJJjkibEVWir+83DqWYkznj8sVkxGOohJx4UaiK5td5Qp1Eat4ER5X8vMB/n6pUTmw
 miajtXIUeqZesfwV08/B2Q4WRcuDQeBe86qQ1J6hBroKowNp3IlsAYyxb32Qc0o72/A/
 zCwg==
X-Gm-Message-State: AOAM533A1OUoLsoDdcP35XeALb6JUYQ8XfqjH1r2h0CNFWwA/5p7SDPP
 64Nc1NXfuHx06+6YfrZbniQ=
X-Google-Smtp-Source: ABdhPJzZvryybJpj7wOJimQ2Cyt/LNy/AugUNbqr7zzcp389gJSHaS+UZayp1LGVwYwITNeIoG5eTA==
X-Received: by 2002:a17:906:57c5:: with SMTP id
 u5mr3270775ejr.311.1595494953946; 
 Thu, 23 Jul 2020 02:02:33 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id h8sm660427edv.28.2020.07.23.02.02.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 02:02:33 -0700 (PDT)
Date: Thu, 23 Jul 2020 11:02:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
Message-ID: <20200723090230.GB25935@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_050236_273708_F6FA4301 
X-CRM114-Status: GOOD (  21.14  )
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

On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Cast pointer to iomem memory properly to fix sparse warning:
> >
> >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/memory/ti-emif-pm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > index 9c90f815ad3a..6c747c1e98cb 100644
> > --- a/drivers/memory/ti-emif-pm.c
> > +++ b/drivers/memory/ti-emif-pm.c
> > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> >  static int ti_emif_resume(struct device *dev)
> >  {
> >         unsigned long tmp =
> > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> >
> 
> Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?

Won't readl() be enough? Indeed it looks problematic.

> 
> The other accesses in this file don't use MMIO wrappers either but just treat
> it as a pointer. The effect would be the same though.

I think all the reads and writes are with readl() and writel().

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
