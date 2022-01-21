Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E343C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 20:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKlW6Dwj5+9dLTvcfuLfvWqWt9s0KIDo3tb6/E/j4sg=; b=c4c0+xkzUpeW1M
	nLT05CjgGtuDcnw8gstzfYdgyESIqyfHo4oq6a3AAxysB/rwkfhKB0zln4UWh4deJD1HRAJoKp1n3
	hOE7PmoHBMnjYwzuLagcjtc+L2M3q7I+KZGye/uu6/E5Uj4NdVAHBjHOjqICwgMk8mUwyYuHSgNn4
	Gzo/mBREsFgbJMI7aDMEK51aPAa4od8BcCQPwl9VAcj//Oa24mHUkoaO42LjCBoDa2DJIIZddpmiW
	49YDi81HUyOM4msqTX/VX39kGGLMLXhD9lGCJaaKszN18GoYRaHdNEhK3WbOM5ndZXY7Xu/KVkOo8
	009iAa+vElaRQF7Xmhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB0RT-00G2XA-Om; Fri, 21 Jan 2022 20:23:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB0RI-00G2Vt-JH; Fri, 21 Jan 2022 20:23:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C150B82107;
 Fri, 21 Jan 2022 20:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018E8C340E2;
 Fri, 21 Jan 2022 20:23:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BMscvUpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642796591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oBqGV4H7K/jCpP8PTz6+aYreOz0jHaQWza7NI4+WEM4=;
 b=BMscvUpigkybSXqmm6pvM0d9nar+niscgkEtK7t6AlZ255cvnXWJHE57oPKT94a5SPmziW
 3qepWhXljuII19w3iYazpQ4TNYxTBsozuR+Qndq7tczbA5JNAqthomyKT3EP2LdKS3gw4T
 Wb51lIEedSU3FGf5ad1TdX9AuUw/FHQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e5779650
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 21 Jan 2022 20:23:11 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id m1so30799344ybo.5;
 Fri, 21 Jan 2022 12:23:11 -0800 (PST)
X-Gm-Message-State: AOAM532sBMMpp1Yi5UlATiDAiScuImjuWLMulZBXaS3gKxZaizABu1GP
 OT4RFVSgXil0ClK4THYSNmv1KOofOnnDLeAzLU8=
X-Google-Smtp-Source: ABdhPJwl2jkYtYtG2nPh5ypMlIKxLf59xn8Y3SzY5dE0QkIWXT8ENiHBOTEA4FBYcb21NZAtyd/9VJpUiC7JY0D0yk4=
X-Received: by 2002:a25:244b:: with SMTP id k72mr8936181ybk.638.1642796590031; 
 Fri, 21 Jan 2022 12:23:10 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
 <20220119135450.564115-1-Jason@zx2c4.com> <YesPesOhftSzp2ft@sol.localdomain>
In-Reply-To: <YesPesOhftSzp2ft@sol.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Jan 2022 21:22:59 +0100
X-Gmail-Original-Message-ID: <CAHmME9ow7TxCaYYayRn9rdJJSdQ48tWQgdrW00g7mHaWvVJ+Zw@mail.gmail.com>
Message-ID: <CAHmME9ow7TxCaYYayRn9rdJJSdQ48tWQgdrW00g7mHaWvVJ+Zw@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: avoid indirect calls to compression
 function for Clang CFI
To: Eric Biggers <ebiggers@kernel.org>
Cc: Miles Chen <miles.chen@mediatek.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_122317_030642_5AC70000 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, Jan 21, 2022 at 8:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
> There are some lines over 80 columns in this patch.

I'll fix that up.

> Otherwise this looks fine.  It would be really nice to fix this in clang,
> though.

I agree. I'm wondering whether it makes sense to roll with this patch,
or to just not change anything and lean on Clang upstream to fix their
bug. Full LTO is marked as "experimental" still. On the other hand,
Android ships with it turned on, so how "experimental" can it really
be? I don't have a strong read on the Clang ecosystem to know what
makes most sense, to apply this or not. Do you have an opinion?

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
