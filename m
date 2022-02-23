Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F31C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrwFhciegrRmEWZtis+oZ0mK6Y/8dv1Kb0ATPJSA/w0=; b=4IWGpV3eC2W+UD
	0EFxmm0kAVTBGDm4MAsjVLBqKBeAmN68A9tFd5sc2zdC8SLkRcwIw9yvGj5GTYPaBWVFQrytSEtXf
	P3ywWJIrNers80ZCmjSVPkz5lfk2xN+8lj7w3DEjHYqB7N+9etClyZyK3LKgVdnL3vebymFudRtlP
	zvqe+gJ0s56CmYfx4dvO+so5AWsWLs0tz8zQPdblu4GwQB1bPhT3bQ4mJGz7taoOWxUx3Qz2iOrL5
	/cDQgc3j2Zn5DFYyQyjCnMfc/Y3456rczweGWBZxQYeWq5k3i+PM/F0MKhkzAOyKydW7oxt7wZiSA
	VV3y6IJYw33I0nBCuuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpzg-00DvaO-LO; Wed, 23 Feb 2022 11:39:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpus-00Dthd-H6; Wed, 23 Feb 2022 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=paCGtpP/ZhQMLZc3iDwxQIlZbZ7Zk52B/3okQ8tkR14=; b=VyGxTwta5zVbw5xS51TkUg68rl
 BV3QShvpiaUzoiS5mXZ80UtG9Uoog3k1B2LeXkv8CK21CZU0c4IaumhMnbP8SIGWfKZa62JNCupBq
 xBBIISkbpb6qewQWH2Z4ux+comdQ28NEVpaYHXjCyUmFlme7G4lErljTCi28qKzUuEw/YP3GB2kwZ
 +3vJZY/+aOVLMGn+nkAlu6OshvzXWvfEszSUvsJRT5bX0XtJ5IJal30P7Qs26wWt7VnzEiSdPHFbX
 JtHfBVWtgsjEjbhhc3SusvA8ZJiRVhPA9+xfa2GQOBCzGVdL0mxVCPBSmGYo1UFZIgbCZOvNJNXuX
 SKtJR4fg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57382 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nMpuo-0002k1-G2; Wed, 23 Feb 2022 11:34:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nMpun-00AJou-Sm; Wed, 23 Feb 2022 11:34:37 +0000
In-Reply-To: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next v2 05/10] net: dsa: mt7530: drop use of
 phylink_helper_basex_speed()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nMpun-00AJou-Sm@rmk-PC.armlinux.org.uk>
Date: Wed, 23 Feb 2022 11:34:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033442_681091_C62B66DC 
X-CRM114-Status: UNSURE (   9.00  )
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

Now that we have a better method to select SFP interface modes, we
no longer need to use phylink_helper_basex_speed() in a driver's
validation function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9579cd9aaa18..25c3c54f1380 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2942,11 +2942,6 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
 
 	linkmode_and(supported, supported, mask);
 	linkmode_and(state->advertising, state->advertising, mask);
-
-	/* We can only operate at 2500BaseX or 1000BaseX.  If requested
-	 * to advertise both, only report advertising at 2500BaseX.
-	 */
-	phylink_helper_basex_speed(state);
 }
 
 static int
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
