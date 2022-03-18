Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81923C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNtVnUJTYs3OpXqHAkzx8S2eV9A3WZFgmWaISUkHV/8=; b=gHJzTFDxz2WCIL
	x3PWikfpfKyo/9Lrfd00j+svDx6ykWhRjUrhtMJuxzM8gwxiF3EzJN4X3zivshjdssp/jQdLx9P0U
	SBephke6UJz2E44nINv2auE5SDV91BcepNmXDcj93X4SCa84Cs8pF6HV5/CF8VuA319bf+kPDEqxV
	JnGYuGz6SK/xuh1R+d/8FHtHpjM87o0YJfJl+DFg850H9eXNy7wB+SIzXKvGEtCjB7m5zoCCyd1Z+
	qna8YGuNAyUpmsOHE7CraQomIzngrGTx7UDhM6lwwmIqzoAMnoElK7Ino4KIdTrmNIxnUL1gkXau8
	zVYPYsbHVo7uCJA3oM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVDjd-001zwx-ML; Fri, 18 Mar 2022 14:37:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVDd1-001wyf-U6; Fri, 18 Mar 2022 14:30:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1E241CE28F8;
 Fri, 18 Mar 2022 14:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91AFC340E8;
 Fri, 18 Mar 2022 14:30:47 +0000 (UTC)
Date: Fri, 18 Mar 2022 14:30:43 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com,
 yee.lee@mediatek.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mm/kmemleak: Reset tag when compare object pointer
Message-ID: <YjSXkyq6icIFx4GS@arm.com>
References: <20220318034051.30687-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318034051.30687-1-Kuan-Ying.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_073056_376949_64773653 
X-CRM114-Status: GOOD (  10.47  )
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

On Fri, Mar 18, 2022 at 11:40:48AM +0800, Kuan-Ying Lee wrote:
> When we use HW-tag based kasan and enable vmalloc support, we hit
> the following bug. It is due to comparison between tagged object
> and non-tagged pointer.
> 
> We need to reset the kasan tag when we need to compare tagged object
> and non-tagged pointer.
> 
> [    7.690429][T400001] init: kmemleak: [name:kmemleak&]Scan area larger than object 0xffffffe77076f440
> [    7.691762][T400001] init: CPU: 4 PID: 1 Comm: init Tainted: G S      W         5.15.25-android13-0-g5cacf919c2bc #1
> [    7.693218][T400001] init: Hardware name: MT6983(ENG) (DT)
> [    7.693983][T400001] init: Call trace:
> [    7.694508][T400001] init:  dump_backtrace.cfi_jt+0x0/0x8
> [    7.695272][T400001] init:  dump_stack_lvl+0xac/0x120
> [    7.695985][T400001] init:  add_scan_area+0xc4/0x244
> [    7.696685][T400001] init:  kmemleak_scan_area+0x40/0x9c
> [    7.697428][T400001] init:  layout_and_allocate+0x1e8/0x288
> [    7.698211][T400001] init:  load_module+0x2c8/0xf00
> [    7.698895][T400001] init:  __se_sys_finit_module+0x190/0x1d0
> [    7.699701][T400001] init:  __arm64_sys_finit_module+0x20/0x30
> [    7.700517][T400001] init:  invoke_syscall+0x60/0x170
> [    7.701225][T400001] init:  el0_svc_common+0xc8/0x114
> [    7.701933][T400001] init:  do_el0_svc+0x28/0xa0
> [    7.702580][T400001] init:  el0_svc+0x60/0xf8
> [    7.703196][T400001] init:  el0t_64_sync_handler+0x88/0xec
> [    7.703964][T400001] init:  el0t_64_sync+0x1b4/0x1b8
> [    7.704658][T400001] init: kmemleak: [name:kmemleak&]Object 0xf5ffffe77076b000 (size 32768):
> [    7.705824][T400001] init: kmemleak: [name:kmemleak&]  comm "init", pid 1, jiffies 4294894197
> [    7.707002][T400001] init: kmemleak: [name:kmemleak&]  min_count = 0
> [    7.707886][T400001] init: kmemleak: [name:kmemleak&]  count = 0
> [    7.708718][T400001] init: kmemleak: [name:kmemleak&]  flags = 0x1
> [    7.709574][T400001] init: kmemleak: [name:kmemleak&]  checksum = 0
> [    7.710440][T400001] init: kmemleak: [name:kmemleak&]  backtrace:
> [    7.711284][T400001] init:      module_alloc+0x9c/0x120
> [    7.712015][T400001] init:      move_module+0x34/0x19c
> [    7.712735][T400001] init:      layout_and_allocate+0x1c4/0x288
> [    7.713561][T400001] init:      load_module+0x2c8/0xf00
> [    7.714291][T400001] init:      __se_sys_finit_module+0x190/0x1d0
> [    7.715142][T400001] init:      __arm64_sys_finit_module+0x20/0x30
> [    7.716004][T400001] init:      invoke_syscall+0x60/0x170
> [    7.716758][T400001] init:      el0_svc_common+0xc8/0x114
> [    7.717512][T400001] init:      do_el0_svc+0x28/0xa0
> [    7.718207][T400001] init:      el0_svc+0x60/0xf8
> [    7.718869][T400001] init:      el0t_64_sync_handler+0x88/0xec
> [    7.719683][T400001] init:      el0t_64_sync+0x1b4/0x1b8
> 
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
