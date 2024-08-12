Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1CCC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1PU2E4EjujWFn2Z/iRFgAc3JYxyafoWRcQhlBSIDIo=; b=FJphmO0nqgE+u0xz/9vcw/Vv89
	ERbIKRN4I5O9MxDS1j0SgoxQLDesHyHpWLLpF+f2uipuDzsIHaRiPsl7SL8VcTEoss08UbhrlboGE
	RIpIS9ALZ4tP01rpWAbBJK3F97Fmnpmu1tId4oUU1dCNyzT205idGA9AKTgBLyxKM2FeOvu0IZ8v5
	yeMkNpVrXZuXUUnNVL0EDmWzAAhkAjWQRTCZgDDe5zLvd6a6OWpVfjVtfrEnupS+oY2o0u1Fd7uEL
	b7xdRFxPYoI9ozFcKf6wIgbgJSIRBIjjDcP/SLKwBCoCA/is4p3M1iGyVUwzll6+dGyQG/AehZq+2
	YdpjBQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdULv-00000000IxL-10wG;
	Mon, 12 Aug 2024 12:40:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdULJ-00000000Ioy-2Bs4;
	Mon, 12 Aug 2024 12:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h1PU2E4EjujWFn2Z/iRFgAc3JYxyafoWRcQhlBSIDIo=; b=gc86JsYQsoX85aWqDXT86zSpdj
	TeUG7rjLxOQl3/tlU33aRJYyqPo7JPoLp7PnRPIFCgYcQFLr3VG69m582y3LOAI5Ext2bmR1gOCUo
	i6dYcmCkx8/VFUPF02wzuD8KF5gUYi5Qi+/59SgPN0TKF+D4+xbO6QinaTGk4mUMD6bE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sdUKz-004Zmv-Lu; Mon, 12 Aug 2024 14:39:49 +0200
Date: Mon, 12 Aug 2024 14:39:49 +0200
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
Subject: Re: [PATCH net-next 3/3] net: hns3: Use
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
Message-ID: <cd5d4314-c75d-4647-8a12-3a15a90f5552@lunn.ch>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
 <20240812-ipv6_addr-helpers-v1-3-aab5d1f35c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812-ipv6_addr-helpers-v1-3-aab5d1f35c40@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_054009_584992_D7D5A3F8 
X-CRM114-Status: UNSURE (   8.61  )
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

On Mon, Aug 12, 2024 at 01:11:57PM +0100, Simon Horman wrote:
> Use new ipv6_addr_cpu_to_be32 and ipv6_addr_be32_to_cpu helper,
> and IPV6_ADDR_WORDS. This is arguably slightly nicer.
> 
> No functional change intended.
> Compile tested only.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

