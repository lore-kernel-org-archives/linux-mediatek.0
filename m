Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A5EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMk7JxL5fbDuYKFZP1Dk6LIQ9TQbK1wDDQyfa09JAEY=; b=p6qdAxc6jKYBlE
	dbr1ACPwncWoqVvZlarTy8bhFhI7He3wGj4ZgD9Lh63rxLcYArDoRPZ0wBRgiQEh2DrrGaMUsx54N
	1bbJNg7LW3RRIH8aSOrLnVmnTqcq33b+OKqy71oWUnLzfcd7PM2ILXZs2qQEk093Wyx4aYzrrsmNC
	5zEx24KFIpTRChWAOrPUxwE/Hi33QvgzDuoNYDKIYCM61qNUtCsjk8S+5/1jw9oJOWpyz1O6tSoxU
	6H4Z6E06luqJyMKn704xepnoL1cimGyaDgNIgKWRtWJ+bMJFTrSy/adPn0rSXwGe6JwafSMbpxHKG
	92qzCwspUVM8NsOdthMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8eC-0052LS-Lu; Wed, 19 Jan 2022 10:57:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8dz-0052HS-LE; Wed, 19 Jan 2022 10:56:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51E68B8198E;
 Wed, 19 Jan 2022 10:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AC1C004E1;
 Wed, 19 Jan 2022 10:56:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="clSmDhQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642589801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c6OIpweiYSlg1CO1oV/4/fX9PmbGWaJgEcK1s5L/UCM=;
 b=clSmDhQ9v6mwT8AqA/7PddiliXjzCnVuKqGHWuRMScEBMvlsnTy8g6e1Y6cMjyqzqjVYOt
 +xUXZMczZX6IXfAgbWAYUOdoJ2GpYjNYh3LGTJpoIkSRLGNNrO6HqGrfX+Sey4uOmMExW0
 8PRRZeAuWLXdS31lzH9DCVM+ZQdLbGg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bbab6ecf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 10:56:41 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id g14so6148112ybs.8;
 Wed, 19 Jan 2022 02:56:40 -0800 (PST)
X-Gm-Message-State: AOAM5337/dXppxbRqttz3YU74SULNWELzfn1Exp5F/wcSXZjnCfUqOqn
 bypcX0/lSbeI2LcQMby6eeYqAQPW55xbYkCMklc=
X-Google-Smtp-Source: ABdhPJwSrhUa6tV1Vuk+5uZ3ov5nQgpookiKOhJa3YUNCmP6fIkNz2Lw1CO4IK9upJuph+xxqIgYgHP4KC7FjLDB5Tw=
X-Received: by 2002:a25:bc52:: with SMTP id d18mr9639032ybk.255.1642589799667; 
 Wed, 19 Jan 2022 02:56:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Wed, 19 Jan 2022
 02:56:39 -0800 (PST)
In-Reply-To: <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 11:56:39 +0100
X-Gmail-Original-Message-ID: <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
Message-ID: <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: Miles Chen <miles.chen@mediatek.com>
Cc: ardb@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, 
 herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, nathan@kernel.org, 
 ndesaulniers@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_025647_858672_24DD370E 
X-CRM114-Status: GOOD (  15.22  )
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

On 1/19/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Miles,
>
> Okay. Keep me posted.
>
> Just FYI, as mentioned, I'm unable to reproduce this, and you haven't
> provided any further minimized guidance on how I might reproduce this,
> so it'll sit in the "not a bug" bin until I have another clue on how
> to reproduce. Alternatively, Nick and Nathan are now on this thread
> and they usually have good luck teasing out compiler issues and such,
> so maybe they'll have an idea. But I'm afraid with the information I
> currently have, I'm at a dead end.
>
> Jason
>

We're back in business! I was able to reproduce this using FullLTO
rather than ThinLTO.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
