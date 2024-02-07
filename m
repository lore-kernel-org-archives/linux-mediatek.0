Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD2C4829A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 23:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8MX8hAmbc+bXt3TVWxkcpF4cySt12sl3QQG2SCDKKI=; b=GFhQYBqtxDRghD96htxh2lsrLI
	5POjD0SgY+9E1oLugYU0zVzQh7iUOKYSKo5Py+qz6xucPW5dsqkqkL9IDOy8nuqRcBmHD8ByOGV/u
	f24hB3qqyxssY4H8bJIPcFbVbAwlO2kN+IQ/B3nhSEA24lwfoEK0tLQafLG4Mm3ICR5d2LqcsGyhY
	IOjDr8vrmUSoLEmZmpv97VaeV/8auuXkh0g7kKJUdthw2/Lg2+VolORXZPvcRNoBSxm51kx8Z2WMe
	muG7Z9JICuUsKlKkxHHrfmZ0Xi/Znsu4lX1ixbWXfoJl35ukHv4MpvX6Ms4sgOxKwjJrtkub0aq54
	TSN8WmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXrmH-0000000CGAZ-0Gdp;
	Wed, 07 Feb 2024 23:56:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXrmD-0000000CG9k-40Mc;
	Wed, 07 Feb 2024 23:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58A45617DB;
	Wed,  7 Feb 2024 23:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B93AC433F1;
	Wed,  7 Feb 2024 23:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1707350185;
	bh=olXKOEtFICuarB+A1Plr5Q6pk9xJ3SBVVYmbulfIKPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AP9MSno1xVJ7P5OcbiS3b8nLGkGyrV5wo314dvJCWaT2KIpEdrvqLt/o+Eb3lTMLF
	 TyipGNpYwzssX6qnz2ncIymRZKejRRCYpTn6iFnhumkH/ZvSbfUFgfpk6XKrm6jm02
	 JAEBRE+AZbMQGC6pFShPhx7GsjWPsYsaBOdXDAik=
Date: Wed, 7 Feb 2024 15:56:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
 <qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>, <urezki@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Uladzislau Rezki (Sony)"
 <urezki@gmail.com>
Subject: Re: [PATCH] scripts/gdb/vmalloc: fix vmallocinfo error
Message-Id: <20240207155623.a943328ba0b77859246e0d9f@linux-foundation.org>
In-Reply-To: <20240207085856.11190-1-Kuan-Ying.Lee@mediatek.com>
References: <20240207085856.11190-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_155626_120469_8574E1C7 
X-CRM114-Status: GOOD (  21.04  )
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

On Wed, 7 Feb 2024 16:58:51 +0800 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:

> We met the gdb vmallocinfo issue as following.
> 
> (gdb) lx-vmallocinfo
> Python Exception <class 'gdb.error'>: No symbol "vmap_area_list" in current context.
> Error occurred in Python: No symbol "vmap_area_list" in current context.
> 
> Since Mitigate a vmap lock contention patchset [1], we
> remove the vmap_area_list.

I don't think that's correct?

> We need to use vmap_nodes to iterate all vmallocinfo.
> 
> [1] https://lore.kernel.org/linux-mm/20240102184633.748113-1-urezki@gmail.com/

vmap_area_list was removed by https://lkml.kernel.org/r/20240102184633.748113-6-urezki@gmail.com

So I think this patch is actually a fix against mm.git:mm-unstable's
mm-vmalloc-remove-vmap_area_list.patch?

However this gdb function was probably probably broken earlier in that
series, so perhaps this patch would be best staged as a predecessor to
Ulad's vmalloc series.

> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Cc: Casper Li <casper.li@mediatek.com>
> ---
>  scripts/gdb/linux/vmalloc.py | 56 +++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/scripts/gdb/linux/vmalloc.py b/scripts/gdb/linux/vmalloc.py
> index d3c8a0274d1e..803f17371052 100644
> --- a/scripts/gdb/linux/vmalloc.py
> +++ b/scripts/gdb/linux/vmalloc.py
> @@ -29,32 +29,34 @@ class LxVmallocInfo(gdb.Command):
>          if not constants.LX_CONFIG_MMU:
>              raise gdb.GdbError("Requires MMU support")
>  
> -        vmap_area_list = gdb.parse_and_eval('vmap_area_list')
> -        for vmap_area in lists.list_for_each_entry(vmap_area_list, vmap_area_ptr_type, "list"):
> -            if not vmap_area['vm']:
> -                gdb.write("0x%x-0x%x %10d vm_map_ram\n" % (vmap_area['va_start'], vmap_area['va_end'],
> -                    vmap_area['va_end'] - vmap_area['va_start']))
> -                continue
> -            v = vmap_area['vm']
> -            gdb.write("0x%x-0x%x %10d" % (v['addr'], v['addr'] + v['size'], v['size']))
> -            if v['caller']:
> -                gdb.write(" %s" % str(v['caller']).split(' ')[-1])
> -            if v['nr_pages']:
> -                gdb.write(" pages=%d" % v['nr_pages'])
> -            if v['phys_addr']:
> -                gdb.write(" phys=0x%x" % v['phys_addr'])
> -            if v['flags'] & constants.LX_VM_IOREMAP:
> -                gdb.write(" ioremap")
> -            if v['flags'] & constants.LX_VM_ALLOC:
> -                gdb.write(" vmalloc")
> -            if v['flags'] & constants.LX_VM_MAP:
> -                gdb.write(" vmap")
> -            if v['flags'] & constants.LX_VM_USERMAP:
> -                gdb.write(" user")
> -            if v['flags'] & constants.LX_VM_DMA_COHERENT:
> -                gdb.write(" dma-coherent")
> -            if is_vmalloc_addr(v['pages']):
> -                gdb.write(" vpages")
> -            gdb.write("\n")
> +        nr_vmap_nodes = gdb.parse_and_eval('nr_vmap_nodes')
> +        for i in range(0, nr_vmap_nodes):
> +            vn = gdb.parse_and_eval('&vmap_nodes[%d]' % i)
> +            for vmap_area in lists.list_for_each_entry(vn['busy']['head'], vmap_area_ptr_type, "list"):
> +                if not vmap_area['vm']:
> +                    gdb.write("0x%x-0x%x %10d vm_map_ram\n" % (vmap_area['va_start'], vmap_area['va_end'],
> +                        vmap_area['va_end'] - vmap_area['va_start']))
> +                    continue
> +                v = vmap_area['vm']
> +                gdb.write("0x%x-0x%x %10d" % (v['addr'], v['addr'] + v['size'], v['size']))
> +                if v['caller']:
> +                    gdb.write(" %s" % str(v['caller']).split(' ')[-1])
> +                if v['nr_pages']:
> +                    gdb.write(" pages=%d" % v['nr_pages'])
> +                if v['phys_addr']:
> +                    gdb.write(" phys=0x%x" % v['phys_addr'])
> +                if v['flags'] & constants.LX_VM_IOREMAP:
> +                    gdb.write(" ioremap")
> +                if v['flags'] & constants.LX_VM_ALLOC:
> +                    gdb.write(" vmalloc")
> +                if v['flags'] & constants.LX_VM_MAP:
> +                    gdb.write(" vmap")
> +                if v['flags'] & constants.LX_VM_USERMAP:
> +                    gdb.write(" user")
> +                if v['flags'] & constants.LX_VM_DMA_COHERENT:
> +                    gdb.write(" dma-coherent")
> +                if is_vmalloc_addr(v['pages']):
> +                    gdb.write(" vpages")
> +                gdb.write("\n")
>  
>  LxVmallocInfo()
> -- 
> 2.18.0

