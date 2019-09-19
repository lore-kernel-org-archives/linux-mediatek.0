From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/1] sched/eas: introduce system-wide overutil indicator
Date: Thu, 19 Sep 2019 10:00:13 +0200
Message-ID: <CAKfTPtBFQJKmr0tw6_mA5OLsDu=HE+f4nFgZLGd4vv8dvyiubg@mail.gmail.com>
References: <1568877622-28073-1-git-send-email-yt.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568877622-28073-1-git-send-email-yt.chang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YT Chang <yt.chang@mediatek.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, wsd_upstream@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 19 Sep 2019 at 09:20, YT Chang <yt.chang@mediatek.com> wrote:
>
> When the system is overutilization, the load-balance crossing

s/overutilization/overutilized/

> clusters will be triggered and scheduler will not use energy
> aware scheduling to choose CPUs.
>
> The overutilization means the loading of  ANY CPUs

s/ANY/any/

> exceeds threshold (80%).
>
> However, only 1 heavy task or while-1 program will run on highest
> capacity CPUs and it still result to trigger overutilization. So
> the system will not use Energy Aware scheduling.
>
> To avoid it, a system-wide over-utilization indicator to trigger
> load-balance cross clusters.

The current rd->overutilized is already system wide. I mean that as
soon as one CPU is overutilized, the whole system is considered as
overutilized whereas you would like a finer grain level of
overutilization.
I remember a patch that was proposing a per sched_domain
overutilization detection. The load_balance at one sched_domain level
was enabled only if the child level was not able to handle the
overutilization and the energy aware scheduling was still used in the
other sched_domain

>
> The policy is:
>         The loading of "ALL CPUs in the highest capacity"
>                                                 exceeds threshold(80%) or
>         The loading of "Any CPUs not in the highest capacity"
>                                                 exceed threshold(80%)

Do you have UCs or figures that show a benefit with this change ?

>
> Signed-off-by: YT Chang <yt.chang@mediatek.com>
> ---
>  kernel/sched/fair.c | 76 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 11 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 036be95..f4c3d70 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5182,10 +5182,71 @@ static inline bool cpu_overutilized(int cpu)
>  static inline void update_overutilized_status(struct rq *rq)
>  {
>         if (!READ_ONCE(rq->rd->overutilized) && cpu_overutilized(rq->cpu)) {
> -               WRITE_ONCE(rq->rd->overutilized, SG_OVERUTILIZED);
> -               trace_sched_overutilized_tp(rq->rd, SG_OVERUTILIZED);
> +               if (capacity_orig_of(cpu_of(rq)) < rq->rd->max_cpu_capacity) {
> +                       WRITE_ONCE(rq->rd->overutilized, SG_OVERUTILIZED);
> +                       trace_sched_overutilized_tp(rq->rd, SG_OVERUTILIZED);
> +               }
>         }
>  }
> +
> +static
> +void update_system_overutilized(struct sched_domain *sd, struct cpumask *cpus)
> +{
> +       unsigned long group_util;
> +       bool intra_overutil = false;
> +       unsigned long max_capacity;
> +       struct sched_group *group = sd->groups;
> +       struct root_domain *rd;
> +       int this_cpu;
> +       bool overutilized;
> +       int i;
> +
> +       this_cpu = smp_processor_id();
> +       rd = cpu_rq(this_cpu)->rd;
> +       overutilized = READ_ONCE(rd->overutilized);
> +       max_capacity = rd->max_cpu_capacity;
> +
> +       do {
> +               group_util = 0;
> +               for_each_cpu_and(i, sched_group_span(group), cpus) {
> +                       group_util += cpu_util(i);
> +                       if (cpu_overutilized(i)) {
> +                               if (capacity_orig_of(i) < max_capacity) {
> +                                       intra_overutil = true;
> +                                       break;
> +                               }
> +                       }
> +               }
> +
> +               /*
> +                * A capacity base hint for over-utilization.
> +                * Not to trigger system overutiled if heavy tasks
> +                * in Big.cluster, so
> +                * add the free room(20%) of Big.cluster is impacted which means
> +                * system-wide over-utilization,
> +                * that considers whole cluster not single cpu
> +                */
> +               if (group->group_weight > 1 && (group->sgc->capacity * 1024 <
> +                                               group_util * capacity_margin)) {
> +                       intra_overutil = true;
> +                       break;
> +               }
> +
> +               group = group->next;
> +
> +       } while (group != sd->groups && !intra_overutil);
> +
> +       if (overutilized != intra_overutil) {
> +               if (intra_overutil == true) {
> +                       WRITE_ONCE(rd->overutilized, SG_OVERUTILIZED);
> +                       trace_sched_overutilized_tp(rd, SG_OVERUTILIZED);
> +               } else {
> +                       WRITE_ONCE(rd->overutilized, 0);
> +                       trace_sched_overutilized_tp(rd, 0);
> +               }
> +       }
> +}
> +
>  #else
>  static inline void update_overutilized_status(struct rq *rq) { }
>  #endif
> @@ -8242,15 +8303,6 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>
>                 /* update overload indicator if we are at root domain */
>                 WRITE_ONCE(rd->overload, sg_status & SG_OVERLOAD);
> -
> -               /* Update over-utilization (tipping point, U >= 0) indicator */
> -               WRITE_ONCE(rd->overutilized, sg_status & SG_OVERUTILIZED);
> -               trace_sched_overutilized_tp(rd, sg_status & SG_OVERUTILIZED);
> -       } else if (sg_status & SG_OVERUTILIZED) {
> -               struct root_domain *rd = env->dst_rq->rd;
> -
> -               WRITE_ONCE(rd->overutilized, SG_OVERUTILIZED);
> -               trace_sched_overutilized_tp(rd, SG_OVERUTILIZED);
>         }
>  }
>
> @@ -8476,6 +8528,8 @@ static struct sched_group *find_busiest_group(struct lb_env *env)
>          */
>         update_sd_lb_stats(env, &sds);
>
> +       update_system_overutilized(env->sd, env->cpus);

This should be called only if (sched_energy_enabled())

> +
>         if (sched_energy_enabled()) {
>                 struct root_domain *rd = env->dst_rq->rd;
>
> --
> 1.9.1
>
