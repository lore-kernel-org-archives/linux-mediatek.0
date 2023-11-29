Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CBFC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 03:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmmZdnMG5cx1ucOkJTYJz9C0ueulBI91QAmZKkzSQnk=; b=aIzfYc566jYrNvtGKhJYTtv3Qd
	STZ/J4+Q7Xdn5cujCwa4R7XvX0zx5Ezpn882TtwBdL4VykwnJ1MI7t7xC7DJulFFhuj0ISI82Vq6/
	WBh7pTR/vRN/sZNPAR1zFwno9kv0UloHq0WiAzdfT98CTV0mvgqGx4tFRh2cykpbdYIw1WMzvMBDV
	Mx4fHmo/rZYI2SBGvQa3xxghM1PI0gb+6ZgQZALbvtm7Z0qT7Dkmyr5RL23x5TFS9Q3v9+epxDKpA
	ObBYRzpIoGlW5lHn1+7io95JmjG8xpxu6z/az4WD2+FyaSNT4NFSwtjSUSd8Gba8+06rlmSSZ94xA
	G0iuchFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Apw-006srq-1f;
	Wed, 29 Nov 2023 03:02:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Aps-006spz-1s;
	Wed, 29 Nov 2023 03:02:02 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c2b7ec93bbso2755469a12.2;
        Tue, 28 Nov 2023 19:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701226919; x=1701831719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmmZdnMG5cx1ucOkJTYJz9C0ueulBI91QAmZKkzSQnk=;
        b=ZoNZT7KgISHKmc9x+Qi3d1G0848j37eJbcKJURk39rT3nAYu7zbmX9MloNhD+qnavQ
         ro167INiQ3pvEVlZL4ozkfttMfGrp2K3uK+9HQVl2DEVco/G7MWTQephy7GwkiB3mNVd
         AlAMYM9lvSKxBEOsdXN42BMgqJji4W2kxRsdO7IKCwCfMrF4tnZoZ8bzIFDI3xer7ENj
         Xj1ObN6MJ/JQEFVEAqlXTZBpwZ7Y7scOorRw2YmlypcviYIP9zalNkNLJ1jtkQGS2EEA
         igShAvyKI1KrSN0VZ4du9uLWXpsKzvkesEZgubaFTZ9UIT3o6A+sVatLZr1Zy/FqFOFw
         QFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701226919; x=1701831719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmmZdnMG5cx1ucOkJTYJz9C0ueulBI91QAmZKkzSQnk=;
        b=r25CvAS9RbQA4dZYkVdnqcAJTxqmwneeogiQJORCZ4xOJyII4feSmx40l0JJxniqo8
         fL5rG7RB8DmvlHm0dWr7swiNCxdBrJdG1ALalwY2sTShxYMGM53z9z9LXMTrVtBpsPCb
         lx3UzmU0eSpHNxnXsa5IJEwNRRx4M1ZdiheXB9XQ0bF8kZVl6oG/pEQUloERG/jqTgim
         WDFCVSFssXgBHBY9Vyp5iPHw16bTC84JiJsLz1wa+GMRRbBdOsH7Z6HyOzxRwKt5T5Xg
         If7mBbPpwa7h6arqvxwUX2dfX+vis55IbyklNIkfg4zAhhTYSs8f+7Zkax6ws/QUXrIJ
         1fnw==
X-Gm-Message-State: AOJu0YyNC2RGi0Iec62+LXc9jaC/KocpU3E/uzUy/J+QGmT8bAkGX/MT
	C5FKcI66B0jg/lApkCxy7A2O3y/JK1IHZqSXA2k=
X-Google-Smtp-Source: AGHT+IGnzMPnHxO60vC1ojrSQZx1ZUStF+SQpvY4lfHFS3JYWC+jAHzm4FZ5/2GQ51SFSCY35ZknJWpTMhCgJeAVM+k=
X-Received: by 2002:a17:90b:4c02:b0:285:dbbe:1178 with SMTP id
 na2-20020a17090b4c0200b00285dbbe1178mr7726571pjb.39.1701226918871; Tue, 28
 Nov 2023 19:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20231128075532.110251-1-haibo.li@mediatek.com> <20231128172238.f80ed8dd74ab2a13eba33091@linux-foundation.org>
In-Reply-To: <20231128172238.f80ed8dd74ab2a13eba33091@linux-foundation.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 29 Nov 2023 04:01:47 +0100
Message-ID: <CA+fCnZcLwXn6crGF1E1cY3TknMaUN=H8-_hp0-cC+s8-wj95PQ@mail.gmail.com>
Subject: Re: [PATCH] fix comparison of unsigned expression < 0
To: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Haibo Li <haibo.li@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_190200_662515_356CF9CA 
X-CRM114-Status: GOOD (  16.00  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 29, 2023 at 2:22=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 28 Nov 2023 15:55:32 +0800 Haibo Li <haibo.li@mediatek.com> wrote=
:
>
> > Kernel test robot reported:
> >
> > '''
> > mm/kasan/report.c:637 kasan_non_canonical_hook() warn:
> > unsigned 'addr' is never less than zero.
> > '''
> > The KASAN_SHADOW_OFFSET is 0 on loongarch64.
> >
> > To fix it,check the KASAN_SHADOW_OFFSET before do comparison.
> >
> > --- a/mm/kasan/report.c
> > +++ b/mm/kasan/report.c
> > @@ -634,10 +634,10 @@ void kasan_non_canonical_hook(unsigned long addr)
> >  {
> >       unsigned long orig_addr;
> >       const char *bug_type;
> > -
> > +#if KASAN_SHADOW_OFFSET > 0
> >       if (addr < KASAN_SHADOW_OFFSET)
> >               return;
> > -
> > +#endif
>
> We'd rather not add ugly ifdefs for a simple test like this.  If we
> replace "<" with "<=3D", does it fix?  I suspect that's wrong.

Changing the comparison into "<=3D" would be wrong.

But I actually don't think we need to fix anything here.

This issue looks quite close to a similar comparison with 0 issue
Linus shared his opinion on here:

https://lore.kernel.org/all/Pine.LNX.4.58.0411230958260.20993@ppc970.osdl.o=
rg/

I don't know if the common consensus with the regard to issues like
that changed since then. But if not, perhaps we can treat this kernel
test robot report as a false positive.

Thanks!

