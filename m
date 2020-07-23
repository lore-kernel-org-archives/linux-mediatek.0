Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC26C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AB622BEF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zPuInXA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84AB622BEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ltm1E1Vvge+uxldphq5wsNc2sKn9md1nCIA+3gPneRM=; b=zPuInXA4Ycnrv3LHo0TKwtYnk
	gjsOcTqaqJ0qxRV/D/jEGEfoluFEKiWVtHyfjW5R6d+tbT/jeqoaFgNEKrFqD6W+uqtOue2s3v3/H
	s+IqEiAcILU6jR61V6CGQSO/fVC0XQx08owL4oPV6N5oEdIj94m03bF7l0fFjUlxSNcQhRaHZl4BA
	uerxD12vvTzXoUDr/FZsc+bfu6ayiunSEp1gXWsg14JuILXgyrX85LLyJNVq9wjU2iboaKOLeY3uf
	Mmsv2xk53tBwNsOpCLfXH4KwJEjBSBe5g/c6uLcFgJdoGRxxM1sjhZH10zNYQ99VJ+r8zed3c5u6z
	YvajbcAnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXJ2-0004xk-CM; Thu, 23 Jul 2020 09:14:24 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXIz-0004w5-4J; Thu, 23 Jul 2020 09:14:21 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGiF0-1k3VNZ3cRe-00Dp3R; Thu, 23 Jul 2020 11:14:20 +0200
Received: by mail-qk1-f174.google.com with SMTP id u64so4638319qka.12;
 Thu, 23 Jul 2020 02:14:19 -0700 (PDT)
X-Gm-Message-State: AOAM532UnD/IvJ2oSXr9nM5NWYBBF4MG/VqsfVm0Q0/ybh2VMeOtmktK
 ZBGYK3Tnw4ImDGYALRCu2yxHU1sSALq1xh/okcY=
X-Google-Smtp-Source: ABdhPJyfIhx6eiKVKg4rHbAuRO6OkD2w5iLBrvPotu3J5hOQmvUiK3e54tHiHcXr7T/fRPeYMXzXCv1u/Kq2bJSXU54=
X-Received: by 2002:a05:620a:1654:: with SMTP id
 c20mr4131860qko.138.1595495658635; 
 Thu, 23 Jul 2020 02:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
 <20200723090230.GB25935@kozik-lap>
In-Reply-To: <20200723090230.GB25935@kozik-lap>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 11:14:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
Message-ID: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:SXjLvXjaCI/Q0rKi1pHUhwJnNRv7F8kYoA1hdyGZhvYWkodPfnZ
 /HKhWd2ERjvwcY4LAz/ttRFZFG/e1GNSJPAOzJFv95x8RfThfwkXXIuWf4jX2uIZJ/r9hTQ
 nkySXuWhdnP0wjf1D/apNEAVwtMGXVyXij1G+iPtDNLlMmSnty3CxUXXgwhIAe8onlHJyZT
 DdKSmVPd1ixfz+EgG2qsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:76XzQ8eRDIc=:avBO96fCPnDiLKTs9Dw1N8
 nr0crw5XNfz6PjYa/9HAQm6GZWU4yPYzw6BMI7NUwcSBb4uiBwbwIk/F8l5SvkeUakRU9SWTV
 +MMYDGM/sOB2fTkpf7cwc7Dvw7exUEmhRQJD/CFF/kAf2VYuCAI12ZPRkB1FmdTD3Kua1cX/4
 St1i3JLmWiX9Yp6X+Se4HA2TF93L6t1yYqxe50PwN9uBDZ+TQqu7ZLzISxdAyuUgVDKPPw8oB
 k6WZmy+2o6EPcQTY3WK5BwYgGhTZaUqWR9tIvX9B4k6vURUOqq7BzrIWIKsC52CJPq76AoRd4
 ev3DnWunvABI58ifcDPcs4IYISxFPcZD4Ixo9GEDVTLlNSSUZB5VFogrYERpuVP7iuczQp+mf
 EvPdXMPyphaGCvbkYnqLYGxHYcqtJ1+jcIE48F+Chjpwweca6tMYmh2OilhaIFbCAweEUnRMm
 oiGkMAamFYsfMF0RtruFRViUn2VEvY4K24/4YFSikZqpcvzSV7wZB5BTy/7vvAjgEXU/ZPiXT
 8vOFns6z/jpP++67oZtUWgwK7Q0MBi8DLGYegKF5SKXKyQZToo/2kliWT/VuOtNdHzQY8jDqc
 n1vWYkyFF8+b8xmtsJOMZawEX1B0QIpBwagFVrhyq+tm5X0LTJKIgYiIihZueht/aLTrRqceE
 VMbrKOye41GPxr3WahRlh4w0FXocFT07F5kk+0sdkZE8iSO665+FXHbxdosusZJ3GiDaLbaia
 SiOtIAvLlzSCtdSC/Zl+kT1RRfpNAHHhw3pLD70Gwc4K1gxtMjYF5UwvjcgJY3zrnQ6vU+6Qa
 NiaQF1UWTuQFFXISMdegGmMKMaR7RK0Br8H2E7rBmw5pUMVjVtwVRpXtyNtUMHOw4kL3Btz2P
 c6gjtN3221V1ln5R495za2JApSIqN8CHuBXCgSboAmv/JDpIzV0sFpVtL19vxFg1c8AMo9q93
 rRyXducmyCGIdnTBd1X7GRf/TBxlGKDC8UEV8k6tXrjIoiOjAun9X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_051421_370933_9D334174 
X-CRM114-Status: GOOD (  24.73  )
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

On Thu, Jul 23, 2020 at 11:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Cast pointer to iomem memory properly to fix sparse warning:
> > >
> > >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> > >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> > >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  drivers/memory/ti-emif-pm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > > index 9c90f815ad3a..6c747c1e98cb 100644
> > > --- a/drivers/memory/ti-emif-pm.c
> > > +++ b/drivers/memory/ti-emif-pm.c
> > > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> > >  static int ti_emif_resume(struct device *dev)
> > >  {
> > >         unsigned long tmp =
> > > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> > >
> >
> > Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?
>
> Won't readl() be enough? Indeed it looks problematic.

readl() won't work on big-endian kernels, since this is a byte comparison.

> > The other accesses in this file don't use MMIO wrappers either but just treat
> > it as a pointer. The effect would be the same though.
>
> I think all the reads and writes are with readl() and writel().

I actually see only one other access:

        copy_addr = sram_exec_copy(emif_data->sram_pool_code,
                                   (void *)emif_data->ti_emif_sram_virt,
                                   &ti_emif_sram, ti_emif_sram_sz);

and this one ends up in a memcpy() that does not perform any byte
swapping or barriers.

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
