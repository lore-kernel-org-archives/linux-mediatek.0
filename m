From: Qais Yousef <qais.yousef@arm.com>
Subject: Re: [PATCH 1/1] sched/rt: avoid contend with CFS task
Date: Thu, 19 Sep 2019 15:23:16 +0100
Message-ID: <20190919142315.vmrrpvljpspqpurp@e107158-lin.cambridge.arm.com>
References: <1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com>
 <d5100b2d-46c4-5811-8274-8b06710d2594@arm.com>
 <20190830145501.zadfv2ffuu7j46ft@e107158-lin.cambridge.arm.com>
 <1567689999.2389.5.camel@mtkswgap22>
 <CAKfTPtC3txstND=6YkWBJ16i06cQ7xueUpD5j-j-UfuSf0-z-g@mail.gmail.com>
 <1568892135.4892.10.camel@mtkswgap22>
 <CAKfTPtCuWrpW_o6r5cmGhLf_84PFHJhBk0pJ3fcbU_YgcBnTkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtCuWrpW_o6r5cmGhLf_84PFHJhBk0pJ3fcbU_YgcBnTkQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: wsd_upstream@mediatek.com, Peter Zijlstra <peterz@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Jing-Ting Wu <jing-ting.wu@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On 09/19/19 14:27, Vincent Guittot wrote:
> > > > But for requirement of performance, I think it is better to differentiate between idle CPU and CPU has CFS task.
> > > >
> > > > For example, we use rt-app to evaluate runnable time on non-patched environment.
> > > > There are (NR_CPUS-1) heavy CFS tasks and 1 RT Task. When a CFS task is running, the RT task wakes up and choose the same CPU.
> > > > The CFS task will be preempted and keep runnable until it is migrated to another cpu by load balance.
> > > > But load balance is not triggered immediately, it will be triggered until timer tick hits with some condition satisfied(ex. rq->next_balance).
> > >
> > > Yes you will have to wait for the next tick that will trigger an idle
> > > load balance because you have an idle cpu and 2 runnable tack (1 RT +
> > > 1CFS) on the same CPU. But you should not wait for more than  1 tick
> > >
> > > The current load_balance doesn't handle correctly the situation of 1
> > > CFS and 1 RT task on same CPU while 1 CPU is idle. There is a rework
> > > of the load_balance that is under review on the mailing list that
> > > fixes this problem and your CFS task should migrate to the idle CPU
> > > faster than now
> > >
> >
> > Period load balance should be triggered when current jiffies is behind
> > rq->next_balance, but rq->next_balance is not often exactly the same
> > with next tick.
> > If cpu_busy, interval = sd->balance_interval * sd->busy_factor, and
> 
> But if there is an idle CPU on the system, the next idle load balance
> should apply shortly because the busy_factor is not used for this CPU
> which is  not busy.
> In this case, the next_balance interval is sd_weight which is probably
> 4ms at cluster level and 8ms at system level in your case. This means
> between 1 and 2 ticks

But if the CFS task we're preempting was latency sensitive - this 1 or 2 tick
is too late of a recovery.

So while it's good we recover, but a preventative approach would be useful too.
Just saying :-) I'm still not sure if this is the best longer term approach.

--
Qais Yousef
