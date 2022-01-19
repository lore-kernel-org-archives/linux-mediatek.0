Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B55C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZNvzCdAcJxROEVbF9ZTzJOdLWgYThFUFKS9kyQRO1Q=; b=xAAHD5yZkD5e/p
	qp33XefT5lERr0gb4tjGXUSnNyj5y+yKnBRp1hOmmKR8KbmzRpk2bx26XCKFPKeLFPUEYwf0KlYIl
	qpo65mZoflr5/cfKZueFWN1Wvkey0sBRkODiUgbVPx0rgJ7HaawpAxZx3mUuEU71/2mCt1UVhkFr3
	mTYsbISbzjd3Bs7jjfEXsf9YFgl4837x0jOIMKJEMc2dCkUDk9Xq7xhJivsBPGdds8LsHJaV6HhyJ
	kbMQ5PqMAx9JdJbn7qO6sYAD0PGnR3XmCVttiGNFhc275j+5o6/bYcdVhIgLiInMbZH8hpa+b89hi
	InadZHpH67iWE48/NU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7hH-004kF1-Oq; Wed, 19 Jan 2022 09:56:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7h5-004kAS-TL; Wed, 19 Jan 2022 09:55:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63E98B81914;
 Wed, 19 Jan 2022 09:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05FBC340E7;
 Wed, 19 Jan 2022 09:55:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Z/xBQThn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642586150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SKXS+607Wp2jjel6Jj9GRFNgGoTj5LRUomKHD9Jf0q0=;
 b=Z/xBQThn4dOhNbf+0kibnSc52nIZkMM3KQQxp6U9/1PgFCghS+nrTjPXu2s8WSSy8FMcYx
 tYTVWvwPY2JziclQmFYDrbeAwzmBUuaVu3EFPRPnNdtpZBp/gFMngqNefAYQp8bjWPcZyQ
 x+dqCCo+Ttvr6Bf8Or8iuFC4+gxjQI4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id edf62936
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 09:55:50 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id c6so5759544ybk.3;
 Wed, 19 Jan 2022 01:55:49 -0800 (PST)
X-Gm-Message-State: AOAM531Ctb6GZBn1VOOc2K7PV0B0ndiGrubb7QqgUuh4hLc4bMUKj547
 LmEbukl2p50Kfdqm8qYrXGks3xRxst9teG51jDo=
X-Google-Smtp-Source: ABdhPJxRwv4/wvglAbm3F6pwOwbbu4Fs+IC9Ms5MBl/Up/EpNJDUYPYHj1w6P04OD+aB/2YfZnyy2UCxrn9RxDSrXeo=
X-Received: by 2002:a25:c709:: with SMTP id w9mr16348576ybe.638.1642586148339; 
 Wed, 19 Jan 2022 01:55:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Wed, 19 Jan 2022
 01:55:47 -0800 (PST)
In-Reply-To: <20220119092440.4045-1-miles.chen@mediatek.com>
References: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
 <20220119092440.4045-1-miles.chen@mediatek.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 10:55:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
Message-ID: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: Miles Chen <miles.chen@mediatek.com>
Cc: ndesaulniers@google.com, nathan@kernel.org, ardb@kernel.org, 
 davem@davemloft.net, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, 
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_015556_102276_422E497D 
X-CRM114-Status: GOOD (  11.77  )
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

I'm actually not able to reproduce your oops. I'm using vanilla clang
13, cross compiling for arm64, with thin LTO enabled and CFI enabled.
Kernel seems to run fine.

Are there other settings that are needed to trigger this? Do you see
it in upstream clang or just the Android fork of clang?

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
