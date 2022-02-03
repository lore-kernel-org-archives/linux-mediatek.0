Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6486CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyc++yyjak529Pp+ZjaoG3AbOBmz+gVaRruEIpwuG5g=; b=RLBRdTVElE/Oqb
	Bv7d0iDJxTp4kndjE/Wrhm4Aqjz3fiI+SNT6awFyPgnX+hYdppENDMRGAYG79oF1hyYwMhIco79z0
	WuGk5P224ZBUk0vOtFyA1WD0XoRVY7+2yyTAfMgqHQRvHqxtX2lTJ62PkfS2o/L2bcwDMJhMVFlpk
	rKOTPA6A2YpSYuk7u2fHiOTXn9Nli7Susi5nJ1ekDlVVYFW0tecFAxrCH2tzxIya58b0Mxt+4CD+W
	U4SdSHn8fwe2TtMmhjHJ0yFpFV+m4ukEYB4D/9WDb1rt/z31aTw6dVrg4DzRTkBqMHCSjcwJuWJac
	A91xWGyzlGjy/eDvAoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFg2r-002GN5-S7; Thu, 03 Feb 2022 17:37:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFfxO-002E2c-NM; Thu, 03 Feb 2022 17:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LT0yR0PeUj3iS0pQ3EBNu1UcT2mKQB/wbY+eKASwNJk=; b=A0yJIJIhVxdH0g3AoJ54Z5XZFx
 iUWMv6wVmNVAaFWkmEZXNI/fa2EQCclfVlMierJD3r92+7ke63gFql2msvqAa38R4GBDRMLBiUANh
 h7dkEcfCvsuu7405HhmL6F6EdTXLM5J4PZlA1ssV36XG61sHo7KQyOEuxLdA3oAWgxG6Fxez3DTr5
 gHUnSnvmFYKk53UeOT20zX4oZiygc3ANZBh+PF2wL9w+yr0dhM8XQ25/+pA0mAxRczwBFHfKcY6KD
 VO9kWLMdsQMGo+HlhYGW3RcwA1soVi0SZtoiwVNvXkTu0cflXMzvwayTVFFuei5g7lr4TPbdGnpua
 3ayyz5BQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54888 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nFfxL-000303-1v; Thu, 03 Feb 2022 17:31:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nFfxK-006X72-Es; Thu, 03 Feb 2022 17:31:38 +0000
In-Reply-To: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
References: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 5/7] net: dsa: mt7530: RGMII can support
 1000base-X
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nFfxK-006X72-Es@rmk-PC.armlinux.org.uk>
Date: Thu, 03 Feb 2022 17:31:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_093142_805906_4933150B 
X-CRM114-Status: UNSURE (   9.22  )
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

When using an external PHY connected using RGMII to mt7531 port 5, the
PHY can be used to used support 1000baseX connections. Therefore, it
makes no sense to exclude this from the linkmodes permitted for mt7531
port 5, so allow 1000baseX.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index cbdf4a58e507..a2fa629cccc0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2523,9 +2523,6 @@ static void mt7531_sgmii_validate(struct mt7530_priv *priv, int port,
 	 */
 	switch (port) {
 	case 5:
-		if (mt7531_is_rgmii_port(priv, port))
-			break;
-		fallthrough;
 	case 6:
 		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
 			phylink_set(supported, 2500baseX_Full);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
