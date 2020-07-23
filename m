Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79703C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:38:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4445920771
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ncVRn4r7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="PQL2Dzu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4445920771
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DUtOVeIyyWfhKcOfGBRn2FCd/YP4YsGgNM0V+fBajSY=; b=ncVRn4r7Azg80SVpab1HKyjOf
	+Wuo/npkVIoSCh4SLIx6Npv6fZwCGViYHNHia+MpaRHvkY7HNvmemyiVXN+cTjWWwLaQ0X6RlvE3d
	Qype097P13ozqPpyF9YkMG6Lte65ou3sAqbE2IEP9usHawG03a3nW07uzNuE3SN04GzX7s7+nembG
	21ZT78REStNfcv3UGDQgf6KpiO62PzSiw5h+6dUHWRpyylxtuYKJDaxQA5ENqHWyc2rj/hSS9GJUt
	6/wialm2Uh+kcthSylxLdkWHrGA6Kk2/7nvM9RWM0ZnEfxlLnANWzzRIHpl+kYIjLEpFQyK3xspa8
	IGzBH86uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyfAE-0000KN-O8; Thu, 23 Jul 2020 17:37:50 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyfAD-0000Es-2r
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 17:37:49 +0000
Received: by mail-pf1-x444.google.com with SMTP id 1so3349785pfn.9
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2020 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qnuIrZu2OWZ5kvibJg3aLSShYvtv8J4Cmi01ZuM4HUc=;
 b=PQL2Dzu+NyxvneZO+9riZM5BPQljQd5y0QHCqDonnE9YhEMxSIxU1BxGHIgflOvBgs
 aVM1ujTMLTpWe2xuZaJF0T90dTxI4S4fTu+fomJ9guXal5MCiQwuzFh+a9venPA8cruV
 I5+/M8kERmuifFpR2Y+CLeFkHpLbevIG8qmQu1qa0rxljQ8fiJYr6fisZklFa0WAjrWo
 ZSPFB3DurMQ1rcxRADLINxxFeRWWMIT1q6O6IIPbVD1KmIUzniZj1j4QtlKzWeS+f5M6
 NSWJEXusM+uVG0MzzQkqW4aBmpuhAyXMZWUcCOvREVIDcp500g0r42e2W9hfW5XmiToQ
 K41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qnuIrZu2OWZ5kvibJg3aLSShYvtv8J4Cmi01ZuM4HUc=;
 b=rVL6qDPdvMdQ5R6xavNgFs8uloYI9vlpDj3eDDUYVv/3/t9zz41kdejExYpUXbjZi6
 w/qS+FWAjs5OZkh9aBwWWRDEy03Ax/rj3eDOQlLQYRBbM9osfexOAyVQhzHLqS4kvHbT
 2/6PsKMYLF/+5tfsIGNPseldtw11MybtPrrSK1x44+Ur1ROER2diUK5xU3Xa34DoT+Px
 5dBa6crJ+7i/SzGd318EfpqlrZxqp6uemTUmlDT1ZVlzjR+1HJgoSwThFmu96WdSDopi
 98vw2lFOdZN4kttkWwZEery4VD4fQIPtfQb95qsLzjuLSSOCf8YX6Vo9AxtLBnezZi69
 0bNw==
X-Gm-Message-State: AOAM531gHQ5xMpmZy8fsxd4onmI6swwXLzfKJ8bKPvroMwcg6yqVtt1m
 gC+pCdIHK5upfRRu+iOa8Er3hHtVzuTdnpG8P+VanA==
X-Google-Smtp-Source: ABdhPJzFd1N2krZxRMK3NLvXZSLLCFIMX7xBovURQlHaZx+irb05W06lmdHRV6Pg81rYWDbD3PvqpSO/m7aTpaGtEeM=
X-Received: by 2002:a63:fc01:: with SMTP id j1mr5228706pgi.0.1595525864945;
 Thu, 23 Jul 2020 10:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-5-saravanak@google.com>
 <1595504763.31289.5.camel@mtkswgap22>
In-Reply-To: <1595504763.31289.5.camel@mtkswgap22>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 23 Jul 2020 10:37:09 -0700
Message-ID: <CAGETcx-BWm9TPZix7WvVfe+BwHi=9-Bq2xJBLEK-dWH+xzpYxA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] irqchip/mtk-cirq: Convert to a platform driver
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_133749_167734_6FE21D68 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Loda Chou <loda.chou@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 4:46 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> On Fri, 2020-07-17 at 17:06 -0700, Saravana Kannan wrote:
> > This driver can work as a platform driver. So covert it to a platform
> > driver.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/irqchip/irq-mtk-cirq.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
> > index 69ba8ce3c178..62a61275aaa3 100644
> > --- a/drivers/irqchip/irq-mtk-cirq.c
> > +++ b/drivers/irqchip/irq-mtk-cirq.c
> > @@ -295,4 +295,6 @@ static int __init mtk_cirq_of_init(struct device_node *node,
> >       return ret;
> >  }
> >
> > -IRQCHIP_DECLARE(mtk_cirq, "mediatek,mtk-cirq", mtk_cirq_of_init);
> > +IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_cirq)
> > +IRQCHIP_MATCH("mediatek,mtk-cirq", mtk_cirq_of_init)
> > +IRQCHIP_PLATFORM_DRIVER_END(mtk_cirq)
>
> Hi Saravana,
>
> Looks good for me to convert cirq to a platform.
> Thank you for your patch.
>
> Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>

Hi Hanks,

Thanks for the Reviewed-by on both patches.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
