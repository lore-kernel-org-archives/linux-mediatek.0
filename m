Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E939BC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlyCx97Vj5xKVHsPK8EMQ/utmeFGM8vhocj6gX7aGmg=; b=d0JTHMyVtsRu9p7lY8XsQMTjlb
	Zsq2YjJabj89iDALe+eYyiDkO16l73rJ4Nlz1Sn06D2aA21R7d2mOWJsyj6NTR3S92+y2510W8kxv
	S5mS8LpEgdxWGdod6VAMlwRcKoRRqFqcJz5kPBtZxWw1RSRVzu4N10+rAoC6BL8P9J4tG3WVr8g9/
	zWlPeY7vPnjsT/ZaiHn5B0ZpGGLcdF5OCP8utmHKE/FWqqhV/6AEgDwEhM/5DGF2YK6Nayy/R1grf
	riGGp/+FiV1e9ax7JOPah8u9VosYJ+zcUWwmUSZyc0kCUaRGAlJIDs0VsjbB/LHXumKq8fWEsOtiA
	ifJdlCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUJr-00000000IXn-1syk;
	Mon, 12 Aug 2024 12:38:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUJF-00000000ITg-3kJE;
	Mon, 12 Aug 2024 12:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MlyCx97Vj5xKVHsPK8EMQ/utmeFGM8vhocj6gX7aGmg=; b=XechQ9MoG36ki92DOiEHmm2J6i
	PXYlL/7crx2dgDAhR7MMIRwEvvCq2+QzUH0rXL19L9UiUzFc/iaVipyStlVVwhicpgJTZAw5h5mUa
	JB+1vvoiQ33V78qQkQwz5M8suny87XZZlVcKrj5ogzenWSsaqOr+K9tcnfz+fa9gcC1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sdUIq-004Zkw-4k; Mon, 12 Aug 2024 14:37:36 +0200
Date: Mon, 12 Aug 2024 14:37:36 +0200
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
Subject: Re: [PATCH net-next 1/3] ipv6: Add
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
Message-ID: <827bbb8a-2d5b-44a4-81a2-258c7713ef59@lunn.ch>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
 <20240812-ipv6_addr-helpers-v1-1-aab5d1f35c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812-ipv6_addr-helpers-v1-1-aab5d1f35c40@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_053801_950504_29E014A0 
X-CRM114-Status: UNSURE (   8.28  )
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

On Mon, Aug 12, 2024 at 01:11:55PM +0100, Simon Horman wrote:
> Add helper to convert an ipv6 addr, expressed as an array
> of words, from cpy to big-endian byte order.

Hi Simon

Is cpy supposed to be cpu?

Otherwise, please add: Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

