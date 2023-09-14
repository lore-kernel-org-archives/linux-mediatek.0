Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832DAEEAA71
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUZ4tKWNQQW/M0sqK1AFluw87RumzXnsJH+qNtjEDz0=; b=AA0onIWVkSyM4bjiopgmrUU9ps
	QHisgY7pgXwiFORD5XnZBhPiJiqCnQ6B8CfKzCs5oSIvAjdsUChTgabCgd/3m+8mGTuuQRgLbWxy7
	kiL5NywqVWe/dhGfG7GF4XCQuX3w1DXZSDAWg/eVECov1YAM7nHbdG0P4XXHPb32BDVszdO7v8hiX
	d0NOeZMdvh+F6I8ElkjyaUVBWmsXBEuK4zoFbiYUuKEvk0oAwumcwQZZK+wyztzOAOXQ1XCoSjnS8
	YksPp960SoQ1APLaH/Nuv/JpOHjC4+HQCFUveH0lekWWcyKHoQPoDk/TblT1WgKohodc4/ryz9y4y
	3uCa5QTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgt3O-009Elu-1q;
	Thu, 14 Sep 2023 20:35:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgt3K-009EkZ-2r;
	Thu, 14 Sep 2023 20:35:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c3bd829b86so12019195ad.0;
        Thu, 14 Sep 2023 13:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694723702; x=1695328502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUZ4tKWNQQW/M0sqK1AFluw87RumzXnsJH+qNtjEDz0=;
        b=TsSJitPtKM+b9+u+HgSvzGdzhkmcb+VKJ6Pe5rE12ceeOrauSdlBGKA/GszNHUWuPO
         6EXdQkM0IMSj7zxnE440w03CGCiUNXtr9fsQjb+NCiXbyp2bNRHRr84z/Yg5yCpqLehg
         DkmH8PgpsoqdGvmduXukaMP2bR0XZbIL4UE24dZ61t2MFaFFx9uDPEvTfwp2+8GPfXdf
         zw1keKhh9HxQkQP/FXW0d2QXJapzIhJ9Fvg9yxkb8olQ0607/ulzIQEtjqdzL+ATdhrc
         lwjBGy62vTVBOXWMawdNdeRAlea8nmvQGybw2vQjeOwfB0JDjNQ7jrFp2QGk6xAj1bis
         BNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694723702; x=1695328502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUZ4tKWNQQW/M0sqK1AFluw87RumzXnsJH+qNtjEDz0=;
        b=VVDius1Cms9niHmlR0FiMlV2+xNYLzlcqPcJ4ZZj6sU/0h90oxBJ59Z9CRp6yzxeE/
         8p1Xcxn32sXentfnp1tE6ruHrHKtUDLkb5vSUJQkem1u0oDTycEGwAbIVgB1IcO2xs0I
         T448qg6IIjAq3GOQo9xhXf6+SUfgwsHIlO6kwfv4CMzaft+peozFq0Fmpad7TxrAwB25
         hzxIX0cWhbCps3XQZPwGiUNkuZkcbvpOGGrVJqgMeL1vKv+eJKwLesWoQhotNXTDej6+
         99eYe/epGZ9aWVEdYPyRNIoOGJs95s5MWYoWggmmHvMytz9veqIItw+gNXgeaF6izm97
         srAw==
X-Gm-Message-State: AOJu0YxWCda4twS3kHArQBmD/IUmSknSgByJHGJ3eOzxZmdz9IBvVB/+
	I+MGXSzbMgVkR6qWVdf1xp14x42XLR7PLUcoJCc=
X-Google-Smtp-Source: AGHT+IFOJYurVLTveCv5tcbwSznaQ3Y77VJdYi4b/nk55QYpjNA4y8dRl/UXfJkyqn2rnYbR9kkKMwrpX3nyJfCj+2c=
X-Received: by 2002:a17:902:c949:b0:1c3:ea60:73e2 with SMTP id
 i9-20020a170902c94900b001c3ea6073e2mr7674254pla.27.1694723702114; Thu, 14 Sep
 2023 13:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230914080833.50026-1-haibo.li@mediatek.com> <20230914112915.81f55863c0450195b4ed604a@linux-foundation.org>
In-Reply-To: <20230914112915.81f55863c0450195b4ed604a@linux-foundation.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 14 Sep 2023 22:34:51 +0200
Message-ID: <CA+fCnZemM-jJxX+=2W162NJkUC6aZXNJiVLa-=ia=L3CmE8ZTQ@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Haibo Li <haibo.li@mediatek.com>, linux-kernel@vger.kernel.org, 
	xiaoming.yu@mediatek.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_133506_928080_590FE134 
X-CRM114-Status: GOOD (  16.36  )
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

On Thu, Sep 14, 2023 at 8:29=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -304,8 +304,17 @@ static __always_inline bool addr_has_metadata(cons=
t void *addr)
> >  #ifdef __HAVE_ARCH_SHADOW_MAP
> >       return (kasan_mem_to_shadow((void *)addr) !=3D NULL);
> >  #else
> > -     return (kasan_reset_tag(addr) >=3D
> > -             kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
> > +     u8 *shadow, shadow_val;
> > +
> > +     if (kasan_reset_tag(addr) <
> > +             kasan_shadow_to_mem((void *)KASAN_SHADOW_START))
> > +             return false;
> > +     /* use read with nofault to check whether the shadow is accessibl=
e */
> > +     shadow =3D kasan_mem_to_shadow((void *)addr);
> > +     __get_kernel_nofault(&shadow_val, shadow, u8, fault);
> > +     return true;
> > +fault:
> > +     return false;
> >  #endif
> >  }
>
> Are we able to identify a Fixes: target for this?
> 9d7b7dd946924de43021f57a8bee122ff0744d93 ("kasan: split out
> print_report from __kasan_report") altered the code but I expect the
> bug was present before that commit.
>
> Seems this bug has been there for over a year.  Can you suggest why it
> has been discovered after such a lengthy time?

Accessing unmapped memory with KASAN always led to a crash when
checking shadow memory. This was reported/discussed before. To improve
crash reporting for this case, Jann added kasan_non_canonical_hook and
Mark integrated it into arm64. But AFAIU, for some reason, it stopped
working.

Instead of this patch, we need to figure out why
kasan_non_canonical_hook stopped working and fix it.

This approach taken by this patch won't work for shadow checks added
by compiler instrumentation. It only covers explicitly checked
accesses, such as via memcpy, etc.

