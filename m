Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8435C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VqUmY5wZVwV4cxZ72Q5InnMgLsILZ7kQ2y2MmSPzwE=; b=MBktP3bWX9Ev2t
	paP9ufJDcWmT61w/Fb1eV8uHoF1rDFHx9bitPpAiBAl8NBze6jZhMrAWf2oEbnBI0ZwtauIhRv3Ks
	vNBHXztBHz8oct8eAggrDjSo64dL/gOzpHs4is27wmvTDNI+peAE3kQOaFhG2dv/ygKzSlN8/R27f
	yr2nPBB1wUgIq0K5CAtss3M7fQonhPNBP8navZZmvRU4XP/ii/iVnYV3oGnrVoSL0Pj5y63Hr3twG
	HMz5YHrL9KRzhIlFTpno+spSG8NZQTUq3mtScnFu9MnYAworDLnsj1F5h5Aj5zlecw1UCPIT5rJvO
	6ns0cJtn+RwjzrAxRp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA9vj-005Mc3-FH; Wed, 19 Jan 2022 12:19:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA9vW-005MYJ-9Z; Wed, 19 Jan 2022 12:19:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E5DAB8199E;
 Wed, 19 Jan 2022 12:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CC3C340EC;
 Wed, 19 Jan 2022 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642594734;
 bh=iDwIc+DUc7OXya/bdZZtCN1X2ndJaDk5bFsU0zq/2TI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UbAM2eQiEL1rH1KxWDPHCYiWRrleLvCXprfbHIiVN84PDsQF31gC5IgxT+sHhWfBJ
 yOl//lTT17LwljJrkIXb6fk8nROOoF/K8kjvfB67vsJNKcVfQUk2sAg10CMSfsFV6t
 JZnCSsEbMWZLe1VXKeSJKzDEMtpKknJXRNyGS/uY38A/SonbxxVnErqyuaiJwXfI//
 tnl4IbzhaYFOxEwiQbNGP/1roievIafNKAFmG82lqyU1K4qa5uYnFVIqcaAlKs8S7u
 gh3+jbwHaJghTxYP/cpS5TQ3rtF2M+8dK8XYULOTTJ8UUcH+OXWEAQ8Qb9l+P7Tb8i
 uWz0AoH7ads6g==
Received: by mail-wm1-f42.google.com with SMTP id p18so5050747wmg.4;
 Wed, 19 Jan 2022 04:18:54 -0800 (PST)
X-Gm-Message-State: AOAM531q+e0nwG54LngnP6NfjDgENmc0qIoqpa0/wMTXQ91nQrAZZ9ZU
 7q9Vec9yYVURpnXCmnE3adgY/KpWUUorG3VY3zI=
X-Google-Smtp-Source: ABdhPJxZk6fKzMkFX1LYAekV1S8lD5eU9AS8iqvCI/XPeSpX8nrMJRY7q6XCGwhbCk0JTQJr+o/N2W1N4R3t8GmwHnM=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr28303504wrp.189.1642594732270; 
 Wed, 19 Jan 2022 04:18:52 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
 <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
 <CAHmME9oGTPS-gVyHQ4o=AxvMJrGH44_tyQ2KPQcfAKgcqC2SnA@mail.gmail.com>
In-Reply-To: <CAHmME9oGTPS-gVyHQ4o=AxvMJrGH44_tyQ2KPQcfAKgcqC2SnA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jan 2022 13:18:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
Message-ID: <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Miles Chen <miles.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_041858_640968_4478AF56 
X-CRM114-Status: GOOD (  21.96  )
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

On Wed, 19 Jan 2022 at 13:15, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> The below kludge of a patch fixes the issue. Still unclear whether we
> should go with something like this or get clang fixed or what.
>
> diff --git a/arch/arm/crypto/blake2s-shash.c b/arch/arm/crypto/blake2s-shash.c
> index 17c1c3bfe2f5..be8cde5f1719 100644
> --- a/arch/arm/crypto/blake2s-shash.c
> +++ b/arch/arm/crypto/blake2s-shash.c
> @@ -13,12 +13,12 @@
>  static int crypto_blake2s_update_arm(struct shash_desc *desc,
>                                      const u8 *in, unsigned int inlen)
>  {
> -       return crypto_blake2s_update(desc, in, inlen, blake2s_compress);
> +       return crypto_blake2s_update(desc, in, inlen);
>  }
>
>  static int crypto_blake2s_final_arm(struct shash_desc *desc, u8 *out)
>  {
> -       return crypto_blake2s_final(desc, out, blake2s_compress);
> +       return crypto_blake2s_final(desc, out);
>  }
>
>  #define BLAKE2S_ALG(name, driver_name, digest_size)                    \
> diff --git a/arch/x86/crypto/blake2s-shash.c b/arch/x86/crypto/blake2s-shash.c
> index f9e2fecdb761..c81ffedb4865 100644
> --- a/arch/x86/crypto/blake2s-shash.c
> +++ b/arch/x86/crypto/blake2s-shash.c
> @@ -18,12 +18,12 @@
>  static int crypto_blake2s_update_x86(struct shash_desc *desc,
>                                      const u8 *in, unsigned int inlen)
>  {
> -       return crypto_blake2s_update(desc, in, inlen, blake2s_compress);
> +       return crypto_blake2s_update(desc, in, inlen);
>  }
>
>  static int crypto_blake2s_final_x86(struct shash_desc *desc, u8 *out)
>  {
> -       return crypto_blake2s_final(desc, out, blake2s_compress);
> +       return crypto_blake2s_final(desc, out);
>  }
>
>  #define BLAKE2S_ALG(name, driver_name, digest_size)                    \
> diff --git a/crypto/blake2s_generic.c b/crypto/blake2s_generic.c
> index 72fe480f9bd6..050874588a84 100644
> --- a/crypto/blake2s_generic.c
> +++ b/crypto/blake2s_generic.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> +#define FORCE_BLAKE2S_GENERIC
>  #include <crypto/internal/blake2s.h>
>  #include <crypto/internal/hash.h>
>

I'd prefer it if we could avoid magic #define's like this. We could
fix it up locally to crypto/internal/blake2s.h just by doing something
like the below.

diff --git a/include/crypto/internal/blake2s.h
b/include/crypto/internal/blake2s.h
index d39cfa0d333e..9e52c07c54cc 100644
--- a/include/crypto/internal/blake2s.h
+++ b/include/crypto/internal/blake2s.h
@@ -39,7 +39,11 @@ static inline void __blake2s_update(struct
blake2s_state *state,
                return;
        if (inlen > fill) {
                memcpy(state->buf + state->buflen, in, fill);
-               (*compress)(state, state->buf, 1, BLAKE2S_BLOCK_SIZE);
+               if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S))
+                       (*compress)(state, state->buf, 1, BLAKE2S_BLOCK_SIZE);
+               else
+                       blake2s_compress_generic(state, state->buf, 1,
+                                                BLAKE2S_BLOCK_SIZE);
                state->buflen = 0;
                in += fill;
                inlen -= fill;
@@ -47,7 +51,11 @@ static inline void __blake2s_update(struct
blake2s_state *state,
        if (inlen > BLAKE2S_BLOCK_SIZE) {
                const size_t nblocks = DIV_ROUND_UP(inlen, BLAKE2S_BLOCK_SIZE);
                /* Hash one less (full) block than strictly possible */
-               (*compress)(state, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
+               if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S))
+                       (*compress)(state, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
+               else
+                       blake2s_compress_generic(state, in, nblocks - 1,
+                                                BLAKE2S_BLOCK_SIZE);
                in += BLAKE2S_BLOCK_SIZE * (nblocks - 1);
                inlen -= BLAKE2S_BLOCK_SIZE * (nblocks - 1);
        }
@@ -61,7 +69,10 @@ static inline void __blake2s_final(struct
blake2s_state *state, u8 *out,
        blake2s_set_lastblock(state);
        memset(state->buf + state->buflen, 0,
               BLAKE2S_BLOCK_SIZE - state->buflen); /* Padding */
-       (*compress)(state, state->buf, 1, state->buflen);
+       if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S))
+               (*compress)(state, state->buf, 1, state->buflen);
+       else
+               blake2s_compress_generic(state, state->buf, 1, state->buflen);
        cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
