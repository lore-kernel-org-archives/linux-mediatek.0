Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F5EEEAA62
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eRAg4BOSXhzdaCM4oFAMYBsORYMTL2ICOv9GCq6ZaA=; b=dqOLAyTKG3o/qjAvayBiDG9Aio
	KK6tUBpZ1O15AF507gCILY0zzXDgahPAZOykYNOncrMPlhYV5RL7PB9O9SbICCyvwfQcE0F+8+FJe
	M/cTpI5tmVrFwVOaLY/MrocdodF63OMFHmSdbEP4PefRPG5R/mAeg59LylcWNFo/CwHd3gGVojY8c
	6tnNjtzzMADQPIwdjJbMpPiKbz0X6x4PpJoIecvOnPLAzBn5YAA+ZAtR+5KUrTHyONJsk9Sv4TWA7
	DSqS7nx7S0UAdnAmWwxrdsQ0a6eox1CgYcYS+mcSMoYSmT5gF3KWIXdWCDMIm7XRtckjBhEaXzW/a
	paDM3o2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgr5e-0094GI-09;
	Thu, 14 Sep 2023 18:29:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgr5a-0094FC-2H;
	Thu, 14 Sep 2023 18:29:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E656861DB4;
	Thu, 14 Sep 2023 18:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9921C433C8;
	Thu, 14 Sep 2023 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1694716156;
	bh=8yfZbzZKag5d7bxNrUSr/lpYoM54Vk26Cn0YqHlXOnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k8uDcAI3/N9nu9z6RNGz7MTQI7GnzEOueZNNkHePh6pbgMV5izoqp8ZBNnpewTVDZ
	 5nvRul9SEPLd+PWL0RLNb1YrboFFPW6PuJ8F8mgIEvVrvrX7W1It5tTUonSluB3mxt
	 jHwMGpGX+T7d1JMb+p5mJWINZt/wPMJqJZ+42mSo=
Date: Thu, 14 Sep 2023 11:29:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Haibo Li <haibo.li@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, <xiaoming.yu@mediatek.com>, Andrey
 Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is
 illegal
Message-Id: <20230914112915.81f55863c0450195b4ed604a@linux-foundation.org>
In-Reply-To: <20230914080833.50026-1-haibo.li@mediatek.com>
References: <20230914080833.50026-1-haibo.li@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_112918_830897_786A7A46 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, 14 Sep 2023 16:08:33 +0800 Haibo Li <haibo.li@mediatek.com> wrote:

> when the input address is illegal,the corresponding shadow address
> from kasan_mem_to_shadow may have no mapping in mmu table.
> Access such shadow address causes kernel oops.
> Here is a sample about oops on arm64(VA 39bit) with KASAN_SW_TAGS on:
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
> To fix it,check shadow address by reading it with no fault.
> 
> After this patch,KASAN is able to report invalid memory access
> for this case.
> 

Thanks.

> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -304,8 +304,17 @@ static __always_inline bool addr_has_metadata(const void *addr)
>  #ifdef __HAVE_ARCH_SHADOW_MAP
>  	return (kasan_mem_to_shadow((void *)addr) != NULL);
>  #else
> -	return (kasan_reset_tag(addr) >=
> -		kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
> +	u8 *shadow, shadow_val;
> +
> +	if (kasan_reset_tag(addr) <
> +		kasan_shadow_to_mem((void *)KASAN_SHADOW_START))
> +		return false;
> +	/* use read with nofault to check whether the shadow is accessible */
> +	shadow = kasan_mem_to_shadow((void *)addr);
> +	__get_kernel_nofault(&shadow_val, shadow, u8, fault);
> +	return true;
> +fault:
> +	return false;
>  #endif
>  }

Are we able to identify a Fixes: target for this? 
9d7b7dd946924de43021f57a8bee122ff0744d93 ("kasan: split out
print_report from __kasan_report") altered the code but I expect the
bug was present before that commit.

Seems this bug has been there for over a year.  Can you suggest why it
has been discovered after such a lengthy time?

