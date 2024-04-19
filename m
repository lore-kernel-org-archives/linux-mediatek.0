Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5EFC04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 12:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgvA+pX3m076VODfdVT5T36t6N6KpW3H7jte1/zPwIo=; b=vnpIOXHY26UbONAkFTS7szPbw3
	Rn40U5NX09dVe3TrHyX9RKnMKGtpujUqtixYmRJDE0vV/9zaYYTxtNKAtzkzbVCj7+UD+jgdsDGSZ
	4x/DacLW+p6ZphqLdq1ijE3J4x6qSGyOWYGru2gIRTM/FyRJjxWz0pitS8dTYmghLk8lO0S6iKDrf
	W/Ai18gXFQVolyFrJCnO6otSJKpP/X7aEWPJcKiMfEul4XzaLEHx+QiKuVRmZypswOUCBT5Y1EAyI
	M0ILlePopCiQ+IbFA2s8PXcws8GqgOWpx+gBtbdCu28rV9Jmad5OmgL0zNMY/6x7VS9FExkA/4XnC
	+2zEpROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxmzt-00000005XdO-0Uyq;
	Fri, 19 Apr 2024 12:05:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxmzo-00000005Xbf-1VGt;
	Fri, 19 Apr 2024 12:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7DA0ACE1A9C;
	Fri, 19 Apr 2024 12:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F06DC2BD10;
	Fri, 19 Apr 2024 12:05:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UlyzfiaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1713528329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sgvA+pX3m076VODfdVT5T36t6N6KpW3H7jte1/zPwIo=;
	b=UlyzfiaUf6CZ0D9OZ0DeUkyUqT80dx11ttf/Yb8RUie94AXuNtvwKEe6G2hGrh+8QT79dG
	QjiYRvF/B0sBcrvPUmofvfHKeKZFnnMSUhMYwxJHhuhRl4NFIi3PQWK7iAMTn5v3aWGOVv
	NQ+8z0gBddlE3ed43SExJbVJGnasKKM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0db50ce3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 19 Apr 2024 12:05:29 +0000 (UTC)
Date: Fri, 19 Apr 2024 14:05:28 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Guoyong Wang <guoyong.wang@mediatek.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v2] random: Fix the issue of '_might_sleep' function
 running in an atomic contex
Message-ID: <ZiJeCPkcnEEmYqc-@zx2c4.com>
References: <20240419105453.5440-1-guoyong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240419105453.5440-1-guoyong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_050536_681643_92DAA28A 
X-CRM114-Status: GOOD (  14.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 19, 2024 at 06:54:53PM +0800, Guoyong Wang wrote:
> In the case that a delay is acceptable for 'crng_set_ready', it can be
> deferred to a workqueue in order to accommodate different contexts.
> 
> Signed-off-by: Guoyong Wang <guoyong.wang@mediatek.com>
> ---
> v2: Compared to version 1, version 2 has removed the definition of
> 'execute_in_non_atomic_context' and always uses a workqueue to execute 
> 'crng_set_ready'.
> 
>   Send out the patch again for further discussion.
> 
> [1]: https://patchwork.kernel.org/patch/13595066

Sorry, but this doesn't make sense in terms of how kernel development is
typically done:

1) Before you sent this, I told you there was no need for a v2.
2) The removal snippet at the bottom applies to your previous v1, not to
   upstream code.
3) The other snippet is taken verbatim from a patch that I posted.
4) That snippet is already upstream:
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e871abcda3b67d0820b4182ebe93435624e9c6a4

There is no further work to do on this. Thank you for reporting the bug
- very appreciated - and for discussing the fix. But now we have a fix.
So everything is all set and there's nothing else to do and everyone can
be happy.

Jason

