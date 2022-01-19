Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F48C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0c8plYySlWrAB+bQYrokTZi2WmXGN508Nt99UKA2Etw=; b=ZUfx32/KHrprPG
	F+siC9TzYGLmf5YeSDa7z5RAYdGS9CgjleY6Wotf/JzGMmXyTiDadA2CTr+YunqsFrdl514UPMiTg
	8w2yHKzZzzcu8Iuj7nTYxtwO0mS7aGr/mCp4NxpU1h1hzeu3nOToIBq8//ihP3bf+4ODPBhaTcubO
	vQdMLDRDWhme5SjyYlFXnqhpkTbq4nEA57qBq4u1rcze4DD+kjlyz0CEk1RgxbDfQWIyELSX2ksGL
	UHdIdtqEsdA+ru4Vp0Q9UkiqieDyEJSiGjjNvGu9xLYx75nKjCJ6Xj6tP/VMcmusmA0+y85qRvUqd
	C/tE3HwtzFr2xI7W+j8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA72p-004Uwu-QU; Wed, 19 Jan 2022 09:14:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA72c-004Ush-3o; Wed, 19 Jan 2022 09:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AECED6149E;
 Wed, 19 Jan 2022 09:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0961DC340EC;
 Wed, 19 Jan 2022 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642583644;
 bh=UT1ycB5MKQguCeHT4CqkfeYkeSTVnUZkbqsNKDB91DE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O4idI1zwFEP43IR30nHcX2e6/3IXYhwq/luJfzjA4gl23cMKxwgg3Uhqnwxwg8Jhb
 fINRWL54KrR0TjT4IBUl2nKlbuE/QROsbaQ4EPkSdFzVNeQKD5uU/Jie9HG1YaSKzH
 TW5SsCImZ2f3f2F17Eto6pkCff0Ny5bgbD408iFwwzFjOI4vTajrsIS+gjP2BDRvhv
 CbUnhFkgC8CC5jTOFcIIVtAxJ+r9yTegF4kJWqT13dqvpWPyM/plJXOUN8iKJvBlPx
 6VdMBXbgGG2TrYmEULBA3XQ8PHPDvx68WrrPwfQp21n1MS/Jt0PE5CshfjDHOHFVyL
 eAL8x/HukYJ6Q==
Received: by mail-wm1-f42.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso11370876wma.1; 
 Wed, 19 Jan 2022 01:14:03 -0800 (PST)
X-Gm-Message-State: AOAM5326KrGHocKoBo/KKHCMixkZc+UC2/1KtXr+az2bk3KRshLy8ngD
 IzbNljbL4Cn0ujBa/xwnROWsk3YfEhDxDHknB9c=
X-Google-Smtp-Source: ABdhPJwCrAQgxYS+mSM5rThnIjL7BrcKp/O0rhZ0fCrotJ58xV1UBxwc+zZAx8OHuLmlHLQeNbsXBBo+N7eqth/eSbQ=
X-Received: by 2002:a5d:6210:: with SMTP id y16mr26324324wru.454.1642583642257; 
 Wed, 19 Jan 2022 01:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20220119082447.1675-1-miles.chen@mediatek.com>
 <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
 <CAMj1kXEuWRUbCqDBnxiWRaERt6OGL8ufQ1Q7naAGHqKK1oQB1w@mail.gmail.com>
In-Reply-To: <CAMj1kXEuWRUbCqDBnxiWRaERt6OGL8ufQ1Q7naAGHqKK1oQB1w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jan 2022 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGUtg1BOauCjxB+S7yMTPArQrPnHf5jnfhOihL-FHrFZA@mail.gmail.com>
Message-ID: <CAMj1kXGUtg1BOauCjxB+S7yMTPArQrPnHf5jnfhOihL-FHrFZA@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= <miles.chen@mediatek.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Eric Biggers <ebiggers@google.com>, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_011406_255403_B4B9646A 
X-CRM114-Status: GOOD (  29.18  )
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

On Wed, 19 Jan 2022 at 10:09, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> (+ Sami, Eric)
>
> On Wed, 19 Jan 2022 at 10:00, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Miles,
> >
> > Thanks for the patch. Could you let me know which architecture and
> > compiler this was broken on? If I had to guess, I'd wager arm32, and
> > you hit this by enabling optimized blake2s?
> >
> > If so, I'm not sure the problem is with weak symbols. Why should CFI
> > break weak symbols? Rather, perhaps the issue is that the function is
> > defined in blake2s-core.S? Are there some CFI macros we need for that
> > definition?
> >
>
> We should try to understand why CFI thinks the prototypes of the two
> symbols are different. There are still a number of issues with CFI, so
> papering over them by reverting stuff that we want for good reasons is
> not the way to go imo.
>
> In the short term, you can work around it by avoiding the indirect
> call to blake2s_compress, e.g.,
>
> diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
> index 93f2ae051370..fef2ff678431 100644
> --- a/lib/crypto/blake2s.c
> +++ b/lib/crypto/blake2s.c
> @@ -16,9 +16,15 @@
>  #include <linux/init.h>
>  #include <linux/bug.h>
>
> +static void __blake2s_compress(struct blake2s_state *state, const u8 *block,
> +                              size_t nblocks, const u32 inc)
> +{
> +       return blake2s_compress(state, block, nblocks, inc);
> +}
> +
>  void blake2s_update(struct blake2s_state *state, const u8 *in, size_t inlen)
>  {
> -       __blake2s_update(state, in, inlen, blake2s_compress);
> +       __blake2s_update(state, in, inlen, __blake2s_compress);
>  }
>  EXPORT_SYMBOL(blake2s_update);

Ehm, maybe not. As Jason points out, the typedef does not have quite
the right type, so that is most likely the culprit, and this
workaround would trigger CFI in exactly the same way.

Interestingly, the compiler does not seem to mind, right? Or are you
seeing any build time warnings on the reference to blake2s_compress in
the call to __blake2s_update() ?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
