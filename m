From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH 1/1] sched/rt: avoid contend with CFS task
Date: Thu, 29 Aug 2019 11:38:26 +0100
Message-ID: <d5100b2d-46c4-5811-8274-8b06710d2594@arm.com>
References: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Qais Yousef <qais.yousef@arm.com>
List-Id: linux-mediatek@lists.infradead.org

On 29/08/2019 04:15, Jing-Ting Wu wrote:
> At original linux design, RT & CFS scheduler are independent.
> Current RT task placement policy will select the first cpu in
> lowest_mask, even if the first CPU is running a CFS task.
> This may put RT task to a running cpu and let CFS task runnable.
> 
> So we select idle cpu in lowest_mask first to avoid preempting
> CFS task.
> 

Regarding the RT & CFS thing, that's working as intended. RT is a whole
class above CFS, it shouldn't have to worry about CFS.

On the other side of things, CFS does worry about RT. We have the concept
of RT-pressure in the CFS scheduler, where RT tasks will reduce a CPU's
capacity (see fair.c::scale_rt_capacity()).

CPU capacity is looked at on CFS wakeup (see wake_cap() and
find_idlest_cpu()), and the periodic load balancer tries to spread load
over capacity, so it'll tend to put less things on CPUs that are also
running RT tasks.

If RT were to start avoiding rqs with CFS tasks, we'd end up with a nasty
situation were both are avoiding each other. It's even more striking when
you see that RT pressure is done with a rq-wide RT util_avg, which
*doesn't* get migrated when a RT task migrates. So if you decide to move
a RT task to an idle CPU "B" because CPU "A" had runnable CFS tasks, the
CFS scheduler will keep seeing CPU "B" as not significantly RT-pressured
while that util_avg signal ramps up, whereas it would correctly see CPU
"A" as RT-pressured if the RT task previously ran there.

So overall I think this is the wrong approach.

> Signed-off-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> ---
