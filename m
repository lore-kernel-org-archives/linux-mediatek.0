Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111A2C982ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9OuFK8krYG5CFJQY5mJoDN0CmcjBiY8Df4psmo7f7k=; b=AHXEfKtT7AfQsAriFJBopQH1Me
	Mxjm/zubEwZEBIwcZFZFys93Pwk7rkLW58SJp3exF33SvIpImPMTS54+r428cRaRlIs3ffhXU5UVH
	tk2zog7wqcEHbPIG7VH02IwRO0jEZaUO3DtU8MlC36cWlH4ggtaTjz6acrmIAxYYT0y9dtNaMV6qv
	dySK4DLwYZrHTk46yIk1egF1QfOY4LhY6b/GuuSRhnLbwhgxLWa9Pwx1SAVmlmjGBpBBnB6qzyj22
	tipwgNeQT6yOJtSSBVWUgSggBsJ56jnSc0qnIyELGUR11vUrOGafHSpnV2WKCpAiqSkPqi0ZtPwko
	N089v9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fYl-00000002XLE-0Sot;
	Mon, 21 Sep 2026 15:03:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fYj-00000002XKR-1Wix;
	Mon, 21 Sep 2026 15:03:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F6D41881;
	Mon, 21 Sep 2026 15:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F431F000FF;
	Mon, 21 Sep 2026 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003036;
	bh=C9OuFK8krYG5CFJQY5mJoDN0CmcjBiY8Df4psmo7f7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HKPtgqXM8YdJsCLmf/4XWk866/vpIokpgYm5FBBZMXJiBdXigdiDCTg9BG39/L/vp
	 gNFovqk3NNKb2LSzzO6almiWMgLvY+0DPM5nY96vjw2kuVmK1C4aPqNmNqAc7JaeR3
	 BmSyW8ls6DDWGEdAi5GhWQ0h/pmTeVKMy5fWpxX/Oqxb1+UpK678Eqwjj0pATZpyl6
	 gJjrRboSyK6QdP4VLnOaeCuhNRpa0/zQ3M96RAeg56rvyP/U1shNwLfsYp4ZPd0w1i
	 b2a3P6iJBnYD/ggePc0FuzwuO/1/wYbvhM6k5qDRMoi7GbqjsxpDFN4C98xyjJAyoz
	 Nlnvjed8Q1QqA==
Date: Mon, 21 Sep 2026 17:03:53 +0200
From: krzk@kernel.org
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	Yonglong Wu <yonglong.wu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, Min Guo <min.guo@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
Message-ID: <arFHWJb9igZQPkeZ@quoll>
References: <20260921085119.308981-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921085119.308981-1-lgs201920130244@gmail.com>
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


On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> mtk_musb_probe() populates child platform devices using
> of_platform_populate(), but neither the probe error paths nor the
> driver remove path depopulate them.
> 
> If any initialization step after of_platform_populate() fails, the
> probe returns without unregistering the populated child devices.
> Likewise, the children remain registered when the driver is later
> unbound.
> 
> Use devm_of_platform_populate() so the populated child devices are
> automatically depopulated when probe fails or the driver is unbound.
> 
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
> 
> Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/usb/musb/mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem, how to document usage of LLM and how what you should not
do if this was posted in a good faith.

Best regards,
Krzysztof




