Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6B8E95A61
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Oct 2023 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMCeioDFaGxkYwSUQC9B7TV8zYuHj7khZ+w+X/o+eyI=; b=o+NTawcRo73Q0IwY3E4AswxNzm
	ycRjdfm4Y9VtI3p5HrKMUmllTuQWtBEzuAqFCxlMPt9+MymDYJ4Aqj/gfSqLkCMENVdAJ7zLZFV2J
	9aqcNMCEXk7Oe1tVqI+RTNmIS8DZXf2g8Sq7YQWvY1O6NboJPPcYAuhiPAqn4skK6jvNe72CLOnaQ
	7xKXMg0n6Sef6JQAlw3CqvOrpdVEm+W1xBzXc9cUqHvD3guxUEeFJzpDrPg9W4yVqPxsS0Fvpj77x
	bAjhbQsdlCgoPySdxZ9CAx5Cybs6arawtkSAkN/crKILG3tKy4D3Rdex6SiRkAgO1CKtzv4h2OqPC
	1KhCyU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp42k-007HI1-1Q;
	Sat, 07 Oct 2023 09:56:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp42g-007HHP-2u
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Oct 2023 09:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 07E43CE0B9D;
	Sat,  7 Oct 2023 09:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC631C433C8;
	Sat,  7 Oct 2023 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696672572;
	bh=cjSdvgy+F3bHC3Fhr8uA8IIadAj6KK16Go6VF12lU2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVCTmleuVvB22ihcWk3W/QbC/+xIuFctv++xzEOPVxIs9jR7W+lhvBfwcMXOGi5Iv
	 KOS66jaEybXkUmgxUtDOFGGNhZo2fO6t2nE2xstK+zepuG8MXM4jj5E8Fxb2HEg5hb
	 giXyywUTzTUIej41T42iTl3uBRcfmWz78lVtDP+k=
Date: Sat, 7 Oct 2023 11:56:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 5.10] drm/mediatek: Fix backport issue in
 mtk_drm_gem_prime_vmap()
Message-ID: <2023100700-cosponsor-risotto-2a0a@gregkh>
References: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_025615_121371_CC23263F 
X-CRM114-Status: GOOD (  13.13  )
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

On Fri, Sep 22, 2023 at 08:51:17AM -0700, Nathan Chancellor wrote:
> When building with clang:
> 
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c:255:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
>     255 |                 return -ENOMEM;
>         |                        ^~~~~~~
>   1 error generated.
> 
> GCC reports the same issue as a warning, rather than an error.
> 
> Prior to commit 7e542ff8b463 ("drm/mediatek: Use struct dma_buf_map in
> GEM vmap ops"), this function returned a pointer rather than an integer.
> This function is indirectly called in drm_gem_vmap(), which treats NULL
> as -ENOMEM through an error pointer. Return NULL in this block to
> resolve the warning but keep the same end result.
> 
> Fixes: 43f561e809aa ("drm/mediatek: Fix potential memory leak if vmap() fail")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This is a fix for a 5.10 backport, so it has no upstream relevance but
> I've still cc'd the relevant maintainers in case they have any comments
> or want to double check my work.

Now queued up, thanks.

greg k-h

