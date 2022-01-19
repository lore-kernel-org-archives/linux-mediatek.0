Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70272C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRLL4hWYtyCIpOyAAVRDzlmzpslxGd9SPveVg//wmwY=; b=ZOuu3TSLIseAQS
	v1WqKGQiR3aOS0wroP4GX2IjQzSwOWr5Y/+69PRItnsFfpjWPLYtGak0J5qv0QtaStE9p+68Vi5K0
	6EQP+US9tiUi6zqxEap7nc3WfD6bRGBKNZ1w5B0vUAD70/1PfCdyPAg4BldFYzg+Jo1EeeXyRXRKO
	JFhyJ4icqpjhoL7IlcL4R6sGVGfMZsZ/EyHBRgzNxfrI4szSforrQEdAZEErn2sq3tytL9wVxTtXM
	FoMRdpHrFqiAID5XWKiVVMxFLuojhavOq6MejmYGxsIfVmyr3d88+oeCXXEx5lYLJaRwMqBsHUJOK
	5/aNiKcO1ynuKhkUkd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACVG-0060ns-LQ; Wed, 19 Jan 2022 15:04:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nACV3-0060kB-Ui; Wed, 19 Jan 2022 15:03:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99E7CB8197E;
 Wed, 19 Jan 2022 15:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102DBC340E5;
 Wed, 19 Jan 2022 15:03:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hBQSpQfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642604623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GCabguGiN7uT4MQN1kXder1vGuODWjOeHEelZ93JwRY=;
 b=hBQSpQflXLHVazhaxkTthyTBxcaYO9N0NY0sU1Khwt6dMsxWHTbVyoowt90ivmRYdKDNuz
 q3wwo702DCkg+uSBAoi6tibVPjTsX5gu/bvpvNeV6UknffvsRcM/mt1MH6Ejd+Z8QBmRT0
 wqfhenwVX8YjZ+wFS27dPz1sx9fWwY8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 02cb762e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 15:03:43 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id m6so8222999ybc.9;
 Wed, 19 Jan 2022 07:03:42 -0800 (PST)
X-Gm-Message-State: AOAM530dwQtAlmGSGMo1zhSHEG5C5VUdJcToOL1ytGznGdMA6Mf4QmMS
 OKwLsbK3wukg0PH/F6AEKA2o/xGWjWSVMNYYZHo=
X-Google-Smtp-Source: ABdhPJyPplsLL3VSpiK5D84dlkwlzW6DMV1FL5dXA8RsTT2mIPew8sKEZ8KIgnVmP6xFVtVk5brIoW5GPM78o5jqYZ0=
X-Received: by 2002:a25:e90a:: with SMTP id n10mr14086571ybd.245.1642604620836; 
 Wed, 19 Jan 2022 07:03:40 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
 <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
 <CAHmME9oGTPS-gVyHQ4o=AxvMJrGH44_tyQ2KPQcfAKgcqC2SnA@mail.gmail.com>
 <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
 <13f9d24879e34914b1135a4d2ae48d73@AcuMS.aculab.com>
In-Reply-To: <13f9d24879e34914b1135a4d2ae48d73@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 16:03:29 +0100
X-Gmail-Original-Message-ID: <CAHmME9oON=XwOoMNyO+Uu6pEC5j=JvvfK5g2u7mFcM=Y_LZ3uw@mail.gmail.com>
Message-ID: <CAHmME9oON=XwOoMNyO+Uu6pEC5j=JvvfK5g2u7mFcM=Y_LZ3uw@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: David Laight <David.Laight@aculab.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Miles Chen <miles.chen@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_070350_445506_8F708375 
X-CRM114-Status: GOOD (  23.34  )
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

Hi David,

On Wed, Jan 19, 2022 at 3:41 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Ard Biesheuvel
> > Sent: 19 January 2022 12:19
> ...
> > -               (*compress)(state, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
> > +               if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S))
> > +                       (*compress)(state, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
> > +               else
> > +                       blake2s_compress_generic(state, in, nblocks - 1,
> > +                                                BLAKE2S_BLOCK_SIZE);
>
> Isn't that a candidate for a 'static call' ?
>
> And, maybe all these inlined functions should be real functions?
> No point having all the bloat on every call site.
> Much better to call a real function and used the cached instructions.

Not a good candidate for static call, as this doesn't actually need to
change at runtime ever. It's using a function pointer here out of
laziness to keep the same body of the function, like a compile-time
template. You can sort of squint and imagine the C++. Unfortunately,
CFI felt differently and still treats it as an indirect call.

https://lore.kernel.org/linux-crypto/20220119135450.564115-1-Jason@zx2c4.com/
fixes it up to use a boolean instead, which will certainly be inlined
away. So that's definitely an improvement on what's there now.

For 5.18, I think it's probable that all of this stuff goes away
anyway, and we don't need the templated helpers at all. So perhaps my
patch will serve as an okay stop gap. Alternatively, maybe the clang
people will say, "oh no, our bug" and then fix it in their
neighborhood. According to
https://github.com/ClangBuiltLinux/linux/issues/1567 it looks like
that could be the case.

> There are clearly optimisations for the top/bottom of the loop.
> But they can be done to the generic C version.

Optimizing the generic C version would be quite nice, as it'd help all
platforms.

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
