Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE1FC11F67
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:10:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A4ED61416
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A4ED61416
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9/DcRXmm6nPYOe0b0CcBRX8C3UboKzqBjn9y6LlARU=; b=b/LR6ovmg6UylN
	BldS6FR6+ZQDWEcE2dogppvC9ZrV2RF5qfjdKAn+AH2ziqP5+W8XPixBYvO5dX9xHJhMz89H8sj9S
	Y6kMbOB+V5EdymtEsOnBXy0yYPmvicUMpylOy9ayg5cymens82PPY6cQ4jXQmLUBYVQThzVQn13MP
	1jOnUpaNqThbvvuEZ0M0CFqh/1cMUNjeLuQBsrtvkPhDusgnhYnH5hrOZNsF5EpJcSy3mKhYSpglr
	xuHmBMmgHpeJ35qYUYJgRw8ZgvFVe7pHCSTK9s+/0cOsNNR5Vj9MsNAp9lOz5ZJ2tDAphHN/5AxLN
	Uvc2wauc28kwTmINHVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyzGC-000MV6-Rf; Thu, 01 Jul 2021 16:09:52 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyzFz-000MSx-TH
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 16:09:41 +0000
Received: by mail-yb1-xb34.google.com with SMTP id p15so11672255ybe.6
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uzi1kcVee3nZI004Eqmdf8y65g93K4CPvU+WDS5oQ0o=;
 b=UbI4NvvhXAKF6UJlUQJnCnIZTrPzaWdjQcU6NH0GrVU6eIit+YEfiMywDOAfxqk9o9
 tAUXpeb60OkDSx9bD6lOX62A/UBZAJD8ptJRlCml6KoBg4ua6O6q9JCyDDSeZAj+QAkc
 WrJ5xeq2NOCp7aRcUS+yoclphDIkKOJdP8slkfbniGOfPxYm2Q/Jjjtv4olDqfLSSyxZ
 Dg7d03u2ogyibOVT+ShLOuJkKEI+IxOjT8XjAxolKK3GwvR6JtkTLTQBfj7oACQa/1cF
 C9yD3GteMdLWIIqy6hn/UTSwQ4n+A0f+lkYgWr+9bF5kE11px+0WS5EtvAqbmPm5iY/O
 0TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uzi1kcVee3nZI004Eqmdf8y65g93K4CPvU+WDS5oQ0o=;
 b=MzcJs9wxlWg1jbJ8nPi3iLWpwjAsbsrqtkgN30uVrZJhWO2Th2DZpdR8cQjtqbXvTM
 HvCrEj1BSG6CFxOX/ehIVY8HQZ4JvrXxGcaelpcbHG60jphkfNULA1FbgU3OdKIiiSde
 xXwFc/hDnIVCCB3holDWPzN9uEtz/JIwoQ2l8N/yYWaI9dAM3sM+ANw3/CW0u1neCs/Z
 JWd2+Dz2dPBMyJFdIVta2CXlwebOasOo2mZYQEz1OfXwz5EANSOC0upN6p28H4/9/kDz
 7Is7h7XjB/Dj/omsABFpibNL2DsrqZJDMzcFhMq2ioJgP+aPlNKE45x3wEzjFR2fhb1C
 pbKA==
X-Gm-Message-State: AOAM530by/F6x3A3zm1FTMOGb/Zcl8Mbwl3VXbvlX8Y/lh6r0xmNEw8s
 o/qRYbcRsuN0a6IIPW8UrpPXEo5BcrBkAJXdjfdwSQ==
X-Google-Smtp-Source: ABdhPJw73TwvlM3X+UsxZTrZkl7Yi035kGpgDESa4lssYP9pUQ2usK2Q7Aza4S0poCiOx0NH2LqRyPpMJYSPU/Q/uYs=
X-Received: by 2002:a25:7ec4:: with SMTP id z187mr668800ybc.136.1625155775937; 
 Thu, 01 Jul 2021 09:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
In-Reply-To: <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Jul 2021 09:09:25 -0700
Message-ID: <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Ingo Molnar <mingo@redhat.com>, 
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>, matthias.bgg@gmail.com, 
 Minchan Kim <minchan@google.com>, Tim Murray <timmurray@google.com>, 
 YT Chang <yt.chang@mediatek.com>,
 =?UTF-8?B?V2VuanUgWHUgKOiuuOaWh+S4vik=?= <wenju.xu@mediatek.com>, 
 =?UTF-8?B?Sm9uYXRoYW4gSk1DaGVuICjpmbPlrrbmmI4p?=
 <jonathan.jmchen@mediatek.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>, 
 SH Chen <show-hong.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_090940_014838_1F9C3D2E 
X-CRM114-Status: GOOD (  13.09  )
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

On Thu, Jul 1, 2021 at 1:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > +     /* cmpxchg should be called even when !force to set poll_scheduled */
> > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> >               return;
>
> Why is that a cmpxchg() ?

We want to set poll_scheduled and proceed with rescheduling the timer
unless it's already scheduled, so cmpxchg helps us to make that
decision atomically. Or did I misunderstand your question?

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
