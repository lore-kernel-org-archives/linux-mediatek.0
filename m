Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB90C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:37:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 108182333E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 108182333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ozD79spY6OVdVOCSxR4+t8jR2QHC2du7lIBrJ5qEStA=; b=ej4RloL+zmHrbI6548yTs9HkW
	1jV7f3mY25RORz7D7qlVRl9Lz5+KVWCXRhxrHX7RqKne7ZPwjWyfpHDUHj4ql6OioNYCx8aGNm+pq
	IRvUp+uKc3PRV0h+/SJ/LOYHVnz/iaKnH3DSZL2aQyV1OyEYUlTURodSaIwXTxhJkbgyeB4SK6ZfY
	/0hcfLTh4t3dazUNuIwEE2tK+FwXFZJ8K/57AfQISRYfCQQtrrAY/aeGU2uFFOhFobEwPegVNOoAF
	Fm0Cji6S1b0LmP6BVUW6D8LHGhitzpqZ3gaWHl5lG2DvXQ9Ym62WzIANJOWiGwPDwxFq1ampeeyIl
	TQDVjxU2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwdc-0007SY-53; Fri, 08 Jan 2021 18:37:28 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwdV-0007Pu-SG
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 18:37:23 +0000
Received: by mail-pg1-x535.google.com with SMTP id p18so8137779pgm.11
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NdEgLCv0WcsMLswh+8Qu2jUrNvErOztEJExOtEtsP1U=;
 b=eW2T0ERT3EcmrriRa+877oo1orT/BVz49StZkuNqKMQNcIaFxdh143+b8LlkF5XuMR
 kNyWgVr0UEOYZ/WbjZ8Sd+0e08XdNkwXsXhyT1mSfU9c1gRkBrx4ZN/USZMovfYf1buP
 Qw8/g23Fwa1FOnsYC98vZ9aeUeXNRx8cmRoWQn87zRawWjIoQxG/Akx85WYUsGFQn5qr
 ebIvlYHuae7YA0rNHMbT+4h73YkFIHHliv2o2YdmHzOb0LicWxghdz5fX/A0o3tPU2cP
 o6ud33sUCbRpoSyAGJT/tjASduh/4NrlrSEekmdXp3hDUpcCg/NBG+RMSQiyqdS3dQZZ
 bqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NdEgLCv0WcsMLswh+8Qu2jUrNvErOztEJExOtEtsP1U=;
 b=dAhB+qZFpR3F562I9s4mx5vqrTCCnkyuu5ErtXB6ML8Sdukvqe1Achuf/ZEXGT/Mhd
 6jcQc8pt+D7f2oCJji8uiB2GRYSxNN5kgYHSq/W6Z/HrwXhje4cblz+Chb+/L3fKqE7z
 JPmmZIxWnbUrEm1Dt74WcVo+oZoQ9QCOTFkNbvb3dXjoAf27JZPWNbfRfWD9vCganJwB
 PkSYe3IQRDA00JR89GQ9mjN9Aow6JtquZLhaRktjrwdMrAM2xPLRoz1M6FPXf3bS4r7N
 Q99HHwGX1XFkWwE0ItoiZVUo1CrJ/anL/XKYt3Ky3GhPJhLOJxhr3uMjSERJb6J1CJtW
 yE8w==
X-Gm-Message-State: AOAM530UGPTaG31nwIfaYJpGu+e05MbPCsiHzER6GYyNzZgFMVgH4ShN
 WexUHe2jnF0MU9pz0NIt9+7HoGgcEWnPbdjuWVB1zw==
X-Google-Smtp-Source: ABdhPJwEfe1QqhFk0jrAFEufd1jArwzUfZxR6UaVy99xbVOyreBChQZUpNRelxBssoGesrEYfF6ujhJVFLOrd+Ew/2I=
X-Received: by 2002:a63:4644:: with SMTP id v4mr8354904pgk.440.1610131038922; 
 Fri, 08 Jan 2021 10:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20210103171137.153834-1-lecopzer@gmail.com>
In-Reply-To: <20210103171137.153834-1-lecopzer@gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 8 Jan 2021 19:37:08 +0100
Message-ID: <CAAeHK+xaVvvMfd8LhPssYi+mjS-3OVsDaiNq2Li+J7JLF6k3Gg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Lecopzer Chen <lecopzer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_133721_932840_9D79AA66 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, yj.chiang@mediatek.com,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dan Williams <dan.j.williams@intel.com>, Will Deacon <will@kernel.org>,
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

Re this: it makes sense to introduce vmalloc support one step a time
and add SW_TAGS support before taking on HW_TAGS. SW_TAGS doesn't
require any special hardware. Working on SW_TAGS first will also allow
dealing with potential conflicts between vmalloc and tags without
having MTE in the picture as well. Just FYI, no need to include that
in this change.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
