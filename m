Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84524606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07sZED2m;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=YQe4qWxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IpqQrUdn2qhnA27eiGBsYUdjhzGI02RMEz6Jntjyjrc=; b=07sZED2mdnRgbGQTx0u0rkhWFw
	vu5KlbODAHkWXAUgR0cPBGEBl3gDggcnfp0mJhDmBiW6UJHU8WROZixzAMa7oeyZQsOF5qpsF/JrD
	2dDK/1ryVfuFykmTwuKKr6lLBktNglot1OIjiJjVBKytYmF0JCxdXkd0zgvvy3lUnC2RouFLCpBbG
	OtVBX48nhD5MXyxN0kpu3suaGhYqIAYtefbm+StfqPY0AFBGSN0IU9W8HOQorqbMpRf2UgopYahMx
	ibakp6bLsmyThQJUqCVHIlUC63aWN2kdTyRqE7OJSTRAhDVrZ8PJZSL2uNYamDiBLjS1WdWa+5Qxc
	Ne9gY6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRXu-00000009RFK-3P9G;
	Thu, 12 Nov 2026 09:56:42 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRXo-00000009RDo-02xK;
	Thu, 12 Nov 2026 09:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=IpqQrUdn2qhnA27eiGBsYUdjhzGI02RMEz6Jntjyjrc=; 
	b=YQe4qWxqafQyT5s2mrhI9FkGvC9ALxbW9K/peJznX1m4IeldruA4zURGUyjmyq+5UAYpHlvAGKY
	P0/RZ2dFC7osNv35ilTV62HI4IUqO+EwY4nM2z8Ao257hcVj/aTwnfMGzHdfl1TVtVikpIfruT3lh
	qaE1bJvRwM3LxFMj4EHkxq+HS6DQlfSNi6PwQnwRqZIOk+Y/zPicHylz2X1I+g53hkJMEEQ953+L2
	d9HuykWev4RXZv5ugzjU/mQwe5y+yBzOTWR6Y3jAu+O3I85lLydBFqDnjDuT94Y6UrZ2xHUbeDk6G
	kntRNh2FxvGMdeSz+Vn6onTULk3OiCLoQGxA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xRRXd-0000000EDgD-27ii;
	Thu, 12 Nov 2026 17:56:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 12 Nov 2026 17:56:25 +0800
Date: Thu, 12 Nov 2026 17:56:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] hwrng: mtk - wait long enough for the next word
Message-ID: <avWNSXABarLk0roZ@gondor.apana.org.au>
References: <20261026-rbrue-sheldon-upstreaming-mtk-rng-timeout-v1-1-551b4b6b4f86@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mtk-rng-timeout-v1-1-551b4b6b4f86@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_015636_795495_90441DE2 
X-CRM114-Status: GOOD (  14.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 01:47:05PM -0500, Ryan Brue wrote:
> mtk_rng_wait_ready() gives the generator 60 us to produce the next
> 32-bit word. On MT8695 it takes longer: timed over 1421 waits, the
> median was 82 us, the 99th percentile 92 us and the longest 225 us. So
> most waits time out. A read that fails on its first word returns -EIO,
> which a read from /dev/hwrng after a short idle period does more often
> than not, and longer reads come back short.
> 
> Raise the timeout to 1 ms. Generators that are faster still return as
> soon as the word is ready. On MT8695, 20 reads after idle periods all
> succeeded, and a 256 KiB read returned in full at the same 63 KB/s.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Found while bringing up mainline on the Amazon Fire TV Stick (3rd
> generation, MT8695), whose RNG uses the mediatek,mt7623-rng compatible.
> The board's devicetree is not upstream yet. The timings were taken with
> a temporary print in mtk_rng_wait_ready().
> ---
>  drivers/char/hw_random/mtk-rng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

