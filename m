Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B98C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 11:55:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887C72311B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 11:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzynaEKP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="KC3r+Mpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887C72311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L/Pd0oKTxu1gcQS55FAVFrNpZIQq+RRUMRYKmdH/S58=; b=tzynaEKPmfKwmUnCopzhSxLCQ
	0fK3JOQ87f6LmFJkPQxT6Kp/ksKeH227L6rl+b+wd2PRGi05fMjwQMI6UVaNgcyI1vrO3VYcc6fBh
	RMVQOF7UXBcoONu13nsvhabcn0z83R4m0iauPdI35Lahel84WAo/5L6E5i53nG6KsHMjTPC//N/qZ
	Qyt9MjE5Efonb2hD5bB72H44prtAkY0dnxkl2CF05mFwMMOhsuGm6aGygXlxO2eV49Ug+k8AMrFXQ
	EwCX97wR16OFSurD3Q7u9MdFuabACwyJSqEhtoVTRTqEQMwHB5beSjNEEK5ajqo3iNcvcIrVPNhIy
	pyqZhZYtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLPqE-0002ww-RY; Thu, 24 Sep 2020 11:55:14 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLPqD-0002vR-0k
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 11:55:13 +0000
Received: by mail-ot1-x344.google.com with SMTP id m13so2837685otl.9
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 04:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ztRBPPvDaKOY/eanG9V3sp2lDW4LO5Tox/N9KiU+s4o=;
 b=KC3r+MptjH/RTy/874CBDG3LrIXfP8feQfAP7+/hMMMj/ti8ELR6KiicqyT2j9kmNl
 c89a6PBl1YAx7bbrDpZyNXZyhdK5ikYEIaSwbEWQmmwElvCPxips6yC+c8Ay6AEsndDf
 iRbwt9rhwrrTNe1XfSbpjOYKZryKtm7Eneiq7JPsUbPsW5Ivjrik88zf2y+f3ExpS4yS
 wUqLwJBMbDHQ6TXzOVVHl+Mk7PeHPBIbOKJkI7jIvqmRtAMgVfFXBlc8VA3lPG2w7SQ4
 IGJpuwjS4zIt1ijLDM0JeJ26vpi18keWgLQdMOQjUzYH1SlD9SKzLWiUOtBadyDYiMhQ
 i95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ztRBPPvDaKOY/eanG9V3sp2lDW4LO5Tox/N9KiU+s4o=;
 b=dtKk3sHO3H+4q8lp5ZS1yvZL2bkCpbgsIlmS8/pd4AEUKWc4b8fdOtQaRoX0oqzOjY
 J3HFf/zjqXyZKTvP5slE/EvXwJAS1T5fwiQxdPLvq2v+rQQBuWLFSGoXCJlS61Ymgmp0
 mYHI3uEikfJyAqgiu7JOgVKH6kOw3NkWKTd+bly1NLG3C9lydT3tXDTE/sDIZnf94X93
 i2Sp43Bga74eRZ5Y0weQvjwyKKTT6T2E7BtXyR/gK32H9+uDP1gF1GSJtgwH7QDYX4/p
 ILNfkqdJBVZQ4p1hcg1VqQz/jHFknGCX2gocl9HUbxM3d9na9w6w9KggskXuNEwurB31
 L79g==
X-Gm-Message-State: AOAM530UirHwIbS7jMYq0KM4Y3dA6j+hcXou1YY+s5A6x/AJ33Pp0bFB
 DK0RXmWSGYSsGc/BOEo4Eih3dER78vBcjUzf5Zt4dg==
X-Google-Smtp-Source: ABdhPJzEBQ4Ct/h1arzvWDi0y14t62r2NGPwfHNLNhHfWH4WnG/J9sJadnKxxKmmnRROfMojYyJ8YHirAvneUEUwmno=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr2619746otk.251.1600948508986; 
 Thu, 24 Sep 2020 04:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200924040513.31051-1-walter-zh.wu@mediatek.com>
 <CAG_fn=W2dcGKFKHpDXzNvbPUp3USYyWi2DEpEewboqYBodnSsQ@mail.gmail.com>
In-Reply-To: <CAG_fn=W2dcGKFKHpDXzNvbPUp3USYyWi2DEpEewboqYBodnSsQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 24 Sep 2020 13:54:57 +0200
Message-ID: <CANpmjNNmeqfMLZ0aFC49fHTYS5k7BqTZHP4FmDc=sfZe+j6bOg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] kasan: print timer and workqueue stack
To: Alexander Potapenko <glider@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_075513_085053_219EA659 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 at 13:47, Alexander Potapenko <glider@google.com> wrote:
>
> On Thu, Sep 24, 2020 at 6:05 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > The aux_stack[2] is reused to record the call_rcu() call stack,
> > timer init call stack, and enqueuing work call stacks. So that
> > we need to change the auxiliary stack title for common title,
> > print them in KASAN report.
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Suggested-by: Marco Elver <elver@google.com>
> > Acked-by: Marco Elver <elver@google.com>
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > ---
> >
> > v2:
> > - Thanks for Marco suggestion.
> > - We modify aux stack title name in KASAN report
> >   in order to print call_rcu()/timer/workqueue stack.
> >
> > ---
> >  mm/kasan/report.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > index 4f49fa6cd1aa..886809d0a8dd 100644
> > --- a/mm/kasan/report.c
> > +++ b/mm/kasan/report.c
> > @@ -183,12 +183,12 @@ static void describe_object(struct kmem_cache *cache, void *object,
> >
> >  #ifdef CONFIG_KASAN_GENERIC
> >                 if (alloc_info->aux_stack[0]) {
> > -                       pr_err("Last call_rcu():\n");
> > +                       pr_err("Last potentially related work creation:\n");
>
> This doesn't have to be a work creation (expect more callers of
> kasan_record_aux_stack() in the future), so maybe change the wording
> here to "Last potentially related auxiliary stack"?

I suggested "work creation" as it's the most precise for what it is
used for now.

What other users do you have in mind in future that are not work creation?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
