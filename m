Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC3FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 06:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3f7D90UWRd8qsF2pZvEDKhz5VPOvUolD0p186PO8Is=; b=tHhQudQ5ISUSoQ
	NRQOTZrVhyzHpZ5Y6oKFBv7q7vo11YTwpMd3+hXryGPyEHAj6J7NlR++B83gAec3GkzwKZW+hW0CW
	+wgpG7Aaw4pJ+ToRUy/EwRM3oLUc0ltF15us/wtdkSsL/dpwzpbwKaiQJZ+htSfa0vWexjLpQv8fJ
	o82G8jk3Zb2GsYB1w+LeP6xJ/zsc4DT+KTtqvAHk8gbDk409zC9zvWtKstjLeQSuxy9cEytG5jugz
	HL7cRtkPqwSOuRuZ5TZjKjmTvOOcJbdOrrNv/EGWEr0R+EZ457B2hGt/n1acZYNd0TowHNK/A1/RJ
	vxXSLcpSd6x3f17H6t3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYQB-006F6f-Ht; Fri, 10 Jun 2022 06:47:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYPf-006ErD-28; Fri, 10 Jun 2022 06:46:37 +0000
X-UUID: bd30847c2cad4c6c8a7bcb0ff9d02455-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:71c1c8c8-bbde-4910-9b63-7a6306942689,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:0ec65de5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,QS:0,BEC:nil
X-UUID: bd30847c2cad4c6c8a7bcb0ff9d02455-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1971727978; Thu, 09 Jun 2022 23:46:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 23:36:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 14:36:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 14:36:22 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <will@kernel.org>, <stable@vger.kernel.org>
CC: <alexandru.elisei@arm.com>, <catalin.marinas@arm.com>,
	<jean-philippe.brucker@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm64: Clear OS lock in enable_debug_monitors
Date: Fri, 10 Jun 2022 14:36:19 +0800
Message-ID: <20220610063619.7921-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220609115716.GA2427@willie-the-truck>
References: <20220609115716.GA2427@willie-the-truck>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_234631_142165_86DFAA42 
X-CRM114-Status: GOOD (  21.40  )
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

> On Thu, Jun 09, 2022 at 11:33:18AM +0800, Mark-PK Tsai wrote:
> > Always clear OS lock before enable debug event.
> > 
> > The OS lock is clear in cpuhp ops in recent kernel,
> > but when the debug exception happened before it
> > kernel might crash because debug event enable didn't
> > take effect when OS lock is hold.
> > 
> > Below is the use case that having this problem:
> > 
> > Register kprobe in console_unlock and kernel will
> > panic at secondary_start_kernel on secondary core.
> > 
> > CPU: 1 PID: 0 Comm: swapper/1 Tainted: P
> > ...
> > pstate: 004001c5 (nzcv dAIF +PAN -UAO)
> > pc : do_undefinstr+0x5c/0x60
> > lr : do_undefinstr+0x2c/0x60
> > sp : ffffffc01338bc50
> > pmr_save: 000000f0
> > x29: ffffffc01338bc50 x28: ffffff8115e95a00 T
> > x27: ffffffc01258e000 x26: ffffff8115e95a00
> > x25: 00000000ffffffff x24: 0000000000000000
> > x23: 00000000604001c5 x22: ffffffc014015008
> > x21: 000000002232f000 x20: 00000000000000f0 j
> > x19: ffffffc01338bc70 x18: ffffffc0132ed040
> > x17: ffffffc01258eb48 x16: 0000000000000403 L&
> > x15: 0000000000016480 x14: ffffffc01258e000 i/
> > x13: 0000000000000006 x12: 0000000000006985
> > x11: 00000000d5300000 x10: 0000000000000000
> > x9 : 9f6c79217a8a0400 x8 : 00000000000000c5
> > x7 : 0000000000000000 x6 : ffffffc01338bc08 2T
> > x5 : ffffffc01338bc08 x4 : 0000000000000002
> > x3 : 0000000000000000 x2 : 0000000000000004
> > x1 : 0000000000000000 x0 : 0000000000000001 *q
> > Call trace:
> >  do_undefinstr+0x5c/0x60
> >  el1_undef+0x10/0xb4
> >  0xffffffc014015008
> >  vprintk_func+0x210/0x290
> >  printk+0x64/0x90
> >  cpuinfo_detect_icache_policy+0x80/0xe0
> >  __cpuinfo_store_cpu+0x150/0x160
> >  secondary_start_kernel+0x154/0x440
> > 
> > The root cause is that OS_LSR_EL1.OSLK is reset
> > to 1 on a cold reset[1] and the firmware didn't
> > unlock it by default.
> > So the core didn't go to el1_dbg as expected after
> > kernel_enable_single_step and eret.
> 
> Hmm, I thought we didn't use hardware single-step for kprobes after
> 7ee31a3aa8f4 ("arm64: kprobes: Use BRK instead of single-step when executing
> instructions out-of-line"). What is triggering this exception?
> 
> Will

You're right.
Actually this issue happend in 5.4 LTS, and the commit you mentioned
can avoid the kernel panic by not using hardware single-step.

I think 5.4 LTS should apply this commit.

7ee31a3aa8f4 ("arm64: kprobes: Use BRK instead of single-step when executing instructions out-of-line")

Cc: stable@vger.kernel.org



And I'm not sure if there is other use case may have problem if the
kernel don't clear OS lock in enable_debug_monitors everytime.
So should we do this to prevent someone face the similar issue?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
