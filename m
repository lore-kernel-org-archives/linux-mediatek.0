Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CEECD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 10:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApXaBVn2XS6OYYCjGNp8YjyB5+PeDb/eSjzi35GKmCY=; b=gSrRMJgX9KgcItLZJoxOAdcFyS
	H5SwACOcUBnN87G2Fi/X4BFm5OkQv/qzOjKZESXkiKXaLRPSsvjif4UcJnuWSAZttUjywWO9RxP5Q
	K/4vnJb76lW2e3TiivQp3+iVqYsGkcPD/mhIy57mGRNQMxOUH+lZMRSsmcog+r10K/T6/a6tClBeU
	yzaTfzT9nPKzeJipnK3jLo/wvC9/wvcwG9ZxAAZhdj+fWD3EawUH/9HviLNgVg+WXk0KIynGaXlx8
	OuxwvySjMpKV49vBHMsMivpwGO2LRJ+PrSz3diK9CGXi0QDY1Fo8UOOHIXbfroHCXRrn44/14JGOs
	TptxRZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbaB-0000000AhJJ-39AF;
	Tue, 02 Apr 2024 10:41:35 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrba7-0000000AhHi-3qRt
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 10:41:33 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso4469888276.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 03:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054491; x=1712659291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApXaBVn2XS6OYYCjGNp8YjyB5+PeDb/eSjzi35GKmCY=;
        b=m15s1KfTgCHpavQ6QlhoXfNFGmz/AmqPvGXWEkMCDjvCWyyVM4aenx7VoGjLx5nqvW
         rqKsphuvcOpo3wRUhhHQt1PNWEUVPHzfTnMuBDDwBBDnfDyqCsginWmwuPSGXBaj624x
         Xtm7YQlwGR6yHE7qFiGnhW95e0Icyp+dr8rTvT0OF20UWUCpNtWJ02am6s2w1w734yjr
         tuNoJtMLARu7+BbUD/sG/Oq0RjIy15hE05PFI+q/Jee8Ht1U74GudnXX0+61N92wy4oM
         ELOGQ9TQfzTzgxobFt/ogQ6NOeaAUogCxM7RPSN8GGc0rrm4UvqPA8Dvn1QDY70UmkX+
         0bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054491; x=1712659291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApXaBVn2XS6OYYCjGNp8YjyB5+PeDb/eSjzi35GKmCY=;
        b=Gk1E78qyKN+oob13r7/TVWNZeA4hdwavVNW4MkxZr1Eax8o/c6Ake0n8kIn9AWqc/z
         3BLmYjqRsg1GioEo3Fib6UXSH8CMMSQmzEnj1FlK9Ww/7sEnffbuiJSmkyBCdB+jidIO
         CDmfOAkjIuf8ygP88fFf5cd7HxEq4C9mN794EN0RZF1konUy5X6hsExuX4Jhb9Dc5R58
         OYvHLyt9+6zClXRDMOMREF7L6nE1HcoF04OnuDizRLC9BX6GiII5ZbGlTqfIMUyK4GxP
         syDuhU2svqfN4U/dWFf9zUmnHfoC/1/v1Rj0sBVZrjnTOV11bN3vAk390jATSGmdW50j
         V4gg==
X-Forwarded-Encrypted: i=1; AJvYcCUCas3xGSXknb/iJD3uFSlshZU5HNwT/JbEvvVKCLKrMBWRKK3EJMCzI/iMS4E2hx8LSuCJQ3e+Ei2eTEpN0vtPJgOoqr1CD+v3B0qGLxIbuSRf
X-Gm-Message-State: AOJu0Yxa1jufA1zuZfcGljza9gJL+Etr/FQZ2WQ/8TX/Oyz8/umhCA+B
	FdIqaO2W5qI+D6W47yDgJ0acCh2A8FJeq+lhWmmqKL+OfhdlEtlhQu9eEDcSfcLOSwA+hrpp2u9
	WpEfDmDhObUcVEoT4D9a2E1pzILL2rEzMl9BwoA==
X-Google-Smtp-Source: AGHT+IHFrOBcRfRRcNHSGMiQ/W4jMX2rXf1tkCXA4ATT8aem9b16esSs4RkJ1Tfl+2WaN6o0ECfwJ0rgttOE6KypifQ=
X-Received: by 2002:a25:16c4:0:b0:dcd:4d96:741f with SMTP id
 187-20020a2516c4000000b00dcd4d96741fmr10305474ybw.10.1712054491019; Tue, 02
 Apr 2024 03:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231222022741.8223-1-boy.wu@mediatek.com> <6837adc26ed09b9acd6a2239a14014cd3f16c87c.camel@mediatek.com>
 <Zghbkx67hKErqui2@shell.armlinux.org.uk>
In-Reply-To: <Zghbkx67hKErqui2@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 12:41:20 +0200
Message-ID: <CACRpkdaNtXDYOMbRbbsXb+frYa18+ErVWP966LFGt-GCXbL9iQ@mail.gmail.com>
Subject: Re: [PATCH] arm: kasan: clear stale stack poison
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_034132_002971_E03DA2EB 
X-CRM114-Status: GOOD (  10.64  )
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

On Sat, Mar 30, 2024 at 7:36=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> On Fri, Mar 29, 2024 at 03:17:39AM +0000, Boy Wu (=E5=90=B3=E5=8B=83=E8=
=AA=BC) wrote:
> > Hi Russell:
> >
> > Kingly ping
>
> I'm afraid I know nowt about KASAN. It was added to ARM32 by others.
> I've no idea whether this is correct or not. Can we get someone who
> knows KASAN to review this?

I rewrote the patches from Andrey, Abbot and Ard into the current form
and I tend to keep an eye on it, I can add a MAINTAINERS
entry for arch/arm/mm/kasan_init.c pointing to me and Andrey
so we (hopefully) get CC:ed on these patches. get_maintainer.pl
won't help in cases like this patch though :/

Yours,
Linus Walleij

