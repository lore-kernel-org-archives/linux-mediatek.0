Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25709C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 14:51:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B658A64F58
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 14:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B658A64F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RcMI7YU1mAFtx5G3ca8LxrE+Qh1d4B6ux7qZU4MhYas=; b=uVs+4SqTvB8SS/42pjT4UeQXg
	9ZGUqBKpeTEY13IFVdf5iZmJODicwmCxCB/0nNrOT4OwikFexeVJ/Lk+s87ICWXMMjge8Wo3kww62
	PLoZ1ihMSnyVi+uEepOB25GaWDs1+ZcDHjJqzYged3DsHPp792wTE/xM383D6uXwGK0APKXcugnjf
	H8VE0+/WxXsTik+h8/gXtrfJ8tEey5PgsBL9rCPdm928oYenxV5eyOY7fAcjYTwLVQSt2guOWqC8a
	8fhElvWrBOt3C8AFjWFiahBmveHMbZz+4nmPyh/aeWlU5NFFBb8Y3ax0ctbkOc3+mr8NZjXo4bH5F
	pFXK5uUog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7fyy-00050n-AN; Thu, 04 Feb 2021 14:51:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7fyt-0004zd-Ms; Thu, 04 Feb 2021 14:51:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id x9so1890993plb.5;
 Thu, 04 Feb 2021 06:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j2b0oOc+rzmzi38W+sTrovSj5jDaFAC2TznS4DZxElU=;
 b=soWUtNJ9rxQTjmER1hm91KKYjx1D2hTUbleBe3U3hCVjwO4eY8NS8NDaAfLP364QdJ
 x0N62cGzoJOUzxf7o4kpGpqTEO0dMCK9GYj8A3kPFCAEeTPNzqZoP4Maj7xZeinOCCTa
 XzOzVTL8cdIZUyBb2sR2ubIHIHAk07QzIkD1hCJM14rbEznL4BKjT8R4WGix86c+YGIf
 47169whurzBYY8RW3AriKDY+Z/5S19xhPHW5qeMLPNgPUd1M9YS8cB+ia3XtVxoKqwhg
 dfoqp+1nZiIcrGU78eAwRlfJ6WwbWxWRFCrnOd2A1MwvahD1X0kuFbsQ4HmlUb2MlfAq
 m+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2b0oOc+rzmzi38W+sTrovSj5jDaFAC2TznS4DZxElU=;
 b=COiLC1P8S7LP7W8iwh9N+mVDgefwv/GRZQkfDaq6CavOLexAYPJK8Eko7QN7pCW787
 0snevFOrj9tx3/riDoOYAUeZ2D+tRLmVdK1+pHeyeXr7BEfuGzOCi2I6sTTziaxRAN87
 14HklN8X00jIGp6jFUVz28mGec42GQUrryAQXx7KsevWRRFRu0aiq5J+aV5mujOU95o9
 H/QoNTd9+YLaFVt6IgrrIDfurKcCZ/z0Zm351C+6d9DdRbC20aE2lgi7Uy8w0HAwjQy3
 0pg0lFM8z6j9CYywKrNgS5FH2UGdXeQm4OsFHvzF/wt/sLlEsUPapS56RCWSGndEdqjM
 Ie5g==
X-Gm-Message-State: AOAM530guDsiZGylNuo2lkMn/eKjowvl+95nUCmXqXd6IMPyiQ33Ut7I
 FmfMPAhTcXHBwsTrOanZdd0=
X-Google-Smtp-Source: ABdhPJx7fA7KLsWP2F4d34Pj5VS0YAoanRrPZirQ5OS3yJ5pM2+RSI6hhGsHvsCd6yxeh/96BDE3Kw==
X-Received: by 2002:a17:90a:6a43:: with SMTP id
 d3mr9043689pjm.224.1612450297639; 
 Thu, 04 Feb 2021 06:51:37 -0800 (PST)
Received: from localhost.localdomain (61-230-45-44.dynamic-ip.hinet.net.
 [61.230.45.44])
 by smtp.gmail.com with ESMTPSA id u3sm6866224pfm.144.2021.02.04.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 06:51:36 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: will@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: kasan: abstract _text and _end to
 KERNEL_START/END
Date: Thu,  4 Feb 2021 22:51:27 +0800
Message-Id: <20210204145127.75856-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204124658.GB20468@willie-the-truck>
References: <20210204124658.GB20468@willie-the-truck>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_095139_753193_A9DEF81F 
X-CRM114-Status: GOOD (  17.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com, dvyukov@google.com,
 aryabinin@virtuozzo.com, linux@roeck-us.net, andreyknvl@google.com,
 lecopzer@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> On Sat, Jan 09, 2021 at 06:32:50PM +0800, Lecopzer Chen wrote:
> > Arm64 provide defined macro for KERNEL_START and KERNEL_END,
> > thus replace them by the abstration instead of using _text and _end.
> > 
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  arch/arm64/mm/kasan_init.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > index 39b218a64279..fa8d7ece895d 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -218,8 +218,8 @@ static void __init kasan_init_shadow(void)
> >  	phys_addr_t pa_start, pa_end;
> >  	u64 i;
> >  
> > -	kimg_shadow_start = (u64)kasan_mem_to_shadow(_text) & PAGE_MASK;
> > -	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(_end));
> > +	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
> > +	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
> >  
> >  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> >  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> > @@ -241,7 +241,7 @@ static void __init kasan_init_shadow(void)
> >  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
> >  
> >  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
> > -			   early_pfn_to_nid(virt_to_pfn(lm_alias(_text))));
> > +			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
> 
> To be honest, I think this whole line is pointless. We should be able to
> pass NUMA_NO_NODE now that we're not abusing the vmemmap() allocator to
> populate the shadow.

Do we need to fix this in this series? it seems another topic.
If not, should this patch be removed in this series?

Thanks,
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
