Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53197C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QE951D5l0qilZ1o07jWbnkqCMRoquuXb8OIu85XME+o=; b=FANnT+wLL8HIYMP03uMOaG1O4G
	6AfQEwn/kOFAI+tRX3Do2ngqPQ1eoDl+/wSJermPmcVKRILyqlztdlKVbT50A92cZPbQP8LQKWe4o
	dcr0gYNd3IVDO0nLqWOFgSzathw/11DvPPMaPXbLWTuimTGxxe9kM3hkMOaRVzBpV78o2D6o6uFY+
	+2VCGaBRJgXj/syppLGVTXAy2HrloV/z7fFNYmQHDSODH1aAp+AiU7KcSwAWbqP0J+HHYFjLH78V0
	Og+GHXOCx14PyZ29ovhOknCkdMRXnIQyZV5p+mgxjkc9nrWIk/V8qdtF8hUhF4I86M7y2irXTgso8
	1GlNWzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NnG-00000002BM4-1mcf;
	Mon, 29 Apr 2024 09:59:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NnC-00000002BL5-3JHe;
	Mon, 29 Apr 2024 09:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QE951D5l0qilZ1o07jWbnkqCMRoquuXb8OIu85XME+o=; b=p5EYPf74YgHv7kaeBx9L4VBEF+
	U2XaPUgsI9DOvLi94YdpzE0PrgDBkECABKoxA5Me/SCplKBpJ6C9B5vznmACi4V5DbWG14ny4IoCa
	nrZs9qPBV004sFNc4N5TjhtGghTiIlrOLevPRWVpKxdg3bpmmtKMxxb30ba/Yxngda0V9OEQh+CoT
	i6mKk8in0zO/IrMBo9sFkRwpyg+2QPcPwXt+q8ZHd41ee8eFR7lyDSFFGRUz68m7OVJDnfLXmv6VY
	/x6m257IwvUwIgdKIcuaf77m07ujtdz3F2UUhvn73lRL5tvS6eXJKDxihnAYJcutNA05ctShVOnie
	e6ZMjGOA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38050)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s1Nmn-0002wf-2K;
	Mon, 29 Apr 2024 10:59:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s1Nmi-0000kp-VR; Mon, 29 Apr 2024 10:58:57 +0100
Date: Mon, 29 Apr 2024 10:58:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: detect PHY muxing when PHY is
 defined on switch MDIO bus
Message-ID: <Zi9vYLwgekd0Pmzn@shell.armlinux.org.uk>
References: <20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v1-1-1f775983e155@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v1-1-1f775983e155@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_025926_856146_EDBD93AF 
X-CRM114-Status: GOOD (  23.60  )
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

On Mon, Apr 29, 2024 at 12:46:43PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
> direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
> bus the switch listens on. The PHY muxing feature makes use of this.
> 
> This is problematic as the PHY may be probed before the switch is
> initialised, in which case attaching the PHY will fail.
> 
> Since commit 91374ba537bd ("net: dsa: mt7530: support OF-based registration
> of switch MDIO bus"), we can describe the switch PHYs on the MDIO bus of
> the switch on the device tree. Extend the check to detect PHY muxing when
> the PHY is defined on the MDIO bus of the switch on the device tree.
> 
> When the PHY is described this way, the switch will be initialised first,
> then the switch MDIO bus will be registered. Only after these steps, the
> PHY will be probed.

Looking at the commit description and the patch, I'm not sure whether
you really mean "probed" or whether you mean "attached".

PHY drivers will bind to PHY devices when they are detected on the MDIO
bus (either by scanning or instantiating firmware description) and the
devices are registered. As each device is registered, the drivers for
the bus type are scanned and any matches will have their probe function
called. This happens outside of any control of the DSA driver if the
DSA device is on the same MDIO bus.

This is separate from the process of looking up a PHY and attaching the
PHY.

So, I think there is probably a terminology issue with the patch
description. I suspect you don't mean "probing" as in phy_probe() being
called. Looking at the code, it looks like the driver is making
decisions based on how PHYs are connected to the ethernet MACs in the
device tree, and you're making decisions based on that. I wouldn't call
that "probing" a PHY.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

