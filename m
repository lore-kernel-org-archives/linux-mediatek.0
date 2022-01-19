Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59597C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=588doRtTi1q7d9bso+Uz+hZb6P1Vb7mXQp39tDAMIKs=; b=JyjYxN3U+h7IXu
	NjzulM0Jj4OeE0IItulpx24bqnHXeubF7Q9l8HzF43wu2PDAKvch3sj8sC2Qs3L4z9ZMuardLrLKX
	XDeQihTk3IgrcJYSBh1sC3U4MaMgZ17Iz9A7pnlMr/mTwQO8LRkmfWq/NvKFWjLJji1KFCWQIseQn
	Lb0G0OcaqUokt/FGRsLNtUhIkiGiLZveN/ExBWpYidLHAKHUDfyLg+dsx21UuInOpXqpixRZ5ilEC
	pB8Z2n7KN7gAPmiAR919mrfuh0fT999+/BPaU811QD377jtylUlh6kjEc+uzXVgcsjIXUbEPgLcrk
	tq2Zor2VZcYMxKa1ndBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7wj-004pnO-QD; Wed, 19 Jan 2022 10:12:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7wF-004pY9-7t; Wed, 19 Jan 2022 10:11:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CD9EB81911;
 Wed, 19 Jan 2022 10:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A88C340EB;
 Wed, 19 Jan 2022 10:11:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mUQ+s6q9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642587089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZmc8gDqgNsLlJyQwY9u8TazOCsbUcBCdP5ULRWI5FI=;
 b=mUQ+s6q9VJYV9dD6t4jt5v4YG8mcJrGjjBluSq0ZI4jMahXa35imbu6npbY6pXmkButnVJ
 NaEwiEdAgsTFXRJfJKvrWDepfEXri42HC5+rG3ESUqucZTrnuyDgbuIHlBHI+5R0BOLrhD
 Lg8nqUX1IkVGNWwujIPwZYgcvuUUlz8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e73b6adb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 10:11:29 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id r65so2261088ybc.11;
 Wed, 19 Jan 2022 02:11:28 -0800 (PST)
X-Gm-Message-State: AOAM530vHVMfdYdrI6qZMfL5Cu5yOxJLb0PiuA2A9mSsEunJZOVVt12M
 cTGEA2F/ZZKtLm6zPsAmaUIEc0DQxd4Z/h61m38=
X-Google-Smtp-Source: ABdhPJzYRh6013NycZtQZQi8QTZFhJmw5Fmt733wofIXKSa0m6oYQxRC7J/azk1MKYt3b7DTFrEvpILYXH/l94r/js8=
X-Received: by 2002:a25:ef08:: with SMTP id g8mr4332927ybd.115.1642587086828; 
 Wed, 19 Jan 2022 02:11:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Wed, 19 Jan 2022
 02:11:26 -0800 (PST)
In-Reply-To: <20220119100615.5059-1-miles.chen@mediatek.com>
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 11:11:26 +0100
X-Gmail-Original-Message-ID: <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
Message-ID: <CAHmME9pQcUxs87EwQwBZNDA4ZzqugTggH+uiNPh=mv5zjp3g3A@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: Miles Chen <miles.chen@mediatek.com>
Cc: ardb@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, 
 herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, nathan@kernel.org, 
 ndesaulniers@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_021135_520225_1C4B6377 
X-CRM114-Status: GOOD (  10.88  )
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

Hi Miles,

Okay. Keep me posted.

Just FYI, as mentioned, I'm unable to reproduce this, and you haven't
provided any further minimized guidance on how I might reproduce this,
so it'll sit in the "not a bug" bin until I have another clue on how
to reproduce. Alternatively, Nick and Nathan are now on this thread
and they usually have good luck teasing out compiler issues and such,
so maybe they'll have an idea. But I'm afraid with the information I
currently have, I'm at a dead end.

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
