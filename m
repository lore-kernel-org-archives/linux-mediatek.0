Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29036C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y07lnTAv8aOj6O/ePabkFbWBmuQ3atrmSkvRtR8nZ1c=; b=Zw6rnEb98AuS3L
	dAUwDkIwqq2YTla/XaH8vRcCSjz59i3YIAQHN45TyuR2wRUaJp1CWq5kirh+xQ4Tco9LbViKKnvBq
	OU9XStfETWCeoP71Dh2mkpdbYGZT4sroo6ukC0RoECepW6s1dGUFfdlWBKVW6ifecvG7f6BGOTmtQ
	pVGvXpTIwGddLpfTTzKc9zMxDcuRrWcyoU8SKmmHzDYTOmnqOQUB5WgCUDhuoBfpbOBR0MBzlPQkZ
	p8pz1estC7ZvYQYK7HXa4wKSLPBPcfnRqWSTxcwF3KTS4FKVkvP0QdZKm3RxMfhDN5OzIpscMxDzn
	4C+ZUiv9/5EqXwP+ZhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uli-00HGPh-9g; Mon, 27 Dec 2021 18:30:46 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1ulf-00HGPK-DP; Mon, 27 Dec 2021 18:30:44 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n1ulb-0000EZ-Ch; Mon, 27 Dec 2021 19:30:39 +0100
Date: Mon, 27 Dec 2021 18:30:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 0/2] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YcoGSJEaQQFzEi4V@makrotopia.org>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_103043_482711_F188F239 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As it turned out some clean-up would be needed, first address return
value and type of mdio read and write functions in mtk_eth_soc.
Then add support to access Clause 45 phy registers.

Both commits are tested on the Bananapi BPi-R64 board having MediaTek
MT7531BE DSA gigE switch using clause 22 MDIO and Ubiquiti UniFi 6 LR
access point having Aquantia AQR112C PHY using clause 45 MDIO.

v5: fix wrong variable name in first patch covered by follow-up patch
v4: clean-up return values and types, split into two commits
v3: return -1 instead of 0xffff on error in _mtk_mdio_write
v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
    device id and register address. Unify read and write functions to
    have identical types and parameter names where possible as we are
    anyway already replacing both function bodies.


Daniel Golle (2):
  net: ethernet: mtk_eth_soc: fix return value of MDIO ops
  net: ethernet: mtk_eth_soc: implement Clause 45 MDIO access

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 72 ++++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 +
 2 files changed, 59 insertions(+), 16 deletions(-)

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
