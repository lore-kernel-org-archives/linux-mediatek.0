Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB6B6124F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECB6B6124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VrK/eXhBzKoDfSJcmB7jRi81dY9ITQWRR+EMXqNkSs=; b=Z2zBitZNY4ywcN
	mOLk3H6iodGS8vhQ+RE+A9dFkklVSLbqACsWLBmE+7mvPuqwDqSMBT2LyA6aaygiU7a2wI2QWxyT/
	ovmVJ5BMfHQLbEp54ZVopFXe25DctyfB6qjz0Jy5d4546u0HPB1g5EqK1NPzRt0vqxRxQ5UfkjpIa
	2XmtBUNWI/ig83ePJrFdju/ZWRd1p4Kipj+4lajqwa3PI5zysuIKdvMfKmce5ubhQeaGyqOOGJFQz
	azP27/o+UB4yJaGWB7Tzdz6lsGrqofjpNR21uvIming591oMesQMlNO/FAWXQsD/st7NQ07/C1dO9
	ClSzzvlaFo8wRc5Hr/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmFq-00EqRg-3w; Fri, 24 Sep 2021 14:32:46 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmFg-00EqPL-5s
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 14:32:37 +0000
Received: by mail-yb1-xb33.google.com with SMTP id m70so6167990ybm.5
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Sep 2021 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCjQZcVJmjPWZioCoH0GfM/uPKlpTelBzg4TO/HnFhI=;
 b=UYF+YUVwUcVhe3APQrnO15JByJbbU4EgOO2uJm9IYny9sOz2Wp3B4ktp3/XRxtjVA8
 LBLncoyj+R0eNm3k6f5LScAiuSvA2alqziPikFWG5qzp8NiIki0ikLwVXSHI7SEEvj9N
 YHxy21e6PDoCCr+vpzcgFuicZxW9Dgb5vzRVF15J2YkqQ3D3NL/6Z9DD/oVISSgYzRxr
 NQI8iiMp/cm5D2D6dCMqhGzcOT2lus24afyFKjnYVae+V88oThBgR2fuwpgZfIVnsZmo
 PGj6j4m6SaiFEMr+vPK3ozX2nHJG445XF08IdhB+bOwbScZc4KcdXDWqnz+asjRexSNY
 SYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCjQZcVJmjPWZioCoH0GfM/uPKlpTelBzg4TO/HnFhI=;
 b=6Kil2Un+ANJpB6jC8znbVOHQv+vsEDzEmQqEjk7E1KFRwbyvPzZkKeS8FVaxbjNxj9
 XIHhzWJcao0NRQgqW8P6iEBivDr0Bt/EPg+hfatIj8dIl1d5ZN3zl3IGEMsxN8ShGEFq
 fDU3L9hMSA4SFGpOXRPgtFucx7O8AHbnusiNG0bFX4ZTX3taJxagUSlQFw/eEPX5WRO9
 j04qFyZHu2jEfWG13Augiu7dGFlrmuSI0Tf4ZXc3GXPlc4Ey+hbzfbS9vXKDmhJZJlpN
 x+70VRuX2S5kzLiKhXQt35ID9CDoJXdoj1gM0N8PfwJe7u8JGtZG7HStBoXKXZf/PfAC
 dORw==
X-Gm-Message-State: AOAM532ONwBCHgIBWRnpouXdocfZ5DK+wE9Mr6cgzgNIpn9je5tgf36e
 loC5j8f4CEPV8PDyg2DCXhXXJmEAaX+MHc7c8Irxtw==
X-Google-Smtp-Source: ABdhPJzIlLF34YGWfPvgQ9nBPguvg4Rp0wtZnARw0kUV7S/YfbpAZoEuMNhdGf3E0DXLWY87heVqiceD4P05RLyXKcU=
X-Received: by 2002:a5b:286:: with SMTP id x6mr12728856ybl.59.1632493950045;
 Fri, 24 Sep 2021 07:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210923095316.13867-1-yee.lee@mediatek.com>
In-Reply-To: <20210923095316.13867-1-yee.lee@mediatek.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 24 Sep 2021 07:32:19 -0700
Message-ID: <CABCJKudkcxtDX89hXRTv7osFOxqMsvv=OK5BpcO4-xPHrQB9dg@mail.gmail.com>
Subject: Re: [PATCH] scs: Release kasan vmalloc poison in scs_free process
To: yee.lee@mediatek.com
Cc: LKML <linux-kernel@vger.kernel.org>, nicholas.Tang@mediatek.com, 
 Kuan-Ying.lee@mediatek.com, chinwen.chang@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_073236_233339_481C7312 
X-CRM114-Status: GOOD (  19.43  )
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

Hi,

On Thu, Sep 23, 2021 at 2:53 AM <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Since scs allocation has been moved to vmalloc region, the
> shadow stack is protected by kasan_posion_vmalloc.
> However, the vfree_atomic operation needs to access
> its context for scs_free process and causes kasan error
> as the dump info below.
>
> This patch Adds kasan_unpoison_vmalloc() before vfree_atomic,
> which aligns to the prior flow as using kmem_cache.
> The vmalloc region will go back posioned in the following
> vumap() operations.
>
>  ==================================================================
>  BUG: KASAN: vmalloc-out-of-bounds in llist_add_batch+0x60/0xd4
>  Write of size 8 at addr ffff8000100b9000 by task kthreadd/2
>
>  CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.15.0-rc2-11681-(skip)
>  Hardware name: linux,dummy-virt (DT)
>  Call trace:
>   dump_backtrace+0x0/0x43c
>   show_stack+0x1c/0x2c
>   dump_stack_lvl+0x68/0x84
>   print_address_description+0x80/0x394
>   kasan_report+0x180/0x1dc
>   __asan_report_store8_noabort+0x48/0x58
>   llist_add_batch+0x60/0xd4
>   vfree_atomic+0x60/0xe0
>   scs_free+0x1dc/0x1fc
>   scs_release+0xa4/0xd4
>   free_task+0x30/0xe4
>   __put_task_struct+0x1ec/0x2e0
>   delayed_put_task_struct+0x5c/0xa0
>   rcu_do_batch+0x62c/0x8a0
>   rcu_core+0x60c/0xc14
>   rcu_core_si+0x14/0x24
>   __do_softirq+0x19c/0x68c
>   irq_exit+0x118/0x2dc
>   handle_domain_irq+0xcc/0x134
>   gic_handle_irq+0x7c/0x1bc
>   call_on_irq_stack+0x40/0x70
>   do_interrupt_handler+0x78/0x9c
>   el1_interrupt+0x34/0x60
>   el1h_64_irq_handler+0x1c/0x2c
>   el1h_64_irq+0x78/0x7c
>   _raw_spin_unlock_irqrestore+0x40/0xcc
>   sched_fork+0x4f0/0xb00
>   copy_process+0xacc/0x3648
>   kernel_clone+0x168/0x534
>   kernel_thread+0x13c/0x1b0
>   kthreadd+0x2bc/0x400
>   ret_from_fork+0x10/0x20
>
>  Memory state around the buggy address:
>   ffff8000100b8f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>   ffff8000100b8f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  >ffff8000100b9000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>                     ^
>   ffff8000100b9080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>   ffff8000100b9100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  ==================================================================
>
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> CC: Will Deacon <will@kernel.org>
> CC: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  kernel/scs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/scs.c b/kernel/scs.c
> index e2a71fc82fa0..25c0d8e416e6 100644
> --- a/kernel/scs.c
> +++ b/kernel/scs.c
> @@ -68,6 +68,7 @@ void scs_free(void *s)
>
>         __scs_account(s, -1);
>
> +       kasan_unpoison_vmalloc(s, SCS_SIZE);

Thanks for the patch! I believe I had this in the original vmap SCS
series, but Will pointed out that unpoisoning shouldn't be necessary
before vfree_atomic() and I don't remember seeing this KASAN error
back then. I wonder if something changed there? Either way, the patch
looks good to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
