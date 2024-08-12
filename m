Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98212C52D7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBM1SwywOpZWx8RU2WnkombQyfzfLzy535rZo0wnA90=; b=pq+G691lNd7gMHI21R5TA5Obub
	HAlV2mrT4bIzoeEUi+Dv/uud+1y534apNQ92c5IcHw7/EFPYsuU6DOKFs85DwcTH0iQIFMHeIsaCn
	4Cq4TUKGX10k2WTsOSe8C4bg+MUy5CetUGzxqSA4bgk/yMgpnAGPb82tBbcT3Z0kwCL5XQ+UOQUM6
	F/XKRP30dMFHcJnwzSGgEPqt7DzOBQhMO4wvkhCBMc6Gy7GIJMET2OPUjj/DqiBqk0tWx6v/PzmZ5
	Vg+BKVSK5KVI+XpV6wcCfWZSqu/QwiELwKBcM6wVGIflBDthPXVZy97MMvLmAxE46xp1DI+oUCod1
	Q40Q7OpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUKm-00000000Igy-1KPg;
	Mon, 12 Aug 2024 12:39:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUKA-00000000IbF-3s5p;
	Mon, 12 Aug 2024 12:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lBM1SwywOpZWx8RU2WnkombQyfzfLzy535rZo0wnA90=; b=2pA8C6pAtLZuSP0g4aMaBIA5wz
	yGeAvXcPj8uBHUGfQAIGFgeHMFN5QMI2yFNJf/iAFMLJMsMmvYZYY3kuK/wXHwsVqPjG32By7F+NY
	9RVQooRVz+ME763yJ+8QGYW0YrZHGFzVA3Ztn58LSo4fmE38kIpGUDlTEilUe4Z34bHM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sdUJq-004Zlk-KH; Mon, 12 Aug 2024 14:38:38 +0200
Date: Mon, 12 Aug 2024 14:38:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/3] net: ethernet: mtk_eth_soc: Use
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
Message-ID: <ae28903f-d490-4925-9b4a-0b4945e3a1f5@lunn.ch>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
 <20240812-ipv6_addr-helpers-v1-2-aab5d1f35c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812-ipv6_addr-helpers-v1-2-aab5d1f35c40@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_053859_078627_B38C6FCA 
X-CRM114-Status: UNSURE (   8.77  )
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

On Mon, Aug 12, 2024 at 01:11:56PM +0100, Simon Horman wrote:
> Use ipv6_addr_cpu_to_be32 and ipv6_addr_be32_to_cpu helpers to convert
> address, rather than open coding the conversion.
> 
> No functional change intended.
> Compile tested only.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

