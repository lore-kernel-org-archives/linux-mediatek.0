Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB51C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tv7w9k3rJDca3dOOtjZ2EvSlxZ7hVk8CWdnmPXBROKU=; b=xeJgkIn6jBqNQX
	nNzbi9lIeb+68ot+gZb+XK0vHpaPoEr+6bRL/YemfyXP3UAxKhGCXtfeKNUFG2oPi2CTrUlTteTZF
	ssBdI537Kc631KE8JLbPeK37Gx4U5V/e6T98eSTljUyyc1sAKYqAmbJOISx2YlLsn0YDwHzCAUjmO
	z0+fDGytQzRljmKQidO6cZZWOBrNyR5KGKERv2aX8GKHbqK32X0DGFZRtYjNp6uf1QEsB6H7Prw2C
	KVCQkOCu4Xz58060SE2BSYtiieYQzyUs1eJJjFzefILskMvDBj5Ml5r9Xti7Lz6AAjjaOP80Exm74
	ncedIiuP0QeoVUjU7IXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL7X-002eUk-8T; Wed, 18 May 2022 14:57:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4w-002cvo-8Y; Wed, 18 May 2022 14:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjd4UTsJ/uBlXkLtNx3aIi/f0Ca/xdqp8DRiLJniQPM=; b=KOI+1FNZSFNDjYlvhd9E/Kw5v8
 zHMlwf3vr/aUgzJj+9I7Q8dPdgJHJrepzoGM99wzkgdnVXOOV4/m1DzO/idTZ/u1gjepNgQ1sH5Ey
 +7G2fWgDHmC2/HyUSV/yaB3b2gbLZf31gDQPOB8uv8wASX2PVZyZFSbUBT/5tlokfvrWjoiH4yfFd
 Zde8vDZZZWXXAXsbYhDO8F/PovOtM0QOebaq31UrVZw68NVCb533DO/9z4XHC35vFs2menwbToHvm
 paIXu8WygO4GkwBgQsemgWuKylf/sll/dKD7/EOwfizDWFLR0FpEPNRRixbU8gR7g9uN2QvVUvcCK
 rRiFkS+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38624 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4t-0002G1-N9; Wed, 18 May 2022 15:55:08 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4t-00AM5K-K5; Wed, 18 May 2022 15:55:07 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 08/12] net: mtk_eth_soc: add fixme comment for
 state->speed use
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4t-00AM5K-K5@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:55:07 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075510_359565_009850FC 
X-CRM114-Status: GOOD (  13.74  )
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

Add a fixme comment for the last remaining incorrect usage of
state->speed in the mac_config() method, which is strangely in a code
path which is only run when the PHY interface mode changes.

This means if we are in RGMII mode, changes in state->speed will not
cause the INTF_MODE, TRGMII_RCK_CTRL and TRGMII_TCK_CTRL registers to
be set according to the speed, nor will the TRGPLL clock be set to the
correct value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 87b5a837695f..211457a8831d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -327,6 +327,14 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 							      state->interface))
 					goto err_phy;
 			} else {
+				/* FIXME: this is incorrect. Not only does it
+				 * use state->speed (which is not guaranteed
+				 * to be correct) but it also makes use of it
+				 * in a code path that will only be reachable
+				 * when the PHY interface mode changes, not
+				 * when the speed changes. Consequently, RGMII
+				 * is probably broken.
+				 */
 				mtk_gmac0_rgmii_adjust(mac->hw,
 						       state->interface,
 						       state->speed);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
