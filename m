Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBAFCCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvznwVrYPPlUMDYDoT/wrp26Ln8GYa15qKpmk6/PNaI=; b=umuBE0P2WcNTmawtgwwxkGdLSp
	Q1ZY/QAwH+Kx8V+F9bQm8hjBaoBC0BOB2ffeQVrOifSqbirz19J065IPSf2v7y0QLzQZ+bJRdON26
	AX7ZH4/sHGZ/eYdETebxLeHsMOHfMbBRsa+eaxqjaMy6sDa24+zRRi63Ow2lZNHsC1UjoByfso29q
	/dtTo7Py+X1+mgQkBpG4Xj0a96L/ScaA0AQVE/4RWusEb7EVV0Aw99SmsPyG52GkJfv2irnhnAUBJ
	GdvkDKEtK0oEvAovjwfK16t0ErlTjsTqz/CmUFYGXsrbu8lkhdvfNkfxUF10N0lhgADQTIE/xPkin
	pD7NXBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDImz-0000000DMPi-11MY;
	Mon, 27 Oct 2025 08:41:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDImw-0000000DMP1-3EA1
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 08:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FA54185D;
	Mon, 27 Oct 2025 08:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEC6C4CEF1;
	Mon, 27 Oct 2025 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761554473;
	bh=p7L1ppdjpTPK5vdV3Mi+mMZfy8PqxfrJ0ZCIY6BoM3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rufVP4OSJtQ3/mqTsI9HPHrUO+OB+vlQGbAQqIDt1z1/AZr7oI74LCqffPdj8vLew
	 JW1i1LFS8BrXSqZRhEm8DGIdLLQVtvMjlTR4+W3Nd5kmSFHSa0+5cnJLiMCDqe1zZi
	 BZNURd+k0QiE1zTDpsPp4znfOXhDST9Y3ZAdAzHCG4QUeEz2dKvoj2FRR+7KtARw0K
	 x93tfow3vIZdl4w3bnKt+Aq0n8eljgp5LLbcx8nSChwFpPFXxJxXmmuBeEl5qZ6Ewt
	 QStYGjeV2llAJvn5SGcXYs1zeEWXAMkH7z30MF1MUyoV1y4kbm/N2jrDV4GJAx84ZL
	 F0pZYbv/EemuQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDImy-000000000Gc-2Ow9;
	Mon, 27 Oct 2025 09:41:16 +0100
Date: Mon, 27 Oct 2025 09:41:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>, Ma Ke <make24@iscas.ac.cn>,
	Sjoerd Simons <sjoerd@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
Message-ID: <aP8wLMrFTsJI-Lr3@hovoldconsulting.com>
References: <20251006093937.27869-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014114_829477_7DEA126E 
X-CRM114-Status: GOOD (  15.35  )
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

Hi Chun-Kuang,

On Mon, Oct 06, 2025 at 11:39:37AM +0200, Johan Hovold wrote:
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
> 
> This results in a reference imbalance on component bind() failures and
> on unbind() which could lead to a user-after-free.
> 
> Make sure to only drop the references after retrieving the driver data
> by effectively reverting the previous partial fix.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

This patch fixes a regression in 6.17-rc4 that apparently breaks boot
for some users. To make things worse, the offending commit was also
backported to the stable trees.

You need to get this one into mainline as soon as possible, that is,
this week and into 6.18-rc4.

Johan

