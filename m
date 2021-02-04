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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E318EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 14:46:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BCC64DFF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 14:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BCC64DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CUDOZvi64kW2keu0tIo1ezIrzV5g2640W5rlxILb6t0=; b=IfEMu4DFesKnCW9TYYpKtqdBq
	lf2DbEJp4VInYKhik+PqIvTZTXFGpxVamsVbk4JtOyIfpSPrWyxy35QZ9dXd72tiagybD6zppTBQ5
	rbAzXrXSKz/JGftPlTAjopje/aXH3xz4A3px5UWxL5jTfq0vACva/4DZDYdUBj02aWYkVWSR/4caX
	iYFPy0QA3WJO3Td2qW0/M9Cm4ZJzeAVUPfJK73shYPedZ6A043rjbpoAUOiZIZX/QtJEM4aCtgk2i
	kac4qd3j2nwNkxMozIe3A0Sv3i/vqktXOb3k3PPbWrYTGlZIKZSE0DjMTTEsN1NpVz3R6uuK3QsO2
	tYheS6PLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7ftu-0004YO-AI; Thu, 04 Feb 2021 14:46:30 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7ftr-0004XQ-Hk; Thu, 04 Feb 2021 14:46:28 +0000
Received: by mail-pg1-x535.google.com with SMTP id o7so2264532pgl.1;
 Thu, 04 Feb 2021 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONy/oQQmnX5TrrjNFytVoLv75B7UXC2fqKWnMIXbGzs=;
 b=JvJ1qeNfvw6BcOjaGVSW5FIeL8kmh8OwMEOC4re7970bU1N83umruRDn8+w+fLl4RN
 63EvVEhR6dqS8hoY8mApckXYpIrU6MSmB0GOny3r0m0f58w83FXlYnb2jj4OZptsfkYl
 6snfOqi/Hjk7v4Khp5TrGaVjItOSRxAJKXH0JgFYUJRg3aOfNVESawuqryyssousV9k9
 i3sK42o8TJSD0eIFg4IRMJJRoikqyjyUprXOlu9kS8USrZn1RAcAQXL2Rq+gdOoUjfFE
 DcF7Fq0L6QsyUr0wnVQhXzIMUVbuz0O+5BklkUnjDBuM2+9p2OSsbBkYK6hE7aGyJuKq
 gAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONy/oQQmnX5TrrjNFytVoLv75B7UXC2fqKWnMIXbGzs=;
 b=glW7b1Kzn8vkz1eDI4W5Jgv06nFY3wakWTvYWFBFTdagL1BEuXD2SHZ+kU/SvQWkXn
 1gmENBnLeGx54sGVTTtP3KSSkNlySZDkW8kmTLJs6lS+rpn/wqbv4B13oNR4QqUDSuFM
 rzI2ZrsblI23NtI+k91m38e8PeKfLixyxZinnXDvrJ5fJ5GyARySGt+xYZwc0mYuiMVI
 te0F70TQ8WyK0mIdkDcVqTSKKoaFyE/Q69QW+ukMKO/g6+CvgLkeQlynkg5l99h91fxb
 P5JuVqfW2OXyoP1p0T2XOz3iWtPTfFKjOCfrVGNDLRy8C4KLKKyYCuC/w8TWQI8AClHS
 8KJQ==
X-Gm-Message-State: AOAM532uYXWKUjYHeEs5Hd2WtFzO342SiJYrk6WlZ156vAB97x6ms8Wl
 x/UK2BJp0MD9XPZEgQfb3Qc=
X-Google-Smtp-Source: ABdhPJzai0dWbSt7+WLA3WtD42I4vYknfBo+7vrNRDV/4Nj5JBi54UmO9JfeYGktAdgIawh4bBqF1A==
X-Received: by 2002:a62:a108:0:b029:1c1:119b:8713 with SMTP id
 b8-20020a62a1080000b02901c1119b8713mr8565016pff.74.1612449983550; 
 Thu, 04 Feb 2021 06:46:23 -0800 (PST)
Received: from localhost.localdomain (61-230-45-44.dynamic-ip.hinet.net.
 [61.230.45.44])
 by smtp.gmail.com with ESMTPSA id z2sm6382878pfa.121.2021.02.04.06.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 06:46:22 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: will@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Date: Thu,  4 Feb 2021 22:46:12 +0800
Message-Id: <20210204144612.75582-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204124543.GA20468@willie-the-truck>
References: <20210204124543.GA20468@willie-the-truck>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_094627_605194_0B894773 
X-CRM114-Status: GOOD (  22.20  )
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

> On Sat, Jan 09, 2021 at 06:32:49PM +0800, Lecopzer Chen wrote:
> > Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> > 
> > Like how the MODULES_VADDR does now, just not to early populate
> > the VMALLOC_START between VMALLOC_END.
> > similarly, the kernel code mapping is now in the VMALLOC area and
> > should keep these area populated.
> > 
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > index d8e66c78440e..39b218a64279 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
> >  {
> >  	u64 kimg_shadow_start, kimg_shadow_end;
> >  	u64 mod_shadow_start, mod_shadow_end;
> > +	u64 vmalloc_shadow_start, vmalloc_shadow_end;
> >  	phys_addr_t pa_start, pa_end;
> >  	u64 i;
> >  
> > @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
> >  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> >  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> >  
> > +	vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
> > +	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> > +
> >  	/*
> >  	 * We are going to perform proper setup of shadow memory.
> >  	 * At first we should unmap early shadow (clear_pgds() call below).
> > @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
> >  
> >  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
> >  				   (void *)mod_shadow_start);
> > -	kasan_populate_early_shadow((void *)kimg_shadow_end,
> > -				   (void *)KASAN_SHADOW_END);
> > +	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> 
> Do we really need yet another CONFIG option for KASAN? What's the use-case
> for *not* enabling this if you're already enabling one of the KASAN
> backends?

As I know, KASAN_VMALLOC now only supports KASAN_GENERIC and also
KASAN_VMALLOC uses more memory to map real shadow memory (1/8 of vmalloc va).

There should be someone can enable KASAN_GENERIC but can't use VMALLOC
due to memory issue.
 
> > +		kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> > +					    (void *)KASAN_SHADOW_END);
> > +		if (vmalloc_shadow_start > mod_shadow_end)
> 
> To echo Ard's concern: when is the above 'if' condition true?

After reviewing this code,
since VMALLOC_STAR is a compiler defined macro of MODULES_END,
this if-condition will never be true.

I also test it with removing this and works fine.

I'll remove this in the next version patch,
thanks a lot for pointing out this.

BRs,
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
