Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B589DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 20:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Yp/M2nXRKhaVrrCRiUqUlQQA9aEJHHJ9VS2IScoQcQ=; b=b2gewRLIKTBv2v
	qB3/R42v+f2Km24zDVAJQe4PmJHsIEmIFnrGJRN1/f7JUrWusX8dFyKAeTe+s/enCbFjGbvNiMylI
	kPBryJrhxPXd54wQFndVhrXxCB4uWGtWnu4ug3kT/n3a6lclslw6jqY+prNCwuVfhL9YbOOe8dwGu
	VNoZanjmMHkgCzEN+uH6JdDfnx8SPy6v0lZjxmE70oO05cOomsyGactMdKwZN/HFT8G4uC/Ob9nWZ
	yNG4KyMC0vCS/bHMlInVP0WpLiIjHoK6A7SyXGhvvEKCa17zLkf5XyF4t7B058bxjDBIzyBQ56RMT
	GdIt0L2QVqKnb5YSsTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB0t6-00G3nu-3Z; Fri, 21 Jan 2022 20:52:00 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB0t2-00G3mJ-RO
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 20:51:58 +0000
Received: by mail-yb1-xb35.google.com with SMTP id p5so30843772ybd.13
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 12:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yx8Sp5yK+IdSrHNRElqCQeGwi3Mhv+uJHX0dumssPUA=;
 b=YjZAfWsIl22u4X60/fbS0dbemyatmDIkYev6n1TbCuzrDC87OZ3vL1EMl1GajyVlDf
 AelgkM6pKJ0kXs/tVKF3zcI07cEMv0w9EAYpMNi5c3CNWfYRphBxeQBYSK/rDzUD2Aoc
 O/9vGAd1++8iH81q0OyiG5sdMKU2Jii8KEkzgUDk+l8Bj9KfRDLw9nVEnd9csn9q1in7
 jIU40jwptembCj0iK/B4OXLRvkqGP5fdzwuauK1L2dBBPlFB84oZEhR3dut2uFSqfMfY
 8nRZkKg0C73kq764VJ8P9MK8Kx0P/kX0fdX46xbVvRNhonRy8dadYg8FYS9E1G/Gvfrv
 RSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yx8Sp5yK+IdSrHNRElqCQeGwi3Mhv+uJHX0dumssPUA=;
 b=Himc1vGJjhYnfaUorlCYZspjD8aUJ6G/U6s/gM0z6ZT9alkw4CL6WIx+t7hn0hC65l
 LPEbVLS5/Goi3mj5SZlsB8OBC6j4TXuWBOsDieCUa1EoeuMFtQNIeXe8eZFQLbi8AtLG
 edS6UC1xZCwTsBb/syKhsIrfjm77O2F5cXOzyWUTCZGenYRe/8OAcmxvlm07+ePJGdTu
 ujwEU1USXh2NMhKNf4imLhGtuleYHzZ4jRZ0h/XTOGYe8UHFwC/DxSYZczk8DNC2MxYA
 5JZwhy3gTqt+oQ5W4x3hcN3UQjtLQbf9dh8T1kBzlr87PMFUuSy72w/JtKHSm/Gy+Bqy
 etYA==
X-Gm-Message-State: AOAM533RWA/RGipT19NtxpDjjyzBRxUyRHC/XZpHOSWNVSwCvL9rYFcg
 Pz3O1AHvuBayY4DOODs45VSeCgkv33ouTIvY7ZJLfA==
X-Google-Smtp-Source: ABdhPJxkhXZrcRureYqCap4kFxTZxfwvDGSic4fyFA+HyhmO213hyixgvNMr4MNs1ShbFviWARp8lDLRAfZc4ikUV+s=
X-Received: by 2002:a25:c841:: with SMTP id y62mr8672404ybf.196.1642798311679; 
 Fri, 21 Jan 2022 12:51:51 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
 <20220119135450.564115-1-Jason@zx2c4.com> <YesPesOhftSzp2ft@sol.localdomain>
 <CAHmME9ow7TxCaYYayRn9rdJJSdQ48tWQgdrW00g7mHaWvVJ+Zw@mail.gmail.com>
In-Reply-To: <CAHmME9ow7TxCaYYayRn9rdJJSdQ48tWQgdrW00g7mHaWvVJ+Zw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 21 Jan 2022 12:51:40 -0800
Message-ID: <CABCJKuf=eHuFfNjD-7FBTeft3XNTkEc4G9cDvYpMJgH_se12eg@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: avoid indirect calls to compression
 function for Clang CFI
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Miles Chen <miles.chen@mediatek.com>, 
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_125156_906282_D425D461 
X-CRM114-Status: GOOD (  16.56  )
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

Hi Jason,

On Fri, Jan 21, 2022 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Fri, Jan 21, 2022 at 8:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > There are some lines over 80 columns in this patch.
>
> I'll fix that up.
>
> > Otherwise this looks fine.  It would be really nice to fix this in clang,
> > though.
>
> I agree. I'm wondering whether it makes sense to roll with this patch,
> or to just not change anything and lean on Clang upstream to fix their
> bug. Full LTO is marked as "experimental" still. On the other hand,
> Android ships with it turned on, so how "experimental" can it really
> be? I don't have a strong read on the Clang ecosystem to know what
> makes most sense, to apply this or not. Do you have an opinion?

We'll work on fixing the compiler, but please note that it's most
likely going to take a while, so I would prefer to work around the
issue in the kernel for now.

Sami

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
