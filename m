Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDBDC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 09:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112DA610D0
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 09:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 112DA610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwEd4n0bqsT0J5UrPeC4ByipyZJWapt0PD9/yo+MaJo=; b=K3Sn4Bpx5/7+aw
	8XrRaze9M48fhyW9KHiz9tR9udeO0JG2GQpQ3NM/gjzW12ib/xm2+5coUiUZr+Nh0Ok6tIETfEghj
	wJzkRoknmphtp3PBM+ilI6rs5UzEGnTDIq861/xj/th+Fksy3A1DN+EiaHn1SJvNC8EhgEyATK/92
	UAzstQFuCTTQ/5rgrL0vtxrZSngz8KzpVyZEDnLBMOf+e2InmijPhu6oVxXs5+IWMZOoqxhAyC9+N
	fEKqTUI8cci4N7Jkv8epowbCoUpBNVMA5wnYkihnxy9vAEuYdxGeT4U4stvN52660e63ItQKEVvzy
	5uO3JsmqspULjAvTEBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8JUU-00EDfk-Ew; Tue, 27 Jul 2021 09:35:10 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8JUR-00EDep-Rn
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 09:35:09 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso10998317ota.2
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tLt+aSNQ5Gb3uT3hTHMrtPbqAxvcc/LgUpLk9Zqb864=;
 b=C6alpqeGgRR5duqKxngJC5UsL/Oh79tkoE0aX+AhtcQZc7WmzMRz9UKH/fd1u8VEVS
 21M5PpkbFJXxAHXB9XgXAxEs34bsVqetGXbtfVk4r38qy47Z3PuA+SOHFHCEBVqqka6C
 LJLri7/pBuu6f8BMMA8rLI5ffy6isz+sYObAE1yULx+iMCFaGfgWYdqy09CkjZQ7AHxg
 VokEeMLsNImnAm4URjD3Al2tj6Y1n48/fr4l1WYlx0eTCNGV867D1rrt06pt/JZJx5we
 AAW7mU6ZEgtGYuuzOmeYz1CgbpVo0zSRBS0n4xIh50dTW5RrRX0INsQIJWz5Sb/IH6pv
 8PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tLt+aSNQ5Gb3uT3hTHMrtPbqAxvcc/LgUpLk9Zqb864=;
 b=Gu6ZrfiXPbBUflzUY5GdsN1cgEG2ZRYApaT3+oIQxQQVAsFcnWB2e9VJQ3dgExezAU
 OXl9fpamM5HG0s6vgJFHSFhGgkfELOtCcckF4hxSA4R1QRpcTjumcvWpYTCOeT0RlkqM
 SuHic08oFUJn3fMGzldl6sdg8vsS8uN431IbvOf0+3uZJAnykTAwmAWc+xm0nQEk+tel
 EnA7i429InhmWZ3p9rY2gRqbapOVZP9wcnGQvOkSOonswTR7pkFsC4NF7U7pn/k6xk60
 J8nxG8WJpryLRbJWyStO4Yl4bkLbpAIyNMALbKwSv6cYBH63xancNuch8iEOzkg7iu9O
 du9A==
X-Gm-Message-State: AOAM530FQGhXeB9158OAy6iTCeJOyBkTAl27gxiL+1mY/K4Q06MQGHXv
 H+JU7L9vp0lnJSmg/tnyDomee1fOf19l5sk+2WDcyQ==
X-Google-Smtp-Source: ABdhPJzMmPCMuHoc0I/fdkdyST7SYjrbQ+O9ddk9jDnVr9frICdz+xJHflx6+n8KHcAnj5WnUEr+8gTOOVpFMpVKFZg=
X-Received: by 2002:a05:6830:23a7:: with SMTP id
 m7mr14848974ots.17.1627378506348; 
 Tue, 27 Jul 2021 02:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
 <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
In-Reply-To: <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jul 2021 11:34:54 +0200
Message-ID: <CANpmjNPDSqokrHHVGkKHBFRe379xWUsF9CpECK=Eas375Wjj_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, 
 Andrew Morton <akpm@linux-foundation.org>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_023507_927663_F348FF12 
X-CRM114-Status: GOOD (  23.63  )
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

On Tue, 27 Jul 2021 at 10:32, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> On Tue, 2021-07-27 at 09:10 +0200, Marco Elver wrote:
> > +Cc Catalin
> >
> > On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> > Kuan-Ying.Lee@mediatek.com> wrote:
> > >
> > > Hardware tag-based KASAN doesn't use compiler instrumentation, we
> > > can not use kasan_disable_current() to ignore tag check.
> > >
> > > Thus, we need to reset tags when accessing metadata.
> > >
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> >
> > This looks reasonable, but the patch title is not saying this is
> > kmemleak, nor does the description say what the problem is. What
> > problem did you encounter? Was it a false positive?
>
> kmemleak would scan kernel memory to check memory leak.
> When it scans on the invalid slab and dereference, the issue
> will occur like below.

Please also add this info to commit message.

> So I think we should reset the tag before scanning.
>
> # echo scan > /sys/kernel/debug/kmemleak
> [  151.905804]
> ==================================================================
> [  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
> [  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
> [  151.909656] Pointer tag: [f7], memory tag: [fe]
> [  151.910195]
> [  151.910876] CPU: 7 PID: 138 Comm: kmemleak Not tainted 5.14.0-rc2-
> 00001-g8cae8cd89f05-dirty #134
> [  151.912085] Hardware name: linux,dummy-virt (DT)
> [  151.912868] Call trace:
> [  151.913211]  dump_backtrace+0x0/0x1b0
> [  151.913796]  show_stack+0x1c/0x30
> [  151.914248]  dump_stack_lvl+0x68/0x84
> [  151.914778]  print_address_description+0x7c/0x2b4
> [  151.915340]  kasan_report+0x138/0x38c
> [  151.915804]  __do_kernel_fault+0x190/0x1c4
> [  151.916386]  do_tag_check_fault+0x78/0x90
> [  151.916856]  do_mem_abort+0x44/0xb4
> [  151.917308]  el1_abort+0x40/0x60
> [  151.917754]  el1h_64_sync_handler+0xb4/0xd0
> [  151.918270]  el1h_64_sync+0x78/0x7c
> [  151.918714]  scan_block+0x58/0x170
> [  151.919157]  scan_gray_list+0xdc/0x1a0
> [  151.919626]  kmemleak_scan+0x2ac/0x560
> [  151.920129]  kmemleak_scan_thread+0xb0/0xe0
> [  151.920635]  kthread+0x154/0x160
> [  151.921115]  ret_from_fork+0x10/0x18
> [  151.921717]
> [  151.922077] Allocated by task 0:
> [  151.922523]  kasan_save_stack+0x2c/0x60
> [  151.923099]  __kasan_kmalloc+0xec/0x104
> [  151.923502]  __kmalloc+0x224/0x3c4
> [  151.924172]  __register_sysctl_paths+0x200/0x290
> [  151.924709]  register_sysctl_table+0x2c/0x40
> [  151.925175]  sysctl_init+0x20/0x34
> [  151.925665]  proc_sys_init+0x3c/0x48
> [  151.926136]  proc_root_init+0x80/0x9c
> [  151.926547]  start_kernel+0x648/0x6a4
> [  151.926987]  __primary_switched+0xc0/0xc8
> [  151.927557]
> [  151.927994] Freed by task 0:
> [  151.928340]  kasan_save_stack+0x2c/0x60
> [  151.928766]  kasan_set_track+0x2c/0x40
> [  151.929173]  kasan_set_free_info+0x44/0x54
> [  151.929568]  ____kasan_slab_free.constprop.0+0x150/0x1b0
> [  151.930063]  __kasan_slab_free+0x14/0x20
> [  151.930449]  slab_free_freelist_hook+0xa4/0x1fc
> [  151.930924]  kfree+0x1e8/0x30c
> [  151.931285]  put_fs_context+0x124/0x220
> [  151.931731]  vfs_kern_mount.part.0+0x60/0xd4
> [  151.932280]  kern_mount+0x24/0x4c
> [  151.932686]  bdev_cache_init+0x70/0x9c
> [  151.933122]  vfs_caches_init+0xdc/0xf4
> [  151.933578]  start_kernel+0x638/0x6a4
> [  151.934014]  __primary_switched+0xc0/0xc8
> [  151.934478]
> [  151.934757] The buggy address belongs to the object at
> ffff0000c0074e00
> [  151.934757]  which belongs to the cache kmalloc-256 of size 256
> [  151.935744] The buggy address is located 176 bytes inside of
> [  151.935744]  256-byte region [ffff0000c0074e00, ffff0000c0074f00)
> [  151.936702] The buggy address belongs to the page:
> [  151.937378] page:(____ptrval____) refcount:1 mapcount:0
> mapping:0000000000000000 index:0x0 pfn:0x100074
> [  151.938682] head:(____ptrval____) order:2 compound_mapcount:0
> compound_pincount:0
> [  151.939440] flags:
> 0xbfffc0000010200(slab|head|node=0|zone=2|lastcpupid=0xffff|kasantag=0x
> 0)
> [  151.940886] raw: 0bfffc0000010200 0000000000000000 dead000000000122
> f5ff0000c0002300
> [  151.941634] raw: 0000000000000000 0000000000200020 00000001ffffffff
> 0000000000000000
> [  151.942353] page dumped because: kasan: bad access detected
> [  151.942923]
> [  151.943214] Memory state around the buggy address:
> [  151.943896]  ffff0000c0074c00: f0 f0 f0 f0 f0 f0 f0 f0 f0 fe fe fe
> fe fe fe fe
> [  151.944857]  ffff0000c0074d00: fe fe fe fe fe fe fe fe fe fe fe fe
> fe fe fe fe
> [  151.945892] >ffff0000c0074e00: f7 f7 f7 f7 f7 f7 f7 f7 f7 f7 f7 fe
> fe fe fe fe
> [  151.946407]                                                     ^
> [  151.946939]  ffff0000c0074f00: fe fe fe fe fe fe fe fe fe fe fe fe
> fe fe fe fe
> [  151.947445]  ffff0000c0075000: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [  151.947999]
> ==================================================================
> [  151.948524] Disabling lock debugging due to kernel taint
> [  156.434569] kmemleak: 181 new suspected memory leaks (see
> /sys/kernel/debug/kmemleak)
>
> >
> > Perhaps this should have been "kmemleak, kasan: reset pointer tags to
> > avoid false positives" ?
>
> Thanks for the suggestions.
> But I think it doesn't belong to false
> positive becuase scan block
> touched invalid metadata certainly.

It's how kmemleak works, so we knowingly access invalid memory, and
for all intents and purposes it's a false positive.

> Maybe "kmemleak, kasan: reset tags when scanning block"?

That's fine.

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
