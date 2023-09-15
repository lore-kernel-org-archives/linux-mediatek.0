Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B92DEDE98B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqLoBm8H6ZiMRz1kerNsf8O/I1x2KB0Fau5qTkJBuRw=; b=jR5B6fc6/bc+DvITyjfPX4xM2W
	O/SXh85YRrL5k+sj/svQ4X5ona8D3BALbNn2NNuKj4+moUTuO+ZoIlEX1o5uaUIq+tU+jt6hi89hv
	Oz//WW75VbnCg2iSYV2/TkVH6SGPdZb/0SoESul1cZsDQ1cVs7VuN0XCxGoFsZxGFtsZ3rXShXFxa
	v6AHmbZ00XJkvEcDfv5lEYfenxvrnshgqcyd0UOZK8Qi55lUlWwUf9J91Pozb8jnsgqoR77LLPMS7
	c1eMQoradK59xdWK7caMPDL2bL036/xTOKpbdlE5ozzZI2WkJK97so8y8H+Ip9W3Pnasf3lZgYwO1
	8bRh0uYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxzs-009ZY5-1C;
	Fri, 15 Sep 2023 01:51:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxzp-009ZXG-0x;
	Fri, 15 Sep 2023 01:51:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-274972a4cb6so272541a91.1;
        Thu, 14 Sep 2023 18:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694742708; x=1695347508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqLoBm8H6ZiMRz1kerNsf8O/I1x2KB0Fau5qTkJBuRw=;
        b=b74fL1njdomYMeTK/DEKwM/2LZ2Qp22i3kppdoMoejwzKTY4egoLKkZ+YAmgTmG/Xl
         OSb2E7NMkKg1CXWWGobSOigEK3D24vW+Tqz+M3NuiubHTt39hHW6d3K1PLiu7pZEcLPz
         TGZXOhAvuYGGGaQ8qHaAYamRLRVPzwH/DE/+wLMb7DL3fbtS6S2pl7JUj7cSJMR+xVBp
         BfGnNCRGa83oJwIJbVhYf0F9Ax9ec/xziRsG81QsmI/NDE0H1OAx83mZ0rQOpyXA7Hp+
         bF1Srhci5TqJN0gZWqyRcjfsxZY4X4Z5t/4qxVKPJqxyI9K/cs+h7j/LnwhMeXpQFBIp
         Z9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694742708; x=1695347508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqLoBm8H6ZiMRz1kerNsf8O/I1x2KB0Fau5qTkJBuRw=;
        b=RQJVv+Y5BAzQdDATdbqufP9v8wP4r2o57wvC1uZM0BlS7giTU7hCdk4qMTAuDpVYS8
         ZyBoKKHJ3ynJm31gx67UYH+5aU2YfiwTFRFEFSrhP2vvFBuJjnFMih7k9dSdj9vK7C9T
         VPc0LqgltdP/OCWPYrxtHQOqau5G6ZXEWnWnhwNZ3D/uII191BAY8TwvGBBtV1jdeRNe
         HF5dIL8bTRVkToJRUUoca2H3pLobb/g6YJjRAmPJ57YMVre0M5bGnAy700zqzmaqs1xG
         4Q0/420aL4K8CYDY2KtJS3zWi5ZRBThRRnmGKvZD/1y8nfcSQdnML8bZKVkqbtd3i+Ym
         SgFg==
X-Gm-Message-State: AOJu0YzYXgEL6vVKN36eAAlxudNS1d2AkvGeEEV+3v+NAHm/6dl0YLj6
	EbGI6tzNpgn5Nuv7DAG3u4EusDoJvHQ/952hEmM=
X-Google-Smtp-Source: AGHT+IHypl50ozXbVNpyt6MCHdaoxCaRqBl2NAiMm+S4Y/6YOO7S8XoNh0lYeLcNgC9idrJZOsUI38MTb7wkV8Iedjg=
X-Received: by 2002:a17:90b:a49:b0:268:60d9:92cc with SMTP id
 gw9-20020a17090b0a4900b0026860d992ccmr210845pjb.43.1694742708242; Thu, 14 Sep
 2023 18:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230914080833.50026-1-haibo.li@mediatek.com> <20230914112915.81f55863c0450195b4ed604a@linux-foundation.org>
 <CA+fCnZemM-jJxX+=2W162NJkUC6aZXNJiVLa-=ia=L3CmE8ZTQ@mail.gmail.com> <CAG48ez0aenPmr=d35UGa4_BiCwYU1-JHhD_2ygThvjOEXEM7bQ@mail.gmail.com>
In-Reply-To: <CAG48ez0aenPmr=d35UGa4_BiCwYU1-JHhD_2ygThvjOEXEM7bQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 15 Sep 2023 03:51:37 +0200
Message-ID: <CA+fCnZePgv=V65t4FtJvcyKvhM6yA3amTbPnwc5Ft5YdzpeeRg@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Jann Horn <jannh@google.com>, Haibo Li <haibo.li@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	xiaoming.yu@mediatek.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_185149_340269_56B3E5C1 
X-CRM114-Status: GOOD (  21.13  )
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

On Thu, Sep 14, 2023 at 10:41=E2=80=AFPM Jann Horn <jannh@google.com> wrote=
:
>
> > Accessing unmapped memory with KASAN always led to a crash when
> > checking shadow memory. This was reported/discussed before. To improve
> > crash reporting for this case, Jann added kasan_non_canonical_hook and
> > Mark integrated it into arm64. But AFAIU, for some reason, it stopped
> > working.
> >
> > Instead of this patch, we need to figure out why
> > kasan_non_canonical_hook stopped working and fix it.
> >
> > This approach taken by this patch won't work for shadow checks added
> > by compiler instrumentation. It only covers explicitly checked
> > accesses, such as via memcpy, etc.
>
> FWIW, AFAICS kasan_non_canonical_hook() currently only does anything
> under CONFIG_KASAN_INLINE;

Ah, right. I was thinking about the inline mode, but the patch refers
to the issue with the outline mode.

However, I just checked kasan_non_canonical_hook for SW_TAGS with the
inline mode: it does not work when accessing 0x42ffffb80aaaaaaa, the
addr < KASAN_SHADOW_OFFSET check fails. It appears there's something
unusual about how instrumentation calculates the shadow address. I
didn't investigate further yet.

> I think the idea when I added that was that
> it assumes that when KASAN checks an access in out-of-line
> instrumentation or a slowpath, it will do the required checks to avoid
> this kind of fault?

Ah, no, KASAN doesn't do it.

However, I suppose we could add what the original patch proposes for
the outline mode. For the inline mode, it seems to be pointless, as
most access checks happen though the compiler inserted code anyway.

I also wonder how much slowdown this patch will introduce.

Haibo, could you check how much slower the kernel becomes with your
patch? If possible, with all GENERIC/SW_TAGS and INLINE/OUTLINE
combinations.

If the slowdown is large, we can just make kasan_non_canonical_hook
work for both modes (and fix it for SW_TAGS).

