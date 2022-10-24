Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9D2C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLgA2KHW4zBL0pJQ01sZ8XB5eZ61y0NroPK+N3UbEhM=; b=Uzo6zTlvfduTDVpUBC7gRf+pGj
	Ru79vV2zLgx/3undP63jG+7ru+VDRN79JQjqrCULCPWknA0ybfjvXL+FwLGFVvEgUtkc9uWHgI5ug
	etyNwaNGQq6pGrj1rT61U41PPw0X6qRti9OTeQt1xxnc9y+Pl/ERI7v1mJ4T/72AgLc+bdCs/q1Ez
	wzZxtJg2PyP3pKQUPhVMtYr3ABcS0Q+GFlEX4eiu3humn/aan3hWa3kEBYxhmbU/L5O8ZZ5T4yePn
	Bxhfvpp63va1TbWP/3A3dY0tjcZxKECONuVIntauJLEo+WjyDlP5al7gphIR1/HBeBTqYvpn0TaZ8
	muux5iJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on4Kh-0030LG-LA; Mon, 24 Oct 2022 20:46:03 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on4Ke-0030IY-QW
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 20:46:02 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 63so12345683ybq.4
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 13:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sLgA2KHW4zBL0pJQ01sZ8XB5eZ61y0NroPK+N3UbEhM=;
        b=CWBph8rA++SBI0a83I+e4TnII4JVHzeSonkgYQVtzKcULr9U34cD9Yrb4klJWtFT3B
         0izA7chJW8bWcXZdCEnzTPPQ32GzNGuAn/pkXTRELQo6+Zh7xspWFuuYIvLDP5GWDvlz
         NqaEy/WPMqKTk8p4ldPHpbu0JeMhCWKkEtQxzGhZicuFJzhEKGFidZNDr0kNm8+fBt94
         VqWDpLuG6EQT0ycfgLnynA8WJKyQ9sjT292qhNeF9j6T0W0hL5bkMxI+wYzpxdUEHcjf
         uN/IC1svlIZuBrd2RogLGbCo2QDczPzumOx8EVS0diogFE33L9jtfrybmzfYOHIC3fUY
         p4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLgA2KHW4zBL0pJQ01sZ8XB5eZ61y0NroPK+N3UbEhM=;
        b=MnesmGWjsHbi6V/Thtj2iFDWGuJSGdR14g0S/ERV67KIKD9J16PAfsl4MTaNr+QtFG
         tSYGU6/nZWQBqVoK2VFd800iGc/nXVq9brneaxtz9cYoZEU31ucWYxqAXzm7PzR6yf2v
         Elpk/mIE9ftgqpaR+O1fSXAb1zygrGoUkXjoYQVaZn4tdZx4j+GpOOVZIKR9pyW0jq/y
         Ng8IG83MaLP+3A1IByt05C+AT00MxZ97xDN25dHarwI00FRF8ELtLB2Z4B5VmOmwaMZ8
         tyaQf0LuJwwYzx5UFGwsDgwVZ7IFo5FcL20ZBWOO7y1Rjb9nLfVsDEfrJgjrldygPHS6
         zSLQ==
X-Gm-Message-State: ACrzQf14+Qdil79AzfFLYbf3WWdDlb9QRFg4m/pa65MHKHyLvF4uwVYj
	NWkTbp2+O358S4veSfnkLaUy4bh6+hMOwWto4atThQ==
X-Google-Smtp-Source: AMsMyM5NFr96nU+t+xjgnA79Wl6s5s3n19xLP/o+ixhEyIpWv5hK1DTIuDlYpiKndl0gJFlzR/WwDxlU6h0CyemkJ7s=
X-Received: by 2002:a25:2:0:b0:6c4:dc1:d37c with SMTP id 2-20020a250002000000b006c40dc1d37cmr29027953yba.380.1666644342803;
 Mon, 24 Oct 2022 13:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221010225744.101629-1-surenb@google.com> <CAJuCfpHeJuZBbv-q+WXjgNHwt_caMomFPL3L9rxosXOrZz3fBw@mail.gmail.com>
 <Y1ZhNDEoX3n9qOpk@hirez.programming.kicks-ass.net>
In-Reply-To: <Y1ZhNDEoX3n9qOpk@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 24 Oct 2022 13:45:31 -0700
Message-ID: <CAJuCfpE9tLmUhvD3OcLjBheFR7j2QnAJnNB9_vCRFqRZK=CFDA@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/1] psi: stop relying on timer_pending for
 poll_work rescheduling
To: Peter Zijlstra <peterz@infradead.org>
Cc: hannes@cmpxchg.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	matthias.bgg@gmail.com, minchan@google.com, yt.chang@mediatek.com, 
	wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com, 
	show-hong.chen@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_134600_886273_C649CB48 
X-CRM114-Status: GOOD (  36.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 24, 2022 at 2:56 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Oct 20, 2022 at 03:25:47PM -0700, Suren Baghdasaryan wrote:
> > On Mon, Oct 10, 2022 at 3:57 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > Psi polling mechanism is trying to minimize the number of wakeups to
> > > run psi_poll_work and is currently relying on timer_pending() to detect
> > > when this work is already scheduled. This provides a window of opportunity
> > > for psi_group_change to schedule an immediate psi_poll_work after
> > > poll_timer_fn got called but before psi_poll_work could reschedule itself.
> > > Below is the depiction of this entire window:
> > >
> > > poll_timer_fn
> > >   wake_up_interruptible(&group->poll_wait);
> > >
> > > psi_poll_worker
> > >   wait_event_interruptible(group->poll_wait, ...)
> > >   psi_poll_work
> > >     psi_schedule_poll_work
> > >       if (timer_pending(&group->poll_timer)) return;
> > >       ...
> > >       mod_timer(&group->poll_timer, jiffies + delay);
> > >
> > > Prior to 461daba06bdc we used to rely on poll_scheduled atomic which was
> > > reset and set back inside psi_poll_work and therefore this race window
> > > was much smaller.
> > > The larger window causes increased number of wakeups and our partners
> > > report visible power regression of ~10mA after applying 461daba06bdc.
> > > Bring back the poll_scheduled atomic and make this race window even
> > > narrower by resetting poll_scheduled only when we reach polling expiration
> > > time. This does not completely eliminate the possibility of extra wakeups
> > > caused by a race with psi_group_change however it will limit it to the
> > > worst case scenario of one extra wakeup per every tracking window (0.5s
> > > in the worst case).
> > > This patch also ensures correct ordering between clearing poll_scheduled
> > > flag and obtaining changed_states using memory barrier. Correct ordering
> > > between updating changed_states and setting poll_scheduled is ensured by
> > > atomic_xchg operation.
> > > By tracing the number of immediate rescheduling attempts performed by
> > > psi_group_change and the number of these attempts being blocked due to
> > > psi monitor being already active, we can assess the effects of this change:
> > >
> > > Before the patch:
> > >                                            Run#1    Run#2      Run#3
> > > Immediate reschedules attempted:           684365   1385156    1261240
> > > Immediate reschedules blocked:             682846   1381654    1258682
> > > Immediate reschedules (delta):             1519     3502       2558
> > > Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%
> > >
> > > After the patch:
> > >                                            Run#1    Run#2      Run#3
> > > Immediate reschedules attempted:           882244   770298    426218
> > > Immediate reschedules blocked:             881996   769796    426074
> > > Immediate reschedules (delta):             248      502       144
> > > Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%
> > >
> > > The number of non-blocked immediate reschedules dropped from 0.22-0.25%
> > > to 0.03-0.07%. The drop is attributed to the decrease in the race window
> > > size and the fact that we allow this race only when psi monitors reach
> > > polling window expiration time.
> > >
> > > Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> > > Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> > > Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> > > Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Tested-by: SH Chen <show-hong.chen@mediatek.com>
> > > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> > > ---
> > > This patch somehow slipped through the cracks after being acked by Johannes in
> > > [1] and I didn't notice it until now because we cherry-picked it into Android
> > > kernel trees due to the urgency at that time. On the bright side, this change
> > > has been tested for about a year in the field by millions of devices.
> > > Resending v4 of this patch previously posted at [2], rebased on the latest
> > > Linus' TOT.
> >
> > Hi Peter,
> > We missed this Ack'ed patch last year and as I described above I
> > didn't notice that up until now. With rc1 released, hopefully it's a
> > good time to ping you to ask for inclusion of this patch in your tree.
> > If the timing is not good, please let me know when to remind you and
> > I'll send another email. Just want to make sure it does not slip
> > again.
> >
> > Just FYI, we have two other Ack'ed PSI patches for you to consider:
> >
> > https://lore.kernel.org/all/20221014110551.22695-1-zhouchengming@bytedance.com/
> > https://lore.kernel.org/all/20220919072356.GA29069@haolee.io/
>
> Thanks for the poke; I've picked up all three and will place then in
> sched/core.

Thanks!

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

