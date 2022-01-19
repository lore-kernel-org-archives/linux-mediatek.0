Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2DFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkDR3WssprX2uz4U/DXBLq8vrb4N2rdEW5VMfO8KVJE=; b=IXFUKgHjF4iQFp
	A28ifXi3cxH2/xdPdSWvcAG5s15JNt9rtiYzaGml1+bbGBXBpl25upgJ42Xg1tdquYtaKBPTPmcKd
	G3whCzUloy2tCKdwtCOFdJ7y9LhZd9CTWFI8we6PWOYwjaH2uTzWcBBD3cHl+9YTfZ6F+q9UAE/jd
	b9glbfSo4Ccsy6uMYEFmEdE0oNWyQ7HLxLMR9KQ+zMf8pPBjQNnfHaUsMC8U8uCfQSbYJhh7Y6WKy
	E6ZSjfKrTxuDCPHOJsmVyczSL5cmJ+gWVU3CGOFyvcVZiF6qGUYG3z/Lk7Vabipz9vMpjOFDDKEF8
	gnlUCCCt8D8ZJ054FEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAB72-005drF-HA; Wed, 19 Jan 2022 13:34:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAB6p-005dnn-PP; Wed, 19 Jan 2022 13:34:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFD3E60AE2;
 Wed, 19 Jan 2022 13:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57C5C340E5;
 Wed, 19 Jan 2022 13:34:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QWsO0rMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642599279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZuC6TmXhJQVSeFuSv1mMMFPmjV47Ffvc9/epCoTyMw=;
 b=QWsO0rMHXEsNzU7JaiEc6a45Blq9Kchc75TVYZzX/FAHKbD7ZLV2YTaR0kRE3xpH3Qpu58
 t5p+af3MmnnvXF9LbnvR/5W4kXDSSc0qxcEa3vsyHu8NOTVUZrp/NY8ptT6BEw9k5njSui
 I7T/jbbhdOPUM605+v4hnHB2RM3qOwc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c5dcea5a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 13:34:39 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id g14so7417802ybs.8;
 Wed, 19 Jan 2022 05:34:38 -0800 (PST)
X-Gm-Message-State: AOAM533MsGVpfpsvW0XQQc82KNXxxr0UwsrQByxTTTAHg8gHk+0C8yb9
 J0OQq2jts/SjaCrgStmJytVyRRqMvScjhD2ABOc=
X-Google-Smtp-Source: ABdhPJwl2oYebyTcjJJzYEcQx1P0FnZ8TEkLTKOLecv3UE1gMShS+rFpjiSNu6UvcQ2d9xR0yhRTcFuoVyPulYXQV48=
X-Received: by 2002:a05:6902:709:: with SMTP id
 k9mr15518165ybt.113.1642599277841; 
 Wed, 19 Jan 2022 05:34:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
 <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
 <CAHmME9oGTPS-gVyHQ4o=AxvMJrGH44_tyQ2KPQcfAKgcqC2SnA@mail.gmail.com>
 <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEo8kQNeoCdwvBkkW0UeYFQEJwkZ_nj06qjsBDF2Qu2pQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 14:34:27 +0100
X-Gmail-Original-Message-ID: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
Message-ID: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: Ard Biesheuvel <ardb@kernel.org>
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
X-CRM114-CacheID: sfid-20220119_053443_952264_1A33B138 
X-CRM114-Status: GOOD (  13.61  )
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

On Wed, Jan 19, 2022 at 1:19 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I'd prefer it if we could avoid magic #define's like this.

I'll send something that just replaces it with a simple bool.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
