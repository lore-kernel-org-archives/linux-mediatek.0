Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8056C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLAq3fWlq0GjO0YjpBaxlMq80fQaiF1O08BtCiF0svU=; b=Uz93tME2g+8fSY
	BJk9BUgY3R1Dz7SyxeyegKidqmCnfTaeJrWJvlXbX+qmaBZflgcvZcPPQAYNoLTwEWdPatkzQGsK0
	OdJfgfYW7wrr92XN1cj57/9AxIwTkLl9aOOTdf8TBlVAN5GkNGzgBB1Ukjdf5J/jkXFNbO3LxxHIN
	cRqm9ZaAN7vEKcK9WGEBTJwgXNWrNU0VM269GeCEU7qR92EttS7OTnIk9xFUdyy6iwo19hnQwQ//4
	o6hegA+XGn4VDa+w4ilDW+37/xqznCkhzcDPIj57tM1TRV6aKN0WCS3VdUpWT9Ds7UruTzgHYYUt1
	kedlhNkz48Cj6gLmz4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAC9D-005vTF-JV; Wed, 19 Jan 2022 14:41:15 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAC98-005vPG-Uh
 for linux-mediatek@lists.infradead.org; Wed, 19 Jan 2022 14:41:14 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-56-LQ0FXddLOfCr6qw0uAVh6w-1; Wed, 19 Jan 2022 14:40:59 +0000
X-MC-Unique: LQ0FXddLOfCr6qw0uAVh6w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 19 Jan 2022 14:40:58 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 19 Jan 2022 14:40:58 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ard Biesheuvel' <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Miles Chen <miles.chen@mediatek.com>, "David S. Miller"
 <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>
Subject: RE: [PATCH] lib/crypto: blake2s: fix a CFI failure
Thread-Topic: [PATCH] lib/crypto: blake2s: fix a CFI failure
Thread-Index: AQHYDS69GuHcqhw6yUKTzpetNPFOeaxqZdAw
Date: Wed, 19 Jan 2022 14:40:58 +0000
Message-ID: <13f9d24879e34914b1135a4d2ae48d73@AcuMS.aculab.com>
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
 <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
 <CAHmME9oGTPS-gVyHQ4o=AxvMJrGH44_tyQ2KPQcfAKgcqC2SnA@mail.gmail.com>
 <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_064111_309510_339C8C20 
X-CRM114-Status: GOOD (  15.33  )
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

From: Ard Biesheuvel
> Sent: 19 January 2022 12:19
...
> -               (*compress)(state, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
> +               if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S))
> +                       (*compress)(state, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
> +               else
> +                       blake2s_compress_generic(state, in, nblocks - 1,
> +                                                BLAKE2S_BLOCK_SIZE);

Isn't that a candidate for a 'static call' ?

And, maybe all these inlined functions should be real functions?
No point having all the bloat on every call site.
Much better to call a real function and used the cached instructions.

Although, having looked at the source and the generated code for
x86-64 and arm64 I'm not sure I'd want to try to generate
optimised assembler for it.
(Unless you can a instruction that does exactly what the code wants.)

Basically the compiler can merge the instructions for 4 of the
G() expansions so that they can execute in parallel on a multi-issue
cpu. Doing that by hand will be error prone.
Each G() expansion is pretty much a register dependency chain,
not much chance of parallel execution.

There are clearly optimisations for the top/bottom of the loop.
But they can be done to the generic C version.

The real problem is lack of registers - the code needs 16 for the
v[] array plus a few extras.
So some have to spill to stack.

The unrolled code is about 1200 instructions on arm64 and x86-64.
Each of the 10 rounds reads all 16 of the u32 input values.
So that is about 8 (1200/160) instructions for each read.
Which means there is plenty of memory bandwidth for other
reads.

So 'rolling up' the rounds - which adds in the blake2s_sigma[]
reads could easily be 'almost free'.
Certainly on x86 where you are just (well should be just) adding an
extra memory uop for each input buffer reads.

I'm not sure the 8 G() calls can be folded into two sets of 4
while still getting the compiler to interleave the generated code.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
