Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3199C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C346128E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C346128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmuaKOpgEjat5Tep7sXI4eTjREOklnECDUykSIAkLKI=; b=qC8nAjEYiAeRV0
	KrVk4NSngKxJpTFGoD8N0sA1//Wd6fFd4+b9MDZFd1wSLdPTDYTQGu1YPhrYFUcbBdDkr/x37z8tK
	UmSj4959Fb2fz+roz3RVTazrikyqKtKRffQF7lfwsGZknVQ5LMGI1eDvUdRk6waW20yEj0hU+apk7
	+SjdfkjUJ3b+V8w9qeVLnCHq+MYwToffcmg5O/S+n64ojvVwzSRO0IIftH9/Bf99qDFSyFenWi/ce
	wpswduFXR143rdybG1TsttN0p3EhIJdnNOsSLStvTO/Y3dQj+tUqzIHBXGdkENaiAriBGhGntk506
	IehH6dXAOcjCnHPOjapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvi0P-007bVc-Ad; Tue, 22 Jun 2021 15:08:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvi0M-007bTl-B1
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 15:08:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id t32so5288198pfg.2
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SI166qr6HueDNoTy9ydevVzqvTJI8FKVXkBcOgX/an4=;
 b=lq8Xv5RAYOJ9v0jUsUz5zBb6e1WyfaJp8diGrsGE+vJhZiTAuvS2aeCNmdrgESECBs
 HupHSvGV1OQIKBkdZySBOeyP9s05bMvs8ZfwVuRUGIOB9clvHLegaIzoBKwkNxmgJINT
 o0qNg6dO7Mgnap/OGgXKNHuZKN8gocwjp4ZQx8zsEmhDeF46MwomuRZ+RQPENJX/yqOl
 QB5UyXas6ZmizWIXBSUSMwpe92hf8XUzMMtsshff5xhzzhG1i4YPUZixHPzomOOEZv31
 35RRY+oTQXPnqoH8sLHOio7Ixg+TkZT50DRj0iNCnM28aGpKMFmB2+GH80YmZn7SsTzN
 3y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SI166qr6HueDNoTy9ydevVzqvTJI8FKVXkBcOgX/an4=;
 b=CKPSczGwy3osIYO3KQBYSHE7Gz8CB+6X1uZXnoAmvIyWOTmZkbFPvn3ZFPpZca83f0
 /77qQzS+CZe57PMaTkFKZHyNqpagqlhtkmYz7L/xQ17Uz4Kz0pEoTHbq9FSb+sN0sCZS
 qZ58bryl8Y9Ay0NzfJtoI7c6LeoHTsZm/TETeTqhebBjd0/nJu6HIYL934n78N/JqaVf
 HLKzKx4cqeWT4PbpeDT6SF/mRiBxqpUs8Oar6n5hLSYWkwrNTd/ZbmVmouyaSjx0qXD4
 Yw8x9REEVw25/FD72ZVtO2aEQ61T621calAwYSGNmNcGpEsQ2EtimsAd92IxhuJCKg3k
 uqIQ==
X-Gm-Message-State: AOAM532u7kdTrxCDOydU8xnlWLE7kw/1BzP3bBcxtrCd+T0AKQv8D1y2
 F3aflRI2n7B/uPaRXadunAReUQ==
X-Google-Smtp-Source: ABdhPJwm0JFMXAlFLUyQwhmXF6OYeDIQmhHBekmUlHzikepo9746iaBZX8vYFkWNhAA1HeUIagS7Zg==
X-Received: by 2002:a63:5b21:: with SMTP id p33mr4225420pgb.402.1624374476642; 
 Tue, 22 Jun 2021 08:07:56 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:ebf0])
 by smtp.gmail.com with ESMTPSA id t14sm1271570pfe.45.2021.06.22.08.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:07:54 -0700 (PDT)
Date: Tue, 22 Jun 2021 11:07:51 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, bristot@redhat.com, matthias.bgg@gmail.com,
 minchan@google.com, timmurray@google.com, yt.chang@mediatek.com,
 wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YNH8x9HRyfvF53Pl@cmpxchg.org>
References: <20210617212654.1529125-1-surenb@google.com>
 <YNHr81D/fPD2Q8kM@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNHr81D/fPD2Q8kM@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_080758_495156_90C20F22 
X-CRM114-Status: GOOD (  21.66  )
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

On Tue, Jun 22, 2021 at 03:56:03PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 17, 2021 at 02:26:54PM -0700, Suren Baghdasaryan wrote:
> > Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> > Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> > Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> > Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> 
> Johannes?

Looks generally good to me, I'd just want to get to the bottom of the
memory ordering before acking...

> > -/* Schedule polling if it's not already scheduled. */
> > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > +/* Schedule polling if it's not already scheduled or forced. */
> > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > +				   bool force)
> >  {
> >  	struct task_struct *task;
> >  
> > -	/*
> > -	 * Do not reschedule if already scheduled.
> > -	 * Possible race with a timer scheduled after this check but before
> > -	 * mod_timer below can be tolerated because group->polling_next_update
> > -	 * will keep updates on schedule.
> > -	 */
> > -	if (timer_pending(&group->poll_timer))
> > +	/* cmpxchg should be called even when !force to set poll_scheduled */
> > +	if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) != 0 && !force)
> 
> Do you care about memory ordering here? Afaict the whole thing is
> supposed to be ordered by ->trigger_lock, so you don't.

It's not always held when we get here.

The worker holds it when it reschedules itself, to serialize against
userspace destroying the trigger itself. But the scheduler doesn't
hold it when it kicks the worker on an actionable task change.

That said, I think the ordering we care about there is that when the
scheduler side sees the worker still queued, the worker must see the
scheduler's updates to the percpu states and process them correctly.
But that should be ensured already by the ordering implied by the
seqcount sections around both the writer and the reader side.

Is there another possible race that I'm missing?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
