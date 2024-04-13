Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E650BC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dqIsEjPUpYCBrc9BX29HwzZS10yCkmrdB7xcreqrWcw=; b=SGW8rEY8ELiQ/MzHCN0fY1BBUE
	v/Xa1nCHMRrLlE71Ec0mxvXl3OCAxUOW+IXGPYGCjdn/zRVmfVEkAb/UWHkzRsORGtNWPWyKRCaic
	1FhIlNfr2GgABNq2a9meLm1pRZ0rZUi1qnRYM5NPKcK0pwXMBCKK8LPuVrIPvOFYLscqdH99RnMvt
	wczq8Z5fwtepRo8+n1vMsbnqQ6kjh59afYB4r8nNycUvvkV8v9WtsK9ASxy9a53aADvWLFlIp213M
	Oogavc+JMoSLhOeuz5QoI/Vmh3BJyvPIBOmMnmksVlzf0t6dPFPrgdM0B7HQDhRJFcM892dmcCvGx
	TJW+8cEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvkc1-00000003wP6-43e9;
	Sat, 13 Apr 2024 21:08:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvkbx-00000003wNh-2sQj;
	Sat, 13 Apr 2024 21:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39E3FCE01C8;
	Sat, 13 Apr 2024 21:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C12FC113CD;
	Sat, 13 Apr 2024 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713042506;
	bh=8ftN+AozV8xrqm48t4mfEg6N/gXxQI8jvRXOIlRjc5s=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AQvzQMyPsr0JldqzqNIGUFOjwCMRLj5SDBbzz57DAPtPKdG241YGxFecrrnPk+EEn
	 T73fdmN33X4gLPiX3xDuh4K6rE+BjW6VYBCESKz4/Wz1IO39ZZEDKdSrh6JMAnqQPx
	 +TMS8l5VAiNVJnxMeDF225u/4uuMm1MB/3sidZevb2mD+Ypiu3v0X1R12ajQc9DDi9
	 k2iIUmAQU91joHGlTOL/37/HvPZ22uBbLLmFKoWJjjAoHLL+cfCDsyw/LvFVplacvO
	 lKPuY6+0nX1XQ6BIXqGtMyfFdlXtQyyvZp76uNiJwwkjWFWzOOryZAABVB5w5b92QW
	 87kGKO1K2dmOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55312C4345F;
	Sat, 13 Apr 2024 21:08:26 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sun, 14 Apr 2024 00:08:13 +0300
Subject: [PATCH net-next] net: phy: mediatek-ge: do not disable EEE
 advertisement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240414-for-netnext-mediatek-ge-do-not-disable-eee-adv-v1-1-2fefd63c990b@arinc9.com>
X-B4-Tracking: v=1; b=H4sIADz0GmYC/x3N2wrCMBCE4Vcpe+1CE4unV5FepNmJLmoiSSiF0
 nc39fKH4ZuVCrKi0K1bKWPWoim2MIeO/NPFB1ilNdneDv3RGg4pc0SNWCp/IOoqXtxmkjimyqL
 FTW8wAHYy83Q6S/A+XC/GUEO/GUGX/+GdmsM7ROO2/QBWJbCvigAAAA==
To: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713042497; l=1262;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=3+tGyLYc9tR5wwy3EghRPXT4LZ9a92aLjvNesVkpu9o=;
 b=W1Dn4HFVHIUCOJTQtcShYgKgcG7Ck+OXjRDh/mAj+PHLqe0nx8zL743Qod1CUINXYtPSl+N4t
 1RNaO8X4jOcCOCKSeamjbRPXGI3W7B8FkPtIlDoQG0kl4AFu1DlEgDG
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_140834_475365_F1F8D7BD 
X-CRM114-Status: UNSURE (   6.85  )
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

The mediatek-ge PHY driver already disables EEE advertisement on the switch
PHYs but my testing [1] shows that it is somehow enabled afterwards.
Disabling EEE advertisement before the PHY driver initialises keeps it off.
Therefore, remove disabling EEE advertisement here as it's useless.

Link: https://lore.kernel.org/netdev/d286ea27-e911-4dcb-9037-b75f22b437b8@arinc9.com/ [1]
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
 

---
base-commit: 32affa5578f0e6b9abef3623d3976395afbd265c
change-id: 20240321-for-netnext-mediatek-ge-do-not-disable-eee-adv-b67dfccf9811

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



