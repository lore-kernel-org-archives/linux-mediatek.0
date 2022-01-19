Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFFFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sP7i070btEoBLX66RxEjdWgo5jwB27/LNCzs1NqfLxw=; b=nGsGKISu6JpuzD
	Q9sEvIq2TzcuHQz680PHZQ0LRBbzV5pK9NkR2nv+0NA4tFAr3bkh8Ii55FZ3PvCsce1ZqHWfxSEuX
	oPB/nRFYwTCtItlVTv7D+K2mp1eVWQkAGkJSApSxQh6USXED5VmzMM0dVrbRyKXMjpGPqq6Xll2JS
	hQbM0WLCxKE07MmKPp2ZH6fH+S9ManAJ0BmcHcHZhVaNLkmUPj3Vhb/fTHmfZl2GHSCazRqTO5BsR
	HRclyxBjylHA5iz/ZyITJrih0URo8anwoTEjIGqhpB9PAYIpX7jN9yeGQdejuIoxCcJ9/SPCGc4uU
	5Nmnx5h7yNtiyj/w6TSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6ps-004Qwc-Dx; Wed, 19 Jan 2022 09:00:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6pZ-004QpB-D8; Wed, 19 Jan 2022 09:00:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57CD1614E4;
 Wed, 19 Jan 2022 09:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC194C340E3;
 Wed, 19 Jan 2022 09:00:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="c3dQq4AT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642582833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2dOFJ+UpcJtVObG5xI+XoGYifJptafHjJhs8HGfwX1w=;
 b=c3dQq4ATbm3F/187EqTQn/DEc2+TVz5Z6Leei8F10Yf3ixE2Uu6PJW8ci1EnHZrfZM0tzK
 HOkeqMqMuOacinhQ2L5LbbQObXWehm5LhxLXbvyOgx2P8gpomIxL5mz6xFs3X39Twpe18H
 6UV6m97d9dMYHbb/v+7tKMp5de21ePo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14ac1af5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 09:00:32 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id k31so3731559ybj.4;
 Wed, 19 Jan 2022 01:00:31 -0800 (PST)
X-Gm-Message-State: AOAM530uLt91dr5ZILJwXznxz8D5qtvkCQragXEXz14w0krikZNms48s
 toMyzANIXqeEv29m5Zz9nUB5D1XC/00CH6ypX1o=
X-Google-Smtp-Source: ABdhPJx4RyuigxoTOZs8Or8CkU4hkibFalbgQMbYzSXkFlEEIcgX6zw0oBRh/W5vLkIRmue8eoXzbhHlni3UQuAdKpE=
X-Received: by 2002:a25:e7c7:: with SMTP id
 e190mr12418681ybh.457.1642582830614; 
 Wed, 19 Jan 2022 01:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Wed, 19 Jan 2022
 01:00:30 -0800 (PST)
In-Reply-To: <20220119082447.1675-1-miles.chen@mediatek.com>
References: <20220119082447.1675-1-miles.chen@mediatek.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 10:00:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
Message-ID: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: miles.chen@mediatek.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_010037_598499_868DA625 
X-CRM114-Status: GOOD (  15.38  )
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

Thanks for the patch. Could you let me know which architecture and
compiler this was broken on? If I had to guess, I'd wager arm32, and
you hit this by enabling optimized blake2s?

If so, I'm not sure the problem is with weak symbols. Why should CFI
break weak symbols? Rather, perhaps the issue is that the function is
defined in blake2s-core.S? Are there some CFI macros we need for that
definition?

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
