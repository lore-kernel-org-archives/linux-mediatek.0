Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5838EC4363C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 01:08:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7953C20757
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 01:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vkUK0jA5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nM0rmVuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7953C20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ORQv6VGGUo6tAIAt3ht8yQGok0pU6RMlSxpSvOPWSkU=; b=vkUK0jA5nAKpTG6CCh138f4Ew
	y3TRqGPtFfKpf5/han+73FNETsX6JPL22Wnk7aUf3HxDo/u8+bQtZN+2mFCJTIeHOx0JnT2etevqU
	91wa+Ag50qOudF7UhuyOGlFmpLOtahnoG7Qz7PSuoI7ul6LbMn6Cj8bgsJRfr8pYhZSnV1g5LcMP+
	/QXllVqJ0oqxwpqtQQsESEPBgqIazPRlZg7bYYE5ZV6h/WiUtIq1d1utkmH8mEACtjkS/caKB7WHR
	fqskcYjBqtZ1G9PlH+nRAeaJ9ZpKaFdkrEezqxdgVHxNMPpZv/S11eaoWChggCcXqeNB60wzY5RpT
	k69pJx7Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPEzR-0003kB-Ql; Mon, 05 Oct 2020 01:08:33 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPEzO-0003jV-Ou
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 01:08:32 +0000
Received: by mail-ua1-x941.google.com with SMTP id x26so1172988uan.11
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2020 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lzi6k3AqyqG7MfTfpPbp6oQnU/CVHLJ/4VcvpRGjvRc=;
 b=nM0rmVuONuIJa+EEBfrSCP2xTfko8vm5CnOGvyCu8krelT0/1VAozhlhcH53yUCuO0
 1HU0fmsWVFjrMW0/1HoPf6feLYpLfSVVE0Z40EK1VFZ6GF4MllxWX3uvhZteLiTFi1oO
 x4SCN21hIFZOx2Nt7IM04ehakAPmGQA0NTYhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lzi6k3AqyqG7MfTfpPbp6oQnU/CVHLJ/4VcvpRGjvRc=;
 b=G6VJCk7hkxh/d1Kocfs+62KZ+3RldlJ01XAOSQgTv9k79AThB33Hv9KO3C5LpjE80h
 TpKLyHh9OZEw/H+isVhaBsgcYd/UhkbD1Neu3UyrEEzYKgAWdTmnKn8T7PJznUe92o1V
 +b/S4OqHwj8aPVu2rWAzUeBu2tpwYQLuYLP+8HxANTye+jA+RMSXhgaiwFy2Q6tfaIHJ
 X6NDtEMkMjhbRZ3HLPMTiZztDGf36YdRX9+IIoXp0oC3xmaWPrWSDQNgLvSynbKsVIq8
 swCWQoayOhgzbIi2KadEURTOMmSmhaFPkYUN+Shf2oI3NzW+Ax5Sds7TdsBdHkywO0EE
 lHBw==
X-Gm-Message-State: AOAM533ZtiRPisma3Bh4QkI4eHl/y1K5Sd5at4rZoIs3i3ama8Ug0okN
 ISjUbAf4wNcYbYp2nnEOkbB64anJF2kY3k2tJRk5Rw==
X-Google-Smtp-Source: ABdhPJzlJFbn5aSHJ5VVUc5EutBTtfaO5xYShcZG73bY1PxsEWRc7VNKX0rUoZJMD2F8z09EMgPwHpJevKokqnPd98E=
X-Received: by 2002:ab0:7658:: with SMTP id s24mr439583uaq.48.1601860107092;
 Sun, 04 Oct 2020 18:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200928113107.v2.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
 <fe2f0eeb-ec21-5cf5-7cae-c17855bf0297@gmail.com>
In-Reply-To: <fe2f0eeb-ec21-5cf5-7cae-c17855bf0297@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 5 Oct 2020 09:08:16 +0800
Message-ID: <CANMq1KCnsrPtxxvqHL2pBPPgfna-uqbAnNxzoZSzH4seLQqY=g@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: Check if power domains can be powered
 on at boot time
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_210830_828250_330488A7 
X-CRM114-Status: GOOD (  26.21  )
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

On Thu, Oct 1, 2020 at 11:03 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 28/09/2020 05:31, Nicolas Boichat wrote:
> > In the error case, where a power domain cannot be powered on
> > successfully at boot time (in mtk_register_power_domains),
> > pm_genpd_init would still be called with is_off=false, and the
> > system would later try to disable the power domain again, triggering
> > warnings as disabled clocks are disabled again (and other potential
> > issues).
> >
> > Also print a warning splat in that case, as this should never
> > happen.
> >
> > Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> Applied to v5.10-tmp/soc which will be v5.10-next/soc as soon as v5.10-rc1 gets
> published.
>
> Nicolas can you please make sure that similar logic will be part of the series
> Enric is working on?

https://patchwork.kernel.org/patch/11811767/ the logic is a bit
different, and the whole scpsys driver would fail to probe, but I
think that's also reasonable behaviour.

Thanks,

>
> Thanks a lot.
> Matthias
>
> > ---
> >
> > Changes in v2:
> >   - Add WARN_ON if the domain can't be powered on, to make it more
> >     obvious that this should not happen (there is already an error
> >     message).
> >
> >   drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index f669d3754627..ca75b14931ec 100644
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
> > +             on = !WARN_ON(genpd->power_on(genpd) < 0);
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
