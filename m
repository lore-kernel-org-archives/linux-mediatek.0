Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B725C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 14:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C715761130
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 14:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C715761130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1F61zxtYZtbBB1/azKJWgl8x5o4kg9xP+7nwdsoYhIQ=; b=q0y3eu/Q80E/uO
	YHdEQBqXDNjHyfy8gbNzn0ZU5OUy+r31mInFTBfewBZnh5glfo8gEURhBuelSGunAB5Mf7+ZmasbB
	dChJLZUcOZDb2aJ8T9FPIu2iaa5kMORRvnewDsHjJ7IADcBhbA/Nx/v4pZsk4nRefbA2ENAtE8BoJ
	Md471BfWkRs3SI1R2HnyCRAczW+HT3aDb1DDd4h0xE+osz3PEyu6hCUgCg4H6Wo3pidRBJjAOGfUS
	gQTnm5cMCNiIgrhSDIHzRsKxatrksGGP9j6T97yfr1KnmlnN9hB3Kiwnu4TIqvalsZNwIdR0KfpFn
	zmVdPef6qXAdz80ByPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqG2f-0041Oh-7Z; Mon, 07 Jun 2021 14:15:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqG2X-0041Ne-Ti; Mon, 07 Jun 2021 14:15:48 +0000
X-UUID: f221f4088cec4cab90cb194af2f6cd4e-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZAMAsV9G0c/zrlppjOcf4U6UOLMSVoPtimKv9s4GLKU=; 
 b=pzQeIyV803D0qO7sn81UBN1Z0IzxOFtfRX8qepOnA/mdR9c2lm7y/1QOYCI7Ou4cJSDCSy2CdmYt9zCPws4XAn7yatb1gxaDrMn4xpiVQqrT2D3bHiy94gvyIDHa/3XcMs9fWx09o6v2aRklt3qqLAmPD3+B6nuUJhiXT5HPZJo=;
X-UUID: f221f4088cec4cab90cb194af2f6cd4e-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1098676730; Mon, 07 Jun 2021 07:15:38 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 07:15:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 22:15:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 22:15:22 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mingo@redhat.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm64: ftrace: don't dereference a probably invalid
 address
Date: Mon, 7 Jun 2021 22:15:22 +0800
Message-ID: <20210607141522.3281-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210607095518.12694437@oasis.local.home>
References: <20210607095518.12694437@oasis.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_071542_420949_4A28D7BA 
X-CRM114-Status: GOOD (  25.28  )
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

> On Mon, 7 Jun 2021 11:23:30 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > Address in __mcount_loc may be invalid if somthing goes wrong.
> > On our arm64 platform, the bug in recordmcount make kernel
> > crash in ftrace_init().
> 
> How did it crash? The link below doesn't show any crash.

Below is the crash log:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2008 ftrace_bug+0x9c/0x38c
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.4.61-350609-gf78fedda5a5e #1
Hardware name: MediaTek MT5896 (DT)
pstate: 60400089 (nZCv daIf +PAN -UAO)
pc : ftrace_bug+0x9c/0x38c
lr : ftrace_process_locs+0x314/0x3b8
sp : ffffffc011743ef0
x29: ffffffc011743f00 x28: 0000000000000001
x27: ffffff818e401b80 x26: 0000000000000000
x25: ffffff818e480008 x24: ffffffc011749000
x23: 0000000000000008 x22: 0000000000000000
x21: ffffffc010084ac0 x20: 0000000000000024
x19: ffffff818e480000 x18: ffffffc011759c20
x17: ffffffc01133dcf8 x16: 0000000000000068
x15: ffffffc01133dcf8 x14: 0000000000000000
x13: 0000000000000000 x12: ffffffc010084ae4
x11: ffffffc011749000 x10: ffffffc011749000
x9 : 0000000000000001 x8 : ffffffc011749000
x7 : 0000000000000000 x6 : 000000000000003f
x5 : 000000000008e93d x4 : 0000000000000000
x3 : 0000000000000101 x2 : ffffffc010084ac0
x1 : ffffff818e480000 x0 : ffffffc01127621c
Call trace:
 ftrace_bug+0x9c/0x38c
 ftrace_process_locs+0x314/0x3b8
 ftrace_init+0x8c/0xbc
 start_kernel+0x180/0x40c
---[ end trace 59db467eb74a6604 ]---
ftrace failed to modify
[<0000000000000024>] 0x24
 actual:
"Unable to handle kernel read from unreadable memory at virtual address 0000000000000024
"Mem abort info:

And the crash is becuase kernel trying to read *rec->ip in print_ip_ins() if
ftrace_bug() get error code -EINVAL.

> 
> > 
> > https://lore.kernel.org/lkml/20210607023839.26387-1-mark-pk.tsai@mediatek.com/
> > 
> > Return -EFAULT if we are dealing with out-of-range condition
> > to prevent dereference the invalid address in ftrace_bug(),
> > then the kernel can disable ftrace safely for problematic
> > __mcount_loc.
> 
> !mod is not an out-of-range condition. It just happened that the other
> bug caused this strange side-effect. A !mod does not mean a fault
> happened. Just because it may have been caused by a fault in your use
> case does not mean that it's a fault in all use cases. That's like
> saying that your dog is a poodle, so all dogs are poodles.
> 
> A return of -EINVAL should not cause a crash. If it does, then that
> needs to be fixed.

I understand.
Keep -EINVAL here make more sense.
So maybe we should handle this case in ftrace_bug() by checking the rec->ip?

> 
> -- Steve
> 
> 
> > 
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  arch/arm64/kernel/ftrace.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> > index b5d3ddaf69d9..98bec8445a58 100644
> > --- a/arch/arm64/kernel/ftrace.c
> > +++ b/arch/arm64/kernel/ftrace.c
> > @@ -201,7 +201,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
> >  			preempt_enable();
> >  
> >  			if (WARN_ON(!mod))
> > -				return -EINVAL;
> > +				return -EFAULT;
> >  		}
> >  
> >  		/*
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
