Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280F1C79F82
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=; b=UnYifcX3ZqlLMolxlf/TdFwI1N
	L0VFVlMJWkdD5wNLLZ9xNtYPOEYZSZDWC6tCJYQb6P4Oz9VFMm4bKue5lL9RUEIGVNV1/wcX+CtdD
	tfXnex6TBB99ngL7s99nt1+WgCGiV+FLAKB+1io2ZKenF9p/WIPyreDAlQFySQTXsDuJhUJVH0cAM
	IrMteOBP2T0G+pUCaVj4Gi44H9Q/sIqjVvPLd1rK1SSfbbyf54edLbx1+YbjK9XP3ou93pzQpmYQP
	3EuV/mNOWqfo+wLPNixPSeowbmBXz2P/TIYdw8sGynZYyN5HHYRCVcNyKQG0Z3yFC85XinuNeCWaD
	y79mu/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xBY-00000009LAl-32GQ;
	Tue, 08 Sep 2026 14:52:32 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xBW-00000009L6b-1bfZ
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 14:52:31 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ab0e4da6so4658886e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788879147; x=1789483947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=;
        b=FuirBMucaZJsPWWmhsEwPMs8MUy9HwTFiSGmaMOc8/8uJnp2ukawW95R/c27HkRQPD
         uyxDMM2Kv/0dKsa4uqpBaql1vUn51rNFIhgc8q5CgEWsYH/eaUjUTwVJCBFWa23axvoP
         AF9i0EG1JN3aB/vRK6jijKShE0i6/URN6RCyXSLzRQfI/2Gtgljh/vRA+CqRxO6FLfJY
         pMUFrNXaI05Vd0YdPyf2EAJAXItCXTtHMkyopqn1fAp3Pb0RA6MLKU5jgT5CKJ4zW6y0
         tKsrEHlkDadjeoQsWZyzcc31a/R1Sew0ZAXkn+zL9qF8IyqJbzxrLE9CjAzSjHQjXzxH
         DBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879147; x=1789483947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=;
        b=fIdYxxqdaLlHwFbU4gDpbc/8ChJ2gHxH7S44CIfk7LHbz3JTPxtEDlmDpX6OFLB9Lu
         bHZRh3ateisK8hG4Dvw4lECygVW9UnLGUVUrCM3/hm5kjEDSEz6clulbveduzu9ISgWR
         52ESkRXiLGB9thSOsFrfhCEJfZHuKU2HDXZMC9+nhv1vIefUuLYYpdfZqcZjaPjA90PT
         tObAEfs7o54sNtJtRafCB+gX2MX3Vk9B/9LJqMZIucjQqAjB60vsDuQ1NeANI+1SNLY9
         BB1oUXYHlN6QLXsecMSK00iofCfqftzvGyFkyZOI599Qmt0mc1mvz9ySyvFQD8tH6U0z
         NUdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMCCx7680Vsk+g0biwZetVsh0Y/dMOfOfnMmdYTt+3u9GGAenEKtbd8i5j/ChtGoZkg10d+oXD5O/vz9JQCw==@lists.infradead.org
X-Gm-Message-State: AFuF++kA2DsKUnw0ade2KI8V7IPsPd57RVqJ0bwQUHfajr6fB57L0D/2
	UhK6Q7M0E/RuDvu1lGCq1jiFlAumryg29Ano0xWf3QRNoYHF9mCajHg=
X-Gm-Gg: AYBFou0Yl0+okjkBI92n0OK03/ZYTgbi3Umi7YpPj7l2Xoc9lQ+7Aq2he2tEgq6e8xZ
	vpiQ5Nu7j+wAx5pBVVHw5a9wOfCvGpSGPyN2TlOIG/vedaIZ+K5VuwU6ZkilFzSwhxkv8Ht2A8m
	UTJ0tUigElEpJFdgE9jDibvDSQXc6FH1bQY1Oagsm7sUiX6qPICZC5bxrKGyfb3rFSVnWQ6iDjM
	P26pFY2+PcIbDVes7FXjmSlgseXvtuILVqQD+rVXQNv/EXd3viCJUQOy9EfVOOTuB6lI/RN2x9e
	CCK4Lv508quD7kXc9V38txQ8ALgaFFsHJD8T0E+EXKIgj5c4zeAWg3UfY4goOsYEpARj4ehXBAM
	kRqKyNb7GBDRyt2lkpSaxkpnBmdNdZ3y8+0aHBV0gIWvGPnl7N4rY6S5jDfodpoSyMZfr+3Q2SB
	s4y1AUj+W5XjNWLP3wC1skf8v88OvU7hDQwkTccAL0/nOjLpDqs4+Pc4B4cVYAqYo8swhu3+82v
	MkR6cm7nIV0FiVV0/Mh3cUYWAPZHsVXW7oidf+FruimZpTZ1o0=
X-Received: by 2002:a05:6512:130b:b0:5b6:183c:5c90 with SMTP id 2adb3069b0e04-5b6183c5d6amr4728496e87.46.1788879146726;
        Tue, 08 Sep 2026 07:52:26 -0700 (PDT)
Received: from i-UX410UAR.lan (broadband-95-84-141-211.ip.moscow.rt.ru. [95.84.141.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecf24sm3215891e87.16.2026.09.08.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:52:24 -0700 (PDT)
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
	arinc.unal@arinc9.com,
	sean.wang@mediatek.com,
	olteanv@gmail.com,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net v4] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
Date: Tue,  8 Sep 2026 17:52:13 +0300
Message-ID: <20260908145213.3976508-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075230_459845_8BB20E65 
X-CRM114-Status: GOOD (  20.31  )
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

  - clear MDIO_AN_EEE_ADV in probe(), as early as possible, before
    anything can negotiate EEE with the link partner;
  - clear it again in config_init() and call phy_disable_eee() there.
    config_init() is what phy_init_hw() replays after a PHY reset, when
    the register is back at its EEE-advertising hardware default, and
    it runs after of_set_phy_eee_broken() in phy_probe(), so the
    eee_disabled_modes mask survives and neither phylib nor userspace
    can re-enable EEE. dp83867 disables broken EEE from config_init()
    the same way.

Auto-negotiation then falls back to a stable 100 Mbps link instead of
looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
cable on the WAN port, a single clean 100 Mbps link comes up and a
DHCP lease is obtained, where the unpatched driver loops.

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
Changes in v4 (addressing the sashiko review of v3):

- phy_disable_eee() called from probe() was undone later in the same
  phy_probe() flow for PHYs with an of_node: of_set_phy_eee_broken()
  zeroes eee_disabled_modes after ->probe has already run, leaving
  userspace able to re-enable EEE through ethtool.
- The probe()-time MDIO_AN_EEE_ADV clear was not replayed by
  phy_init_hw() after a PHY reset, leaving the register at its
  EEE-advertising hardware default.
- Keep the probe()-time advertisement clear -- it also feeds an empty
  advertisement back into genphy_c45_read_eee_adv() during phy_probe()
  -- and move the durable disable to config_init(), which runs after
  of_set_phy_eee_broken() and is the callback phy_init_hw() replays
  after resets. This is the placement dp83867 uses for the same kind
  of quirk.
- The Reviewed-by/Acked-by given for v3 are not carried over: the
  placement is what changed, so they need a fresh look.

v3: https://lore.kernel.org/netdev/20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com/
v2: https://lore.kernel.org/netdev/20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com/
v1: https://lore.kernel.org/netdev/20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com/

 drivers/net/phy/mediatek/mtk-ge.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72..96d8ac5 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -62,10 +62,38 @@ static void mtk_gephy_config_init(struct phy_device *phydev)
 		       FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
 }
 
+static int mt7530_phy_probe(struct phy_device *phydev)
+{
+	/* The MT7530 internal GE PHY has broken EEE: with EEE advertised,
+	 * some link partners fail to establish a stable link (on a 2-pair
+	 * cable, 1000BASE-T training fails and the port loops instead of
+	 * falling back). MediaTek recommends disabling EEE on this PHY.
+	 * Clear the advertisement as early as possible, before anything
+	 * can negotiate EEE with the link partner.
+	 */
+	return phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+}
+
 static int mt7530_phy_config_init(struct phy_device *phydev)
 {
+	int ret;
+
 	mtk_gephy_config_init(phydev);
 
+	/* The probe() clear alone is not durable: phy_init_hw() replays only
+	 * ->config_init after a PHY reset, with the register back at its
+	 * EEE-advertising hardware default, and phy_probe() zeroes
+	 * eee_disabled_modes (of_set_phy_eee_broken()) after ->probe already
+	 * ran. Clear the advertisement again and mark EEE disabled, so that
+	 * neither phylib nor userspace can re-enable it; dp83867 disables
+	 * broken EEE from config_init() the same way.
+	 */
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	phy_disable_eee(phydev);
+
 	/* Increase post_update_timer */
 	phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_3,
 			MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG11, 0x4b);
@@ -100,6 +128,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
+		.probe		= mt7530_phy_probe,
 		.config_init	= mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
-- 
2.43.0

