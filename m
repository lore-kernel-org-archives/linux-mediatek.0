Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38225C3DA63
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP9Q0gxDLP4kvOdzSqHu4jLBkTIETDjf8rYJB3V64qQ=; b=rPFM4f3w8UPhF1R7PbQoJhyEod
	TNc961egQmxcrfO7iHes5oGOFA2sL47eQrivHEVEz54kMhewgeTGmsZd+YY7fEdIrlk/3ecmCjR3C
	kg1jLPJ1DXqa4OWEJLQ6GwBBXCoJD1BVLuvpHt2JZfqDA6qFfnj7Spjf/d+FPtKIZ5nSxj4zkrAoD
	gwuSkwXX9+wNJRoNhSNCqkE2sjPzJGVawzEPTKOO0+7pokReSt1GpexoOnpskzv5CXHwMinH2mSlL
	L4VNaa/8Te+xrNXEr0Z0Lj/+C+OQTealLbGNvB8NwM9cnD5cMRbX/VREj6mGadfcOMelEJ/DxKoYe
	CL1vRm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWKMk-0000000DFYc-0gCY;
	Tue, 23 Jul 2024 18:36:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWKML-0000000DFUv-1dFp;
	Tue, 23 Jul 2024 18:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dP9Q0gxDLP4kvOdzSqHu4jLBkTIETDjf8rYJB3V64qQ=; b=u3qZNtTv/d2J7bsIQ3DZZpuQgx
	3CWzZzrWdGtnNZs3nav8CcEDj5dF6HHfP5UuynlfG60Sr1p0BaevwTiaKLmVrmYEsD3bZ0oG8TFLY
	4nwPo6tFIRLvbeESw/abfgzqbr/cZT0mgQlM6GeTXixZPp5UAsuaczlCKIgf7Hn4cLtk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sWKM0-0035EM-DW; Tue, 23 Jul 2024 20:35:16 +0200
Date: Tue, 23 Jul 2024 20:35:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: drop clocks unused by
 Ethernet driver
Message-ID: <125775a6-42f2-4294-9593-518ad6c852f7@lunn.ch>
References: <38559102c729a811dc8a85f6c7cee07228cffd3e.1721739769.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38559102c729a811dc8a85f6c7cee07228cffd3e.1721739769.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_113537_446020_4A0B0A94 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, Jul 23, 2024 at 02:04:02PM +0100, Daniel Golle wrote:
> Clocks for SerDes and PHY are going to be handled by standalone drivers
> for each of those hardware components. Drop them from the Ethernet driver.

Please could you explain in more details how this does not break
backwards compatibility. Should there also be a depends on, to ensure
the new driver is loaded? Will old DT blobs still work?

Thanks
	Andrew

