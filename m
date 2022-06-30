Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E779BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tJf/17a3GQ00Kn5C7fSPbfS+nGvxRvX74INNcvd7FM=; b=sGAz/3HScx7pkfXh5IW31h8cSn
	dtSF/bsTTJ0nnrbqi9xqoGr7sXwOwqQ6ydYCaZjqlrz/LejDp3PfBOFujCbRGaVdbYZS2EW+pV68I
	vZxuvYBlvOGaWxoWEQMNEy/YZkv/6vrPOiOooDg9t2U968ABzm6u4IhyoSptdrA1Q/zlA0E4KKmmq
	E7grOMGvgbedakuM7uciZij568EyeHG7NMyjLdz+fgBRP9Od1J30Oo+OT3JVAnlIuxAk9oIM4NaBi
	3JWCX2e62R4t84fqDEzE3CFI+wouXJ2cQl3mNWqU9VxYroH49JDNUI7kz70oCLPiR95eYuYmcVAKd
	tr5S6NrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wrJ-000aDD-IO; Thu, 30 Jun 2022 16:17:37 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wrG-000aB7-Pb
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 16:17:36 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3176b6ed923so184041017b3.11
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tJf/17a3GQ00Kn5C7fSPbfS+nGvxRvX74INNcvd7FM=;
        b=V3IQdTjwGtjHq/wY732Ok5nzPOJUJqa005Rjh4xsvyjkOvxBhqe9k6+vrZGL/tcswq
         47DBJDjy1pOYDTaYRu5k7So0tFRo9qf8mXCvatq9gaoBf1DfxkRKsX5tf624n1A1J5WZ
         23IEz9yDN2Y/rJ+PWcc8WSpdQ78EJGf0hq4xxvWzUL/F30sfLXWEwn+HtiiyFfUjveIj
         MP4bYCJgaRY+wnD7da1+nEh6j6LLAvYE83G3gNqaoAIoxf+pBcAmnHAkw1DHEBHRFon+
         FM9Wb4svFi8uTslDwmzkHDu41Z74gJ+iVOd2a9U2wskWBSIIlgZuSzeZDm9dnV3BuQXN
         xpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tJf/17a3GQ00Kn5C7fSPbfS+nGvxRvX74INNcvd7FM=;
        b=lUAUcgAt0BXDMq9sr01XXNyhubwAHE5ou/u0eVNE6k/4TquBUzdCOdEcRirsJICzPY
         iWpG1VzVCW7rl12RVz86/4sa3JmX44244tmfjwoTf4wHeRj7wdVHMSeLbU16w2yi8pQA
         8YkoJaUAIdfOnwU5lyNWCJ3ZygKLQ0XvdUYbHO7gBby11TlF+RG5G4q2wUaTeJsq7YEJ
         WvFzqk10p6+/FtqfkIsyn0T9R3zZXwbP2XdwKc8oiVT8u9HcJ4E7nafXuGGUk1mPh/rh
         7BergC/w/hRtbEtnVy/BQOy+4EEAE/8TfrbT+APyEWNpd6V/Fxn3pJzWLEQ30lyNSmgC
         PKdg==
X-Gm-Message-State: AJIora8iSkFtmAEesoJxkoa7Jsft+ORMR6gJc9+srIv4Jt/PGPoorWZN
	r0Pjuh+8TO0BQWU7Fvhurd5apahrcGMIRIPkM3IS/w==
X-Google-Smtp-Source: AGRyM1sbaK65wf5OF7UYo6reMNsQ9IKIvv8vWLIjJgL97P1kM6VEZuZlgN8a9YFYBeLnAT80hQNyEvy2X6rmMVj68I0=
X-Received: by 2002:a81:68e:0:b0:317:ca36:5807 with SMTP id
 136-20020a81068e000000b00317ca365807mr10798982ywg.314.1656605849995; Thu, 30
 Jun 2022 09:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220630094646.91837-1-haibo.li@mediatek.com> <20220630094646.91837-3-haibo.li@mediatek.com>
In-Reply-To: <20220630094646.91837-3-haibo.li@mediatek.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 30 Jun 2022 09:16:53 -0700
Message-ID: <CABCJKudz5O5_-1q1H0o2DFRcnpMQDBPv4STUVa2bOE9ePaeyDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ANDROID: cfi: free old cfi shadow asynchronously
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
X-CRM114-CacheID: sfid-20220630_091734_882334_07D6998D 
X-CRM114-Status: GOOD (  22.59  )
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

Hi,

On Thu, Jun 30, 2022 at 2:47 AM Haibo Li <haibo.li@mediatek.com> wrote:
>
> Currenly, it uses synchronize_rcu() to wait old rcu reader to go away
> in update_shadow.In embedded platform like ARM CA7X,
> load_module blocks 40~50ms in update_shadow.
> When there are more than one hundred kernel modules,
> it blocks several seconds.
>
> To accelerate load_module,change synchronize_rcu to call_rcu.
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Thanks for the patch! Please drop ANDROID: from the subject line,
that's only used in the Android kernel trees.

>  kernel/cfi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/cfi.c b/kernel/cfi.c
> index 456771c8e454..a4836d59ca27 100644
> --- a/kernel/cfi.c
> +++ b/kernel/cfi.c
> @@ -43,6 +43,8 @@ typedef u16 shadow_t;
>  struct cfi_shadow {
>         /* Page index for the beginning of the shadow */
>         unsigned long base;
> +       /* rcu to free old cfi_shadow asynchronously */
> +       struct rcu_head rcu;
>         /* An array of __cfi_check locations (as indices to the shadow) */
>         shadow_t shadow[1];
>  } __packed;
> @@ -182,6 +184,13 @@ static void remove_module_from_shadow(struct cfi_shadow *s, struct module *mod,
>         }
>  }
>
> +static void _cfi_shadow_free_rcu(struct rcu_head *rcu)

I think this can be simply renamed to free_shadow.

> +{
> +       struct cfi_shadow *old = container_of(rcu, struct cfi_shadow, rcu);
> +
> +       vfree(old);
> +}
> +
>  typedef void (*update_shadow_fn)(struct cfi_shadow *, struct module *,
>                         unsigned long min_addr, unsigned long max_addr);
>
> @@ -211,11 +220,10 @@ static void update_shadow(struct module *mod, unsigned long base_addr,
>
>         rcu_assign_pointer(cfi_shadow, next);
>         mutex_unlock(&shadow_update_lock);
> -       synchronize_rcu();
>
>         if (prev) {
>                 set_memory_rw((unsigned long)prev, SHADOW_PAGES);
> -               vfree(prev);
> +               call_rcu(&prev->rcu, _cfi_shadow_free_rcu);
>         }
>  }

It's probably better to keep the pages read-only until they're
actually released. Can you move the set_memory_rw call to the new
function?

Sami

