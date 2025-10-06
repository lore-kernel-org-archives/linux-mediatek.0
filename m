Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D762CAC5B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Oct 2025 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrUG+CFDWdFhl2oO5Mb/bp0M33QnqWfcHQcX232OcnE=; b=wQHK4zptbkJJBxTGSEGVb3qCOt
	An+JxNSHvT6QsVyYNZFdTwDgU2PF5vlq5iI2Od5Fdi3I7X/r7B83/Dy7F5n5xbH8Svjm1Aw5LTvpz
	I8X8nsiyuRdauNwvXP8pKDWthUZMQnxlRMqMBlgGhwBfgSC1SaVveuutFqDYYaIYgCfbgmD6PAbwL
	TE0q1u3XYAulXvyys1D0i/DGI11LKVY0gfAO0YSPQxCTPMhToZtGYYcnleHSdW+II74vfle0vq0xP
	EXh/Rg6P8UCBOW2smJ2WsMkS9wA9MLhrVNd15JsFf01Cq0t/DKhYjq2saZvPrMKVn7wDyoOErlLfc
	rnBDFXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hqr-0000000HGxB-1aDo;
	Mon, 06 Oct 2025 09:49:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hqo-0000000HGwR-3Y8q;
	Mon, 06 Oct 2025 09:49:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6943C40A5C;
	Mon,  6 Oct 2025 09:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409EBC4CEF5;
	Mon,  6 Oct 2025 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759744189;
	bh=bQYO0VYtBtio80MmlSTfZwF05jmL0sNFgnqPZjKtqzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8NcdP3tmUHEJD/5oHfudOZ3+YWlX59Fzq+n2oTdWwrvPdSOEOpBO04z+2qMleb2t
	 mTSxMK6cFadRiZbhMGuRNRCanftfMrGqUS1EIO1lLxiDAFrzwCwHDxNA6EQqxHFk2H
	 u03XXCBG9JKSAG1S3iGxX+OTGY0jH/qcmQWU2Pow13z0tm/lyQWDe1Rh7gs9YNbZfD
	 x3R387n+1EwQwBU7OwpJQd0iQkaIjOplQsG0Rfd9D6cvKhFQopXDu6mdCCjju3+VAz
	 3qKpA/bwvjD7QpTj7cjlEK7lHHT4+IezQzZTzKDkFRq8QwDqAvHsJtP4a2wCxyhSWa
	 8kr+wc2WDemIw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v5hql-000000007Oc-0j5U;
	Mon, 06 Oct 2025 11:49:47 +0200
Date: Mon, 6 Oct 2025 11:49:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: Fix refcounting in mtk_drm_get_all_drm_priv
Message-ID: <aOOQu9Lu_3-EhtGd@hovoldconsulting.com>
References: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_024950_976908_5C2E0F6C 
X-CRM114-Status: GOOD (  13.76  )
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

On Fri, Oct 03, 2025 at 10:08:28AM +0200, Sjoerd Simons wrote:
> dev_get_drvdata simply returns the driver data part of drm_dev, which
> has its lifetime bound to the drm_dev.

No, that is not correct: the driver data goes away when the driver is
unbound, not when the device is freed.

> So only drop the reference in the
> error paths, on success they will get dropped later.

But there is indeed a partial fix for the device leak here which was
overlooked. Good catch.

> Cc: stable@vger.kernel.org
> Fixes: 9ba2556cef1df ("drm/mediatek: clean up driver data initialisation")

This is clearly not the commit that introduced the issue (even if I also
failed to notice the reference imbalance).

Since there is no need to keep the references, I've just sent a fix
which instead fixes this by dropping the previous partial fix:

	https://lore.kernel.org/r/20251006093937.27869-1-johan@kernel.org

Johan

