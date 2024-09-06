Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68D6CE7AB9
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud0cEW8M6x9iqd7bf2yGPbn3LbhTUr/1zKjDhyuq+jA=; b=PFzGcGULHhD+9H8BQwclyNH9lb
	ksmC2NJe98xpbKK3IiUYys7nKfWTdE2EWHUy4PVX+3JJaXO+58oYyIjLtF1h9ZlIaS62edFdk37Ny
	79Vmk5RdZuoGyM+Lv8ye8b2phVdsenjlT4KOWbueXEKgdV/pL51F9pizhbtpt1xqBoubMujNbOdD3
	wWXm3XD/NNBC5mIs69q8rQMjHHK/qYDgadLzqWkq+cYsVHzraiX6b1zMEz6TyOFiBlV347AwaxKLl
	MUndAbEuGx5zbh2wwMKtmuHsn0TUbpUhWY4PMS//ezYe1rrQDCuySwd/uNVBFmnW0LHX7R7/dF9Tn
	KFRaVyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smT6E-0000000B1kj-2xiq;
	Fri, 06 Sep 2024 07:09:42 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smSwk-0000000Ayuj-219Y;
	Fri, 06 Sep 2024 06:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ud0cEW8M6x9iqd7bf2yGPbn3LbhTUr/1zKjDhyuq+jA=; b=b/5GkZQVZ7JtLZDFGl8kPQI+cx
	P1pcUtKamiDzaPIXt4SHohWVNpdjIJLKxLwhwLGqOyxIrFRlX18tD8RyA0tLkkksobuA4rgvoyWx3
	jd6I4COwbCGnmQ/2EgkwdH2H40uVrjNVVU80EF93kxwTIBmUEdDa5Et7DNY41aE0LO5CDeBycEeIX
	cR2APfX4bFROw37LbWvr5oyf5UqbQwpb1q41zrPGfG3Y3LiVBDrMnwfdWF+6PAVRaJBt4OumfK+K+
	mav8xooEfQ+lzWEsqlbxm9H6I5z5MJg5amBZ14lrPX8cNWY0SX7cYbllQ/7HdA6LjAfrqNQx/46vf
	hNnhmtpA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1smSmW-000WNq-0I;
	Fri, 06 Sep 2024 14:59:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Sep 2024 14:59:33 +0800
Date: Fri, 6 Sep 2024 14:59:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: sean.wang@mediatek.com, olivia@selenic.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] hwrng: mtk - Use devm_pm_runtime_enable
Message-ID: <ZtqoVVpgqmVgCcc-@gondor.apana.org.au>
References: <20240826070415.12425-1-guoqing.jiang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826070415.12425-1-guoqing.jiang@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_235954_541689_299EEC29 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On Mon, Aug 26, 2024 at 03:04:15PM +0800, Guoqing Jiang wrote:
> Replace pm_runtime_enable with the devres-enabled version which
> can trigger pm_runtime_disable.
> 
> Otherwise, the below appears during reload driver.
> 
> mtk_rng 1020f000.rng: Unbalanced pm_runtime_enable!
> 
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
>  drivers/char/hw_random/mtk-rng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

