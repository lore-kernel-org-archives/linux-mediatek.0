Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF0C48291
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzUFuRWBpsRpw+Tqn+WXC0+sh1QrAqZGZXifR4ZcFvo=; b=mTwIsVwJGsK72fIb1TRf0sHl8U
	rBIQxQKlStCWonfux+s4tWMuRX3R7+7QN2wuN2I19AJvsLyBndw1UdfsN06fSSHScbUKbGYAYW2c8
	oIJKCUO7yXseCvg0/bVvW8DaiweVnPDW6P02oWIw05J8AikmNmoca9AtLnqKSGKpX9XQFGfx6oe3G
	ctLgacoqRBtSPRwKw3KNo4iEu0S3cfxzT0f1uDlIKQ/MA2+LPmkYp42s9PqS4098GFqjI2UR0saWB
	TsQImb35ZCsfnud4r5axWEaOKtnepqDlIzsX1/iLnUJkMbY5si4E7q+DUvNOs9SUFTMiLQ7v+HFuk
	GszwFOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpi0-0000000Auad-2xqB;
	Fri, 02 Feb 2024 09:19:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVphu-0000000AuWY-3ZQb;
	Fri, 02 Feb 2024 09:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C842623F2;
	Fri,  2 Feb 2024 09:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19BA5C43141;
	Fri,  2 Feb 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706865573;
	bh=xbOYQ6vgMY8Ad9HjvLOG9yt3xcYe8E0VH499yRcv+v0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JNTwGHPXph1fz5NcoNtbJiYcwjaWlRnjcKrrkAKxHjIWV0QPv5ZrcTP45MFBLvp3h
	 JCcGh+G7mSWIZuq4Po2NDT2+qvFaK51tesT1HkQMpQX8UCkoLKwafMkeb5vuKIGcdG
	 kttWDL8MvuvD6pl7muicRUZ6Lb9wcFV51fNLJyIgS+9HcYTXlbe06n2bNcXDXj1fkr
	 Pm0WGCw+skIDHFg4y6oUCohoUfZbyDHOtq7UmqJIAAoqNBMPvNjWdU9kia3nZZA72k
	 6o3roNZSaH7Ya393azKT1q9ce7jgiLz/LWQ5sPm7Vc2q6tzdv4KwDpok4SsPESjCN3
	 U4Ect4Dgs+MMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A41C48292;
	Fri,  2 Feb 2024 09:19:33 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 02 Feb 2024 12:19:13 +0300
Subject: [PATCH net-next v3 7/7] net: dsa: mt7530: do not clear
 config->supported_interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240202-for-netnext-mt7530-improvements-2-v3-7-63d5adae99ca@arinc9.com>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706865569; l=1237;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=O2Jc3kMGKF7p2IMR4BSUcjDORbDflRydvglEQ/7DqIY=;
 b=oz1Jb+hTkQBq+zHBfH5lPDglY2+5P/R0xXWcb/3ehsxh63f1fIu/v/CVfc5jNziMq+IR/xQEe
 TAGfppGixF8A3Xdq7Zr8sCu9n7Yz5Rgl2SRFrlH3BIAVgvJgGlv3qtv
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_011935_007175_0038D965 
X-CRM114-Status: GOOD (  10.40  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated. The
"config" pointer points to &dp->phylink_config, and "dp" is allocated by
dsa_port_touch() with kzalloc(), so all its fields are filled with zeroes.

There's no code that would change the bitmap beforehand. Remove it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 4ca7ba94788e..aed1ea6815ee 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2573,8 +2573,6 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
-	phy_interface_zero(config->supported_interfaces);
-
 	switch (port) {
 	/* Ports which are connected to switch PHYs. There is no MII pinout. */
 	case 0 ... 3:

-- 
2.40.1


