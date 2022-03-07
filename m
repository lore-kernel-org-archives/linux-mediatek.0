Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A000C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IKoN/OrbWb/UyojLHTG4IvQjRE27flan1+6wBR3swUc=; b=eI6y6Fjrb+r4Xy
	xQ17yfu/HTFadIWMFIDGJrdQLjOl8TsOKHMwTwsGw4xcJXYe07JesXQqixLaSzzlaJZuubFu5JtSF
	9MmREI/fb22nKzYozj1dU14l1mWyNVvjXefxozkPFtH+Jp3933H5mzN1hnLv5UlfQklnuLPPkJhdf
	SpqTT4zWKhE1dKRIoVMOMWRqlpM3CXNI+AgEeEtwHXSRIqqsIGSk1pev868yu4qpS3tBl4COCn17M
	W3e5YvrDncYUPZPiCg+FmZSrIgltZStAfNWdfst3rxGU99w7F2SHKJP8UTISKdZJPq5+jUpzjf3Lp
	y8aKtCN6/kI7++BcT8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCMD-00HXSX-Oc; Mon, 07 Mar 2022 12:20:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCHB-00HUkz-U8; Mon, 07 Mar 2022 12:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jH5AYjse+WxNHZmr7RG3+47WmqMY6ScJQoNgOCRWKRc=; b=apx16hHc60W9kgrugYuwOMejnD
 ZyielHE2YocPyBHLjDvyoYdPr+bUUjA+Zr1vEjp8ZlZOIq/5r84GQL2U238HN69+H+fU1qYRe197d
 R3qKgYDIzoSp/jcrow0XKS/9tv3SS0DvDGClu4fgJipR7r6OKH+pdigYKuFomIgIrAXScTGEkmAgr
 /Ydux0eS/1AOMVjJ2GLny39tvjFIfQ4lhQsolLwH/Bwl9MULJywEbXKmB5zmDdMkMQI0b4hsPgKrp
 iJN+SjdmPUSuBzq5SyzXbst5Ml2/FOrensayrTAn4ib4U0y/CMwPsNs0UT4YOEUf5Rbh/XtjLr7/V
 xgT5Rhtw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49276 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nRCF0-0007IU-QW; Mon, 07 Mar 2022 12:13:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nRCF0-00CiXD-7q; Mon, 07 Mar 2022 12:13:30 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: dsa: mt7530: fix incorrect test in
 mt753x_phylink_validate()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nRCF0-00CiXD-7q@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Mar 2022 12:13:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_041546_041357_A63DF366 
X-CRM114-Status: GOOD (  11.15  )
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

Discussing one of the tests in mt753x_phylink_validate() with Landen
Chao confirms that the "||" should be "&&". Fix this.

Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
As the mt7530 maintainers are not very responsive to my recent two patch
series, but Landen Chao did state that this should be "&&" not "||", lets
at least get this patch merged.

 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index ff3c267d0f26..a251bc55727f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2936,7 +2936,7 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
 
 	phylink_set_port_modes(mask);
 
-	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
+	if (state->interface != PHY_INTERFACE_MODE_TRGMII &&
 	    !phy_interface_mode_is_8023z(state->interface)) {
 		phylink_set(mask, 10baseT_Half);
 		phylink_set(mask, 10baseT_Full);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
