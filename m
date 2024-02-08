Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CC9C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhiQCIizSoOoGlOJh1aEc+Kedwwy9bu+6Ox2q8gZmik=; b=Azc4Cp7Vvw8PeMigNl9dOikNaM
	eaZAw9iuIR0Jy2KKZzXX0EcTWl1nyJYEQr4NY+/7N3H3hkovtrs/33V+tJr5ivZClmxpdOBoIFsAn
	qogGg84nJo3+P0UAe2g7JF7LH9ZRJkzu4H3SpddZoCO95HOhwzWVLcekpfUWSQNy1QuW3q59NoGc1
	h+JNr01hT940VCr9dP5bPYT/uxdJ+VtWPKRrReUNlat5UWcqQu3LbHZFYFNCokFb9Ogy9WeWWySEs
	FeXj7cwIE/yWNHw824e6KYMr/ltUKD6ROZ7MwOOSVXvIybvS7WwzWlue3NZd4RfAgPbU2SxJHfp7T
	lyqu/9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY97k-0000000Ec24-28G8;
	Thu, 08 Feb 2024 18:27:48 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY97g-0000000Ec1W-2gqu;
	Thu, 08 Feb 2024 18:27:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5116588189aso148439e87.1;
        Thu, 08 Feb 2024 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707416863; x=1708021663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MhiQCIizSoOoGlOJh1aEc+Kedwwy9bu+6Ox2q8gZmik=;
        b=lvd4MMjhC9djpydU213KtKQD5i2gTr3Wp97dMc4fxWFnsUGAQLGNG6jgZup34gNxOr
         pjPDHFwZtSnBmI1zyx/gNxCczEMEQcRoiyylE6Ucn6x19zc6x2GilgCIsvCCNWKk0+yt
         VAjjc84C+slxq/rE2aAQJMtIjRyMRIgenZZc5ZBbfiEzekg1pplgie13C8F2RjKI9Mw6
         QQ9N33Wca1MZiicBP1VN0ma5XyzpZ5jD8D6ikYYuF/avx7TRE8WLOmyALlcQhHBOWh5O
         1OqgMa40h1IOBccQ/KakLhIMptubqcL3ifkMN/YUAZ/WHpdpWUPg9XbwsIID5qv0HxaR
         vzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707416863; x=1708021663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhiQCIizSoOoGlOJh1aEc+Kedwwy9bu+6Ox2q8gZmik=;
        b=NwIwPuLKacFol7RVKXjS29v0oj5ggn/BU3gB0Cjp/uVAvYhNW/Nrff7LInGII/TWPf
         9pEi6UJ0R3I/RLXjE/EcD7cRzsGQuRLrBSDkkG8UosOYS/3uO8SOUVgiGXyGe++GObpD
         sW1+OPuXuhf+9HSerJd79L+SG+fvLggXJjrzVi/T2hFbFrJB33Z/jyIFN++W9Xn33zHr
         BkYp9gQ5qx0fWOGQhP7NoQlk7U2KYOXsH91xk/ANAgCFKaglYR9qaQoCXcVWkcsb5rCj
         Iw+XaJEfWHhX9IaOUtSoPvmBGD9Ku54Bs1DG3ua5rjep674+iAizVTULYipm8AYgEOg8
         FjcQ==
X-Gm-Message-State: AOJu0YxlQ0hXuOikzJL3B/4/VD+LQAEVPJpKnhkFWlZL6hbMoXeNrcLv
	mdPYCVrWkXFvknHfsGCEfidegnUJ/Fe3qvo2AYQSWXE17cItCVF27pqcGrwfL4k=
X-Google-Smtp-Source: AGHT+IEt1TA9WaZV161QOsVJTKIO45dwFrmr5lsjYI1a2PuuFU/uotVfRvKIQ12At8iMiW8KxfJUKw==
X-Received: by 2002:a05:6512:3ca3:b0:511:4fb4:94f4 with SMTP id h35-20020a0565123ca300b005114fb494f4mr46153lfv.53.1707416862702;
        Thu, 08 Feb 2024 10:27:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW73WLa6OSXt77bWdX/B/C6TGTeT1GCQPBjP9edjIgotYXUWF9+OyugsyGpxeAbsI1Qa7ibGuUaCMI1fgW7xbP2ZnhjXPqLApJwox89/312sbZI/9/NLizNPLJwj3ZJ7qTQfHZ3C/DvcYaVhsiZMSxEjwxHi6Vg3W7SNpMbGaOA4BbkPgSj2CSNDUi6fNWjYsOlNmTrmaStBrrLUBSKT6N3q6TJCXS6YrrazEBXzSXx46MjBkTdWPROUHw3RtSULg3F+BxX5hZKA7YLjAU8DoXj6jIh3vRvFW16i58N5fObGPpcrnuAu8xn8q+GSdLPfHQ9/JSm/x2PTLlMT5cjoDSZapNi+42P1EqwdgQBKeZUgUm2+6fIn3etemm1PgnaxJZN1pmnyr8TKZ/MR6X5B3m3Vst3IbIwODfIpuqdQsT62z9Ia/jNPnaRFfQTYATfWWVkfKzRSxw1jwYmPYKAzOzXVGBeFwmKmaL4tekmgheOOsROPWrQKW0e
Received: from pc636 (host-90-233-221-0.mobileonline.telia.com. [90.233.221.0])
        by smtp.gmail.com with ESMTPSA id w6-20020a05651204c600b0051151e07c01sm28780lfq.36.2024.02.08.10.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 10:27:42 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 Feb 2024 19:27:39 +0100
To: Andrew Morton <akpm@linux-foundation.org>,
	Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	casper.li@mediatek.com, chinwen.chang@mediatek.com,
	qun-wei.lin@mediatek.com, linux-mm@kvack.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] scripts/gdb/vmalloc: fix vmallocinfo error
Message-ID: <ZcUdG5snmTW1ldx3@pc636>
References: <20240207085856.11190-1-Kuan-Ying.Lee@mediatek.com>
 <20240207155623.a943328ba0b77859246e0d9f@linux-foundation.org>
 <20240207155929.cc107bcc14b982789bdc9fab@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207155929.cc107bcc14b982789bdc9fab@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_102744_727216_02C32C50 
X-CRM114-Status: GOOD (  23.50  )
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

On Wed, Feb 07, 2024 at 03:59:29PM -0800, Andrew Morton wrote:
> On Wed, 7 Feb 2024 15:56:23 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > > [1] https://lore.kernel.org/linux-mm/20240102184633.748113-1-urezki@gmail.com/
> > 
> > vmap_area_list was removed by https://lkml.kernel.org/r/20240102184633.748113-6-urezki@gmail.com
> > 
> > So I think this patch is actually a fix against mm.git:mm-unstable's
> > mm-vmalloc-remove-vmap_area_list.patch?
> > 
> > However this gdb function was probably probably broken earlier in that
> > series, so perhaps this patch would be best staged as a predecessor to
> > Ulad's vmalloc series.
> 
> ie, this:
> 
> 
> From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Subject: scripts/gdb/vmalloc: fix vmallocinfo error
> Date: Wed, 7 Feb 2024 16:58:51 +0800
> 
> The patch series "Mitigate a vmap lock contention" removes vmap_area_list,
> which will break the gdb vmallocinfo command:
> 
> (gdb) lx-vmallocinfo
> Python Exception <class 'gdb.error'>: No symbol "vmap_area_list" in current context.
> Error occurred in Python: No symbol "vmap_area_list" in current context.
> 
> So we can instead use vmap_nodes to iterate all vmallocinfo.
> 
> Link: https://lkml.kernel.org/r/20240207085856.11190-1-Kuan-Ying.Lee@mediatek.com
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Cc: Casper Li <casper.li@mediatek.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Chinwen Chang <chinwen.chang@mediatek.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Kieran Bingham <kbingham@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> Cc: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  scripts/gdb/linux/vmalloc.py |   56 +++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
> 
> --- a/scripts/gdb/linux/vmalloc.py~scripts-gdb-vmalloc-fix-vmallocinfo-error
> +++ a/scripts/gdb/linux/vmalloc.py
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
> _
> 
Thanks for fixing and helping!

--
Uladzislau Rezki

