Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F434CCA47B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siGKi/dIfvfe8+iskQhGtDTJS7NXa0bDAndCilNFqRU=; b=aXx8GMk+FIJU7r3WJnKaGfkbt2
	Ydk5dTAJjbEd99opr8PZgZhnHM/tsekvbJUiTKZiwHSkxxw5M6tu0VphUAYiUJ2o9RC4SLliyvIuP
	E1uAyex/KtQzU2t0dGTrCcwBIGpVaSYeHTSVIQLSoB2rkYQu60aE+LH3eiu0KsmsFY34HgXu5Wjop
	CgSpD84oAj3cdwodflEBYJGqZsH7EXzpzjJuC4Vw1y7HFZHqnFSOoptEghb6rkSOChaaQmf792JrX
	jEMaD87waR30YVRVz9x07FwTqivAEkTH6v+T8Nev8iOtNsMAkGZko6GZm+oPSPs/8iYx+VA9SPUnI
	WvH52DXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wta-000amU-Rh; Thu, 30 Jun 2022 16:19:58 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wtX-000ako-Va
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 16:19:57 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id l11so34596253ybu.13
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=siGKi/dIfvfe8+iskQhGtDTJS7NXa0bDAndCilNFqRU=;
        b=PY172wygPNzbXx/MtlL0kVYhRqHP/PMSgMPKfMe5d3bzaiPOFgDA24BfmJk1n+zPMX
         fc/bD2b+O9jTkZx6hTCu9mc5JivMe1meY8jOCRsG//k9b88HjGzDX8h8Y69vjuHcXDCy
         xOoQL6P5l7QZgCNx+04KtnwvzbIl2DoRn3J24x5aHkRHyB1J6Dz3f/03FXjJ2oV40NI3
         h+LLWTCGpXw7DUWpa9ZIxtFe99Y48TMHMZfWnjuIh7rvMkm1AdEkL4gjOPQE4a0SFeZd
         i5/7o/AYKlRkjlV+w7+lMcU1gD2PdeXYLEPIxdLD1dPp9eAwQRuekkzRPpPNu8Pt+g4m
         Fj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=siGKi/dIfvfe8+iskQhGtDTJS7NXa0bDAndCilNFqRU=;
        b=o+1YwNAVxD49yW3uHuE5NjIPBIUcVbdzZS22JPVuNVAkK2aDU7HtqB2JmzlErHjqLo
         hUmvk59VSFEUd90imRobID9aBI8hOzrcof3l4YVmtEVxH+/1aVzA1wV0deBJJU5JmLgE
         jwsp94gsP+gylFuerjfMeZBQ+3pbTL+Qat9UfTC8YyTIrCTXT6tpGBnYcHUHLv75J8L1
         /HnBNoFKZ9vP4u/tpj2Jg9fwLjzzjlg1HBXndQnIF4Af4AtWvQA/qVaFTIG9cml5aNB+
         u/LZ9ZsJlIg7+Q17vgA4SHDB+7tidS9eJl2stCHAVb6oKjlP+fUHNlXmm+PGQfszqDvp
         c02w==
X-Gm-Message-State: AJIora9YESL2fuRmB5Uo/sWKoT2iH1VOfgw/Vhs1zCW+nzJFTvrRQHT9
	soBez7WZUzHWWiv8glTPKoR6QhIfSMsc733KNQh9DQ==
X-Google-Smtp-Source: AGRyM1u8XSsovv5uNzas0O9wEpepGNCy07fQqznwcLEuYGbRz6VCy/lpNKM9Tcq6oR2CJ4QgsTgK4lCOy2Z0yZIqcoU=
X-Received: by 2002:a25:c646:0:b0:669:b341:a595 with SMTP id
 k67-20020a25c646000000b00669b341a595mr10978550ybf.304.1656605993493; Thu, 30
 Jun 2022 09:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220630094646.91837-1-haibo.li@mediatek.com> <20220630094646.91837-2-haibo.li@mediatek.com>
In-Reply-To: <20220630094646.91837-2-haibo.li@mediatek.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 30 Jun 2022 09:19:17 -0700
Message-ID: <CABCJKucgdTqDFyTumSCBHiyRVWgvJEhR2Fn=MxyMpTjWtvCV=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ANDROID: cfi: enable sanitize for cfi.c
To: Haibo Li <haibo.li@mediatek.com>
Cc: xiaoming.yu@mediatek.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_091956_063704_289C9E67 
X-CRM114-Status: GOOD (  17.23  )
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

On Thu, Jun 30, 2022 at 2:47 AM Haibo Li <haibo.li@mediatek.com> wrote:
>
> currenly,cfi.c is excluded from cfi sanitize because of cfi handler.
> The side effect is that we can not transfer function pointer to
> other files which enable cfi sanitize.
>
> Enable cfi sanitize for cfi.c and bypass cfi check for __cfi_slowpath_diag
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  kernel/Makefile | 3 ---
>  kernel/cfi.c    | 8 +++++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/Makefile b/kernel/Makefile
> index a7e1f49ab2b3..a997bef1a200 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -40,9 +40,6 @@ KCSAN_SANITIZE_kcov.o := n
>  UBSAN_SANITIZE_kcov.o := n
>  CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
>
> -# Don't instrument error handlers
> -CFLAGS_REMOVE_cfi.o := $(CC_FLAGS_CFI)
> -
>  obj-y += sched/
>  obj-y += locking/
>  obj-y += power/
> diff --git a/kernel/cfi.c b/kernel/cfi.c
> index 08102d19ec15..456771c8e454 100644
> --- a/kernel/cfi.c
> +++ b/kernel/cfi.c
> @@ -311,7 +311,7 @@ static inline cfi_check_fn find_check_fn(unsigned long ptr)
>         return fn;
>  }
>
> -void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)
> +static inline void __nocfi _run_cfi_check(u64 id, void *ptr, void *diag)
>  {
>         cfi_check_fn fn = find_check_fn((unsigned long)ptr);
>
> @@ -320,6 +320,12 @@ void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)
>         else /* Don't allow unchecked modules */
>                 handle_cfi_failure(ptr);
>  }
> +
> +void __cfi_slowpath_diag(u64 id, void *ptr, void *diag)
> +{
> +       /*run cfi check without cfi sanitize to avoid calling cfi handler recursively*/
> +       _run_cfi_check(id, ptr, diag);
> +}
>  EXPORT_SYMBOL(__cfi_slowpath_diag);

You can just add __nocfi to __cfi_slowpath_diag, right? There's no
need for the separate function.

Sami

