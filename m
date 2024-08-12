Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD91C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GPYDhtNoPuOHVVZvMyEMl2Bc+SLuWoXN2H/KOECbXg=; b=EjErNB+EKK2cQk8Ia4IEpljVcu
	EoSKngUXzDVr7nKu3DBAkMNXezdru2VsEclXk6r/pyS+oFj8i6s9554gaMb/N67ThZP/Pc+w9h/hc
	82SWu4zyXfN0rSqL9vJg5SgQkurlNcbcPLdI1dAcDXV5dEyRdl2RZxHVSeyHCKN9KwrvBsjPmzFvi
	f0y6RPgyRLvYm3O8XtgpJozfhvQEHYGjZBHJG+UlsKYLTFFQWPzyWAowQelN+kojsJ54e38ztQXHp
	mAoWELZ3dMJsLvxuNFwOBdwZisvITA022Bx0X+wTU+eEB4dQfeE4nm22QBJmmod5WR3g9/ZuWqnQK
	mvL3mkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUVi-00000000JzY-3f5s;
	Mon, 12 Aug 2024 12:50:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUV7-00000000Jtg-2AFd;
	Mon, 12 Aug 2024 12:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6302CE0E70;
	Mon, 12 Aug 2024 12:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DB6C32782;
	Mon, 12 Aug 2024 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723467014;
	bh=e1KaX42oZAJAJMbEl7Hl/Uf9FVrBnvs4EClAfrvP4mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWVEH93TW+5hMhHZgdD60lTMGr0rBnl7IiqNahYPGoT7V2NgWTbs0Fi/djoIJjfPn
	 hsOMBgYHPrMb20FsAhQr9i3CkvOHteVPylFgY417l4FPsrEIhrq/mlB9qFO4jY3+lY
	 2VjgdelpEJJ1SOyd6IEx/KLWFraVTYrAcEpPHcQvQ2vy3hHwhNqXba4Vm/8HSpamIa
	 tXVpWxkgtU51QOo5RCMLmEKyv5QGj53M92q+iktRHq6Qc5uJ9dXFHPTODFhj0jXSNc
	 B24M+WlAA2WCUy6njtFeIRz4y7h4IwgyYh0x/zjhB8Cd3nlgJoZ1DfO5wLsPq2U+DJ
	 csUH3h2g3fm2w==
Date: Mon, 12 Aug 2024 13:50:08 +0100
From: Simon Horman <horms@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <20240812125008.GB7679@kernel.org>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
 <20240812-ipv6_addr-helpers-v1-1-aab5d1f35c40@kernel.org>
 <827bbb8a-2d5b-44a4-81a2-258c7713ef59@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <827bbb8a-2d5b-44a4-81a2-258c7713ef59@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_055017_753438_89A7795A 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, Aug 12, 2024 at 02:37:36PM +0200, Andrew Lunn wrote:
> On Mon, Aug 12, 2024 at 01:11:55PM +0100, Simon Horman wrote:
> > Add helper to convert an ipv6 addr, expressed as an array
> > of words, from cpy to big-endian byte order.
> 
> Hi Simon
> 
> Is cpy supposed to be cpu?

Yes, sorry about that.

> 
> Otherwise, please add: Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
> 

