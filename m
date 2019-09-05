From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/1] sched/rt: avoid contend with CFS task
Date: Thu, 5 Sep 2019 16:01:51 +0200
Message-ID: <CAKfTPtC3txstND=6YkWBJ16i06cQ7xueUpD5j-j-UfuSf0-z-g@mail.gmail.com>
References: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
 <d5100b2d-46c4-5811-8274-8b06710d2594@arm.com> <20190830145501.zadfv2ffuu7j46ft@e107158-lin.cambridge.arm.com>
 <1567689999.2389.5.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567689999.2389.5.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Qais Yousef <qais.yousef@arm.com>, Valentin Schneider <valentin.schneider@arm.com>, Peter Zijlstra <peterz@infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, wsd_upstream@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Jing-Ting,

On Thu, 5 Sep 2019 at 15:26, Jing-Ting Wu <jing-ting.wu@mediatek.com> wrote:
>
> On Fri, 2019-08-30 at 15:55 +0100, Qais Yousef wrote:
> > On 08/29/19 11:38, Valentin Schneider wrote:
> > > On 29/08/2019 04:15, Jing-Ting Wu wrote:
> > > > At original linux design, RT & CFS scheduler are independent.
> > > > Current RT task placement policy will select the first cpu in
> > > > lowest_mask, even if the first CPU is running a CFS task.
> > > > This may put RT task to a running cpu and let CFS task runnable.
> > > >
> > > > So we select idle cpu in lowest_mask first to avoid preempting
> > > > CFS task.
> > > >
> > >
> > > Regarding the RT & CFS thing, that's working as intended. RT is a whole
> > > class above CFS, it shouldn't have to worry about CFS.
> > >
> > > On the other side of things, CFS does worry about RT. We have the concept
> > > of RT-pressure in the CFS scheduler, where RT tasks will reduce a CPU's
> > > capacity (see fair.c::scale_rt_capacity()).
> > >
> > > CPU capacity is looked at on CFS wakeup (see wake_cap() and
> > > find_idlest_cpu()), and the periodic load balancer tries to spread load
> > > over capacity, so it'll tend to put less things on CPUs that are also
> > > running RT tasks.
> > >
> > > If RT were to start avoiding rqs with CFS tasks, we'd end up with a nasty
> > > situation were both are avoiding each other. It's even more striking when
> > > you see that RT pressure is done with a rq-wide RT util_avg, which
> > > *doesn't* get migrated when a RT task migrates. So if you decide to move
> > > a RT task to an idle CPU "B" because CPU "A" had runnable CFS tasks, the
> > > CFS scheduler will keep seeing CPU "B" as not significantly RT-pressured
> > > while that util_avg signal ramps up, whereas it would correctly see CPU
> > > "A" as RT-pressured if the RT task previously ran there.
> > >
> > > So overall I think this is the wrong approach.
> >
> > I like the idea, but yeah tend to agree the current approach might not be
> > enough.
> >
> > I think the major problem here is that on generic systems where CFS is a first
> > class citizen, RT tasks can be hostile to them - not always necessarily for a
> > good reason.
> >
> > To further complicate the matter, even among CFS tasks we can't tell which are
> > more important than the others - though hopefully latency-nice proposal will
> > make the situation better.
> >
> > So I agree we have a problem here, but I think this patch is just a temporary
> > band aid and we need to do better. Though I have no concrete suggestion yet on
> > how to do that.
> >
> > Another thing I couldn't quantify yet how common and how severe this problem is
> > yet. Jing-Ting, if you can share the details of your use case that'd be great.
> >
> > Cheers
> >
> > --
> > Qais Yousef
>
>
> I agree that the nasty situation will happen.The current approach and this patch might not be enough.

RT task should not harm its cache hotness and responsiveness for the
benefit of a CFS task

> But for requirement of performance, I think it is better to differentiate between idle CPU and CPU has CFS task.
>
> For example, we use rt-app to evaluate runnable time on non-patched environment.
> There are (NR_CPUS-1) heavy CFS tasks and 1 RT Task. When a CFS task is running, the RT task wakes up and choose the same CPU.
> The CFS task will be preempted and keep runnable until it is migrated to another cpu by load balance.
> But load balance is not triggered immediately, it will be triggered until timer tick hits with some condition satisfied(ex. rq->next_balance).

Yes you will have to wait for the next tick that will trigger an idle
load balance because you have an idle cpu and 2 runnable tack (1 RT +
1CFS) on the same CPU. But you should not wait for more than  1 tick

The current load_balance doesn't handle correctly the situation of 1
CFS and 1 RT task on same CPU while 1 CPU is idle. There is a rework
of the load_balance that is under review on the mailing list that
fixes this problem and your CFS task should migrate to the idle CPU
faster than now

> CFS tasks may be runnable for a long time. In this test case, it increase 332.091 ms runnable time for CFS task.
>
> The detailed log is shown as following, CFS task(thread1-6580) is preempted by RT task(thread0-6674) about 332ms:

332ms is quite long and is probably not an idle load blanace but a
busy load balance

> thread1-6580  [003] dnh2    94.452898: sched_wakeup: comm=thread0 pid=6674 prio=89 target_cpu=003
> thread1-6580  [003] d..2    94.452916: sched_switch: prev_comm=thread1 prev_pid=6580 prev_prio=120 prev_state=R ==> next_comm=thread0 next_pid=6674 next_prio=89
> .... 332.091ms
> krtatm-1930  [001] d..2    94.785007: sched_migrate_task: comm=thread1 pid=6580 prio=120 orig_cpu=3 dest_cpu=1
> krtatm-1930  [001] d..2    94.785020: sched_switch: prev_comm=krtatm prev_pid=1930 prev_prio=100 prev_state=S ==> next_comm=thread1 next_pid=6580 next_prio=120

your CFS task has not moved on the idle CPU but has replaced another task

Regards,
Vincent
>
> So I think choose idle CPU at RT wake up flow could reduce the CFS runnable time.
>
>
> Best regards,
> Jing-Ting Wu
>
>
