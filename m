Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64046C3DA63
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcnE9O1HP/on4DXZ2YGJRZa8Na/4XLmBvUuuq71+hJw=; b=wVg0oEZOqt0zTZRiPP9gE8UyMi
	hciESl04yV3iG3DawY1piXI30HCd+MkUFJN+yxNufanVA45r1BoiJmYuZm1fWiw77wxgzbCeyyf22
	GFSVddzKau42G75qqS4HXd/3iLXjVkoEE4xE7TPbr3IcNHMp6t9+BeLtxC8CZssmzfUCqmbDHzX8g
	VHsK4VFCjYd/scyTLl/UMQPL+zEg0j20iZrH31nUa3fbxqWx4eG67IjZMSqIgGbRvH2Ue0k40Oegg
	rpD5pdb4smuKZ20wXyun2ctY/gpLjkPsXqtG2j48igjNYeZNG+fGmgphJ0px89s2DgbUcfvKP1rk0
	kz2hdIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWfz5-0000000G7LC-04WB;
	Wed, 24 Jul 2024 17:41:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWfyf-0000000G7FZ-3cAa;
	Wed, 24 Jul 2024 17:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0B0461251;
	Wed, 24 Jul 2024 17:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F26C32781;
	Wed, 24 Jul 2024 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721842836;
	bh=SOl/CnsBeml/c/uFV3EVy7ROsbF7eOEe3MGPrAA8AiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqUbpi6gNeWL/Lz7GUghvjd66vRZhZGhounFOZLOYDRsEHCjBpc7JiRrSrwPHUt9+
	 Gh5+Vkg9CXtRqozH5m5U3tz3aHpNjP6ZhsvJo0voIXqWO/R2BAXbqIkwVfcpeqCMPL
	 cFhgX33eZNkVi9IdTNekrGVc4XOb6/FoN8H8TRHvz/btOi6KjKe3/5dA1s0+lsemIJ
	 tnNVHb3ldFlDcfdLRIUhwHt2D8dur/ytsbk/TeDahOeXAL2DCT2EY28UiwUgGylg2B
	 LBxAtgEHGuLkyPa5u7awYaoYHf2iqJmE8yQh/7/eZTg6LrSzP7NvzISxlxSEuXh0wy
	 geWMa1w8W4FTw==
Date: Wed, 24 Jul 2024 18:40:31 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	leit@meta.com, Dan Carpenter <dan.carpenter@linaro.org>,
	"open list:MEDIATEK ETHERNET DRIVER" <netdev@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net] net: mediatek: Fix potential NULL pointer
 dereference in dummy net_device handling
Message-ID: <20240724174031.GF97837@kernel.org>
References: <20240724080524.2734499-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724080524.2734499-1-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_104037_961770_5B6C6CE0 
X-CRM114-Status: GOOD (  10.95  )
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

On Wed, Jul 24, 2024 at 01:05:23AM -0700, Breno Leitao wrote:
> Move the freeing of the dummy net_device from mtk_free_dev() to
> mtk_remove().
> 
> Previously, if alloc_netdev_dummy() failed in mtk_probe(),
> eth->dummy_dev would be NULL. The error path would then call
> mtk_free_dev(), which in turn called free_netdev() assuming dummy_dev
> was allocated (but it was not), potentially causing a NULL pointer
> dereference.
> 
> By moving free_netdev() to mtk_remove(), we ensure it's only called when
> mtk_probe() has succeeded and dummy_dev is fully allocated. This
> addresses a potential NULL pointer dereference detected by Smatch[1].
> 
> Fixes: b209bd6d0bff ("net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain/ [1]
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Simon Horman <horms@kernel.org>

...

