Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9026DC48260
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 05:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/uU7W/uTpzzuvfgVU4nRTK1vU25pcV789OeP+1QpRA=; b=5EZFhXPJQUd41OtVyZvMdgv47r
	NzP6TDr28N0LKPLyqMWIhltQaKGZoiWBLRXam1x/CJJ0n8Mo8+7H0+TuF+rrMCfvdfbYSgXu1bpov
	uwe4XvzEueuRi224xtkSO6/rJB09W5iJ8dV/csh0Fv/W3x7WyO4XblaFB5GFLKtHRk5i0yj9d0vX8
	q5eHiJ6/cQYf/wt6NoInkhtobV7eJ0McR38LzuwthFVie3aFRtCYg9vCOGbP+3EhYCKMzn8Zu2jG7
	s4wq9+aiNKE+aOB1BSaVKLdVXIMJRcEGv1/1gtfx6+FBKuI//BJhFB/SKUkQgIMhvfh1/ngsFN5uQ
	+yRkAYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxK8-0000000Chck-12FS;
	Thu, 08 Feb 2024 05:51:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxJw-0000000ChVG-3Chp;
	Thu, 08 Feb 2024 05:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E246CE1B89;
	Thu,  8 Feb 2024 05:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39B60C433A6;
	Thu,  8 Feb 2024 05:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707371493;
	bh=wUpyw43HcHACBQ/8AUAV0rAR4ahB+zKQE8l7LVuV9Hs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cBHOSC7yaVTnS02Cyl5GFht/49PLZEWbToeZA1f3LgwWor/PoTHEWZpefJoUgPiSk
	 OoVYW4ReJNmizZN4RebdXp2JRM48fdCnknKIGcyTQ2be0b9MdT1Y0u+AZ+dHi6bFKl
	 4jrTVL4gvxm0gsS8iEUYdhNAtZmeAKBGVJC+oBz/sXwK7j9eH9u4v2aLuXvECNcK36
	 j+8suBpSxPlC7mXSqT82PVkvb4xjxvTkcAxYBVB5Yyz0U+VRlOwj7cTofPbysKVf7w
	 8i4mN4/0/LVJ0od3RcxD7odaz6SmVU0IvVAmy1COIRIBQEy4UajiGHtIEMsADsyA+i
	 vjIf7GYUx/xvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E64C4829F;
	Thu,  8 Feb 2024 05:51:33 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Thu, 08 Feb 2024 08:51:31 +0300
Subject: [PATCH netnext 3/8] net: dsa: mt7530: do not use SW_PHY_RST to
 reset MT7531 switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240208-for-netnext-mt7530-improvements-3-v1-3-d7c1cfd502ca@arinc9.com>
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
In-Reply-To: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707371489; l=1298;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=ecurYkRWOTqqGU2AKHni4Fzup3XR61+gzZ3STlqM5Z4=;
 b=b9VDNMoY49Q3hQXGaelaQQGU9njla99nADPmBBsMFgG6+sLkgV6dTFLgcxR3xwicbe8v5YjB/
 QUbfKb63s/bAWQS4VVEgivcMh5LXkwLvTS/ghzQdKgOVOMBAzfkIBiJ
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_215137_515108_1F63B33C 
X-CRM114-Status: GOOD (  10.93  )
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

According to the document MT7531 Reference Manual for Development Board
v1.0, the SW_PHY_RST bit on the SYS_CTRL register doesn't exist for
MT7531. This is likely why forcing link down on all ports is necessary for
MT7531.

Therefore, do not set SW_PHY_RST on mt7531_setup().

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5cfd303b773f..296711fd5c43 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2451,14 +2451,12 @@ mt7531_setup(struct dsa_switch *ds)
 	val = mt7530_read(priv, MT7531_TOP_SIG_SR);
 	priv->p5_sgmii = !!(val & PAD_DUAL_SGMII_EN);
 
-	/* all MACs must be forced link-down before sw reset */
+	/* Force link down on all ports before internal reset */
 	for (i = 0; i < MT7530_NUM_PORTS; i++)
 		mt7530_write(priv, MT7530_PMCR_P(i), MT7531_FORCE_LNK);
 
 	/* Reset the switch through internal reset */
-	mt7530_write(priv, MT7530_SYS_CTRL,
-		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
-		     SYS_CTRL_REG_RST);
+	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_SW_RST | SYS_CTRL_REG_RST);
 
 	if (!priv->p5_sgmii) {
 		mt7531_pll_setup(priv);

-- 
2.40.1


