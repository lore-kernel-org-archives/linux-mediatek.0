Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC66C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 13:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3B961416
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 13:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3B961416
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bekzzZK9ABA7rvSuzjxCH9hrwSwHb7gZ8dXEcUX9FHg=; b=x2WBxNYx1Ku0m9
	oO9QJo8DIR3mvN+NCuI4XEVBorUfV1suoJ9qB5rtvbECiy3qocyo+CGfOq9NY/lQNcfYXBvtFHoBh
	XFVl7YIW4FUB/mXvR0M55q0w2J/G2YaIiE0tbG20Qml/TbMEIv+cQqF3vIe427GWtt3JmwmR2B8zT
	o/qM+Ke4WgcPyTJ4bKb2oaKR0TlU+vlUrzflie125hbyLadoYgHThjTrs8Di904UxS9Uh8+X2ATC+
	Wz6Je2MrBbQ89pNo4COXTyl2IsNdXkQhNid9+phDRft2IcTomV3NHG54sthrHzNNI2s6w1j9bpwYN
	/IRcNgOVgE616kribRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lywnY-00HTUs-U7; Thu, 01 Jul 2021 13:32:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lywnL-00HTS2-O9; Thu, 01 Jul 2021 13:31:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id gt10so9034599ejc.5;
 Thu, 01 Jul 2021 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F9xHPQXfeX85p/WzrKNX5asqql2B/nD64WETM/hhNus=;
 b=rPkrb7S1fk4T3qkJ10Ep2j4MR6kgQaC6BsJseApFIwDMzhwuu3VfF4W+PMn+D6OOsj
 leSkEpTvERGV5xLo8VbBUsUr6mDM5rt1doaDh50MTc0uzsUlN3zRbh2OYSSAHBJiN6li
 bdQWhTsymoM6+mvoXx3OTtT4O61r1hWcjpzftezV2yOqO0RfmEfAX5YUEsKJs5htq92G
 PAQJrU/eJlCnP6y154lnlyQfgEYTmc87dxS+SyvZO3Cl9jM1WBBTv2ljPQLxX5FHDlcc
 pCiiqVPZIQkb+xQuzE49/flY/F7wWvZhXhUebyqm5a0zD+rEBDd72pM6O3vUDjN392Wt
 D2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9xHPQXfeX85p/WzrKNX5asqql2B/nD64WETM/hhNus=;
 b=CvPL+4G8B9J2qP1/l7Nnom/E+lrRU3QFqoCH6L83CwrUcYoj0ib1eG7B5FOVP6Z9Y8
 DTgnyCr9H5yJiY6/m6iwBQLQfwqcuTrtaXBQrJ564BihsNw2GSbg4iH22a4Ce+laU0C0
 D5eX1212sHpXktKsiT5+B3H7XnBUhnARwVspWR0Yi5OXwieKFVMOKUYt+ckVQ9nWHYS0
 RiD+dt1ph5EPP+UgCCtlgZSI8INLBuvAPprERW1ULWoNcR8Jyd/wDQLU6PzpvvqxAWxI
 ZEuaXxbDCxv2RMjjxg++pASs5XEDlhlYXt2CwWvVttuCt0ZhKD63uxw5LgNwZdReW0fR
 3gpQ==
X-Gm-Message-State: AOAM532PZzYC0pGO1YR62MNqIPibA9J8ICjfJtA20fEjRO8SkbQmlwWI
 j5YuaCT0tZBStFyQ9LsEpPB9tlsWO9RzT3KL2cc=
X-Google-Smtp-Source: ABdhPJwAB9zNDvwIwLlvuGpl2XmkQHgjogSwTqCGj4FJ6uy6ez3lXb60hBmJa9obZ737ErpszWY/M6A6HyDbpv+9BfA=
X-Received: by 2002:a17:907:9f0:: with SMTP id
 ce16mr42484016ejc.126.1625146312962; 
 Thu, 01 Jul 2021 06:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210630134943.20781-1-yee.lee@mediatek.com>
 <20210630134943.20781-2-yee.lee@mediatek.com>
 <YNzCVxmMtZ1Kc6XA@elver.google.com>
In-Reply-To: <YNzCVxmMtZ1Kc6XA@elver.google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 1 Jul 2021 16:31:42 +0300
Message-ID: <CA+fCnZcPXLZxCVAk2Cmhfvov9KNGxALQuWun_yKf0O+q=rbnfQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] kasan: Add memzero init for unaligned size under
 SLUB debug
To: Marco Elver <elver@google.com>, yee.lee@mediatek.com
Cc: wsd_upstream@mediatek.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_063155_847019_B2A68328 
X-CRM114-Status: GOOD (  16.63  )
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

On Wed, Jun 30, 2021 at 10:13 PM Marco Elver <elver@google.com> wrote:
>
> > +     if (IS_ENABLED(CONFIG_SLUB_DEBUG) && init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> > +             init = false;
> > +             memzero_explicit((void *)addr, size);
> > +     }
> >       size = round_up(size, KASAN_GRANULE_SIZE);
> >
> >       hw_set_mem_tag_range((void *)addr, size, tag, init);
>
> I think this solution might be fine for now, as I don't see an easy way
> to do this without some major refactor to use kmem_cache_debug_flags().
>
> However, I think there's an intermediate solution where we only check
> the static-key 'slub_debug_enabled' though. Because I've checked, and
> various major distros _do_ enabled CONFIG_SLUB_DEBUG. But the static
> branch just makes sure there's no performance overhead.
>
> Checking the static branch requires including mm/slab.h into
> mm/kasan/kasan.h, which we currently don't do and perhaps wanted to
> avoid. Although I don't see a reason there, because there's no circular
> dependency even if we did.

Most likely this won't be a problem. We already include ../slab.h into
many mm/kasan/*.c files.

> Andrey, any opinion?

I like this approach. Easy to implement and is better than checking
only CONFIG_SLUB_DEBUG.

Thanks, Marco!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
