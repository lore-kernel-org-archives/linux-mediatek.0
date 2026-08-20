Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B85C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGoy2n51LwvoRDVHhiJ0uQW/YIqwhoXjWTQlpvrOKkA=; b=Vq6+mDed6Rl4DmjU3SG2fOWOSP
	7H+6pENfyiYO7YA6OaQ6kzh8nSbUskGhvLQj148k223DATR2ESJGoQ+hbfesrr1ZQ9iw4FaKpT5eU
	fdVLbHB0IZpV5kJbr6aSBZ6wXVdL57EbOpvYjr9r+1YaW2lPeDeO0xMRNtH/thVdL4YkBjBJ2qpGK
	/pM0ACdpD31hI8lSGD31CKN1W5fophFdtYGQvzwqPhzU9HIXcrk/ppPQHPSA1FTzx5GatSK7e1P9h
	c9VyJVLcAqLBa9WJBBg4NlWuY/eoVMp9KCDvdnMfQcAgTKHZ5e9zDHAkd2qhQxUfx4s/rMPQVL+rc
	47yqUfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9O5-0000000CAbO-1cDR;
	Thu, 20 Aug 2026 20:29:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9O2-0000000CAad-40z5
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 20:29:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso672275a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257757; x=1787862557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGoy2n51LwvoRDVHhiJ0uQW/YIqwhoXjWTQlpvrOKkA=;
        b=ndWOXd/sr7GeEMs4AyVOtnvye3XZ/GumirikRLAaCJ0aaexn9lrBCJUoe/kpXBTN5T
         tRak0F12t953hVm6/3nQnpZdiNUV4SYoqOv8MwBwbVD++OPsYrb4mE5T2IxEKfavY2gZ
         ZfwfCdubPwxhKOLQYV7F27NnhAkHEDFiC7viZoLpCTx1pDR3nRdFzW0e/Q3i9K1fKqpi
         OiOjzKkIXeyuGYcgSbDBGVtZwHERW5i1XsyKnr+Y69suB+jWHxLafUEF8n0O44BJsweD
         lnp/rEXVn5YwryhlvPXPbrFPiwvAxS8hnMzzt00LXM7i+sGDfutZsNEz0oCZASl98xLw
         UIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257757; x=1787862557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGoy2n51LwvoRDVHhiJ0uQW/YIqwhoXjWTQlpvrOKkA=;
        b=NP1I/5yTd8nwwDPUhJcTpPtI29kSXQ46KuOGQNSVXDeFBdjj4PPSeCZB3aNeg44dgh
         5MRt5A1oGe3rD2EvOTqe5tnlmcVD3djUH+RCRBYfMa8ZzOzx/IKkCiPKI5jV3WyGF3xG
         pK1UybbGM3GGiu8eGWVpg57MvhO8L1fSenQYLCBBqX5o09nbmu8mQgulWJRh+uZVhEZL
         5fjUI+X1cRz62nNwQ33PeYT7+w9DNSnStZlcLbaAx9nBQC3sApcakklgcj1q4mWZWp7O
         tI8AyA9IQL9Lze0ZxyoPOuc2InmsgwUOsXGC1eDTJgAlOLQGpHukkXRdkOrJQ+AmpnHS
         J/rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD6+1ZwHrC4iFNVdbDawX/VhahrCqNGWPxRV9qK7yuCakYALmQRV/0ynQl7UVLuVfNkjiMGUHjbGaJUQ+Y6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrpy7suKd9DbyK3w6YoSES3G/pTQLvAIjfYzra1m66sJUKNRpk
	1ZzDgXMvoOCqHqoJ89t/j+tPrjO2ujX7lF/PXyHqEhaHHZZU14cOPyY=
X-Gm-Gg: AR+sD133w3ChxJgdY55FWzksA0J4FggMBUShmRTYpVsDLnSR90Ca6ZdvEMOfJc4yBGe
	BUvSBFcuaA30gtf9RB4XxynQQrzfkPe/NvzXwfnPGBE0IdHhIDc0wRn2dZ2cOyrF3ggkEsb//vA
	Lb7SjYXdW6B23Tbr1AxeK+KUX9w/28DgU62W/GzR17VcJHsLSVHLFiU7FOipjKzTtz6Ze3dKR0H
	hLql7s9stDRw0BWS9pOoQPhEtBx/Ae7Q2IRMuYU1Gyg7LsJ0yrX5QY5l4EHw97DqA1ikx/1ZMnN
	Q/MLmF9QJL1qSiI6j4rHAdKI+5et/oq7E0qP1uFtq1TEB48yH+nP3wdOR6Y5XT+/W3WZtskU8GD
	q9UlqTv3HiCozZ0f4sluk5oQimXdAhIOz4yjJ9kY0wWiSDGovCihf4iVnZr5pwoIgW4CROlKjG+
	bD7h2J6SUBFnscbUeJBzcJcvoPZN6B3kamGmgjBdi1P6wvZEFvO24lIy7wUBtkzzJS+Cm7
X-Received: by 2002:a17:907:6094:b0:c1f:9c3b:96a7 with SMTP id a640c23a62f3a-c246a6269d2mr95089666b.17.1787257757256;
        Thu, 20 Aug 2026 13:29:17 -0700 (PDT)
Received: from i-UX410UAR.lan ([2a02:2168:87cb:3900:b204:3af:b369:d1c3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df622sm133458066b.46.2026.08.20.13.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 13:29:16 -0700 (PDT)
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yangshiji66@outlook.com,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net v2] net: dsa: mt7530: do not advertise EEE on MT7621/MT7530 switch
Date: Thu, 20 Aug 2026 23:28:44 +0300
Message-ID: <20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_132919_026026_63F59A75 
X-CRM114-Status: GOOD (  21.30  )
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

From: Shiji Yang <yangshiji66@outlook.com>

There are hardware defects in the MT7530 internal GE PHY EEE support:
with EEE advertised, some link partners cannot establish a stable
connection. On a 2-pair (4-wire) cable where both ends advertise gigabit,
1000BASE-T training cannot succeed, and instead of falling back to
100 Mbps the port flaps in a loop and no link/DHCP lease is obtained.
This is confined to the WAN / phylib bring-up path; the DSA/LAN side on
the same device is unaffected.

The MT7530 internal GE PHY advertises EEE by hardware default. The
eee-broken-100tx / eee-broken-1000t device-tree properties only take
effect during the late PHY config_init path, which is too late for these
link partners: they negotiate EEE before the OS disables it and then
fail to fall back cleanly.

Commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
advertisement") removed the early EEE-advertisement disable from
mtk_gephy_config_init(), on the rationale that "disabling EEE
advertisement before the PHY driver initialises keeps it off", i.e. that
the DSA subdriver already performs that early disable. That rationale
holds for MT7531, whose mt7531_setup() clears MDIO_AN_EEE_ADV on each
switch PHY, but not for MT7621 (and the dedicated MT7530 IC), whose
mt7530_setup() never had such a loop. So af3b4b0e59de removed the only
early EEE disable covering MT7621/MT7530, reintroducing the flapping.

Regarding the MAC-vs-PHY question: the broken hardware is the PHY (the
MT7530 internal GE PHY, PHY ID 0x03a29412, driven by mediatek-ge), and
MediaTek's own recommendation (Landen Chao, 2021) confirms it: "EEE of
the 10-year-old MT7530 internal gephy has many IOT problems, so it is
recommended to disable its EEE." However, the disable belongs on the
DSA side, not in the PHY driver: af3b4b0e59de itself established that
the PHY-driver-side disable "is somehow enabled afterwards" (it does
not stick), whereas the early disable done in the DSA setup path is what
keeps EEE off -- which is exactly why MT7531 does it in mt7531_setup()
and why af3b4b0e59de considered the mtk-ge disable redundant for MT7531.

Restore the early disable for the affected silicon by clearing
MDIO_AN_EEE_ADV on each switch PHY in mt7530_setup(), gated on a new
`broken_eee` flag in struct mt753x_info rather than an open-coded ID
check, mirroring the existing mt7531_setup() loop. Set broken_eee for
ID_MT7621 and ID_MT7530, which share the same mt7530_setup() and the
same internal GE PHY. Auto-negotiation then falls back to a stable
100 Mbps link instead of hanging at gigabit.

Tested on ASUS RT-AX53U (MT7621): a single clean
"Link is Up - 100Mbps/Full - flow control off" + DHCP lease on a 2-pair
cable, where the unpatched driver loops. Confirmed on kernel 6.12 and
6.18; also confirmed on Netgear R6220 and EdgeRouter-X (both MT7621).

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
Changes in v2:
- Gate the disable on a new `broken_eee` flag in struct mt753x_info
  instead of an open-coded priv->id == ID_MT7621 check, so it is easy to
  extend to further affected silicon (suggested by Daniel Golle).
- Cover ID_MT7530 (the dedicated MT7530 IC, e.g. BananaPi R2) in addition
  to ID_MT7621: both share mt7530_setup() and the same internal GE PHY
  (suggested by Daniel Golle).
- Address the MAC-vs-PHY placement question in the commit message: the
  broken hardware is the PHY, but the disable belongs on the DSA side
  because af3b4b0e59de showed the PHY-driver-side disable does not stick
  (question by Andrew Lunn).

v1: https://lore.kernel.org/netdev/20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com/

 drivers/net/dsa/mt7530.c | 11 +++++++++++
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2a70fa4..cab46c6 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2446,6 +2446,15 @@ mt7530_setup(struct dsa_switch *ds)
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
 		mt7530_pll_setup(priv);
 
+	if (priv->info->broken_eee) {
+		/* Disable EEE advertisement on the switch PHYs. */
+		for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
+		     i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT7530_NUM_PHYS;
+		     i++) {
+			mt7530_phy_write_c45(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+		}
+	}
+
 	mt753x_trap_frames(priv);
 
 	/* Enable and reset MIB counters */
@@ -3298,6 +3307,7 @@ static const struct phylink_mac_ops mt753x_phylink_mac_ops = {
 const struct mt753x_info mt753x_table[] = {
 	[ID_MT7621] = {
 		.id = ID_MT7621,
+		.broken_eee = true,
 		.pcs_ops = &mt7530_pcs_ops,
 		.sw_setup = mt7530_setup,
 		.phy_read_c22 = mt7530_phy_read_c22,
@@ -3309,6 +3319,7 @@ const struct mt753x_info mt753x_table[] = {
 	},
 	[ID_MT7530] = {
 		.id = ID_MT7530,
+		.broken_eee = true,
 		.pcs_ops = &mt7530_pcs_ops,
 		.sw_setup = mt7530_setup,
 		.phy_read_c22 = mt7530_phy_read_c22,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 7e47cd9..fff310f 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -851,6 +851,7 @@ struct mt753x_info {
 	void (*mac_port_config)(struct dsa_switch *ds, int port,
 				unsigned int mode,
 				phy_interface_t interface);
+	bool broken_eee;
 };
 
 /* struct mt7530_priv -	This is the main data structure for holding the state
-- 
2.43.0


