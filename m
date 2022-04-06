Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D08FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLXBH0P/b8kia3nP1+0QYtkuv9rICRLt/7bwkNtvcw8=; b=wCpFBcb36bB7+g
	mesIxcH+mZ9pOg/hz+zE+SF5kskScPbVFowCIMkXgSBdC9JJGDrjNGRXviM39SsChQbDseCoxRfvO
	I1muITaI8Udk145BiMRM8kh2heFUuvasmkzq2UIBem1m/Dt7yCouzFCmB686qs7rV3YM5P4Pb57AB
	EhskAKLVgA8orZAYipAgN/BtgosOPc1O2JEjKqkzVc/Qapdy5lVes3525RXZlgAWz5TESThPmd64c
	CMLr2Y6c0t54yovUeCroa5KRMIfsDi7etEI/1R+wD6LElP5iK8SPJOKfnYng3gplDjvsp4fWzVLb6
	UWK1GBVT0geUKYEMd9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3EJ-005Wwb-5a; Wed, 06 Apr 2022 10:49:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3Df-005WZY-AV; Wed, 06 Apr 2022 10:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hPowbiNe7fYtc4BFafJO2XKd5g9tq2vC8uyyOQwHWoc=; b=TjoSiodNcNiscq25YxQuweQOJc
 Uqjq25g1sWxAefZ6E5AoB1+sGcHocebedBlD4iWkcjLJm2jKs5ggdy4Af+zL6r5IVILdhGaWeKHSP
 S3B0hrfiSVKa4u/6NQzfO01WMCmbxkOe5HLbCE7HZ3pjCAeGH8aZEyFlipnSjNYKLyMtdaxco8uUb
 r1sn3DCEE4+1vEy9qBEm8X3cPlz2/+Pp1CUmaHFoMPgua1Bglpq41nPlRj6aGXTc5mdkxXZqdWZ/u
 L6eJA89v/sl3HTvcNz8nKghdwTQCm2dq/HOBH7ws4IavNPRILhi6U4IMh2q0VSLUXpd3Y/I8/kKd6
 KKy7jbUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59986 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc3DZ-0002Zi-9S; Wed, 06 Apr 2022 11:48:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc3DY-004hq1-9H; Wed, 06 Apr 2022 11:48:52 +0100
In-Reply-To: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
References: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Marek Beh__n <kabel@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 4/9] net: dsa: mt7530: drop use of
 phylink_helper_basex_speed()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc3DY-004hq1-9H@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 11:48:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_034859_428982_8AC894C6 
X-CRM114-Status: UNSURE (   9.17  )
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
index 60264836da49..868d1af646f7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2947,11 +2947,6 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
 
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
