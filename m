Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6ADFF886F
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PMEvjlLQCF+IhJSDR+OfV1rOuww5+zhdmbObo+aXic=; b=sOfH75OkeTDeh2GAM71dPKuWLt
	cnlNwDDgWTCk5s5T8GCVBhj4doNAoFNCxUMAaAd7rtjBhdwbEzWHWLLfu0Vwco4StKqp4CMG3eXzo
	rNK2kOzV8nScymlIyDnkXbCLtpweU3SiNdjzVd6ldBiRL1OOrbmKvowWHbzg5KzFVuY7Tf5F1INBu
	0SewQUivyX3A7wQ9ZcWNZoUuf5XTQQwtg7RE8vzBbEAsCCTyHMZz5OTN9ZmhmMFyVX/TVdYbhtPwh
	cPGEVUSWE4KQ+F8YWI4aGNpqYkuSX+642lx9fy/sVbmGimlN0kDao6jOlFj1bQli6aFt0IkmGXymm
	gFADWAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJse8-0000000DC5y-0nQO;
	Mon, 04 May 2026 12:43:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJse0-0000000DC1i-3r5V;
	Mon, 04 May 2026 12:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1PMEvjlLQCF+IhJSDR+OfV1rOuww5+zhdmbObo+aXic=; b=MWni85lCQoXDMVP6bhjc2GczaN
	d2l5A5HEaNUgy12XQ4iQZtIe76OLfLdlkr+3UkGGsN91//fZs9i34a7a6W2d0B4l5DUg4Jj0gzZuE
	E8fkLl9+/Q/NH8aebCYfcaS4GPk+jTY4AS0wwKnvqR+S4pMzK5PXQlXYyPzY2UVvNpjA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wJsdl-001GDe-KX; Mon, 04 May 2026 14:43:13 +0200
Date: Mon, 4 May 2026 14:43:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next] net: mtk_star_emac: use of_get_ethdev_address
Message-ID: <64c2b026-88b1-4560-8763-9f6696d854a5@lunn.ch>
References: <20260504031019.607682-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504031019.607682-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_054329_005469_9E564B48 
X-CRM114-Status: GOOD (  10.04  )
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

On Sun, May 03, 2026 at 08:10:19PM -0700, Rosen Penev wrote:
> The platform_ variant calls arch_get_platform_mac_address which is only
> implemented under SPARC.

platform_get_ethdev_address() calls eth_platform_get_mac_address().

int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
{
	unsigned char *addr;
	int ret;

	ret = of_get_mac_address(dev->of_node, mac_addr);
	if (!ret)
		return 0;

	addr = arch_get_platform_mac_address();
	if (!addr)
		return -ENODEV;

	ether_addr_copy(mac_addr, addr);

	return 0;
}
 
> Switch to the of variant as of functions are used in the surrounding
> code and to get EPROBE_DEFER support in order to handle NVMEM MAC
> address specifications.

So there is a call to of_get_mac_address(). And it calls
arch_get_platform_mac_address() as well. If you only call
of_get_mac_address(), don't you break SPARC?

If EPROBE_DEFER is what you are trying to get, please change
eth_platform_get_mac_address() to actually return it, not break SPARC.

    Andrew

---
pw-bot: cr

