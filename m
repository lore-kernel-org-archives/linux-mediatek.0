Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00F7C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 19:58:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B301720659
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 19:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EbtOhOoD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Kd3uHXA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B301720659
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIsUumOPw5YfbQY6yqxj9pejibjGLOOoylxW/GJLsdU=; b=EbtOhOoDT0Evn5
	+530uHUiBP1qrGxUTwO91cv1Bq9tLgAged8WsQtsoJ71EKUKz8daFK8HY7VJUm8PKD0RCtTTAHMGn
	UDJ2vgGcTYkCVXUzygSQbmLEAw7WzMDBlKR+KmSPfyRGuQdDI911L9Rl5xe7CB77C7nuc+vvIlMsz
	I3AsQv+zFk58A/LNyjks88BuTGOZSLrXLTCkg7VrfOjtXMQNSS+DgHJgVqn1D1RU/1gy7RWUsdx2w
	iVUccHjHpG7rmdNzijKufAGE6oq+dpwmxqgMOxf01NuK905uljwNNgmTrVQUNEa/w1j3fnvb1N3da
	NyjUsDup4y7AC04r4wyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXsbB-0000tr-5T; Thu, 21 Nov 2019 19:58:41 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXsb9-0000sS-1k
 for linux-mediatek@lists.infradead.org; Thu, 21 Nov 2019 19:58:40 +0000
Received: by mail-qt1-x842.google.com with SMTP id o11so5042652qtr.11
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Nov 2019 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NrzxHrY8HSPigVP1ddvjUfQFh9GexeJHE6yrEfyJGn8=;
 b=Kd3uHXA1P6DuCOhB2GxNrroyfRPcjST5rj7knlJlrVz7Lrr4YsfVvSNtbCJMOzDkm9
 v/Y0j8z3u2abnQEXY0H/eS8gg8o59m/He8HAtGj9aKsogiT9HudHc7VPDU2uoLVegRab
 sua5+XIGxHCZJbnaUyGj+m0xq4sdO/dgPH5ql42Q3eTE9zhaycI8jmcThgYH39KDXrzD
 1s8L4VxDYCCJ8XxaPf86AG60AUSWCfVYt225dJygovcnw48m1vkJtxVDMaj17SMkzVOU
 6motdGawpCw2ZkIZ70iqZsTbQBr8FOa9spMlRL+BJl5lsiRXNBDSQxevq5bBE2xPOBET
 0W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NrzxHrY8HSPigVP1ddvjUfQFh9GexeJHE6yrEfyJGn8=;
 b=oU6RIIgSHFZTlIu4bocRukGVLsahj2TLD15CCZ5Pdj5vIc+5Fnv8ofVe8Yybos3evc
 9f4jpg7n3m9CL+NlrPNk35EtIdmSFujRHwJ57T+G5/frOEq0UgXfKulLQufPjeu/d7in
 JaGt2ZZttHawhfKoiaFuP78cjjThCAj05LQ4Y0WBX/NCkiUhIFmvZv/MNEzFumX4mSPy
 R4DDcGtaroAOr50jdEJ9ThGPiusmQ7Ku9WItA7cuxs8oIoSOYo63CuWQjN3T+ldh8eAD
 ohflqqUgnWHXKOFHkVz8FZ1tE4oRHVARuGSwasJgmQsLw41u4HNKW+TzG9hJxTmieHTe
 F70w==
X-Gm-Message-State: APjAAAUqWLQrCHpC9cROQ1cuJ4cMWA78w+ywd38NoFnnOthjXv9J2npt
 BIwIMb6ZqfUHSwms+AxBKxoPz/GXSV/wnpSVAyLg1A==
X-Google-Smtp-Source: APXvYqzPK/X2AE0eWdYsKj49rv1x+g3AQZDvujO3L268Ze2mJnamWmtGWcsUjKvRNU7iWCoHqffcHfRnbEOs1IRx7Os=
X-Received: by 2002:aed:24af:: with SMTP id t44mr10377791qtc.57.1574366311591; 
 Thu, 21 Nov 2019 11:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20191112065302.7015-1-walter-zh.wu@mediatek.com>
 <040479c3-6f96-91c6-1b1a-9f3e947dac06@virtuozzo.com>
In-Reply-To: <040479c3-6f96-91c6-1b1a-9f3e947dac06@virtuozzo.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 21 Nov 2019 20:58:19 +0100
Message-ID: <CACT4Y+botuVF6KanfRrudDguw7HGkJ1mrwvxYZQQF0eWoo-Lxw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] kasan: detect negative size in memory operation
 function
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_115839_096778_1093EC5D 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2019 at 1:27 PM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 6814d6d6a023..4bfce0af881f 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -102,7 +102,8 @@ EXPORT_SYMBOL(__kasan_check_write);
> >  #undef memset
> >  void *memset(void *addr, int c, size_t len)
> >  {
> > -     check_memory_region((unsigned long)addr, len, true, _RET_IP_);
> > +     if (!check_memory_region((unsigned long)addr, len, true, _RET_IP_))
> > +             return NULL;
> >
> >       return __memset(addr, c, len);
> >  }
> > @@ -110,8 +111,9 @@ void *memset(void *addr, int c, size_t len)
> >  #undef memmove
> >  void *memmove(void *dest, const void *src, size_t len)
> >  {
> > -     check_memory_region((unsigned long)src, len, false, _RET_IP_);
> > -     check_memory_region((unsigned long)dest, len, true, _RET_IP_);
> > +     if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
> > +         !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
> > +             return NULL;
> >
> >       return __memmove(dest, src, len);
> >  }
> > @@ -119,8 +121,9 @@ void *memmove(void *dest, const void *src, size_t len)
> >  #undef memcpy
> >  void *memcpy(void *dest, const void *src, size_t len)
> >  {
> > -     check_memory_region((unsigned long)src, len, false, _RET_IP_);
> > -     check_memory_region((unsigned long)dest, len, true, _RET_IP_);
> > +     if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
> > +         !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
> > +             return NULL;
> >
>
> I realized that we are going a wrong direction here. Entirely skipping mem*() operation on any
> poisoned shadow value might only make things worse. Some bugs just don't have any serious consequences,
> but skipping the mem*() ops entirely might introduce such consequences, which wouldn't happen otherwise.
>
> So let's keep this code as this, no need to check the result of check_memory_region().

I suggested it.

For our production runs it won't matter, we always panic on first report.
If one does not panic, there is no right answer. You say: _some_ bugs
don't have any serious consequences, but skipping the mem*() ops
entirely might introduce such consequences. The opposite is true as
well, right? :) And it's not hard to come up with a scenario where
overwriting memory after free or out of bounds badly corrupts memory.
I don't think we can somehow magically avoid bad consequences in all
cases.

What I was thinking about is tests. We need tests for this. And we
tried to construct tests specifically so that they don't badly corrupt
memory (e.g. OOB/UAF reads, or writes to unused redzones, etc), so
that it's possible to run all of them to completion reliably. Skipping
the actual memory options allows to write such tests for all possible
scenarios. That's was my motivation.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
