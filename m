Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1086C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CF123A79
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CF123A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8YDIyiZbEeOOtMfpoYqKyzumYJ6Jn4NdhZ0vkUNokE=; b=HFPmy/57Pz7IYoPE0FI4sXRvH
	fd5rmt+Q+Yk/gZI+JuzCzhsNAd/VT3uJJcX2X64nC8qSlhQqgtcnwLHfWhsu6aePPWofF+EO06S3I
	bvuxxGEq+7osvXcLM+AzwlsJsvBbdTDtHjfwrhUWNRo/zl9dVRmxLBRKzTU10FdjxY9a/0lc30A45
	/gGA4L0LlkRSgqBrTImUNuu+HKjFzbaT+u1rHoGHwDROo8PdnjN2olRbSvoPgHGx+WOUFZ0EICr9C
	G9zE696JQJLRz/vZtOl2YbA5zs6xGtxs3xXB8nZ7dYc6o7lgJ4w9Q6qnf5qcnqrvE5CWWnmDKrOqx
	dgr+2PrGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwSH-0005HU-LP; Fri, 08 Jan 2021 18:25:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwSF-0005Fm-Nj
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 18:25:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y8so6082635plp.8
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 10:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvvXV7bEAAhRZbN5Xzp/cblWdK/NVPGWOn4od85Z6/w=;
 b=d+L+HGQnJ8GkivLJcq4DSA2uJmUEaepv00NVO6HXnXJPKMFc+PtcXC1FqGYoEuOMyT
 s0pXM7/rVZSEDTRSIpT0t7Rd5Ha5ua5EkBbHlDLbrV82y4x5LFvv9+DKrxf2mNewLhOA
 oGwdlDMpLGuBuvDgbAgAeHZWF4BmA3bl/h5vs5xK9x43q3QakNcdeCuV+Edzegzk8S3f
 XLZDkOrFMrItw47dJOMCaGb0qkDDVq8mYsC6UXU0Z9t0t09FLfNAqWiikYHfXz6MSSBq
 4GKoC01+QiIWSjcxFl8QSUjD9ZlV+xv8AnZlaqcp4j+Jdg9qGFXMYI3dAmqV8mLxDtVQ
 z4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvvXV7bEAAhRZbN5Xzp/cblWdK/NVPGWOn4od85Z6/w=;
 b=r9uUxZnW8nQsNBcFS14xuVx4y4aqxRNNj5Cspr1k6WMPBsnLFV9flVi/wr3/lKGx6u
 hUxydsAOKuIsUXPrhD0XQ3NujVKDbTztJTv1AqE/ep5j+rplYWmnUEBqnwxc0+ulQM0H
 LyDuMmY6lpK8K7zA/8uKgIRGlNU89ImKi9HvP445Nwi7s+fSLsnO8B/qDXqN/XSmpKxw
 anCxwQ+RrSZxe0Yx3CicdVdI3wWVQoaut58f8ZrgZrMvv64QE6inZ8HdLASZjw8u65ty
 B1l82mOt+GY5zCiuGhJ4DnlfpHiI6v7f/chNCCk9V+LFyO1x23j9K9hMuLOelhJauS/8
 NijA==
X-Gm-Message-State: AOAM531eTlIrlfDN1LSg8jjnDnM4WRWXErFRc/vDjG37C4cjvhFOWkun
 XUnAvtMTInPuyrAXb8S36j1yy4akP4FSoa3cU9nJ4Q==
X-Google-Smtp-Source: ABdhPJyeJJzO6h/di2HJL1UmMv07+bcKcaBYuL/EVRKkCR5n8bUJwaYA/emooOx9egKITTXFLdGAXEu23w8IL5O6hTg=
X-Received: by 2002:a17:902:9009:b029:dc:52a6:575 with SMTP id
 a9-20020a1709029009b02900dc52a60575mr4902482plp.57.1610130339630; Fri, 08 Jan
 2021 10:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20210103063847.5963-1-lecopzer@gmail.com>
In-Reply-To: <20210103063847.5963-1-lecopzer@gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 8 Jan 2021 19:25:28 +0100
Message-ID: <CAAeHK+z_+sgoJbi8ULJYKdcNoB9WET8pRbkD7MvK+yp6k5sk4A@mail.gmail.com>
Subject: Re: [PATCH] kasan: fix incorrect arguments passing in
 kasan_add_zero_shadow
To: Lecopzer Chen <lecopzer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_132543_832765_A100BD0E 
X-CRM114-Status: GOOD (  15.25  )
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
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 3, 2021 at 7:39 AM Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> kasan_remove_zero_shadow() shall use original virtual address, start
> and size, instead of shadow address.
>
> Fixes: 0207df4fa1a86 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  mm/kasan/init.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index bc0ad208b3a7..67051cfae41c 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -481,7 +481,6 @@ int kasan_add_zero_shadow(void *start, unsigned long size)
>
>         ret = kasan_populate_early_shadow(shadow_start, shadow_end);
>         if (ret)
> -               kasan_remove_zero_shadow(shadow_start,
> -                                       size >> KASAN_SHADOW_SCALE_SHIFT);
> +               kasan_remove_zero_shadow(start, size);
>         return ret;
>  }
> --
> 2.25.1

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
