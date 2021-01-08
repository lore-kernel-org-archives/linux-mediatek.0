Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4F3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:31:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADCA23A7E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADCA23A7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BSoDGiZjKe0sbA6nomJkO7i3YntYIbQahK/CYxbsaIY=; b=0MQB+yYLzQban5maniIePaBHn
	vY5u0/qxUnOHPGxAr1mCvQcu2cjyoSRkS1o6TGfbbiHLy7WwDNfjlFeH1yIXGhBOh4KvRTY6AMM5M
	WdaUOYwWDLiyWxNDtKQ/51PZJ+9UdPSUSsr+hutV6IC84fq1H/ojBK19e1INdBIONvIMc+xRvXQV0
	DxPvPVzMvJlEgtuI+8VUP9RmiVvLRNN+6nFlxh32asNcfML7g3clILL0Kx0KOWJc0wiR0H9iC8rVd
	vFUxNG/861O/e60FbaaIIjVkcra1yw0eHZh+/o44qPJPHhS+9k5pCmzMVymOBJIE9LS6NhlPlsvsQ
	57p+2mfPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwXG-0005wz-MA; Fri, 08 Jan 2021 18:30:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwX8-0005uF-EA
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 18:30:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id t22so6784992pfl.3
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMtgJrbmi2Dq7xj4bsuhnhgijvRCuVpV/hWagawzWvg=;
 b=NtitF2diZ560VjUqe0aNEmnGnCs9j/OcQDpd7obF4GWgSzxReXHWFgsLG5uZDxRaAK
 X1DFXpWiVX/2j6DXeOECWut1VLvH6JvH4osI5ORI7YpkxZEwZqRAiAG8hdW1JzaXcXki
 1gY1bcNmz91Rf+MF3bt81LWkFTuQ3uJH/z52LZ2MYoapANxl2lO5E2Ckws8FPCS3MkDn
 yCkEOlFMJp8zuATAhPXOhLc00WHUwBjInJ1pMTemnqy7GHRH0qkUqwJs7JScsb2H91kZ
 S7LJaUE0xSS6L5lkVN3wmRJ6FPiAYINlGZINGhD/Uy5sur/SVdr0j9BuRzSpcysjUp5V
 0R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMtgJrbmi2Dq7xj4bsuhnhgijvRCuVpV/hWagawzWvg=;
 b=lqCL7JtEetlb+rRzHrmSorZDRIR0HApa3xnevCMRdbfvz+5R5hemqUTPSCBBWlURqI
 6OAzXe6xnCGocbrN8etSVZzMqg2s80D4eyhLX17V1y4ytD5FdWUuAnxm5Sq7ec5NXJvK
 MWgBwvGtxC6RMs6Cy305h63tJ/YtCW6yDKYzryoYZ47whYWamOwbKqcyDl061cxcj7JL
 ofiHERgn3GxJnasifXlWw1vEu5/1e3bPNbsKEwmd0DcMns7FuD8WIYAMLHGM75tsNcaI
 OFFpfhSFlAc2vda1i+emx2AyN3xR1z7Hu86Q+cGT+ypNw4VMR8SBG8m2lm8jeBEnjU3P
 xvUw==
X-Gm-Message-State: AOAM530/zP26QWZ4iGMW48aJzO38gTTHFjm/fZeHg3QRoA3LXnOGlnvq
 Gc84gQMPcqmiAYjVC+OH7TGZksJosarv7ycQ6xbRrQ==
X-Google-Smtp-Source: ABdhPJyzXMLihNJTmJ4IbqcbioPlGJ22BZ5FodpxuPX9jp6mXZvP5h1beqwhyEPhGYRAZ+ZRoqih0ksqWm0v9X52OkM=
X-Received: by 2002:a62:e309:0:b029:1ae:5b4a:3199 with SMTP id
 g9-20020a62e3090000b02901ae5b4a3199mr4942892pfh.24.1610130643942; Fri, 08 Jan
 2021 10:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20210103171137.153834-1-lecopzer@gmail.com>
In-Reply-To: <20210103171137.153834-1-lecopzer@gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 8 Jan 2021 19:30:33 +0100
Message-ID: <CAAeHK+y=vEuSe-LFOhxkEu4x0Dy2jYts18R0V6Pbv1-5Cwg9_g@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Lecopzer Chen <lecopzer@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_133046_674112_2E434BC6 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, yj.chiang@mediatek.com,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 3, 2021 at 6:12 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
>
> Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> by not to populate the vmalloc area except for kimg address.
>
> Test environment:
>     4G and 8G Qemu virt,
>     39-bit VA + 4k PAGE_SIZE with 3-level page table,
>     test by lib/test_kasan.ko and lib/test_kasan_module.ko
>
> It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL,
> but not test for HW_TAG(I have no proper device), thus keep
> HW_TAG and KASAN_VMALLOC mutual exclusion until confirming
> the functionality.
>
>
> [1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")
>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Hi Lecopzer,

Thanks for working on this!

Acked-by: Andrey Konovalov <andreyknvl@google.com>
Tested-by: Andrey Konovalov <andreyknvl@google.com>

for the series along with the other two patches minding the nit in patch #3.

Will, Catalin, could you please take a look at the arm changes?

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
