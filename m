Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6262C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:54:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C88564F5C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C88564F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=svUISq8CUnWagPphBWx/yowafbIbQ5G4neL707Ztt/w=; b=lcJHyfD7Lcub/6VVwOM0uIyez
	jJPcmxiYO9wq4Rtnp0IncQE3pC9I6AprKJWj6PjFUTEtJtHhyzqa6mEDluPUl9GqFgP4k2IbK8f1k
	B1nnqfRT7JNetJ4mpLylBi7ayCM0/j3/BiG8mAk/dxULmPqU8E7CFAhevT/37Fkcic6NszrNCN2Q9
	9gLzYcK8lmwdOw+7dr0A+eqeOLw8XXV+mS8nV+Bx/c/vwU5B22qYzDXRZbECSq3/YWxzwk2mesAaW
	xZr5DqnB9YCz+X4zUomnBNpMa7MWVvRs7rBD9cAL+npievtp1D7TmjhguNMProd2GH04bAtUiHmLQ
	/2HPV+VhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7gxH-0007Cg-PP; Thu, 04 Feb 2021 15:54:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7gxC-0007AZ-QK; Thu, 04 Feb 2021 15:53:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id w18so2355393pfu.9;
 Thu, 04 Feb 2021 07:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12TvnDbFoHozjXEBq3jhYOc5BE9nWZn0P3eT299I/9M=;
 b=NinYrz5HwaCb0qq/rEnNwOPx6QmtQi63UUzFzsXFLnUBHeZC1H0vd4gdNitL8ljpn7
 JgbnHSKWmW8zBYdCVeLnOw62uOaK2xAOYM5qaGXVX2cObM96tsJwsghylpKX5J2JmCEp
 zRZWWXLSEb3bhPr4fAPlOfAWOKx0lAIs3W3L/cAwvOWXKLWBeEF8oDrsB5jh89QZs1ha
 zUttQr9P5McciU0O78xQjpF+8TJWdQuJSktoRmHxX2bKbS+oXsw9MGpdGrIvcgmuK6J6
 /DcDhIkd+cjexFi1QS9deq9KnoqL3e7307opKt+JWr3j7i+Ax6lbN3bP3zMbx4Lso8hf
 HEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12TvnDbFoHozjXEBq3jhYOc5BE9nWZn0P3eT299I/9M=;
 b=e13BYHlp1/wivfPrLyrWSFf37rZtkL5fUEOOk+joPOeFm1K/JjBcOwgexvGx2GbQ/p
 /ErKxqaWQX68Gv1RIX+GBZ9tJ0EnygttsRzYuXbDptyCJLk110M6rqpQX+OzLyDRaMwl
 ZIC28xt/xg9ToDTvXT3rJEd7QRocejcK3z6Am7pSOglsrw4PaEljw/W6TiG9DKEY3e2J
 CXctY4VXyuq4E4UhyGqZaHg5Er7Yrnlxtbr47FwvMIxWgMZekBJGXIjJt2CxuvKRICIM
 /3fSq0a35oR8CiJa4LSS0m8vTHPX9Mq4uTwjfRAtOqDke6QKp2S8wn8cb7Dn6XldGE8k
 272g==
X-Gm-Message-State: AOAM531aoVOPs/s5gOgcgtpbYg112Z045YHiJRkqgjcBOFN5eYs9bfNS
 Cy0ySa50ywh6xE1UgkR5F/M=
X-Google-Smtp-Source: ABdhPJxBXdR4q9H553UCiCPpdlcKwZ6b4yXIEmQNTn2cfq/9NXQmnXeoTexpuI1RuIEGOoKpWIvuPw==
X-Received: by 2002:a63:105e:: with SMTP id 30mr9541231pgq.24.1612454036561;
 Thu, 04 Feb 2021 07:53:56 -0800 (PST)
Received: from localhost.localdomain (61-230-45-44.dynamic-ip.hinet.net.
 [61.230.45.44])
 by smtp.gmail.com with ESMTPSA id 16sm5580890pjc.28.2021.02.04.07.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:53:55 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: will@kernel.org
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Thu,  4 Feb 2021 23:53:46 +0800
Message-Id: <20210204155346.88028-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204124914.GC20468@willie-the-truck>
References: <20210204124914.GC20468@willie-the-truck>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_105358_913893_3B3655CB 
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

> On Sat, Jan 09, 2021 at 06:32:48PM +0800, Lecopzer Chen wrote:
> > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> > 
> > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > by not to populate the vmalloc area except for kimg address.
> 
> The one thing I've failed to grok from your series is how you deal with
> vmalloc allocations where the shadow overlaps with the shadow which has
> already been allocated for the kernel image. Please can you explain?


The most key point is we don't map anything in the vmalloc shadow address.
So we don't care where the kernel image locate inside vmalloc area.

  kasan_map_populate(kimg_shadow_start, kimg_shadow_end,...)

Kernel image was populated with real mapping in its shadow address.
I `bypass' the whole shadow of vmalloc area, the only place you can find
about vmalloc_shadow is
	kasan_populate_early_shadow((void *)vmalloc_shadow_end,
			(void *)KASAN_SHADOW_END);

	-----------  vmalloc_shadow_start
 |           |
 |           | 
 |           | <= non-mapping
 |           |
 |           |
 |-----------|
 |///////////|<- kimage shadow with page table mapping.
 |-----------|
 |           |
 |           | <= non-mapping
 |           |
 ------------- vmalloc_shadow_end
 |00000000000|
 |00000000000| <= Zero shadow
 |00000000000|
 ------------- KASAN_SHADOW_END

vmalloc shadow will be mapped 'ondemend', see kasan_populate_vmalloc()
in mm/vmalloc.c in detail.
So the shadow of vmalloc will be allocated later if anyone use its va.


BRs,
Lecopzer



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
