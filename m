Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6132C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dd0gSl4CE2V3d5G56HYqss/GOHVFV1yZ9nbqL6AwD9A=; b=kpP5cNYFZiLFW8J2Lm5iOO0Ll1
	E44Bob02qAkTvLmn8yX2Vov45TVfSiY6NiiU0kFT5LYTRQTm25piTGvJhypD1EiS10g9+uIguZr2v
	/ZDsZ2S+GmdBe8AM8cbBIA8pOY1bO+S9qmGHA6fR63TE7vXX/aNCiCgSrgTJyf8RXzWSdevW3qfxz
	zV76ptH794rMrISyiPbDkEs4oQK32povX8Ni7nCQUFJJfJHmC4jRJQTXp9t9k2Msc0HL3+Vt9AKbH
	hVjltaKROsMkmKXkw8/ymZG0s0IQF9XlQoxB4Bd4uUMnrI0ni5zxN4Yd7Xtrk3vEkhoHSmXz4j6sn
	GfqKcxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGF1H-0015Yy-8m; Fri, 13 Jan 2023 08:02:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGF0x-0015Nu-JY
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 08:02:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bq39so32038408lfb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 00:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd0gSl4CE2V3d5G56HYqss/GOHVFV1yZ9nbqL6AwD9A=;
        b=mqO98eOBz/748Ci6ObhHIea8mpxnmd1rLxJ1Ah0FmfoDLs+0VTI6z2oPJlJ53r268e
         xHuZrV1llZVFtYzDl0sZAThadKvHRnMn3SMfUbCcOT9fu4uum5kjAhAWxrPETU8dgQ68
         O2ypD+B1kjo3uMVWaB8Gc2y/NTTKCh7cFQlmzYJo1/iZzhdwYnhopyKNkz7saxX+Kg92
         OLF9Ov9XTl5HPOe4qR9WGx8Z59cOx+sHT46tu/vN6k+x0ZhWlMAhY2dahytJ+XR7sOOg
         Mzde0OVNSIncs51cnSUdwFHUJ0wJIYMZ4pdq/uwRtSG5ywtU9tbixlRfPpBtAxCNExhY
         u2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dd0gSl4CE2V3d5G56HYqss/GOHVFV1yZ9nbqL6AwD9A=;
        b=U1vf9aqpoTWfrc5oDJ5lAXsSjDJmaJ26MgFaX2TKe/PBHTLa3lW6FLkjGgYQN5oysu
         QJ9//aJrCfdqXr+Bal2uIGscsCNIHpTqe5SKSQtDaS2FZWcji3nfZ9t4UpEr9Sixfv9+
         /Ew9DDWiNKZK7rLYHNABnpXezek3yTqeogDr35JqsCY8E+JT16cg3IFjgNaCm1QnUUJ+
         gca6r93YMzqsMb7HfJuYUpEZEDAiKnOTFLX21mNNUwL7A/VZu1UHScCnkWG9giujapSx
         tAK8pOUBDTXTZ8AQxII+LWPBKP54OxEhYDRL2TpnqmAqGwklNF8b6xklrGotux5/Sa4B
         2XYA==
X-Gm-Message-State: AFqh2kouK8ffecF9r3O0dGELcdFOk64pDoCXuSN8GVwJ24iP9WhkN+a1
	yKXdMHecx49zcTysFI9ejsmL70vN1gKzzoFqWEEfgQ==
X-Google-Smtp-Source: AMrXdXsuLPtxsRjt59Z2mJObWpDdPhsFvqdheqjEmNoRMVg61TYZVi8JX1s9a7xADaxX36MhxBDwaBe+xj6Bo6cV56o=
X-Received: by 2002:a05:6512:6c6:b0:4a4:77a8:45a4 with SMTP id
 u6-20020a05651206c600b004a477a845a4mr3595816lff.654.1673596931130; Fri, 13
 Jan 2023 00:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20230103075603.12294-1-Kuan-Ying.Lee@mediatek.com>
 <CACT4Y+b5hbCod=Gj6oGxFrq5CaFPbz5T9A0nomzhWooiXQy5aA@mail.gmail.com> <edbcce8a1e9e772e3a3fd032cd4600bd5677c877.camel@mediatek.com>
In-Reply-To: <edbcce8a1e9e772e3a3fd032cd4600bd5677c877.camel@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 13 Jan 2023 09:01:58 +0100
Message-ID: <CACT4Y+Yx+8tjTvE5oR3qzHa4oMoPoj=+BTgcFZHA8jwxgtp1Pg@mail.gmail.com>
Subject: Re: [PATCH] kasan: infer the requested size by scanning shadow memory
To: =?UTF-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?= <Kuan-Ying.Lee@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, 
	=?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"glider@google.com" <glider@google.com>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_000215_723397_CC331395 
X-CRM114-Status: GOOD (  35.54  )
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

On Fri, 13 Jan 2023 at 08:59, 'Kuan-Ying Lee (=E6=9D=8E=E5=86=A0=E7=A9=8E)'=
 via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Mon, 2023-01-09 at 07:51 +0100, Dmitry Vyukov wrote:
> > On Tue, 3 Jan 2023 at 08:56, 'Kuan-Ying Lee' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > >
> > > We scan the shadow memory to infer the requested size instead of
> > > printing cache->object_size directly.
> > >
> > > This patch will fix the confusing generic kasan report like below.
> > > [1]
> > > Report shows "cache kmalloc-192 of size 192", but user
> > > actually kmalloc(184).
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > BUG: KASAN: slab-out-of-bounds in _find_next_bit+0x143/0x160
> > > lib/find_bit.c:109
> > > Read of size 8 at addr ffff8880175766b8 by task kworker/1:1/26
> > > ...
> > > The buggy address belongs to the object at ffff888017576600
> > >  which belongs to the cache kmalloc-192 of size 192
> > > The buggy address is located 184 bytes inside of
> > >  192-byte region [ffff888017576600, ffff8880175766c0)
> > > ...
> > > Memory state around the buggy address:
> > >  ffff888017576580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> > >  ffff888017576600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > > ffff888017576680: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
> > >
> > >                                         ^
> > >  ffff888017576700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > >  ffff888017576780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > After this patch, report will show "cache kmalloc-192 of size 184".
> > >
> > > Link:
> > > https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?=
id=3D216457__;!!CTRNKA9wMg0ARbw!mLNcuZ83c39d0Xkut-WMY3CcvZcAYDuLCmv4mu7IAld=
w4_n4i6XvX8GORBfjOadWxOa6d-ODQdx6ZCSvB2g13Q$
> > > $   [1]
> > >
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > ---
> > >  mm/kasan/kasan.h          |  5 +++++
> > >  mm/kasan/report.c         |  3 ++-
> > >  mm/kasan/report_generic.c | 18 ++++++++++++++++++
> > >  3 files changed, 25 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > > index 32413f22aa82..7bb627d21580 100644
> > > --- a/mm/kasan/kasan.h
> > > +++ b/mm/kasan/kasan.h
> > > @@ -340,8 +340,13 @@ static inline void
> > > kasan_print_address_stack_frame(const void *addr) { }
> > >
> > >  #ifdef CONFIG_KASAN_GENERIC
> > >  void kasan_print_aux_stacks(struct kmem_cache *cache, const void
> > > *object);
> > > +int kasan_get_alloc_size(void *object_addr, struct kmem_cache
> > > *cache);
> > >  #else
> > >  static inline void kasan_print_aux_stacks(struct kmem_cache
> > > *cache, const void *object) { }
> > > +static inline int kasan_get_alloc_size(void *object_addr, struct
> > > kmem_cache *cache)
> > > +{
> > > +       return cache->object_size;
> > > +}
> > >  #endif
> > >
> > >  bool kasan_report(unsigned long addr, size_t size,
> > > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > > index 1d02757e90a3..6de454bb2cad 100644
> > > --- a/mm/kasan/report.c
> > > +++ b/mm/kasan/report.c
> > > @@ -236,12 +236,13 @@ static void describe_object_addr(const void
> > > *addr, struct kmem_cache *cache,
> > >  {
> > >         unsigned long access_addr =3D (unsigned long)addr;
> > >         unsigned long object_addr =3D (unsigned long)object;
> > > +       int real_size =3D kasan_get_alloc_size((void *)object_addr,
> > > cache);
> > >         const char *rel_type;
> > >         int rel_bytes;
> > >
> > >         pr_err("The buggy address belongs to the object at %px\n"
> > >                " which belongs to the cache %s of size %d\n",
> > > -               object, cache->name, cache->object_size);
> > > +               object, cache->name, real_size);
> > >
> > >         if (access_addr < object_addr) {
> > >                 rel_type =3D "to the left";
> > > diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
> > > index 043c94b04605..01b38e459352 100644
> > > --- a/mm/kasan/report_generic.c
> > > +++ b/mm/kasan/report_generic.c
> > > @@ -43,6 +43,24 @@ void *kasan_find_first_bad_addr(void *addr,
> > > size_t size)
> > >         return p;
> > >  }
> > >
> > > +int kasan_get_alloc_size(void *addr, struct kmem_cache *cache)
> > > +{
> > > +       int size =3D 0;
> > > +       u8 *shadow =3D (u8 *)kasan_mem_to_shadow(addr);
> > > +
> > > +       while (size < cache->object_size) {
> > > +               if (*shadow =3D=3D 0)
> > > +                       size +=3D KASAN_GRANULE_SIZE;
> > > +               else if (*shadow >=3D 1 && *shadow <=3D
> > > KASAN_GRANULE_SIZE - 1)
> > > +                       size +=3D *shadow;
> > > +               else
> > > +                       return size;
> > > +               shadow++;
> >
> > This only works for out-of-bounds reports, but I don't see any checks
> > for report type. Won't this break reporting for all other report
> > types?
> >
>
> I think it won't break reporting for other report types.
> This function is only called by slab OOB and UAF.

I meant specifically UAF reports.
During UAF there are no 0s in the object shadow.

> > I would also print the cache name anyway. Sometimes reports are
> > perplexing and/or this logic may return a wrong result for some
> > reason. The total object size may be useful to understand harder
> > cases.
> >
>
> Ok. I will keep the cache name and the total object_size.
>
> > > +       }
> > > +
> > > +       return cache->object_size;
> > > +}
> > > +
> > >  static const char *get_shadow_bug_type(struct kasan_report_info
> > > *info)
> > >  {
> > >         const char *bug_type =3D "unknown-crash";
>
> --
> You received this message because you are subscribed to the Google Groups=
 "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kasan-dev/edbcce8a1e9e772e3a3fd032cd4600bd5677c877.camel%40mediatek.com.

