Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D77C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuoVx6M9+xNmjh2sJhqvZUd0Sn5Onnf28RspVJUzppM=; b=VMe3oO20vJCsBV
	FKgz0qtwB6ixX6MQLCKxVposVVNcQ9j9WeRs0y3g54Nnjdse7J60/aaC/LZYfzmUA8tnNOUgG7u1X
	G4hDuryP3V1Bwle6gJtonAkQCCxtvwKgEpC0kjiGV0tAMMsL9SdWG1hSZ1nni/GEGqE5S8c0ZjoTG
	unAgGlQ29HyV3qaZbnJmlJY6Staiiu1syCM3lxRAXNJs54yYdjVFvlCLXMk4A6eXuTXclRCcamrJj
	fek2uNHkUaxky+Ip4tgyz3/X4f+g35UjQw9JmUcYm2hRqQgECvUeT3R6ADHm4V4b/Eb/Akqh69us1
	XDHGq6mpu9otjb2e5q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Te-009Xod-N2; Tue, 15 Mar 2022 14:48:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8TQ-009Xib-Tv
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 14:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647355710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJ5sEkSWHWf76ppq8t9x+knf7UP38Iu2uueGoDsX/cc=;
 b=O6k9lkaWYNrQdXJicWZaonUJIVG9tBVVND7+HrXIRFAhRpEJ/ShqMYQvSvqjLg9Ko5jelJ
 s1xjPo3NtgkAbZC1VgRTH+7yppkBEs+yJUJ78yn/n3yhT0kQ0EJvOSfwYtdy8DuXBySKZ1
 WNN1RvOJThTdRJMR347g1RNhWymelkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-fwgZDMIfO3usjcn2rqTcCg-1; Tue, 15 Mar 2022 10:48:27 -0400
X-MC-Unique: fwgZDMIfO3usjcn2rqTcCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A900803D46;
 Tue, 15 Mar 2022 14:48:26 +0000 (UTC)
Received: from [10.22.34.226] (unknown [10.22.34.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5F6140240F;
 Tue, 15 Mar 2022 14:48:25 +0000 (UTC)
Message-ID: <0a3ea370-4743-cfa6-96f8-6eec075820d7@redhat.com>
Date: Tue, 15 Mar 2022 10:48:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] lockdep: Zap lock classes with debug_locks == false again
Content-Language: en-US
To: Cheng Jui Wang <cheng-jui.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>, wsd_upstream@mediatek.com,
 Eason-YH Lin <eason-yh.lin@mediatek.com>,
 Kobe-CP Wu <kobe-cp.wu@mediatek.com>, Jeff-cc Hsu <jeff-cc.hsu@mediatek.com>
References: <20220315112521.29093-1-cheng-jui.wang@mediatek.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220315112521.29093-1-cheng-jui.wang@mediatek.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_074833_117623_F3C9AA20 
X-CRM114-Status: GOOD (  24.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/15/22 07:25, Cheng Jui Wang wrote:
> If a lock_class_key has been registered but lockdep_unregister_key() is
> called with debug_locks == false. The lockdep_unregister_key() will not
> unregister the key and just return without error.
> Users may assume lockdep_unregister_key() always succeed and free the
> lock_class_key even if it is still remained in lockdep structures.
>
> Which lead to following crash when 'cat /proc/lockdep' after
> debug_locks == false:
>
> ==================================================================
> BUG: KASAN: invalid-access in string+0x50/0x10c
> Read at addr f2ffff81ac61c880 by ...
> Pointer tag: [f2], memory tag: [fb]
> ...
> Call trace:
>   dump_backtrace.cfi_jt+0x0/0x8
>   show_stack+0x1c/0x2c
>   dump_stack_lvl+0xd8/0x16c
>   print_address_description+0x90/0x2e8
>   __kasan_report+0x144/0x224
>   kasan_report+0x50/0xa0
>   __do_kernel_fault+0xf4/0x2a8
>   do_bad_area+0x34/0xf8
>   do_tag_check_fault+0x24/0x38
>   do_mem_abort+0x68/0x168
>   el1_abort+0x4c/0x74
>   el1_sync_handler+0x4c/0x8c
>   el1_sync+0x8c/0x140
>   string+0x50/0x10c
>   vsnprintf+0x468/0x69c
>   seq_printf+0x8c/0xd8
>   print_name+0x64/0xf4
>   l_show+0x1a8/0x278
>   seq_read_iter+0x3cc/0x5fc
>   proc_reg_read_iter+0xdc/0x1d4
>   vfs_read+0x2e0/0x354
>   ksys_read+0x7c/0xec
>   __arm64_sys_read+0x20/0x30
>   el0_svc_common.llvm.8008154191216078041+0xd8/0x20c
>   do_el0_svc+0x28/0xa0
>   el0_svc+0x24/0x38
>   el0_sync_handler+0x88/0xec
>   el0_sync+0x1b4/0x1c0
>
> ...
> ==================================================================
>
> Allow lockdep_unregister_key to zap lock classes with
> debug_locks == false again.
> Remove the WARN_ON_ONCE(!found) and only zap lock classes when the key
> can be found.
>
> Fixes: 8b39adbee805 ("locking/lockdep: Make lockdep_unregister_key() honor 'debug_locks' again")
> Signed-off-by: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
> ---
>   kernel/locking/lockdep.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index f8a0212189ca..90dadecb2577 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -6305,8 +6305,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
>   		return;
>   
>   	raw_local_irq_save(flags);
> -	if (!graph_lock())
> -		goto out_irq;
> +	lockdep_lock();
>   
>   	pf = get_pending_free();
>   	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> @@ -6316,11 +6315,11 @@ void lockdep_unregister_key(struct lock_class_key *key)
>   			break;
>   		}
>   	}
> -	WARN_ON_ONCE(!found);
> -	__lockdep_free_key_range(pf, key, 1);
> -	call_rcu_zapped(pf);
> -	graph_unlock();
> -out_irq:
> +	if (found) {
> +		__lockdep_free_key_range(pf, key, 1);
> +		call_rcu_zapped(pf);
> +	}
> +	lockdep_unlock();
>   	raw_local_irq_restore(flags);
>   
>   	/* Wait until is_dynamic_key() has finished accessing k->hash_entry. */

Thanks for the patch.

However, this is a known problem and had been fixed by commit 
61cc4534b655 ("locking/lockdep: Avoid potential access of invalid memory 
in lock_class") in the tip tree. It will get merged into v5.18 kernel.

Cheers,
Longman


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
