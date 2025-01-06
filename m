Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC87E77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lzBF/ZfPmOGT3qEEXdOPpNB7JC83GfpLdkUGGHF2us=; b=0qZpSEO6fAECn9mz5ZOfutqT6g
	GtB6zJ04pyTWNBVMeHsbaU3zkJggIHCgxihdGkgqxeqk2IEh6x4e8ZLTHqOURgZgtz/RWJFKQjj6g
	fXPxC8R5Hetb6CkemTInzntnrnucalE3y2NanqavncevqN1tjKb/Iv14AWS4x8Wts1PL9Nem2X5ft
	Bi9h7H3hZPCebbdJ3I1nUjMtVliwG5JqAlo2BbRARDhQR6ETsgkuJ2SnL1RN2PYFX974rYIaOIF8i
	3CGlD1rXR2avKrXjnwygxo55LosEDkj+jQVwnCtD0ZwovEoMQzAl/rbWty5l3UOJk6NhkcLmbhN63
	8RFzCKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlmc-000000017QK-3xiY;
	Mon, 06 Jan 2025 12:00:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUllR-0000000179W-2mZf;
	Mon, 06 Jan 2025 11:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7lzBF/ZfPmOGT3qEEXdOPpNB7JC83GfpLdkUGGHF2us=; b=Q76wFISMmElzVYjnPgxScXr2JI
	lH44fEbSFJdd6DQjtxq85z4XN3HKQKwc3nKVDxpn9fUUnkBTVPGM8vU6ZgSmglbnekhbq0K3R/8Qz
	h02WZobkklr6rhOWFheKLTS2LtEcBgFDS+Hdnb1D6bQPVR5fXDMlchDQsj/5gLSmYb2d/9Vx66PIi
	Kuy/cVaziM+yxtykBo6oiTmkk/XR0Otr71N9ny13dARnyBh67CSSn9k5mV6wXkxqBXvAF9p+e42BP
	j4xuVLRbikxSs/h3qvqi4jqrdYobwPKiCBwZYj4Y9s1/ZKb1UGrxuhmE/HhVoj6+elVLev0qsw7vt
	GVJSkBsA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53186 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUllD-0005l6-2Y;
	Mon, 06 Jan 2025 11:59:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUllA-007Uyx-4o; Mon, 06 Jan 2025 11:59:04 +0000
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 5/9] net: dsa: ksz: remove ksz_get_mac_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUllA-007Uyx-4o@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:59:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_035921_698602_59475F14 
X-CRM114-Status: UNSURE (   8.31  )
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

ksz_get_mac_eee() is no longer called by the core DSA code. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/microchip/ksz_common.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index 60a4630dd7ba..89f0796894af 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -3489,12 +3489,6 @@ static bool ksz_support_eee(struct dsa_switch *ds, int port)
 	return false;
 }
 
-static int ksz_get_mac_eee(struct dsa_switch *ds, int port,
-			   struct ethtool_keee *e)
-{
-	return 0;
-}
-
 static int ksz_set_mac_eee(struct dsa_switch *ds, int port,
 			   struct ethtool_keee *e)
 {
@@ -4664,7 +4658,6 @@ static const struct dsa_switch_ops ksz_switch_ops = {
 	.cls_flower_del		= ksz_cls_flower_del,
 	.port_setup_tc		= ksz_setup_tc,
 	.support_eee		= ksz_support_eee,
-	.get_mac_eee		= ksz_get_mac_eee,
 	.set_mac_eee		= ksz_set_mac_eee,
 	.port_get_default_prio	= ksz_port_get_default_prio,
 	.port_set_default_prio	= ksz_port_set_default_prio,
-- 
2.30.2


