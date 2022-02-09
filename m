Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrzjOl1+q6HkgjhJSS0j3QX5PAyVvn/eX+ikSYSmqhc=; b=01uWWYo/9c0nDy
	vWmQpl1qMRJ9KaKxV0afm2hvLBdSz5LFSyUf672LC3roXs7f1gJ/B/ILUUC/SCucCdEjGeor69EDl
	RGz/4WuppKbvs4K1AhCcIPSy0LVpBAVjLQK58YJYF+TE989kr7NZ/9R8IwmpXcFvB0QJQXY6hjVNT
	ELk9DgKAMtcdUlWQfmOqAFoh3a1OtU/UElCOwvsJhaU/d2vQKCySwqKJcr6C1KQcImALXsfawcLfF
	mgeqbEQpf0E7C1V+3ri3rWrpRaWVFhTbBqAz9FnEZZl9IxZ26T3+QZclGbF57xkUjeLZrWg6f5qFI
	tzARpET3l0EA3TjCWlIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHuvQ-001jLg-3W; Wed, 09 Feb 2022 21:54:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHuvM-001jKL-NS
 for linux-mediatek@lists.infradead.org; Wed, 09 Feb 2022 21:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644443691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G4Vjp3ISdYeY8fzvSFlPeRWv5ed2FS1oG8JSf5nd0SI=;
 b=TomdO//0zB/kRCpAeslKjtZrrWrzVFUdPNRMnXf1dEPK73w0tj3r7sBkI+AVxXTDnMSbkC
 O5nOZXsEmyfCU2AlLKkTpWfPMAdyYfl1vxgesIS0tq1Eg5KdwAk+mOuOGLlqEs4gsfsxB9
 toyyxEQBw50rbgrEnhN84Ue+O7LyQIY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-I5fQhj4AOiOnhNGvEdWtmw-1; Wed, 09 Feb 2022 16:54:48 -0500
X-MC-Unique: I5fQhj4AOiOnhNGvEdWtmw-1
Received: by mail-qk1-f198.google.com with SMTP id
 d11-20020a37680b000000b0047d87e46f4aso2361118qkc.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Feb 2022 13:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G4Vjp3ISdYeY8fzvSFlPeRWv5ed2FS1oG8JSf5nd0SI=;
 b=GJsHFlxUwCBKv0gMIw68ws2G2oE7uATf5DjypjX1TBbEK0IAQbB8/1FBpIuggsWle2
 XZ9qSEFJnMn0VxcXTNSebkHtQH9W3GWcdh7xIpn69mdkU4ZbjCK58DnqjZ5u0Kx9rJtX
 A4x7eazvviDJSW+pMihLs8Qs9oWWIPqFC+aTMWpLop9Z4hjfOetXqcNX6Dlz8ZAKDOof
 G6ealMaGcT6b5pCMj39c9qtHWSf5BLgnD4V1BT0faK/NHtKWojQ9X5ZjTZ7qjNL5jRPw
 JXU46etS4J6zhdEVdlgWlwWCsXRJSBRPPUT49lnOOtc68rnYMl+EWuJr69v9aDlB/vUh
 D/Pg==
X-Gm-Message-State: AOAM531wEBn5wYYJj7aySJJATAh+NSneLkw9AIe2+653uDPHOUgAcG6Q
 VdQwuHhGEMrPVwFYPM6PYYRtU4vezfCtblNxTG2OXdQGJzmWspxpSEwRDX9UU5Mb5NQ35NBdsRl
 ezn59fXdGKcPzXxmm/XaPONta8S9rBIOn
X-Received: by 2002:a05:622a:296:: with SMTP id
 z22mr2881544qtw.13.1644443688306; 
 Wed, 09 Feb 2022 13:54:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFrCPJ+6XKauKxJ7NxYVD3KF/sK7bZF7uFmE4jil0rZlccWMwS7SraCxnnG1yIwW1HMuPj9A==
X-Received: by 2002:a05:622a:296:: with SMTP id
 z22mr2881528qtw.13.1644443688085; 
 Wed, 09 Feb 2022 13:54:48 -0800 (PST)
Received: from halaneylaptop (068-184-200-203.res.spectrum.com.
 [68.184.200.203])
 by smtp.gmail.com with ESMTPSA id d11sm9667430qtd.63.2022.02.09.13.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 13:54:47 -0800 (PST)
Date: Wed, 9 Feb 2022 15:54:44 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: rostedt@goodmis.org, matthias.bgg@gmail.com, akpm@linux-foundation.org,
 mhiramat@kernel.org, vbabka@suse.cz, wangkefeng.wang@huawei.com,
 linux@rasmusvillemoes.dk, keescook@chromium.org,
 valentin.schneider@arm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH] init: Use ktime_us_delta() to make initcall_debug log
 more precise
Message-ID: <20220209215444.sxuxutqwcyisbbld@halaneylaptop>
References: <20220209053350.15771-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220209053350.15771-1-mark-pk.tsai@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ahalaney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_135452_847232_B91F38E1 
X-CRM114-Status: GOOD (  16.19  )
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

On Wed, Feb 09, 2022 at 01:33:50PM +0800, Mark-PK Tsai wrote:
> Use ktime_us_delta() to make the initcall_debug log more precise than
> right shifting the result of ktime_to_ns() by 10 bits.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  init/main.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 65fa2e41a9c0..c8edcc3029b1 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1246,15 +1246,11 @@ trace_initcall_start_cb(void *data, initcall_t fn)
>  static __init_or_module void
>  trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
>  {
> -	ktime_t *calltime = (ktime_t *)data;
> -	ktime_t delta, rettime;
> -	unsigned long long duration;
> +	ktime_t rettime, *calltime = (ktime_t *)data;
>  
>  	rettime = ktime_get();
> -	delta = ktime_sub(rettime, *calltime);
> -	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
>  	printk(KERN_DEBUG "initcall %pS returned %d after %lld usecs\n",
> -		 fn, ret, duration);
> +		 fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
>  }
>  
>  static ktime_t initcall_calltime;
> -- 
> 2.18.0
> 

I took this for a spin while playing around with other things today,
cleans things up nicely imo.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
