Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C60ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOjFY7tNKFL7dFNVA6yx/TeGWvfp5wOKn+I8yQQqSS4=; b=Ph98sxsHOn2ZHSB8fWzwdcH+kM
	QZbeVD8q4rLYTm8sfWDJmuYfE+5X0UGWz4/GAu31i63HVpkyRGkkYD8FwurfSXKdmAkw1kKTJXjgU
	ZVNRLeUA42uIw6mNqZaQ6oVtxJCzVHX9zingOiY4acxM0LUE49qdnsd3eIR6ghC5ZlZSh9JL0ykFL
	jlFaJhYtH2skQx0DDl+4ReM9QdqidrY+Yo9PzzWO2hnI7iIfBmk6D59hRjJRL8CgeFDAAs9FA7T++
	57SooO/AzcF5WFLRk/U0gXXURaoSNJf+k+0ln17dQHpf9TL+J9Mlf98zmRp5zk6+2HRJ5tWlcI/oa
	tNYvRaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfiI-00HLQ0-2J; Tue, 06 Sep 2022 21:02:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfiF-00HLNx-69
	for linux-mediatek@lists.infradead.org; Tue, 06 Sep 2022 21:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662498145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOjFY7tNKFL7dFNVA6yx/TeGWvfp5wOKn+I8yQQqSS4=;
	b=Ju1onuYKug+swmkdBSR2v9LEcsyecazwiRANYZ+KIu+KoHu6PWTbDpqtyuxhN05GZ9v+8L
	13I/ulcBuKPc5Lk+yG/+l8MbFAbHj6oopJ3q/DZ4KhH3wjohejS6VB/V48CeyOpVsCLI9I
	8gBMWMaF0AY/0KNEyOGFqYstH12kp1M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-WupwlPYUPr2I2vTup4ohvA-1; Tue, 06 Sep 2022 17:02:22 -0400
X-MC-Unique: WupwlPYUPr2I2vTup4ohvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 792CC1C05EAC;
	Tue,  6 Sep 2022 21:02:21 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C17CEC15BC3;
	Tue,  6 Sep 2022 21:02:20 +0000 (UTC)
Message-ID: <879886ba-7d77-11fc-5357-b21e141637ef@redhat.com>
Date: Tue, 6 Sep 2022 17:02:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, Jing-Ting Wu <jing-ting.wu@mediatek.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Valentin Schneider <vschneid@redhat.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
 "chris.redpath@arm.com" <chris.redpath@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Vincent Donnefort <vdonnefort@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Christian Brauner <brauner@kernel.org>,
 cgroups@vger.kernel.org, lixiong.liu@mediatek.com, wenju.xu@mediatek.com
References: <88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com>
 <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
 <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
 <YxeR0RoiTdm8sWCJ@slm.duckdns.org>
 <02b8e7b3-941d-8bb9-cd0e-992738893ba3@redhat.com>
 <36a73401-7011-834a-7949-c65a2f66246c@redhat.com>
 <YxeylMvgc/wKcJqk@hirez.programming.kicks-ass.net>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <YxeylMvgc/wKcJqk@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_140227_322940_A742315A 
X-CRM114-Status: GOOD (  18.76  )
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


On 9/6/22 16:50, Peter Zijlstra wrote:
> On Tue, Sep 06, 2022 at 04:40:03PM -0400, Waiman Long wrote:
>
> I've not followed the earlier stuff due to being unreadable; just
> reacting to this..
>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 838623b68031..5d9ea1553ec0 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -2794,9 +2794,9 @@ static int __set_cpus_allowed_ptr_locked(struct
>> task_struct *p,
>>                  if (cpumask_equal(&p->cpus_mask, new_mask))
>>                          goto out;
>>
>> -               if (WARN_ON_ONCE(p == current &&
>> -                                is_migration_disabled(p) &&
>> -                                !cpumask_test_cpu(task_cpu(p), new_mask)))
>> {
>> +               if (is_migration_disabled(p) &&
>> +                   !cpumask_test_cpu(task_cpu(p), new_mask)) {
>> +                       WARN_ON_ONCE(p == current);
>>                          ret = -EBUSY;
>>                          goto out;
>>                  }
>> @@ -2818,7 +2818,11 @@ static int __set_cpus_allowed_ptr_locked(struct
>> task_struct *p,
>>          if (flags & SCA_USER)
>>                  user_mask = clear_user_cpus_ptr(p);
>>
>> -       ret = affine_move_task(rq, p, rf, dest_cpu, flags);
>> +       if (!is_migration_disabled(p) || (flags & SCA_MIGRATE_ENABLE)) {
>> +               ret = affine_move_task(rq, p, rf, dest_cpu, flags);
>> +       } else {
>> +               task_rq_unlock(rq, p, rf);
>> +       }
> This cannot be right. There might be previous set_cpus_allowed_ptr()
> callers that are blocked and waiting for the task to land on a valid
> CPU.

You are probably right. I haven't fully understand all the migration 
disable code yet. However, if migration is disabled, there are some 
corner cases we need to handle properly.

Cheers,
Longman


