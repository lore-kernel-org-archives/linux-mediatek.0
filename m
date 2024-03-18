Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A66BC54E6A
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsfrv0JdZeEvAyrMCsSbQxOYTlXETIXfo7HJO1itT2Y=; b=4IeZdDsEn8xCIzN/T36/nNjCMb
	x0GU5knQ7z23RAhoVIHYRTakCEfAPk/gv8EuxVjSdbswDnVUo1ynpVPs3XSKrvNvT8S0zEK7G5C+X
	KDkgoWQcmxfIuxeZVS7M/0PAxHIBi/nkfTqR84meJhaEKvfUTqDFKPAs6f2gaNKfuALep1mja80gf
	mFoKHgnmxCOJBZeIsln/jqp6AQHNHWWNrAuZQqLleIqc6rA6vDBU+j24wGkikcplHhGMd19IqTiuv
	le8QhjLIka3/zcbvsI84wODcPQWzu4BFxHnAlfKFZOTiyxQljszvJ+eeGJ5Zskz/LMu/ulpYB2w9Q
	8moS1ALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7iH-00000007eKl-0Zrp;
	Mon, 18 Mar 2024 07:47:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7iB-00000007eHk-1cNb;
	Mon, 18 Mar 2024 07:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C15260BEF;
	Mon, 18 Mar 2024 07:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED23DC433A6;
	Mon, 18 Mar 2024 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710748029;
	bh=Qg6wGn348TMW5vD8jxjP5W64953WeOV0NbR9aKpKJWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fFJv2dbopy2N08oK7/uaLZlAJAyNVDYDT5UVFJPMifpqxz/tRnpMo+yFC6JXDqbqc
	 n9AzVWq5IPAl6K5Sid0rcE788s1jlezqbTklhyPpY32u1UP1RbIqo+FmfWiiAdAh2M
	 /VGhLLMZpxuU9ic2Kli49ONnv05/wXO/vA8EB+ejS9vsqBhuaVoo+pcwYU8gqPeDpD
	 ed9H1CNibz0o5nSq7s8YmpxdWrfrySPqd3t3ZcXBexui5TYXqbZvkZbLJYqi0gNZm7
	 fniXmkj6Hi1OTjvIhcAYhfCriy8B9N9hFP8q3qvv7xIwfUIxUAK6bUkNRrSZxeYa4m
	 wIbk1bAgB0zLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD04BC54E6A;
	Mon, 18 Mar 2024 07:47:08 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 18 Mar 2024 10:46:25 +0300
Subject: [PATCH 3/3] net: phy: mediatek-ge: do not disable EEE
 advertisement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=
 =?utf-8?q?1-3-3f17226344e8=40arinc9=2Ecom=3E?=
References: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=
 =?utf-8?q?1-0-3f17226344e8=40arinc9=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-?=
 =?utf-8?q?v1-0-3f17226344e8=40arinc9=2Ecom=3E?=
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Russell King <linux@armlinux.org.uk>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710748010; l=1173;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=5X/oaW7mTS2TiAUhw0sZVt3FkSCBq14+if6oX62AfQ4=;
 b=+MNXFbgyZ7XWlbB+caj20Ex4VdOFh3bRWNk+7DxEulDTftFo/dQMZlnVMPgDMgzfE7zV31TEr
 3C0SXiZRhwiArszbs0GX8DiM1j4yZODltXA+UTuvosvV+CjFhIJGXcI
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_004711_586789_CAACDE19 
X-CRM114-Status: UNSURE (   9.05  )
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

There's no need to disable Energy-Efficient Ethernet (EEE) advertisement on
the MT7530 and MT7531 switch PHYs. EEE works fine on MT7530 and MT7531
switch PHYs. Remove the code where EEE advertisement is disabled.

This is a bugfix because there's a possible race condition where the
mediatek-ge driver would kick in after the MT7530 DSA subdriver which would
have EEE disabled until manually enabled.

Fixes: e40d2cca0189 ("net: phy: add MediaTek Gigabit Ethernet PHY driver")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/phy/mediatek-ge.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek-ge.c
index a493ae01b267..54ea64a37ab3 100644
--- a/drivers/net/phy/mediatek-ge.c
+++ b/drivers/net/phy/mediatek-ge.c
@@ -23,9 +23,6 @@ static int mtk_gephy_write_page(struct phy_device *phydev, int page)
 
 static void mtk_gephy_config_init(struct phy_device *phydev)
 {
-	/* Disable EEE */
-	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
-
 	/* Enable HW auto downshift */
 	phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED, 0x14, 0, BIT(4));
 

-- 
2.40.1


