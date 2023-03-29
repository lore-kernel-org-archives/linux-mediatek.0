Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8209C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jXKHUtknIYsW5onYdVNmhni/4ffvAb6VEdjSV93nTE=; b=nAGfx8MyepX5cclwDnUQOvfOHS
	pif1xSOg3NsHWgKdiTu32zl0xCg6REfbLwfc2gbs/PT3627Gu4tlg3SSdMZxzPavK2br3fz3BZXNU
	HghSzEEBEZzkxXaRmHl0mAUAd2ZyG4HX21UAwzF9rkIY1LmVEHLXlI4MLf9wb0R0QFedATjlOs5co
	cpGcSRiSoHNa+KFDwTC+v4XarECsgIqN+FLdDLWIFWhbO3SHZ58id2+bhNIBjlnmVINRURwAvY96H
	cZ0bng26XBGJ1W1BG2Ne78YRTctOUdc+pkV/rY06cYQJiNE+lwW/ONXeX4dL2AZiKNay/8M370ytC
	4cSvRXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYfG-0016AV-0T;
	Wed, 29 Mar 2023 16:28:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYfA-00168Z-1u;
	Wed, 29 Mar 2023 16:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+jXKHUtknIYsW5onYdVNmhni/4ffvAb6VEdjSV93nTE=; b=ozxBKntl/ns+qAe7u20tANVKv9
	YIlNEYw9i1spyxcvKMyhffdh1Ie71kiyuTFQlms0H0sUa6nlJXM1NFr3+kYxuLyKpJakw6wo4mcct
	d0GQEsZv9t5QstfXFsQxvX6f6km9k4dK+s+pp9sF2/Zs9af/2rD0YzkP0Xl9U8T0BXek=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYf8-008mVT-W7; Wed, 29 Mar 2023 18:28:38 +0200
Date: Wed, 29 Mar 2023 18:28:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next v3 06/15] net: dsa: mt7530: move
 p5_intf_modes() function to mt7530.c
Message-ID: <38703034-8977-495c-aadd-ea93d13395da@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <98fc2eec00985854010e3d0d16ba7f4c924ab49f.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98fc2eec00985854010e3d0d16ba7f4c924ab49f.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_092840_629737_78E9783B 
X-CRM114-Status: GOOD (  11.66  )
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

On Wed, Mar 29, 2023 at 04:58:35PM +0100, Daniel Golle wrote:
> In preparation of splitting mt7530.c into a driver for MDIO-connected
> as well as MDIO-accessed built-in switches on one hand and MMIO-accessed
> built-in switches move the p5_inft_modes() function from mt7530.h to
> mt7530.c. The function is only needed there and will trigger a compiler
> warning about a defined but unused function otherwise when including
> mt7530.h in the to-be-introduced bus-specific drivers.

The other way to avoid the warning is to mark it inline. The compiler
will not warn than. But this solution is also good.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

