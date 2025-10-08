Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B525CCA472
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huLhdhXnoJSDQMG1/CHEsQNRS/mAokHjuzyGY9yE1ug=; b=PPy/BuSePWvLMiDVuKqjvsMHWF
	r+A6ImDncIS3d/A20mEbsD/8XS+7xLq3H/yDkJayXFsjulH8YllD0sU2M6dDldGghIbvVv/khs0JJ
	BNR/q2RyvyWCOBlwPHwJagEiLsPCrKdHsXHGRdQXRTr4LfHckT4UMzLhCMYy6y7OkxvcB34yPQLbQ
	/ZGBCof+F3yCyyDqi5htoR5Kcxc/IKd6dKgC52JTlM+f+cU41LiE4LSBWWgf36VOE/gHCiY/5bdkZ
	Jhzrq/wUsvYQiOHtYHt/OfaU+NjebOczXBDg+dPaJzDl9jjC0L/4IiyvymNRB/FPmaW8HmpbmyBzj
	iBSVwQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TQJ-00000003pjZ-34ir;
	Wed, 08 Oct 2025 12:37:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TQH-00000003pic-1PlL;
	Wed, 08 Oct 2025 12:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C67440BB3;
	Wed,  8 Oct 2025 12:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BA3C4CEF4;
	Wed,  8 Oct 2025 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759927056;
	bh=la5UGkrChP41nMA8ubVJ6aDpaA9vwENHhK+zqCfr9go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOI2jsR8CxcKyy6uc5misn1Qu/ayWTCBtndON+96E7TP5Ye+qvksJGxAzH30GzNb5
	 gdln0W0RWs/qqI87aKJTjGG4zyp16K0qA8D1fEcplk6IIhiX21x+lMgEaFCytYdcD7
	 XhSOSOuZ1BpmTzSTtT9IPYT23B20TvmxvnRE4TjUP8KO79kHkL5qKbTkX9Ov+z0DBF
	 05s1D2kDjbQ3JQOwGPgirQeJjVo5uVE0bfEtXhFpvsbj3KxnYWlcC9N738wl+vzd27
	 tc7DtgdJxbKXBAitmEyLtZ6nBaKC4llBvDUh3F/8TwvMbBE3vBGpJ+fdQeLeliUXjT
	 othLSO+snPIxA==
Date: Wed, 8 Oct 2025 13:37:31 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>,
	Daniel Pawlik <pawlik.dan@gmail.com>,
	Matteo Croce <teknoraver@meta.com>
Subject: Re: [PATCH net] net: mtk: wed: add dma mask limitation and GFP_DMA32
 for device with more than 4GB DRAM
Message-ID: <20251008123731.GR3060232@horms.kernel.org>
References: <20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_053737_396633_054147DE 
X-CRM114-Status: GOOD (  12.32  )
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

On Wed, Oct 08, 2025 at 12:48:05PM +0200, Lorenzo Bianconi wrote:
> From: Rex Lu <rex.lu@mediatek.com>
> 
> Limit tx/rx buffer address to 32-bit address space for board with more
> than 4GB DRAM.
> 

Hi Lorenzo, Rex, all,

As a fix for net a Fixes tag should probably go here.
> Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Tested-by: Matteo Croce <teknoraver@meta.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

> @@ -2426,6 +2426,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
>  	dev->version = hw->version;
>  	dev->hw->pcie_base = mtk_wed_get_pcie_base(dev);
>  
> +	ret = dma_set_mask_and_coherent(hw->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;

I think 'goto out' is needed here to avoid leaking hw_lock.

> +
>  	if (hw->eth->dma_dev == hw->eth->dev &&
>  	    of_dma_is_coherent(hw->eth->dev->of_node))
>  		mtk_eth_set_dma_device(hw->eth, hw->dev);
> 

-- 
pw-bot: changes-requested

