Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BC2C4346E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 02:55:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C572399A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 02:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2qw62F3A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P1DRcYb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C572399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3w6b0JUcOGYEek7I5uPADpP7phnpnf4I2XbCFKX09rQ=; b=2qw62F3ATl/xuDQX4CVMXzm9y
	GSbUbdDPoluTIwbIY9vnd9BOzkPnexJD07FPp3j+Q9pIOFPpT0tpuKW29FDw7JA3yAH/Zyx8lhtDn
	5snnJVREeWmqG68UsLuN+Mm+1iG9xj3iyj6AO0UX48SPUBXBaHJWPPcM1vY+1CwO9H6yfKg1Fy0oC
	beDg5i+K1CYNwJgG0TuDvpvJ0/uQ7bDyvuqSgUf2AhNrT+q7tPs+UKNgr6yrFQcZaFJuERO1saV9q
	pJR5AM0w9rr4lfsQDG2VKMTbqV102wSokHnV+eGBOCMgWFOVbXAJYwWdKTTAPemhcrQOrkj3YsRvN
	ExxxNIZeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKYSk-0004rs-HE; Tue, 22 Sep 2020 02:55:26 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKYSi-0004qu-Ek
 for linux-mediatek@lists.infradead.org; Tue, 22 Sep 2020 02:55:25 +0000
Received: by mail-ua1-x941.google.com with SMTP id u48so5025205uau.0
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2020 19:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ru94yawi1J4H6mzGaA+bu3tz0jur5splNtJNFK2pEjw=;
 b=P1DRcYb/nUX2CdcgXprpBI9tvTvLET6HBPS6TSWEM8LPAWKOXRSbp3g8NfjjWEPrg2
 z5OY/gpUVCFFh7gg8fztZ3165X3/9SLbiq2vlES4FPHsU/276ohv2drtY9Fg47FRIM9r
 k049Oz7Qt1TFWAkDt6LUx2VPTcBBs/0Z0aPRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ru94yawi1J4H6mzGaA+bu3tz0jur5splNtJNFK2pEjw=;
 b=IG5DcebknYqqx2Pebr6PCoyftiajVz0NyLk0YthwSY5EbApOL3ZB3YSx4jb9y3TdJf
 TTbyz8L/EXCEONqjrG/nHw2/dT/ydxYpn8wK7GFu6MZybhw7yaFbse/vA3NkPF2ZKakI
 q1VNmQDB2XXq3xPhXIQX/pYKn2EM//oWskQFti1psorJH1DaBNSyLT0HFTdr1tRskkYX
 yX/Cn/UMnR+9rZVC/gudxZpR5y86OEu+XEE8OjmhF9fiWdkIGL8pjIZiMse+ywm+KEvi
 1d4NK5xcX5UKKCo9RVo836b8JuPmnv8+N2QIevUKrvgf/vzaoLQJ1mw8I69BzYOKl3UV
 kUKQ==
X-Gm-Message-State: AOAM5300aTy5RDHMb0WSAeYAje+0QZMos5BD8ULVlZsjhsamhlVcfQam
 3yPvP8TmjnbXtzcyI1xgeefnhfeEEeKc6ktcGpKr/g==
X-Google-Smtp-Source: ABdhPJzXVsQocQsixjn2gyYjkmtSokc8QsHvNccpRbxRW75Lla1V27EuRsAXbx5XGoSul1cExZQl1l+CB2eUrRu9cls=
X-Received: by 2002:ab0:6d8d:: with SMTP id m13mr1970572uah.82.1600743322399; 
 Mon, 21 Sep 2020 19:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200730120054.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
 <6549429e-bd3c-5249-2fbd-cd1c45b5b2c1@gmail.com>
In-Reply-To: <6549429e-bd3c-5249-2fbd-cd1c45b5b2c1@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 22 Sep 2020 10:55:11 +0800
Message-ID: <CANMq1KANt+3=qJ56QR_A2jnujohvPqJxTR=xkAwYzX_gxQ7L+g@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: Check if power domains can be powered on
 at boot time
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_225524_570518_96626632 
X-CRM114-Status: GOOD (  25.95  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Sep 22, 2020 at 1:07 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Nicolas,
>
> Thanks for the patch.
>
> On 30/07/2020 06:01, Nicolas Boichat wrote:
> > In the error case, where a power domain cannot be powered on
> > successfully at boot time (in mtk_register_power_domains),
> > pm_genpd_init would still be called with is_off=false, and the
> > system would later try to disable the power domain again, triggering
> > warnings as disabled clocks are disabled again (and other potential
> > issues).
> >
> > Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ---
> >
> >   drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index f669d3754627dad..0055a52a49733d5 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -524,6 +524,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >       for (i = 0; i < num; i++) {
> >               struct scp_domain *scpd = &scp->domains[i];
> >               struct generic_pm_domain *genpd = &scpd->genpd;
> > +             bool on;
> >
> >               /*
> >                * Initially turn on all domains to make the domains usable
> > @@ -531,9 +532,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >                * software.  The unused domains will be switched off during
> >                * late_init time.
> >                */
> > -             genpd->power_on(genpd);
> > +             on = genpd->power_on(genpd) >= 0;
>
> Is this something we expect? On probing we realize that some domains can't be
> turned on?
>
> I understand that this would be a bug in the driver. Therefore we should at most
> provide a warning instead of working around the bug, hiding it. Or do I got this
> wrong?

No, you get this right. That's a bug (we see this on unreleased HW),
and we will fix it.

Now, we already get this (somewhat subtle) error message on boot:
mtk-scpsys 10006000.power-controller: Failed to power on domain adsp

But without this patch, there is an unbalance later on (that is
possibly a bit confusing):
[    6.510811] ------------[ cut here ]------------
[    6.515417] adsp_sel already disabled
[    6.519089] WARNING: CPU: 5 PID: 180 at drivers/clk/clk.c:958
clk_core_disable+0x1ec/0x22c
...
[    6.658393]  clk_core_disable+0x1ec/0x22c
[    6.662395]  clk_disable+0x34/0x48
[    6.665791]  scpsys_clk_disable+0x34/0x58
[    6.669791]  scpsys_power_off+0x374/0x3ec
[    6.673790]  _genpd_power_off+0x40/0x98
[    6.677616]  genpd_power_off+0x168/0x208
[    6.681530]  genpd_power_off_work_fn+0x38/0x54
[    6.685964]  process_one_work+0x208/0x3c8
[    6.689964]  worker_thread+0x23c/0x3e8
[    6.693703]  kthread+0x11c/0x12c
[    6.696923]  ret_from_fork+0x10/0x18
[    6.700487] ---[ end trace 91ddada49c4d717c ]---

But I get your point, we should probably add something like
WARN_ON(!on) to make it clearer, at the time when the issue occurs,
that something is not right...

Thanks,

> Regards,
> Matthias
>
> >
> > -             pm_genpd_init(genpd, NULL, false);
> > +             pm_genpd_init(genpd, NULL, !on);
> >       }
> >
> >       /*
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
