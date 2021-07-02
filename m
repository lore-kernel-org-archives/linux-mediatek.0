Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4A0C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67037613EE
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67037613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2Y6+rchn2D7e8SwZZAfi4G4Qex4iPQwmudCLWXPLxk=; b=h3p0IXsIZS1JKb
	kO9+tfgMHa5WxZn6rusSvPNSRCDANhiC4VoJt2JVPurQk5weC5GnK6FVJjAds/k35rR4LnMoIHk4h
	6+6C+NN7E/pdBNs5Esreg2upL7jtwIas3JTAwx7KPU5dgYpPyeJE11RufXL0cjJIfdzh5vUZToSB9
	TEJIFPIYyT0Uj5zahAX8IvhIUHAXhoUzcMHHpiPUshtR9P3DDHAX9c846JIzbVdCzCI+fzgoslkYq
	iKMREQtFb6CdSiyYjt4c3zI5JD6o+n7pCj71r2yLUHr4CfFmF38FuFe46/F5giow2MhgdrW0GW29j
	akMANI54ctuphm1x/BnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFZ3-002dyd-JJ; Fri, 02 Jul 2021 09:34:25 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFYj-002dsO-G2
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 09:34:06 +0000
Received: by mail-oi1-x22e.google.com with SMTP id h9so10637269oih.4
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vrAYdCh2ggaj+XWyXcYy308yp58pQSy2cm79Y1b9M3w=;
 b=hNF+Pzl08HoowaYaI83wQ56Z3dXc8hRtqXGtkOzRz33spQN1kGyXCVYZVzm0DYWiLw
 XtCqS+WaXZriTD8y0SP0WsV9iOn77PsWScKeRn4c7PG9cj8ydXssDog7mjNCw8tmmuLE
 kK/MdzCEK4SKBRDgdHLCHcKpPKZuUv9KbQlZsSJ99wkV6LZRqUA7MZdDTdir0KunOwLX
 lD+r1KE0ZhmxbwGSwrPHUm2/Tsy4UGZZOG9CAMykeOXzLAkYHI/yBhyJ2wmodFGjJxWT
 pblIW+2gTt0xKiPPMkXLrT5fWrh9OBCPA3PjQmoVivLa/x88/0TG/o5HEJS/5C8jiftf
 Nbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrAYdCh2ggaj+XWyXcYy308yp58pQSy2cm79Y1b9M3w=;
 b=t80JujZiLAplsbLLZaVssJywwPXSUCr7If6bJBoy6Ivv1zoMohg8am4oEBdY2Wf0xk
 Og7EHtaAFaV3fMU62WoJ5z+Hfd2d7MdecUhm5lBO+ro7RXzkAYjkBXmG0YFebVGGoXeP
 0XwRPOL9zdfxspLE2JPc+FNEkz4cNLXsuQTAr++iIBzHBce9gE+hBdb/n1Mex9TYZoN8
 +WUKvb852wjl/IKkGhPBT8fWHjfBBViWM0bBqMw/EsiSk9d+DKl1zojJNTTtT09J90rq
 oWRjMS1JQqv6FbpR1vTb5b/GEuWSUQGk4gV6lfGzHxU/Ls13em8OivsRo3I667DPQQNy
 ngIA==
X-Gm-Message-State: AOAM531mzAFo4Vnz3pXBQMIXUedud28LRFMGXJfRhQxyHMKX7U2WzQ39
 3ir5eiAfxV2HBViP4Vydl0cqy8kvdzpCQdx1CFDZkQ==
X-Google-Smtp-Source: ABdhPJzv4fiupIq0BP8aoyZl0EKj339UCB3ZRtMVV0Lv/baM7npJRmNBELCQcSGxXvHf8nlEIar0CsEzluqEKYruPtc=
X-Received: by 2002:a05:6808:210e:: with SMTP id
 r14mr2475518oiw.172.1625218444412; 
 Fri, 02 Jul 2021 02:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210702085332.10035-1-yee.lee@mediatek.com>
In-Reply-To: <20210702085332.10035-1-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Fri, 2 Jul 2021 11:33:53 +0200
Message-ID: <CANpmjNPqHJqAaDBJDA1t-OOWKMSs5sqbwVRAkQr+E6w5EgJ1Nw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mm: introduce helper to check slub_debug_enabled
To: yee.lee@mediatek.com
Cc: andreyknvl@gmail.com, wsd_upstream@mediatek.com, 
 nicholas.tang@mediatek.com, Kuan-Ying.Lee@mediatek.com, 
 chinwen.chang@mediatek.com, Christoph Lameter <cl@linux.com>, 
 Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_023405_657175_45125011 
X-CRM114-Status: GOOD (  20.86  )
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

On Fri, 2 Jul 2021 at 10:54, <yee.lee@mediatek.com> wrote:
>
> From: Marco Elver <elver@google.com>
>
> Introduce a helper to check slub_debug_enabled, so that we can confine
> the use of #ifdef to the definition of the slub_debug_enabled_unlikely()
> helper.
>
> ---

^^ this '---' is wrong. It needs to be removed, because anything after
the first '---' will be discarded if it is turned into a commit by the
maintainer.


> Signed-off-by: Marco Elver <elver@google.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
>
> ---
>  mm/slab.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/mm/slab.h b/mm/slab.h
> index 7b60ef2f32c3..a11126afe24c 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -216,10 +216,18 @@ DECLARE_STATIC_KEY_FALSE(slub_debug_enabled);
>  #endif
>  extern void print_tracking(struct kmem_cache *s, void *object);
>  long validate_slab_cache(struct kmem_cache *s);
> +static inline bool slub_debug_enabled_unlikely(void)
> +{
> +       return static_branch_unlikely(&slub_debug_enabled);
> +}
>  #else
>  static inline void print_tracking(struct kmem_cache *s, void *object)
>  {
>  }
> +static inline bool slub_debug_enabled_unlikely(void)
> +{
> +       return false;
> +}
>  #endif
>
>  /*
> @@ -229,11 +237,10 @@ static inline void print_tracking(struct kmem_cache *s, void *object)
>   */
>  static inline bool kmem_cache_debug_flags(struct kmem_cache *s, slab_flags_t flags)
>  {
> -#ifdef CONFIG_SLUB_DEBUG
> -       VM_WARN_ON_ONCE(!(flags & SLAB_DEBUG_FLAGS));
> -       if (static_branch_unlikely(&slub_debug_enabled))
> +       if (IS_ENABLED(CONFIG_SLUB_DEBUG))
> +               VM_WARN_ON_ONCE(!(flags & SLAB_DEBUG_FLAGS));
> +       if (slub_debug_enabled_unlikely())
>                 return s->flags & flags;
> -#endif
>         return false;
>  }
>
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
