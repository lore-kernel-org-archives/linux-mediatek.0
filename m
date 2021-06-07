Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F14C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 13:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BB9610FB
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 13:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BB9610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/r8bIzeEslWpwMkVjN9xfqHgSNAT6z2ouxXe1vnv3E=; b=HyppWEyzwmBmud
	u62kVu/RssaEIkijMNghRYsL/rPBg9ExNOay7jbbMY6K80FhBzcKGEmunemq7a49CARgHjD5rpyba
	4JDqu9l5HdZnifVHKDbHMq/d/Wca6pfru3Os76vRVxIGwZDlr6+YSW+1ooN2ir7+G6+32KP1GgbUZ
	kIyL0t7BLIHwpCMvyggjbzWLBnOk7nfPzoX6SxH9vE4ctmCmXTrg5udZZrvraT+WHZg9Twmvgh3Zj
	w46QHyg2Fwpxm39ld071oUkPm2y9X9CQg0Hv56nhIdNlV13BaYuKH2PVW3w9r3MKSDDV+XEdCqjEM
	i4V6c80ZnTyHcdgR4xXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqFj8-003wU8-C3; Mon, 07 Jun 2021 13:55:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqFir-003wSM-L0; Mon, 07 Jun 2021 13:55:26 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62BFB610FB;
 Mon,  7 Jun 2021 13:55:20 +0000 (UTC)
Date: Mon, 7 Jun 2021 09:55:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm64: ftrace: don't dereference a probably invalid
 address
Message-ID: <20210607095518.12694437@oasis.local.home>
In-Reply-To: <20210607032329.28671-1-mark-pk.tsai@mediatek.com>
References: <20210607032329.28671-1-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_065521_737215_3BBD6034 
X-CRM114-Status: GOOD (  23.75  )
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

On Mon, 7 Jun 2021 11:23:30 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> Address in __mcount_loc may be invalid if somthing goes wrong.
> On our arm64 platform, the bug in recordmcount make kernel
> crash in ftrace_init().

How did it crash? The link below doesn't show any crash.

> 
> https://lore.kernel.org/lkml/20210607023839.26387-1-mark-pk.tsai@mediatek.com/
> 
> Return -EFAULT if we are dealing with out-of-range condition
> to prevent dereference the invalid address in ftrace_bug(),
> then the kernel can disable ftrace safely for problematic
> __mcount_loc.

!mod is not an out-of-range condition. It just happened that the other
bug caused this strange side-effect. A !mod does not mean a fault
happened. Just because it may have been caused by a fault in your use
case does not mean that it's a fault in all use cases. That's like
saying that your dog is a poodle, so all dogs are poodles.

A return of -EINVAL should not cause a crash. If it does, then that
needs to be fixed.

-- Steve


> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  arch/arm64/kernel/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> index b5d3ddaf69d9..98bec8445a58 100644
> --- a/arch/arm64/kernel/ftrace.c
> +++ b/arch/arm64/kernel/ftrace.c
> @@ -201,7 +201,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
>  			preempt_enable();
>  
>  			if (WARN_ON(!mod))
> -				return -EINVAL;
> +				return -EFAULT;
>  		}
>  
>  		/*


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
