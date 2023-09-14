Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B26EEAA71
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 20:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAwsTmQ+ELNb0oAFR4fBQd1wUmizG7i6iQSI6zVD64o=; b=hUhYQ4yFq6MDK4qtrWcpvxi7+F
	gjbT/cTqwxuhXiJq+dP3nKWNiyNWZFtD9G9A6Iutyvm/VCvwO3mMDQs+ZYihoCnpcavblPgnrHrOJ
	VyLAKI6yR5Jgby1Q0Xpl68UAwHZTTGPA81JKdeRxJD0KV+4laxp/2/pxx3wllSe20GOZrQWKJmknX
	1vcLjYdkGcmH/pizE+MzE/O/8Gp4LzjOX2y1/8wtc2pg4Hxhr+VGY0q6dLXqBzi4YG4DA1R8bT156
	DcWfhJzegirUaCOs1Dnd1nS5s/WNDbRqc08H3dZFPZJEIGnnTw8Xu3wzgxRdTv0EIKmLE89ENUeYB
	vDEn9mDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgt9W-009F9O-1K;
	Thu, 14 Sep 2023 20:41:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgt9T-009F7v-0s
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 20:41:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso5155e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Sep 2023 13:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694724082; x=1695328882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAwsTmQ+ELNb0oAFR4fBQd1wUmizG7i6iQSI6zVD64o=;
        b=zpCwMB1H8MqcsnECKKu5hv15EGe2wkmg3twJo/ZCKXZHwTnBBmpbnpnTA+vIxPPsDi
         rmTAFBVMVlPWit81YxmAuLDQNkzT9/0xCPKbfMZVOP2WgMFHSjDmAhqkJqgnS1PTrQUX
         +dV2PVj2GWmBvOviPp9u5hAA/AC9Dq9SgsX20HFPnQho+qeoVtY17lA5PMk9+aepPCNH
         v6eC58tsnWDxB6bv2Pl87zqNb8/WsXOmUnN/3T9ayCxTjE+Dkqwg4Ztn2hK0FvJIN1yu
         j7L3X2/QYaGNO3zmb4wQpZOHV0rGVyxsqKPBPsO7YyK0u9K3q0Q1iibJq0kweDAZKu48
         I/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694724082; x=1695328882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAwsTmQ+ELNb0oAFR4fBQd1wUmizG7i6iQSI6zVD64o=;
        b=DB5pBnCxPNGZXx5of0NCII21cMT2l3ori609HH2Ur7iZ+yB2RL5M0hSWi+iA2mH+pk
         a+VM3PW+xhTlS21CLBziXD/DNevro2SgGlQV/AX4vF0M6BLhIFvKBOluc90+I420hveP
         EI/iUxl+ukUuVQMMtOS8h8gt9U4oxOpOLvIDEphby0uzcX1+K4+JxzDsSohsYaU57RIx
         dLPpjFthkQkZDBGQrUlN8By3xtsPimjmBh5LyieRthy0OAfoJFEdrkXBSapsEzMd9Ly9
         lkNAJeBnNIphpQUmyn3MJQaz8Kwtdac60QheNsV+v7+EwUt6Fq28idpQmfIaYLsSFNt5
         anDA==
X-Gm-Message-State: AOJu0YzotCnQYOv05Aq5tYpraJWJSbVMvDhx3Y0GFzlFoExp2+PA3ec5
	dVyeFZ0QDbcsAoAJVxLuEKyD9xLdwC+7hEi670PNdA==
X-Google-Smtp-Source: AGHT+IHsHkVsQuKN291JYs5H+1PLqW9iIMxkotXRW4DbVVL1elJDo88rYPVS0anHPmaVmfAA+Q/VHLHfVqUdniinZt8=
X-Received: by 2002:a05:600c:1e05:b0:3fe:dd72:13ae with SMTP id
 ay5-20020a05600c1e0500b003fedd7213aemr45137wmb.0.1694724082359; Thu, 14 Sep
 2023 13:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230914080833.50026-1-haibo.li@mediatek.com> <20230914112915.81f55863c0450195b4ed604a@linux-foundation.org>
 <CA+fCnZemM-jJxX+=2W162NJkUC6aZXNJiVLa-=ia=L3CmE8ZTQ@mail.gmail.com>
In-Reply-To: <CA+fCnZemM-jJxX+=2W162NJkUC6aZXNJiVLa-=ia=L3CmE8ZTQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 14 Sep 2023 22:40:43 +0200
Message-ID: <CAG48ez0aenPmr=d35UGa4_BiCwYU1-JHhD_2ygThvjOEXEM7bQ@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Haibo Li <haibo.li@mediatek.com>, 
	linux-kernel@vger.kernel.org, xiaoming.yu@mediatek.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_134127_637090_7DDD83E3 
X-CRM114-Status: GOOD (  21.72  )
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

On Thu, Sep 14, 2023 at 10:35=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail=
.com> wrote:
> On Thu, Sep 14, 2023 at 8:29=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> > > --- a/mm/kasan/kasan.h
> > > +++ b/mm/kasan/kasan.h
> > > @@ -304,8 +304,17 @@ static __always_inline bool addr_has_metadata(co=
nst void *addr)
> > >  #ifdef __HAVE_ARCH_SHADOW_MAP
> > >       return (kasan_mem_to_shadow((void *)addr) !=3D NULL);
> > >  #else
> > > -     return (kasan_reset_tag(addr) >=3D
> > > -             kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
> > > +     u8 *shadow, shadow_val;
> > > +
> > > +     if (kasan_reset_tag(addr) <
> > > +             kasan_shadow_to_mem((void *)KASAN_SHADOW_START))
> > > +             return false;
> > > +     /* use read with nofault to check whether the shadow is accessi=
ble */
> > > +     shadow =3D kasan_mem_to_shadow((void *)addr);
> > > +     __get_kernel_nofault(&shadow_val, shadow, u8, fault);
> > > +     return true;
> > > +fault:
> > > +     return false;
> > >  #endif
> > >  }
> >
> > Are we able to identify a Fixes: target for this?
> > 9d7b7dd946924de43021f57a8bee122ff0744d93 ("kasan: split out
> > print_report from __kasan_report") altered the code but I expect the
> > bug was present before that commit.
> >
> > Seems this bug has been there for over a year.  Can you suggest why it
> > has been discovered after such a lengthy time?
>
> Accessing unmapped memory with KASAN always led to a crash when
> checking shadow memory. This was reported/discussed before. To improve
> crash reporting for this case, Jann added kasan_non_canonical_hook and
> Mark integrated it into arm64. But AFAIU, for some reason, it stopped
> working.
>
> Instead of this patch, we need to figure out why
> kasan_non_canonical_hook stopped working and fix it.
>
> This approach taken by this patch won't work for shadow checks added
> by compiler instrumentation. It only covers explicitly checked
> accesses, such as via memcpy, etc.

FWIW, AFAICS kasan_non_canonical_hook() currently only does anything
under CONFIG_KASAN_INLINE; I think the idea when I added that was that
it assumes that when KASAN checks an access in out-of-line
instrumentation or a slowpath, it will do the required checks to avoid
this kind of fault?

