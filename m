Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0183C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RDn8z28hECYxtXc54XaSHZdmkH82HxCmagRFR6jhFwE=; b=WnCh4cwqp7kiHi
	zYCI/4o4fmwbYEXwrGEnO6JTIocyoHTfnOUbTq1Csln76a3YMyOXPb0/7OSlkWVdyiN8V9WzuYVR0
	sAZocVq5pSciRN26t0r+VMHwjO6rLuH8IUNOncsQfYsFCRwNecZ47qQAj28h7fVqxxxOG/GfU98Ru
	E3Z5izz8KlKFQMq8yNyCiksdqih+qV7l3x2B2RHYf4ol3gNUlVArAL7bjryB33ihhY+CCsL5oECFO
	9hVxPmIVE2ckjJbujWDkCLiitYG772nEcQMpEZyR/rbRDij8TpcaBbbmfSvbCQwVLkbiLuDzAgIqX
	smNxdQrI1+EVlYTkp35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfm5-006qQ2-O5; Thu, 19 May 2022 13:01:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfi4-006nxH-JM; Thu, 19 May 2022 12:56:58 +0000
X-UUID: f08d661c340643fd92fbda41de4e3295-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:e3ffdc0d-6a4b-450c-bb92-a4cce47e05fe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:da96df79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f08d661c340643fd92fbda41de4e3295-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jing-ting.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1677579923; Thu, 19 May 2022 05:56:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 05:53:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 20:53:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 20:53:15 +0800
Message-ID: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
Subject: [Bug] Race condition between CPU hotplug off flow and
 __sched_setscheduler()
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>, Daniel Bristot de Oliveira
 <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>,
 <tglx@linutronix.de>
CC: <wsd_upstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Jonathan.JMChen@mediatek.com>, "chris.redpath@arm.com"
 <chris.redpath@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Vincent
 Donnefort <vdonnefort@gmail.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel Gorman"
 <mgorman@suse.de>, Christian Brauner <brauner@kernel.org>
Date: Thu, 19 May 2022 20:53:15 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_055656_682646_D91515EC 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

Hi all


There is a race condition between CPU hotplug off flow and
__sched_setscheduler(), which will cause hang-up in CPU hotplug off
flow.

Syndrome:
During hotplug off flow in CPU_A, it blocks on
CPUHP_AP_SCHED_WAIT_EMPTY state when enters rcuwait_wait_event().
In that moment, CPU_A stays in idle and cannot wake up stopper
thread(cpuhp/A) to continue CPU_A hotplug off flow.

Root cause:
Balance_push() callback has been stolen by CPU_B in executing
__sched_setscheduler() func., which should be executed in idle task of
CPU_A to wake up stopper thread (cpuhp/A) through calling
rcuwait_wake_up(&rq->hotplug_wait).

Racing flow as below:
CPU_A is going to hotplug off and set rq->balance_callback =
&balance_push_callback, then CPU_A should use balance_push() to push
the task out and release rq_lock.
But if CPU_B do __sched_setscheduler() before CPU_A switch to
swapper/A, CPU_B use splice_balance_callbacks() to steal rq-
>balance_callback and set the CPU_A rq->balance_callback = NULL.
Due to rq->balance_callback is NULL,
so swapper/A could not do balance_push() at CPU_A,
Due to rq(rq_A) != this_rq(rq_B),
so swapper/A could not do rcuwait_wake_up() at CPU_B.


Racing flow:
-----------------------------------------------------------------------
CPU_A (Hotplug down)                          
-----------------------------------------------------------------------
State: CPUHP_AP_ACTIVE
sched_cpu_deactivate()
-> balance_push_set(cpu, true)
   -> rq_A->balance_callback = &balance_push_callback
      => CPU_A set rq_A balance_callback here.
                                
State: CPUHP_AP_SCHED_WAIT_EMPTY
sched_cpu_wait_empty()
-> balance_hotplug_wait()
   -> rcuwait_wait_event(&rq->hotplug_wait)
      => CPU_A do while loop to push task out from CPU_A,
         until swapper/A wake up cpuhp/A.
      -> schedule()
         -> rq_lock(rq, &rf)
            -> context_switch() 
              -> finish_lock_switch()
                 -> __balance_callbacks(rq_A)
                    -> do_balance_callbacks(rq,
                                      splice_balance_callbacks(rq))
                       -> balance_push(rq_A)
                 -> raw_spin_rq_unlock_irq(rq_A)
                    => CPU_A release rq_A lock.

CPU_A release rq_A lock, CPU_B can get rq_A lock.

-----------------------------------------------------------------------
CPU_B (do __sched_setscheduler(), set rq_A->balance_callback = NULL)
-----------------------------------------------------------------------
__sched_setscheduler(p) => task_rq(p) is rq_A
-> task_rq_lock(rq_A)
  -> splice_balance_callbacks(rq_A)
     -> if (head)
           rq_A->balance_callback = NULL
           => CPU_B steal rq_A->balance_callback.
     -> task_rq_unlock(rq_A)


CPU_B release rq_A lock, CPU_A can get rq_A lock and switch to
swapper/A.

-----------------------------------------------------------------------
CPU_A (Hotplug down)                           
-----------------------------------------------------------------------
switch to swapper/A:
schedule()
-> rq_lock(rq, &rf)
   -> context_switch()                                     
      -> finish_lock_switch()
         -> __balance_callbacks(rq_A)
            -> do_balance_callbacks(rq, NULL) 
               => Because rq_A->balance_callback = NULL,
                  swapper/A could not do rcuwait_wake_up().
         -> raw_spin_rq_unlock_irq(rq_A)   

-----------------------------------------------------------------------
CPU_B (do __sched_setscheduler(), set rq_A->balance_callback = NULL) 
-----------------------------------------------------------------------
balance_callbacks(rq_A, head)
-> balance_push(rq_A)
   -> rq->balance_callback = &balance_push_callback;
     -> if (rq != this_rq())
           return;
           => Because rq = rq_A, this_rq = rq_B,
              swapper/A could not do rcuwait_wake_up().

-----------------------------------------------------------------------
CPU_A (Hotplug down)                           
-----------------------------------------------------------------------
rcuwait_wait_event(&rq->hotplug_wait)
=> swapper/A could not do rcuwait_wake_up(),
   it cannot wake up stopper thread(cpuhp/A),
   so system could not exit the while loop at rcuwait_wait_event.




Do you have any suggestion or solution for this issue?
Thank you.



Best regards,
Jing-Ting Wu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
