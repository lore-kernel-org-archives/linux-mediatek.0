Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC090C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/e61zul7HNCHKUCokTMpB1fZU2sjgcjzI//4g1OuSI=; b=uGAiXUb4MJSBPfOOnOibCdQm8c
	IkBUv/gN8iL6ukag8idrCmx8dlVzScl8++CTj1EaD3obBjanPlkQ0fMY7L9UmdznbpAsDc7X8g/gg
	GJI2+Dgr/Li7IAjIVsLd6EXKvgdFEoPRdmnMAzKFbFvXa4W8ctMNRcMf3Ku0RlxF/eyZHpmx9Pubo
	FEfGXr3QHJq5+2mcBdS8Xs8T1T+WiOG3CKR8Pr2RKBUO2Nyi3jxgnBpUuj3jfZwZUu6x7xTSThIWJ
	9JUNaI1TFIyqjl1I8TcKGiwagT3bhR8rLvA4B0WXQNz/xYSD87YhipUbxUO1882BboNJyHLQhkU4I
	8K5vhDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvEj-003ne5-Ds; Thu, 29 Sep 2022 15:14:05 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvEg-003nbH-Hr; Thu, 29 Sep 2022 15:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664464442; x=1696000442;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=G/e61zul7HNCHKUCokTMpB1fZU2sjgcjzI//4g1OuSI=;
  b=jkcyR1zvovkppHE/uWFXTX5qV8EjUz+smI/QZRvIjn0oR3jmF6+3ziiI
   ux8zphqAdALOrAK0lqXpUM9YzQ2H//winaKwIkgLk+IVP26nZbTwXOLmk
   B6cjbOJKplKNXO9d9O8tus+IF4Gr7VDKETCrWNCAb3PpMFqqhae1MRja8
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Sep 2022 08:13:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 08:13:56 -0700
Received: from [10.216.55.35] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 29 Sep
 2022 08:13:47 -0700
Message-ID: <cdb597d4-6543-3e34-cbbd-6a776b0d6581@quicinc.com>
Date: Thu, 29 Sep 2022 20:43:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Content-Language: en-US
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>
CC: Tejun Heo <tj@kernel.org>, Jing-Ting Wu <jing-ting.wu@mediatek.com>,
	Valentin Schneider <vschneid@redhat.com>, <wsd_upstream@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <Jonathan.JMChen@mediatek.com>,
	"chris.redpath@arm.com" <chris.redpath@arm.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Vincent Donnefort <vdonnefort@gmail.com>, Ingo
 Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Christian
 Brauner <brauner@kernel.org>, <cgroups@vger.kernel.org>,
	<lixiong.liu@mediatek.com>, <wenju.xu@mediatek.com>
References: <88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com>
 <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
 <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
 <YxeR0RoiTdm8sWCJ@slm.duckdns.org>
 <02b8e7b3-941d-8bb9-cd0e-992738893ba3@redhat.com>
 <36a73401-7011-834a-7949-c65a2f66246c@redhat.com>
 <YxeylMvgc/wKcJqk@hirez.programming.kicks-ass.net>
 <e6153b89-1f41-3fff-241b-a767e41a1e7e@quicinc.com>
In-Reply-To: <e6153b89-1f41-3fff-241b-a767e41a1e7e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_081402_664540_02A4A500 
X-CRM114-Status: GOOD (  23.45  )
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

Hi All,

On 9/23/2022 7:50 PM, Mukesh Ojha wrote:
> Hi Peter,
> 
> 
> On 9/7/2022 2:20 AM, Peter Zijlstra wrote:
>> On Tue, Sep 06, 2022 at 04:40:03PM -0400, Waiman Long wrote:
>>
>> I've not followed the earlier stuff due to being unreadable; just
>> reacting to this..
> 
> We are able to reproduce this issue explained at this link
> 
> https://lore.kernel.org/lkml/88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com/ 
> 
> 
> 
>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 838623b68031..5d9ea1553ec0 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -2794,9 +2794,9 @@ static int __set_cpus_allowed_ptr_locked(struct
>>> task_struct *p,
>>>                  if (cpumask_equal(&p->cpus_mask, new_mask))
>>>                          goto out;
>>>
>>> -               if (WARN_ON_ONCE(p == current &&
>>> -                                is_migration_disabled(p) &&
>>> -                                !cpumask_test_cpu(task_cpu(p), 
>>> new_mask)))
>>> {
>>> +               if (is_migration_disabled(p) &&
>>> +                   !cpumask_test_cpu(task_cpu(p), new_mask)) {
>>> +                       WARN_ON_ONCE(p == current);
>>>                          ret = -EBUSY;
>>>                          goto out;
>>>                  }
>>> @@ -2818,7 +2818,11 @@ static int __set_cpus_allowed_ptr_locked(struct
>>> task_struct *p,
>>>          if (flags & SCA_USER)
>>>                  user_mask = clear_user_cpus_ptr(p);
>>>
>>> -       ret = affine_move_task(rq, p, rf, dest_cpu, flags);
>>> +       if (!is_migration_disabled(p) || (flags & SCA_MIGRATE_ENABLE)) {
>>> +               ret = affine_move_task(rq, p, rf, dest_cpu, flags);
>>> +       } else {
>>> +               task_rq_unlock(rq, p, rf);
>>> +       }
>>
>> This cannot be right. There might be previous set_cpus_allowed_ptr()
>> callers that are blocked and waiting for the task to land on a valid
>> CPU.
>>
> 
> Was thinking if just skipping as below will help here, well i am not sure .
> 
> But thinking what if we keep the task as it is on the same cpu and let's 
> wait for migration to be enabled for the task to take care of it later.
> 
> ------------------->O------------------------------------------
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d90d37c..7717733 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2390,8 +2390,10 @@ static int migration_cpu_stop(void *data)
>           * we're holding p->pi_lock.
>           */
>          if (task_rq(p) == rq) {
> -               if (is_migration_disabled(p))
> +               if (is_migration_disabled(p)) {
> +                       complete = true;
>                          goto out;
> +               }
> 
>                  if (pending) {
> 

Any suggestion on this bug ?


-Mukesh

