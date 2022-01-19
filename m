Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g0Uv85+vOGHgpW3e5U/sX+mdK5PPTcXjiVRComggr4=; b=EibLzqrpw1rOzq
	7CLrMNYRed8ypyi6LPmgCHn/ekoX+T0ZeVrzr445rJROFJ1rR9t2w8dBd2d3U9+Fv+VIR8zCRV+sE
	CYW5ZOCepckyV4zwDTU1UWgNtFFlXEYhP9PluzOGpmKoPwnbwqh6Qy9l5htPXkg+579TfVKsUFIa6
	A5T8eLpIhZqO/AEysZSnHIR18WshcRQhzG+zbXD+2XcCWhqPIsArzLOW4icqLHTQafXyOWmOo8ApM
	RME9NwshB+lYSBSDlq+i8Yk74mvOT5tJfjtJcA9s5Ky9vyPudwAYXFIkD3f93QnO057w3g4hx9weJ
	sXuWvcnJNldrDKl2Z7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6z9-004T99-Jx; Wed, 19 Jan 2022 09:10:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6yu-004T2L-Pi; Wed, 19 Jan 2022 09:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED116B8190B;
 Wed, 19 Jan 2022 09:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308A0C340EA;
 Wed, 19 Jan 2022 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642583414;
 bh=WDNHgCq1Sifyl65SzNP7dhJXzUA+KcGSqB1STBpal/o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ak4X7XB7uZSGxPLHzqT/QXn42qKgsLVbs8uG+kewTlvVrlDl92zFFe4y58KwWDLHT
 f44qHyq5PPPHZeeUaP9l6bFhkZ0KYdEgrfaItVstIwMLINaFygpYqzP2EhtEHEOEwu
 il87cFjjgMG738RjYKKmF8wFOk0h/rYUErjNFc6R71BKzZrrEJ0Ez6VusIKV+gGzA1
 h0ePyVKLFxET5XWPSQDkiyK36hYZ6nktY37PR3iBWeRUkwIkN5n9CzsaLCNPCesZ7q
 hHvpNi3va5mgodYDODW60+y0to9IqOGRGZaXgMNkTfAeJ/9pqwBJLXJf316Gd7U8Ss
 1uEUJ/JwmByBQ==
Received: by mail-wm1-f52.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so12761308wmo.5; 
 Wed, 19 Jan 2022 01:10:14 -0800 (PST)
X-Gm-Message-State: AOAM531k1/mdP7qFtUlky/qUeUo5mVuNQMhkw6F8YXmPC7Qe42bRkwnD
 bPXyXnXmGnojLRCIIXiLa0PIt/SF1p9XdrkSJt4=
X-Google-Smtp-Source: ABdhPJwrsNn68dd2N/CGBv72C8COqRD7ZHZNGWiesAEQwpW2p4EomFBwRkEKZFhiJvyQFSzoSBrWBu8nXTs8AuHJmJo=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr27561730wrp.189.1642583412437; 
 Wed, 19 Jan 2022 01:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20220119082447.1675-1-miles.chen@mediatek.com>
 <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
In-Reply-To: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jan 2022 10:09:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEuWRUbCqDBnxiWRaERt6OGL8ufQ1Q7naAGHqKK1oQB1w@mail.gmail.com>
Message-ID: <CAMj1kXEuWRUbCqDBnxiWRaERt6OGL8ufQ1Q7naAGHqKK1oQB1w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220119_011017_149378_3C3AE20A 
X-CRM114-Status: GOOD (  22.71  )
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

(+ Sami, Eric)

On Wed, 19 Jan 2022 at 10:00, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Miles,
>
> Thanks for the patch. Could you let me know which architecture and
> compiler this was broken on? If I had to guess, I'd wager arm32, and
> you hit this by enabling optimized blake2s?
>
> If so, I'm not sure the problem is with weak symbols. Why should CFI
> break weak symbols? Rather, perhaps the issue is that the function is
> defined in blake2s-core.S? Are there some CFI macros we need for that
> definition?
>

We should try to understand why CFI thinks the prototypes of the two
symbols are different. There are still a number of issues with CFI, so
papering over them by reverting stuff that we want for good reasons is
not the way to go imo.

In the short term, you can work around it by avoiding the indirect
call to blake2s_compress, e.g.,

diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
index 93f2ae051370..fef2ff678431 100644
--- a/lib/crypto/blake2s.c
+++ b/lib/crypto/blake2s.c
@@ -16,9 +16,15 @@
 #include <linux/init.h>
 #include <linux/bug.h>

+static void __blake2s_compress(struct blake2s_state *state, const u8 *block,
+                              size_t nblocks, const u32 inc)
+{
+       return blake2s_compress(state, block, nblocks, inc);
+}
+
 void blake2s_update(struct blake2s_state *state, const u8 *in, size_t inlen)
 {
-       __blake2s_update(state, in, inlen, blake2s_compress);
+       __blake2s_update(state, in, inlen, __blake2s_compress);
 }
 EXPORT_SYMBOL(blake2s_update);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
