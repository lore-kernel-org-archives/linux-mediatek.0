Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42376D21699
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KMHHH9wy1NkUhK8b6gjz467PXF6XivpVm4tvJmq5Ss=; b=xvv3wlSgkljEFA6Uwwl4CmIeID
	Thp93U1pWMRVv1/h0GEsZQftC3TK7I++DYDF7XOAm/DGy6qzZbRhfKOxxaXSFi0vIpCWnpSBB0u5R
	6FdUQ576v5c4h3IrMgt7pB2Y8NtdtE6uK5v+07J7MPi5Vr4Og3knGbusHj1ogbNHeHtz88t/dIg1n
	nbJ1AgsSi9IhfBpXmUf3Hfgq9HiK0pG23evfQ3vBTgP5Hvrf4Lr8WHPMKIh05x6CnVHCIB/1CRbLD
	pahQWwbLRoQw8K6+VcoNiVrr0GaxvSeRNyOLR76NxgEv2dgh8thYsijX0IldKMXkVzmPAyL33del7
	FcjxU5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0h6Q-00000008G2s-1DVH;
	Tue, 15 Oct 2024 12:56:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0h4Q-00000008Fj9-12B9;
	Tue, 15 Oct 2024 12:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9KMHHH9wy1NkUhK8b6gjz467PXF6XivpVm4tvJmq5Ss=; b=iVDHgLOSYJkK/J+OmYpLWRhUgs
	EKzrISJF7Kzsr3wd/12kzYPhhV/ia6n2/QPws/keUF4rlWitV0pZPjqJZNR6sufToFSO3EijPCA9z
	LvNLRPDl3njhHyg43KYW6Acc/Nv4btEeoJyESXaL0ehtOmz7uAadT4w7ZSK1j3ZPHIBc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t0h4B-00A228-RQ; Tue, 15 Oct 2024 14:54:23 +0200
Date: Tue, 15 Oct 2024 14:54:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 4/4] net: ethernet: mtk_eth_soc: optimize dma
 ring address/index calculation
Message-ID: <e67883e3-b278-4052-849c-8a9a8ef145f0@lunn.ch>
References: <20241015110940.63702-1-nbd@nbd.name>
 <20241015110940.63702-4-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015110940.63702-4-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_055438_305223_2B09187F 
X-CRM114-Status: UNSURE (   7.00  )
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

On Tue, Oct 15, 2024 at 01:09:38PM +0200, Felix Fietkau wrote:
> Since DMA descriptor sizes are all power of 2, we can avoid costly integer
> division in favor or simple shifts.

Could a BUILD_BUG_ON() be added to validate this?

Do you have some benchmark data for this series? It would be good to
add to a patch 0/4.

Thanks
	Andrew

