Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYi/ShqKkr9PU+fcoBU0gbY7kOl6rUoq/uyKVymxE+4=; b=xKb6qi2gpw/VsR
	/5tr/FYI8MJEcAzzkS2hIhNg3/RzMXD7mn9WfE6pnwrguJFkOgg/pZ5j6RX7sJrIEcuY2yvRkJjh4
	0pAzFpnE3+sGwD4Z1LBoRc90UlgvOq1EOET0PVGLkcC7G9W4Tnylu/VH57hDxE69rSeP/+rrFrjDl
	szgrI9354HfI/OnzMORBM/k/1M0EvEz+ApBgZu+Z+pNc4l4JjEADAyBFmQIaWKYzn1H8Sgm2B4PzG
	qZtI9secywlX4KbnoCsxSlefe8/a1NcJu5CmqGL4RvO/d7U+QLHKjxRiMFanwkBXhjXI9FvNYsMOH
	67XR1cUMXDFXuBGyMgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1u9s-00HAtc-2G; Mon, 27 Dec 2021 17:51:40 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1u9p-00HAsj-Nb; Mon, 27 Dec 2021 17:51:38 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n1u9k-000090-K8; Mon, 27 Dec 2021 18:51:32 +0100
Date: Mon, 27 Dec 2021 17:51:25 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 0/2] net: mtk_soc_eth: implement Clause 45 MDIO access
Message-ID: <Ycn9HftuXiyLoWyy@makrotopia.org>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_095137_789544_A24ED157 
X-CRM114-Status: UNSURE (   8.73  )
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

v4: clean-up return values and types, split into two commits
v3: return -1 instead of 0xffff on error in _mtk_mdio_write
v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
    device id and register address. Unify read and write functions to
    have identical types and parameter names where possible as we are
    anyway already replacing both function bodies.

Daniel Golle (2):
  net: mtk_eth_soc: fix return value of MDIO operations
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
