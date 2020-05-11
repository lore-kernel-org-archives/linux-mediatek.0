Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A27C54E4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE19206D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0aTV4Mz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ILnkM6H1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE19206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iu45WBDF08v9GpgXRVbnKpttu8MxEGtNvL1TYocEAo=; b=W0aTV4MzExebDB
	KpeaDObyNN8axtskbfzQTQ1aMrJHpJEMZ4+jGH54kbIlsWasZUUhSa184xjkow6d+B55IdOjIrpyQ
	vpEqbuSPpdLEF4eMu86bd2jDjJN7qsYi7kxwDLYL8RweXF46dNVA1IrWdd897m2O320Lc7PY+DJxV
	OH/0iezB8XqgAc3yllFMUT/dfZssttIWZZtLD90sKBc3Ss41NUFzbDyCBysS+RfMhg4zChWD+n3jA
	SGXW3K5J8V0hoRwZha3OvlI6cRWdtsgkgj4fayEIeTYsI54AH0jHcSIS1M4BePsmBS9BVD9SpXHIo
	h1LN3D1oKBylXfNea2qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY630-00087T-Tw; Mon, 11 May 2020 10:52:34 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY62x-00086K-N5
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 10:52:33 +0000
Received: by mail-qt1-x841.google.com with SMTP id j2so7187228qtr.12
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 03:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72CupRCuRPXXCvNwucE/1jDQJJRDxROzY5cHpuICnYs=;
 b=ILnkM6H19JK17KC3M5FAIaz0BrdJVQQCiKVz4hMQKY+zmUQLJmBjxqaofT2C/PU3bR
 lHITSoyEEq2oW26FnPNPLeLM+tiaSBXyJn5L1+kFGVUjqX7SpOtLm9yp/z6X6p6oEQmH
 ndb1m0gPuuPgyVNoMkNvQVywYqrDZDn39LAH6xZrCMKOauwpePg1Oz+BIRB6x8nt6d4B
 lQ1P9Eaw9sPiGAiWu4AhIUnGQrLw2+nsxYKt4JvErU8YbQ0Cb5jgY1s8cq7MP8HPxc76
 eUQS+lo9zvS/M7Rt+cjaAuH4xJ64f62hwjRn8smLeYRcRmBvI4hLFUrWOGCgn+0RgD9k
 9pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72CupRCuRPXXCvNwucE/1jDQJJRDxROzY5cHpuICnYs=;
 b=m98PdH/2k+zP9K2TSPeWVOyuI2usxIlO9LHNp+NBV65ZDG+rvQMX1LDUYNtY2XR6Kd
 bq5ux4tjT+As/G2tr+Z7SeqQrm75RH8SJwhmL8KKwCnnxlodeIRi3+aYXdbDWirFMLLb
 KiVR1ts8MDTsACyoTwfy0PHEtbBswYXMVqSq7awFI2v0XB7lMkbmAAM69mcI0bj1e+zX
 OkRsQm5FtkYg0kMRLWYXs4J2xOl38gPPMss1vwoq3fLoWaiqoIY3W0w5AwYSbxxEsJcB
 Nd67iWPYzIbK9GRy5wu5y8naDKF57oqdZviGXP53JrgX6BXYRMvsZJHvzNcSAnsaY3mc
 JOOQ==
X-Gm-Message-State: AGi0PuZvqhUNrq9pT7ZGXfyXCOfbRHRbvQG84rL48nxkYLit/wkaVRBM
 WbiB8BYaOZnocp0NO6MRAVdI8rb9ibiXzfoUXuWitg==
X-Google-Smtp-Source: APiQypJuV7vh5fEAGAZHwSjBCKi7okLe7bGzhUJ7V6MHqJk55bkwMB8VH74FcIlcoOfXfKrlsq8FE9ROC7OHxh1Ytq4=
X-Received: by 2002:ac8:370c:: with SMTP id o12mr15522299qtb.380.1589194350352; 
 Mon, 11 May 2020 03:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200511023231.15437-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200511023231.15437-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 11 May 2020 12:52:19 +0200
Message-ID: <CACT4Y+aL_R4uVFugsj3wXeXw2oXbe6KQ=YmwD0jCrUH_12ouiA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kasan: update documentation for generic kasan
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_035231_776183_FC0996D5 
X-CRM114-Status: GOOD (  21.79  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2020 at 4:32 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Generic KASAN will support to record first and last call_rcu() call
> stack and print them in KASAN report. so we update documentation.
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/dev-tools/kasan.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index c652d740735d..d4efcfde9fff 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -193,6 +193,12 @@ function calls GCC directly inserts the code to check the shadow memory.
>  This option significantly enlarges kernel but it gives x1.1-x2 performance
>  boost over outline instrumented kernel.
>
> +Currently

Currently is excessive here. Everything in the doc is about the
current state of the things.

> generic KASAN can print call_rcu()

s/can print/prints/

> call stack in KASAN report, it

KASAN is implied for "report" in this doc.
s/KASAN//


> +can't increase the cost of memory consumption,

It does not increase only as compared to the current state of things.
But strictly saying, if we now take the call_rcu stacks away, we can
reduce memory consumption.
This statement is confusing because stacks consume memory.

> but it has one limitations.
> +It can't get both call_rcu() call stack and free stack, so that it can't
> +print free stack for allocation objects in KASAN report.

1. This sentence produces the impression that KASAN does not print
free stack for freed objects. KASAN does still print free stack for
freed objects.
2. This sentence is mostly relevant as diff on top of the current
situation and thus more suitable for the commit description. We never
promise to print free stack for allocated objects. And free stack for
allocated objects is not an immediately essential thing either. So for
a reader of this doc, this is not a limitation.

> This feature is
> +only suitable for generic KASAN.

We already mentioned "generic" in the first sentence. So this is excessive.

This paragraph can be reduced to:

"Generic KASAN prints up to 2 call_rcu() call stacks in reports, the
first and the last one."

The rest belongs to change description and is only interesting as a
historic reference. Generally documentation does not accumulate
everything that happened since the creation of the world :)


>  Software tag-based KASAN
>  ~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200511023231.15437-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
