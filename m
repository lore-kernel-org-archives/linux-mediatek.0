Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E3C433E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A2E2086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTHyjAGX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A2E2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f6OnKxt6L4FwRgkutCTDF+4JIEbGTOE5h+CMKbAoCPY=; b=sTHyjAGXRM4SLJ1RRle6JLTmD
	RrSZxt/t5mAAoJ3aCFDbH5swnT/8esitBrc3eKbi+IMuqmts7Ip1uyFEfrvhd7qOLOmsPjowCAuAL
	wJelUsmFyOMLzvbK82cz68uV8WcusCafKIYkUYbuuDCwYzwLk+5jZx0CkB+74KGaVilnIL2+Bu0E9
	40/bBBDxua6aKpNY7sr6gfW7vq6Q/R4VsLSlaGjAPjKC6cjtMUuTG07OyiNz9dXUJwGNY2aMJ1Qgp
	ztobI+b5jiGsT4S2FNmsb+KrS5s+TbPxLO56XvfmJ5GVf8prBLH+NpxLcF6QcPx+tEsHp+c2jfFDZ
	jKIVgtD2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyY2s-0002lZ-Rq; Thu, 23 Jul 2020 10:01:46 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyY2o-0002kR-HJ; Thu, 23 Jul 2020 10:01:43 +0000
Received: by mail-ed1-f68.google.com with SMTP id b13so1687860edz.7;
 Thu, 23 Jul 2020 03:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hslSkDk2GV4smH9H5xKkxfOrQX9nbu5qQFnRZrSLifU=;
 b=UGTDv//qMW/fnxm5ClGxcmys9448ucN075KKPOc7/HFTPArP8vjA71t+n1Z5UWmaPV
 8EQecLP7zAl3VGXnKY5mxcCBdbxIb+xSrIza1AjswVL6JnLr96wGzkAyypPs39fW/PDS
 GvkqvrW2+zzUVoNaxyxp+nSLmN6+IPN2QtiHWNazHbrLl2CUqqERIUTQE0TWfvMTLJFq
 gCikCzzHknp0ztXIZaViK5018t/9cLygkMbr5W0iRKcqGS3xg2AQiiiDsy4FjQrz6abT
 p/4qOuNhRDpAeUtnjPHwHScu7KQZc/CO++99Ykc8kuYMfToEOt51+5NMsRVP2gnrU4Yu
 yKCA==
X-Gm-Message-State: AOAM530dIV7cQd3sEmR+OWWWWnoOTdXLoWl2Ze32d0ozqm4ATeod1FSK
 Og/ZaBtwae4xf7Slo8Y9z/A=
X-Google-Smtp-Source: ABdhPJyI1dXtFK9c7xFGtDoq/er+m8wTtbHeKjPM3NBbXDh2gegj/He+I6/0VjA5aQ16XwVCcNk6hQ==
X-Received: by 2002:a05:6402:1a42:: with SMTP id
 bf2mr3292640edb.292.1595498500867; 
 Thu, 23 Jul 2020 03:01:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id h24sm1689173ejg.53.2020.07.23.03.01.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 03:01:40 -0700 (PDT)
Date: Thu, 23 Jul 2020 12:01:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
Message-ID: <20200723100136.GB30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
 <20200723090230.GB25935@kozik-lap>
 <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_060142_583274_BDB5C4FE 
X-CRM114-Status: GOOD (  29.01  )
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

On Thu, Jul 23, 2020 at 11:14:02AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 11:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> > > On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > Cast pointer to iomem memory properly to fix sparse warning:
> > > >
> > > >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> > > >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> > > >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > ---
> > > >  drivers/memory/ti-emif-pm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > > > index 9c90f815ad3a..6c747c1e98cb 100644
> > > > --- a/drivers/memory/ti-emif-pm.c
> > > > +++ b/drivers/memory/ti-emif-pm.c
> > > > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> > > >  static int ti_emif_resume(struct device *dev)
> > > >  {
> > > >         unsigned long tmp =
> > > > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > > > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> > > >
> > >
> > > Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?
> >
> > Won't readl() be enough? Indeed it looks problematic.
> 
> readl() won't work on big-endian kernels, since this is a byte comparison.

Ah, right.

> 
> > > The other accesses in this file don't use MMIO wrappers either but just treat
> > > it as a pointer. The effect would be the same though.
> >
> > I think all the reads and writes are with readl() and writel().
> 
> I actually see only one other access:
> 
>         copy_addr = sram_exec_copy(emif_data->sram_pool_code,
>                                    (void *)emif_data->ti_emif_sram_virt,
>                                    &ti_emif_sram, ti_emif_sram_sz);
> 
> and this one ends up in a memcpy() that does not perform any byte
> swapping or barriers.

At least the barrier would come through mutex in sram_exec_copy() and
later spin locks for page table manipulation.

Anyway, I do not have the HW to test the changes or to confirm whether
this is real issue.  I guess the driver author/owner should follow up on
this report.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
