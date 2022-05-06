Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6695AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejAcdKypKOolKeTSDTYupj0clUzuHke18Kpc27Y08SY=; b=ZhDvcIlP+iQHBd
	zDfgctH7nnqworQfmEf9Iiuq68W6PFx3fXV7Xotm2qSOCNCPskwTBmqv9bzxrvJiUSLGfMMAju+U7
	w35CfNNYwX88fe0Bfs6Pv4CAnCqvysjCW7AJ3t9Cqisuci68rP8Ah57zmY002YV2ZqXEtBhIm4c8d
	qk7LVU0pdLogG/2OsUFaKWRjeirzBsjJyX19xhjTQmI9AI63EofpNrCWw6ZZm06/+I8Sdi+MR60k3
	s0+FFRpNy7O1VRbaKY8A+vHH99EUajxBFXXvc32o2pOGgrsFtfdrmwqOEBuAwBLgm/3ykmUuozChh
	frroADU9mmoJPhK3BX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn39Y-004lJA-7M; Fri, 06 May 2022 18:58:12 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn39L-004lDp-Ty; Fri, 06 May 2022 18:58:01 +0000
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2f7d621d1caso91069807b3.11; 
 Fri, 06 May 2022 11:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxlPrmLfCbB332ULeV+CNmlFte+BFEYMZyJdYeXRAX4=;
 b=0AFNNlDslHHyZ0lDNpR3Wx3Z4Zfo5HNUuXRLWnXcIcnV560S3zdpB+49Pjp0fAcEqW
 B2Wd+iHdtfaFQMMB5oQG/T49CgpCitjx+5J83T2rqNjoFU7uen5gQ9gPxL6B1ZbEhdEb
 anagUZ3KCOyZg7iHNfqE6FD/r6IvmfRltsgim/F8Od+NU2oZhTQD5qVmwR64dpwawAtD
 gXg1J7+OJJ3hTLhoIYElScbA4DJR7ESLvAu408lJpXBdc44D+f/XgixRdCc3wIf3xvnm
 qZR2uY5t1pzYDEjT9DH2EPAPIik73l4sMyn9XzZRJ8v9x0/kFoXX1dP/tE3y3v+rgESl
 bM9A==
X-Gm-Message-State: AOAM5303Q+UaV6ERm91QqRhusrx2OswsE3lbreHVn+Pbuq6f1tfzCjne
 g4VZXxL4x9Dw0I+mk5iR9GBMT8RfRkBj86axBl0=
X-Google-Smtp-Source: ABdhPJwgiEChSGf9qvyjy1T6zYSy5XNdQbCamYh3pl5CMGsNXjJNpyDK30nh70IBONDR0lTHUw8ZW6bTd6FXqI7qopY=
X-Received: by 2002:a81:2f4e:0:b0:2fb:2c97:d66f with SMTP id
 v75-20020a812f4e000000b002fb2c97d66fmr4072572ywv.196.1651863475864; Fri, 06
 May 2022 11:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
 <0b9e332d-f479-ed3d-78ce-6386383d827b@gmail.com>
In-Reply-To: <0b9e332d-f479-ed3d-78ce-6386383d827b@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 6 May 2022 20:57:44 +0200
Message-ID: <CAJZ5v0itm1CmdVoO3kiwuLteuNqAvt7TqcMDOpYnBRM=yf4n9Q@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_115759_991122_65426A6F 
X-CRM114-Status: GOOD (  25.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 5, 2022 at 3:32 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 04/05/2022 10:21, Viresh Kumar wrote:
> > For some platforms, the frequency returned by hardware may be slightly
> > different from what is provided in the frequency table. For example,
> > hardware may return 499 MHz instead of 500 MHz. In such cases it is
> > better to avoid getting into unnecessary frequency updates, as we may
> > end up switching policy->cur between the two and sending unnecessary
> > pre/post update notifications, etc.
> >
> > This patch has chosen allows the hardware frequency and table frequency
> > to deviate by 1 MHz for now, we may want to increase it a bit later on
> > if someone still complains.
> >
> > Reported-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> > ---
> >   drivers/cpufreq/cpufreq.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 0d58b0f8f3af..233e8af48848 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -28,6 +28,7 @@
> >   #include <linux/suspend.h>
> >   #include <linux/syscore_ops.h>
> >   #include <linux/tick.h>
> > +#include <linux/units.h>
> >   #include <trace/events/power.h>
> >
> >   static LIST_HEAD(cpufreq_policy_list);
> > @@ -1708,6 +1709,16 @@ static unsigned int cpufreq_verify_current_freq(struct cpufreq_policy *policy, b
> >               return new_freq;
> >
> >       if (policy->cur != new_freq) {
> > +             /*
> > +              * For some platforms, the frequency returned by hardware may be
> > +              * slightly different from what is provided in the frequency
> > +              * table, for example hardware may return 499 MHz instead of 500
> > +              * MHz. In such cases it is better to avoid getting into
> > +              * unnecessary frequency updates.
> > +              */
> > +             if (abs(policy->cur - new_freq) < HZ_PER_MHZ)
> > +                     return policy->cur;
> > +
> >               cpufreq_out_of_sync(policy, new_freq);
> >               if (update)
> >                       schedule_work(&policy->update);

Applied as 5.19 material, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
