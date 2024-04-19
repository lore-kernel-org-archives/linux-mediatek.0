Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25934C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHTewTyCDRmTJmANguJPLyc2R6SnvqULgTht4Lt9W+g=; b=dFNVc4qB3yw8D3K1YM2F1wacyr
	Nvaqr43XCA8H9UANKN7Fp6fxnCvwEgCtK5t6IqlpCBl7paOCWF6A/yGxnxjro/snrlZyDku/3O53N
	Tusv43jODWPBrIPxikI7M5p+sEOIO6v8g3HrFFCAbpssTmWe2lGOhn0hniaB2Z8tENXrP+MHt/0FH
	m4f+8lTafQ94YryKF6qLqoSMZg2YnJJq+lDlf81G+un6Gci8ABeYhRpfYZgTYsFzszLL/kn4IWr3a
	OX9zAQHYTz5R1nS/F9IF0X45Cir+5wXoJIheDHCf3KWjcfU88V7SjO+4tq7fIFgKmmhpN7hXCij8b
	9MDVOxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlDe-00000005FaP-18Kv;
	Fri, 19 Apr 2024 10:11:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlBj-00000005EJT-2QzX;
	Fri, 19 Apr 2024 10:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A40D9CE1A55;
	Fri, 19 Apr 2024 10:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 191B4C4AF13;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521378;
	bh=Opp1CZsglNYhlA4uuP5oQQWhKy/UVwr883h+FPxyU0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CHown39mLVAYE8GFHYlJ0cUkUvs8qd06BFw7NaSRSCVJhl+tKLueIXlyIt8X+bozV
	 9ps4ooVKnqZZ3leu3TWoTiyrQveOozY2H8RFSkkcHn9lhdSy5A1fvETCTnOetsFPKG
	 7dDsqXmNDww10VX++vkFF89ZM23AKkr7q44Ct6oe/+P9fNHbQC34Isg71+ntck/nht
	 6W9/ifPfgZSqyQOXy6hE5yXZfxGRyVNN4GHeanrnwY9gLZZtb4l1/jFPMrL/kMic8f
	 F+aYupzlV9G8xWK2DLVb4AhkBP0OWvY9DtwboEf+cKmdd8IasGL/ZZQh5axgPHJmLB
	 7diwgOzeFVBOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDB1C4345F;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 19 Apr 2024 13:09:33 +0300
Subject: [PATCH net-next 10/13] net: dsa: mt7530: get rid of function
 sanity check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-for-netnext-mt7530-improvements-4-v1-10-6d852ca79b1d@arinc9.com>
References: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
In-Reply-To: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713521374; l=960;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=HUYFdupAh6c43NX7egvGTzUNU8mBqV4dnjn+5D+OLfw=;
 b=MRcbQMKN8mdudDJJ1IvD98gm/l+nrwqQ5IH6uGhsuhwSTcrtnXunHkxCXRLKAZaHc+RGjVxXT
 Mt4GsJ13BrpB+JSqZQa7kY0Rpkm9zRSr7H6vubTCo4gbRVs/2gsdkUt
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_030948_213773_8438505B 
X-CRM114-Status: UNSURE (   8.43  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Get rid of checking whether functions are filled properly. priv->info which
is an mt753x_info structure is filled and checked for before this check.
It's unnecessary checking whether it's filled properly.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8a141f849673..842c2573dfe4 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3232,13 +3232,6 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	if (!priv->info)
 		return -EINVAL;
 
-	/* Sanity check if these required device operations are filled
-	 * properly.
-	 */
-	if (!priv->info->sw_setup || !priv->info->phy_read_c22 ||
-	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps)
-		return -EINVAL;
-
 	priv->id = priv->info->id;
 	priv->dev = dev;
 	priv->ds->priv = priv;

-- 
2.40.1



