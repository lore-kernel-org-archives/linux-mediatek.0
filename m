Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38068C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT0RS+GHCXUGsygoGQD9BLYd7IURiN4ABN7OybgTysg=; b=AUZYtQEBKu1dAfCnkZQAOmBNEO
	TNlvfvmShEjRaL1m57rnRWkcAAEMLt+4V+P8LAu2Fcf74uYCzCvQVo2FaUhT4PGxud22N4vOEDKJz
	Bp15pE/4TFjg9k9dHB2NuMKVWJQ4T2x4FCrK/AoLbTsyUjMgDmmRtvhiBIl27nHHpOOchRjTZrBG5
	0n/PbZUg4kFOZRgYClFgDXxeuJ8GO3YydhRpZoZNfKf6R2YpiW5K01JdGBNwAkHp4KWOQrqL2hmCg
	uSIrG5+YkGznxpPBCdyJ9KXVUFeABTC4pRUFNinOQlC8DQu6fU/yWqyrAJL+LgQvwHfW/PsFn4oFN
	tZu1R3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnLIX-00000003mhi-33XM;
	Thu, 21 Mar 2024 16:29:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnLIT-00000003mg2-277Y;
	Thu, 21 Mar 2024 16:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63C4B611D3;
	Thu, 21 Mar 2024 16:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05EFBC43390;
	Thu, 21 Mar 2024 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711038580;
	bh=yqJggufrP1i89wxFjM8Tt9txIjYYksGH/+vHGN6ns3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LYJ9/HV+39Y7te7sja2d7kBc5OIodn3VAoSiWqcK2J5rjzi/3XGBLpjAQRzbegsoK
	 L6G9TVYtsqbLO2dX2HzqOFkTSItY4nXYVPNJcC/U4zqhcwCN/R0cyiY8FH8X2VKyKe
	 Vv0E6Ir8DN9lXN45HM81UCaZz3j25Tjz+7+vuKQwOz0Y0IMFfW9E24/afhMpsDM93d
	 Mcw4qkd5kZmP71Pm+i6ZwYMeS+RPXjWedRc7n2V1di1TtPIBFcdCMHQz7A+PKVw4GY
	 4Ifk0zfWANkEC3/TxZm+orsBYwzhUqxYHcRmHIgDFsyaOsQ4met3yIvN6VMRUDaPOR
	 dbK53Vy7+c2Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9C5C54E58;
	Thu, 21 Mar 2024 16:29:39 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Thu, 21 Mar 2024 19:29:14 +0300
Subject: [PATCH net v2 2/2] net: dsa: mt7530: fix disabling EEE on failure
 on MT7531 and MT7988
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-2-9af9d5041bfe@arinc9.com>
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
In-Reply-To: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711038558; l=1925;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=DsZ4XshfmuCrCshjsgaop6WdjUbPqTHmbY230mILEL4=;
 b=G2zxEWZRPd7T5UKeb3EAgsPQG9cW8YK9hK0H++LcTnAJNjhhJgyhrSeiqfRJhNLEsGOYGv3YL
 Xz5cm9hMjd9D4wjOKTWIi8jOtYCQjRFlvYMfzdA2Qu+EhTkWIamreOF
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_092941_639909_AEE58F06 
X-CRM114-Status: GOOD (  13.02  )
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

The MT7531_FORCE_EEE1G and MT7531_FORCE_EEE100 bits let the
PMCR_FORCE_EEE1G and PMCR_FORCE_EEE100 bits determine the 1G/100 EEE
abilities of the MAC. If MT7531_FORCE_EEE1G and MT7531_FORCE_EEE100 are
unset, the abilities are left to be determined by PHY auto polling.

The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
made it so that the PMCR_FORCE_EEE1G and PMCR_FORCE_EEE100 bits are set on
mt753x_phylink_mac_link_up(). But it did not set the MT7531_FORCE_EEE1G and
MT7531_FORCE_EEE100 bits. Because of this, EEE will be enabled on the
switch MACs by polling the PHY, regardless of the result of phy_init_eee().

Define these bits and add them to MT7531_FORCE_MODE which is being used by
the subdriver. With this, EEE will be prevented from being enabled on the
switch MACs when phy_init_eee() fails.

Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 509ed5362236..5b99aeca34b4 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -299,11 +299,15 @@ enum mt7530_vlan_port_acc_frm {
 #define  MT7531_FORCE_DPX		BIT(29)
 #define  MT7531_FORCE_RX_FC		BIT(28)
 #define  MT7531_FORCE_TX_FC		BIT(27)
+#define  MT7531_FORCE_EEE100		BIT(26)
+#define  MT7531_FORCE_EEE1G		BIT(25)
 #define  MT7531_FORCE_MODE		(MT7531_FORCE_LNK | \
 					 MT7531_FORCE_SPD | \
 					 MT7531_FORCE_DPX | \
 					 MT7531_FORCE_RX_FC | \
-					 MT7531_FORCE_TX_FC)
+					 MT7531_FORCE_TX_FC | \
+					 MT7531_FORCE_EEE100 | \
+					 MT7531_FORCE_EEE1G)
 #define  PMCR_LINK_SETTINGS_MASK	(PMCR_TX_EN | PMCR_FORCE_SPEED_1000 | \
 					 PMCR_RX_EN | PMCR_FORCE_SPEED_100 | \
 					 PMCR_TX_FC_EN | PMCR_RX_FC_EN | \

-- 
2.40.1



