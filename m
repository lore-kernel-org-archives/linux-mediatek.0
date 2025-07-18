Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33AC87FC7
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS1QQtIUTEAvC+pBZp0mR0WPc3bzPI0i+MxVydVaLek=; b=sbO0EsyTChQw2Y+eYOuWTGc71z
	2+2Vmuj1gGoDOzS5GGmSkPTValSvqx3XmH9BbuBeptEpEIBiFe7fmJEY83N2y/5OJyQvyjkQ4LC+Y
	a/8Mo9xFa/oL+Zou7q44BbN8ZcuE9+UuiU3pIwHCgo+OR/ZEtqUiylsRLIIcYmtfRL4HVXclNSwGj
	LSnFsVhmo9rDHS2TYeUpIGjqoYB7cpOGE8xVaYPzDH22nrxRZWR/+XrBH6kRm/rKIt31e4SMY8vGB
	oiGYD8V6IAfu+/OX7nQKOQMyB2eoKARRVIKttkCWaU0tlQXaQtHQJ91TF2Hlzrjpw7JnyCwOgjDB8
	wc72EWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFV-0000000CR7C-1mXZ;
	Fri, 18 Jul 2025 11:27:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucilW-0000000CMyg-0tGo;
	Fri, 18 Jul 2025 10:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vS1QQtIUTEAvC+pBZp0mR0WPc3bzPI0i+MxVydVaLek=; b=ltHBaCcsmciIIlFRZ8g5J3H6X8
	m5aIG0hGxSsAy7A6EUasdb9K2rB3SQweL9C7m4+jkgKhBaLVqXdhZiOIHGPZ8q7LfGYoea/gD180T
	dfBQh9Rtahcav+N7hTRMGMgbN9MglnbwGbQdsNeJ2phUwHnSwRJu9WHB8oP1CnzstcYvivIJOrpQa
	2zh1HL1o75Nlix1p1OvM2QEZooz/x5tLiVRB7+3pGSceMzt2frQLfYUY6fbIAkXK5J7vft+BTxDKy
	uwLlHrw+wdoFk1jEaugs4AbIjkcIcEL9nEMydJ5b64t1kCvKY6LzfZaovJmBY8RRstXgxY1qb+vSe
	/bDlQixg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uciVn-007yWM-1p;
	Fri, 18 Jul 2025 18:56:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Jul 2025 20:56:15 +1000
Date: Fri, 18 Jul 2025 20:56:15 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: sean.wang@mediatek.com, olivia@selenic.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] hwrng: mtk - handle devm_pm_runtime_enable errors
Message-ID: <aHooT8GLsVdupNO7@gondor.apana.org.au>
References: <20250629173141.2423728-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629173141.2423728-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035634_251205_14758DA0 
X-CRM114-Status: UNSURE (   9.88  )
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

On Sun, Jun 29, 2025 at 08:31:41PM +0300, Ovidiu Panait wrote:
> Although unlikely, devm_pm_runtime_enable() call might fail, so handle
> the return value.
> 
> Fixes: 78cb66caa6ab ("hwrng: mtk - Use devm_pm_runtime_enable")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/char/hw_random/mtk-rng.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

