Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2ADE95A9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 00:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8wElF7g5syQ7ht8CtQXj+FlFUUWeOsXPs0gqy6jQ4o=; b=NuV3mkQ/gO3NwUKOsjlG91J1K3
	L3kq/eBoNLwVE0xdDfDv4SN5BZ/JrCu4f6YS/Xl8ngzDreDJ4CVzUmOrTkxWhiIdwOBF0YzQ2TEuP
	+jC0mpWfxbwdMO+YGxTsGE+hTUT+WVK1+CGagfuDbm4ZDcO4Dkkk9I5IHuJvkrwpcC97bph+NGPLZ
	76AgGVmTqliCL+2Y7CGSGgzFSMQaHyLEjm8ATvzs0rFdKoTDccPiLQ9LW61nHfrDYtW1Mnp4NJ0R8
	m2j7XurlgSoVl3A6dJUjWwnCcbocvs5sNLbDKpKXEmheXRfbgn3leWr+nTY+n60qaeLjFc06qeYk3
	VCkbrNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq0BJ-00BqAU-22;
	Tue, 10 Oct 2023 00:01:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq0BF-00Bq9a-2N;
	Tue, 10 Oct 2023 00:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ADB56B8092E;
	Tue, 10 Oct 2023 00:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7362C433C7;
	Tue, 10 Oct 2023 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1696896054;
	bh=YKS8Y/7EmqBXYuLK/9MivE+xNPfZVkeyEmaZhaCyW+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RryLjpiV4EvbXtkF6jCKy71S0MNAG5dgMqH2ypf7KUcH8JxcCO2Az3wr4Fop2QoZB
	 3vUic30DMWobAmFZ3NSBupUnzR8oiCFyzwCFCRMhVbHe34pG+kprS/MS9qoywVGkBA
	 VSZqLNIVRk+B/g6HIw4aYkQXMV018pdZOysyJ0yw=
Date: Mon, 9 Oct 2023 17:00:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Haibo Li <haibo.li@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH v2] kasan:print the original fault addr when access
 invalid shadow
Message-Id: <20231009170031.a294c11575d5d4941b8596a9@linux-foundation.org>
In-Reply-To: <20231009073748.159228-1-haibo.li@mediatek.com>
References: <20231009073748.159228-1-haibo.li@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_170057_927091_552A6B27 
X-CRM114-Status: GOOD (  16.66  )
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

On Mon, 9 Oct 2023 15:37:48 +0800 Haibo Li <haibo.li@mediatek.com> wrote:

> when the checked address is illegal,the corresponding shadow address
> from kasan_mem_to_shadow may have no mapping in mmu table.
> Access such shadow address causes kernel oops.
> Here is a sample about oops on arm64(VA 39bit) 
> with KASAN_SW_TAGS and KASAN_OUTLINE on:
> 
> [ffffffb80aaaaaaa] pgd=000000005d3ce003, p4d=000000005d3ce003,
>     pud=000000005d3ce003, pmd=0000000000000000
> Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 3 PID: 100 Comm: sh Not tainted 6.6.0-rc1-dirty #43
> Hardware name: linux,dummy-virt (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __hwasan_load8_noabort+0x5c/0x90
> lr : do_ib_ob+0xf4/0x110
> ffffffb80aaaaaaa is the shadow address for efffff80aaaaaaaa.
> The problem is reading invalid shadow in kasan_check_range.
> 
> The generic kasan also has similar oops.
> 
> It only reports the shadow address which causes oops but not
> the original address.
> 
> Commit 2f004eea0fc8("x86/kasan: Print original address on #GP")
> introduce to kasan_non_canonical_hook but limit it to KASAN_INLINE.
> 
> This patch extends it to KASAN_OUTLINE mode.

Is 2f004eea0fc8 a suitable Fixes: target for this?  If not, what is?

Also, I'm assuming that we want to backport this fix into earlier
kernel versions?



