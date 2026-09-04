Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63FCC624D3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=; b=xaim/82NgFQT/qg52ADF/5DL9A
	EOQM74AwmYo4NzXq4RIloTTL+RTdlmPaAxqJ3Vgrs4afqtKx1PBpW8uf8Jge1KiDwWhDkSsZlW4sO
	PUkGcjeWcGAIoFy5H3/xv5QLFaGb4iyWHhj0wgCXPZqOzkgUdD1EFGUUM99xXBSTvINV1UV2pnBl2
	eLkNH81nLNk9AwaP2aOnDPUHBRINzVT0+SMs8uDe8PiR8R4W9rDXKPXdgR4Snx7ilmmbc0BPIzhiv
	bUltBmbBUfVoDzLCfvPmVAnVnbaSHLn6oWvO3y0Fr9achRAv8jdzot49jCW27nFLkfTSzZPx2amAS
	WcTn4o0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aWD-00000003GFE-2cXh;
	Fri, 04 Sep 2026 20:28:13 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aWA-00000003GDS-3UXh
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 20:28:12 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso13107751fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788553686; x=1789158486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=;
        b=eYU44mqbopiNJHpVCmHR4/QsNSbzUJi1/PcCnVtl/UAqLQ8LJrMyF0ejiLfa2AvbBP
         UK8i7yIj2ZwsNzH58BX1bSPOJWlO7WO1V48HvtepY+ivlEqSGGULgXSgr1MObIlJXv2D
         i+BMP1y5gtb5WLcz/xr1IFHONixfupHyEPtxJ7reLyyWFdY8jWJmEiA2oxOe/MYX6dIZ
         NSYRUhd2WcXJmM55nR6nZdOLioZYg+ZjRogzzll6xId2J0883x1u18jkhrCrqPYlEZxe
         n+0DHn4QnHhNGx/YSHbUUeoMzRHrKsWHsq+rT59thZEA3jVFzFLTTWtDZM7cBlHS2D9M
         WEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553686; x=1789158486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=;
        b=GBRtTWjj8ekflukGRUEzkG0LxdI6UvJcZEjYvdpnwuJ1sooQEi6Es2hmyxBVjKFOW8
         6gnQ8szxCEtmeu/qS71fUX4NOLv1hf6Le+aHSgtKD8Q4vwkColxXfV0oYvDETHItP2Ns
         VDVSuova2b8tH+MwBNatg4k0muA1NbPwnah8OmCSW5FAjhV90C4bDSosuNDU2lZHd4aG
         SSxecIN9opAc9pKzUaB7LVTIqjdFBbvHHzxnvDC5jtTgLdbxJWP7FzIv2blJV+j6QXvB
         xA4IY+GPqvABxc2BXjylsupnk6zwQ/46IMbX16A1AM9/SNC5aTx56SV7Ljx6udoYjqhr
         5/XA==
X-Forwarded-Encrypted: i=1; AKwUvBxtkCF1QuTpKnSxnOxhQ89bYZwPVWvv/Jzbn2VoeVzENkN4xCrPeWZZJe/uEwZo1hViC/LdpvYJQZrywMeMBQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nj95CFU35jrb2jVTLic93JwUdii9bbndENqKCsqoyr1GoXenMW
	Kuoq4lj5gj/3Z4rxIRMJX3KXXdjC8IkvUTlocLm2jCGNr7YFDFvIwes=
X-Gm-Gg: AYBFou15HCCyOjwQF92nvnxrzMbWHelQGStkTV2CN1qB/yCKBpxqmyw5T8b1LKgLttc
	yBSxgADKVkykTUC9Z28qCb/+Vkne+w3xoVPOUi2kckLL8JLev5NQ2avFD9K5A3SDVdrvswbma7U
	IWwCfTbqLfHhWm3L5iOlb16J5cI6QRo239nxE4KmWZd3orW2pGqkowxmCyvfk9/2u59e4ioQCVJ
	wxCPuIIzAglJLjJMnGhT9c9gvm5WIqChAmqpG1TrVfyIE2JTYjkU7qfsqmbvtYgVspyxhyRlIlE
	xUbUtngzvpIb+0lP/6Bz/6lnG94Q2rhwKPO5ewF4/lDQ0TmGxOd/hTXPrRvJ7aji62QYsXcTFK2
	3YYd2AAd9sWwfDhpENCVXAw53tuvQGMuXFCB3xYMi30kA31tnvkiclVBq6tgzbOG8TL4aCBLV6A
	1ma5KMv2iwp7gfwUWZ34lYoXSTIGyXjy5vVy1t44XdB5L9DqORYGJyeITKQZvLYnnc5dfHvwfO3
	8WBqIM0BZnA
X-Received: by 2002:a05:651c:a185:b0:3a3:7680:67fa with SMTP id 38308e7fff4ca-3a376806991mr6184891fa.25.1788553685465;
        Fri, 04 Sep 2026 13:28:05 -0700 (PDT)
Received: from i-UX410UAR.lan ([2a02:2168:87cb:3900:a1e5:6a90:4021:407d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370549917sm9910451fa.11.2026.09.04.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:28:03 -0700 (PDT)
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	sean.wang@mediatek.com,
	olteanv@gmail.com,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
Date: Fri,  4 Sep 2026 23:28:00 +0300
Message-ID: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_132810_910628_62481EB8 
X-CRM114-Status: GOOD (  18.61  )
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

The MT7530 internal GE PHY advertises EEE by hardware default, but its
EEE support is defective: with EEE advertised, some link partners fail
to establish a stable link. On a 2-pair (4-wire) cable where both ends
advertise gigabit, 1000BASE-T training cannot succeed, and instead of
falling back to 100 Mbps the port loops, so no link or DHCP lease is
ever obtained. MediaTek confirms the hardware is the root cause (Landen
Chao, 2021): "EEE of the 10-year-old MT7530 internal gephy has many IOT
problems, so it is recommended to disable its EEE."

mtk_gephy_config_init() used to clear the EEE advertisement early, but
commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
advertisement") removed that on the rationale that the DSA subdriver
already performs an early disable. That holds for MT7531, whose
mt7531_setup() clears MDIO_AN_EEE_ADV on each switch PHY, but not for
the MT7530 PHY: neither the MT7621 integrated switch nor the dedicated
MT7530 IC ever had such a loop, so removing it left those boards
without any working early EEE disable and the link flapping came back.

Since the broken hardware is the PHY, fix it in the PHY driver so it
covers all users of this PHY, integrated in a switch or standalone:

  - clear MDIO_AN_EEE_ADV in probe(), before anything can negotiate
    EEE with the link partner;
  - call phy_disable_eee() so phylib does not write the advertisement
    back on later renegotiations and userspace cannot re-enable EEE.

Auto-negotiation then falls back to a stable 100 Mbps link instead of
looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
cable on the WAN port, a single clean 100 Mbps link comes up and a
DHCP lease is obtained, where the unpatched driver loops.

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
Changes in v3:
- Move the fix from the DSA driver to the MT7530 PHY driver: the
  broken hardware is the PHY, so the workaround belongs there and
  covers all users of the PHY, switch-integrated or standalone
  (Andrew Lunn).
- Clear MDIO_AN_EEE_ADV from probe() rather than config_init() so the
  advertisement is off before anything can negotiate EEE, and call
  phy_disable_eee() so neither phylib nor userspace can re-enable it
  (Andrew Lunn).
- Remove the eee-broken-* device tree properties discussion from the
  commit message; the properties are not needed once the PHY driver
  disables broken EEE itself (Andrew Lunn).

v1: https://lore.kernel.org/netdev/20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com/
v2: https://lore.kernel.org/netdev/20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com/

 drivers/net/phy/mediatek/mtk-ge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72..35600c7 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -62,6 +62,27 @@ static void mtk_gephy_config_init(struct phy_device *phydev)
 		       FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
 }
 
+static int mt7530_phy_probe(struct phy_device *phydev)
+{
+	int ret;
+
+	/* The MT7530 internal GE PHY has broken EEE: with EEE advertised,
+	 * some link partners fail to establish a stable link (on a 2-pair
+	 * cable, 1000BASE-T training fails and the port loops instead of
+	 * falling back). MediaTek recommends disabling EEE on this PHY.
+	 * Clear the EEE advertisement early and mark EEE disabled, so
+	 * that neither phylib nor userspace can re-enable it.
+	 */
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	phy_disable_eee(phydev);
+
+	return 0;
+}
+
 static int mt7530_phy_config_init(struct phy_device *phydev)
 {
 	mtk_gephy_config_init(phydev);
@@ -100,6 +121,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
+		.probe		= mt7530_phy_probe,
 		.config_init	= mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.

-- 
2.43.0

