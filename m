Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zdooh2kzSR8pFHKJIVw1MkvS8Fhg3th0KN8y3zrKOds=; b=SqQZsdCYm2ldKx
	guqhybXnsVhUSy3lrMxOkoHq1avhRNFZHI5jknTnKtuY66kjDpqoCkB0aZwpsVsujh6VCcu4g4tNF
	M92dHtfHSw4ynSBuk3sWiD7SaPwLSD0fVDtwDvDpfsU4/ljK6FNeS56n8T1yVu0BPTSREbccbFqt7
	6rkxOCQYkWNDOFOfk01QLci4+JNFsMIdfeBn1kpwIzKc0o+yGMHBrxeLMiiBHOtLJv5pvuHWMEi9S
	3+4mW17WqYFiFyD+17liRzVhsKyntViN4f74kszvnsMaammyKCA/pzGObP5a/h3m3SKxZDt5yqHz7
	xxQgrPR6ey6GufIGDptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI8xV-003nxy-6D; Thu, 10 Feb 2022 12:54:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI8xJ-003nw5-Td; Thu, 10 Feb 2022 12:53:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00A0361DB5;
 Thu, 10 Feb 2022 12:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8AC004E1;
 Thu, 10 Feb 2022 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644497627;
 bh=Sj8DWq94LOKTBM0ypVNljY/FQe/q5/1ffqBT+QjXKsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqLLEdK01Ls4G9UhwGNLKFP2ED7XDuwawFhl64Aal59FMAGnTN6bg54QVqVxEp+3n
 vfdLYXzwTJ9C3myyptw2qrYxUB0EbyRCJL54k4nBWTIkIHJjNDXRguCeTvNJZ+BcBR
 rDvOeJkfp5v6S39D8dzpoPDPzklGzEIkUCmOEOzs=
Date: Thu, 10 Feb 2022 13:53:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
 wsd_upstream@mediatek.com, Eason-YH Lin <eason-yh.lin@mediatek.com>,
 Kobe-CP Wu <kobe-cp.wu@mediatek.com>,
 Jeff-CC Hsu <jeff-cc.hsu@mediatek.com>
Subject: Re: [PATCH] lockdep: Correct lock_classes index mapping
Message-ID: <YgUK134eEhCXOsgk@kroah.com>
References: <20220210105011.21712-1-cheng-jui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210105011.21712-1-cheng-jui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_045350_235877_96B231D1 
X-CRM114-Status: GOOD (  24.15  )
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

On Thu, Feb 10, 2022 at 06:50:11PM +0800, Cheng Jui Wang wrote:
> A kernel exception was hit when trying to dump /proc/lockdep_chains after
> lockdep report "BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!":
> 
> Unable to handle kernel paging request at virtual address 00054005450e05c3
> ...
> 00054005450e05c3] address between user and kernel address ranges
> ...
> pc : [0xffffffece769b3a8] string+0x50/0x10c
> lr : [0xffffffece769ac88] vsnprintf+0x468/0x69c
> ...
>  Call trace:
>   string+0x50/0x10c
>   vsnprintf+0x468/0x69c
>   seq_printf+0x8c/0xd8
>   print_name+0x64/0xf4
>   lc_show+0xb8/0x128
>   seq_read_iter+0x3cc/0x5fc
>   proc_reg_read_iter+0xdc/0x1d4
> 
> The cause of the problem is the function lock_chain_get_class() will
> shift lock_classes index by 1, but the index don't need to be shifted
> anymore since commit 01bb6f0af992 ("locking/lockdep: Change the range of
> class_idx in held_lock struct") already change the index to start from
> 0.
> 
> The lock_classes[-1] located at chain_hlocks array. When printing
> lock_classes[-1] after the chain_hlocks entries are modified, the
> exception happened.
> 
> The output of lockdep_chains are incorrect due to this problem too.
> 
> Fixes: f611e8cf98ec ("lockdep: Take read/write status in consideration when generate chainkey")
> 
> Signed-off-by: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
> ---
>  kernel/locking/lockdep.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 4a882f83aeb9..f8a0212189ca 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -3462,7 +3462,7 @@ struct lock_class *lock_chain_get_class(struct lock_chain *chain, int i)
>  	u16 chain_hlock = chain_hlocks[chain->base + i];
>  	unsigned int class_idx = chain_hlock_class_idx(chain_hlock);
>  
> -	return lock_classes + class_idx - 1;
> +	return lock_classes + class_idx;
>  }
>  
>  /*
> @@ -3530,7 +3530,7 @@ static void print_chain_keys_chain(struct lock_chain *chain)
>  		hlock_id = chain_hlocks[chain->base + i];
>  		chain_key = print_chain_key_iteration(hlock_id, chain_key);
>  
> -		print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id) - 1);
> +		print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
>  		printk("\n");
>  	}
>  }
> -- 
> 2.18.0
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
