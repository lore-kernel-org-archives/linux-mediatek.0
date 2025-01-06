Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1D9E77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKj1xCrTWB6oUM3KvvYnR1gjE7RxlWR8oUMhH1hQmqI=; b=E94T2MmC73043nO1SQiohubFDr
	KoiV2L0GQlcTh2kBpwJTBH0tws4XKqKQdfoZDIxqR8QRYJHzw92/C0A65n4PtOXb1pjMrAtBtdg++
	pekQePKq10mCiVueBY+d6SPzeG8xXw1XICbdy4vlOW1rUvTWzVi5THHD0zcws0v4and7VmykxWW3S
	HL3Jd22PmGGthIrnTW05QmBwibmQF39CKCgq4073Okas/jb3cuZcN3aFwLya3wHlttzKPW6WbgjN3
	XxoJG0XKA/Tfj0R+oygj23o1N0EbpfdmqIKsppB/FpqYrthL+KO/s0gMcJuK1NE2AC6SoaA9rP880
	lRUdJH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlq6-000000018FT-0ydk;
	Mon, 06 Jan 2025 12:04:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUllb-000000017DH-1UKR;
	Mon, 06 Jan 2025 11:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lKj1xCrTWB6oUM3KvvYnR1gjE7RxlWR8oUMhH1hQmqI=; b=FIwbPMicD2sdQ/Nce72hRfQI4w
	FW6SnK3gXfC27V6RD6NycwDFx//HFeNuQ5a30dp6Alj1MUiDFY13967p5jrQV3JrwKPNRCJUcglip
	EMytg+DN9CoutWzfWA138jF08Lnvh7A7fPOSQK+ccMMDFlsQr+MdjmK3TpISv78IdiuVUmfzyBwdT
	leOTB/C/fTWa/TZAhbQH8hUGvjN9pxfbnb0/Om/P+zLmVbvgHFtREZiUz63/ZQMrC5uMZ/lIyJAGO
	0Vdt27UZ0IEcn9xhckTA5tOLw7NF4qqc1lNyFNn/xt/pNI0YgjIxAxshi0V5nLDgSU+IyYZH5v+B5
	qeP/HCQw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38332 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUllS-0005m5-2e;
	Mon, 06 Jan 2025 11:59:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUllP-007UzF-Gk; Mon, 06 Jan 2025 11:59:19 +0000
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 8/9] net: dsa: qca: remove qca8k_get_mac_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUllP-007UzF-Gk@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:59:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_035931_392060_6B6AE8A2 
X-CRM114-Status: GOOD (  10.13  )
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

qca8k_get_mac_eee() is no longer called by the core DSA code. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 1 -
 drivers/net/dsa/qca/qca8k-common.c | 7 -------
 drivers/net/dsa/qca/qca8k.h        | 1 -
 3 files changed, 9 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 90e24bc00b99..2d56a8152420 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -2017,7 +2017,6 @@ static const struct dsa_switch_ops qca8k_switch_ops = {
 	.get_sset_count		= qca8k_get_sset_count,
 	.set_ageing_time	= qca8k_set_ageing_time,
 	.support_eee		= dsa_supports_eee,
-	.get_mac_eee		= qca8k_get_mac_eee,
 	.set_mac_eee		= qca8k_set_mac_eee,
 	.port_enable		= qca8k_port_enable,
 	.port_disable		= qca8k_port_disable,
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index 560c74c4ac3d..13005f10edb7 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -557,13 +557,6 @@ int qca8k_set_mac_eee(struct dsa_switch *ds, int port,
 	return ret;
 }
 
-int qca8k_get_mac_eee(struct dsa_switch *ds, int port,
-		      struct ethtool_keee *e)
-{
-	/* Nothing to do on the port's MAC */
-	return 0;
-}
-
 static int qca8k_port_configure_learning(struct dsa_switch *ds, int port,
 					 bool learning)
 {
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 24962a395754..d046679265fa 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -520,7 +520,6 @@ int qca8k_get_sset_count(struct dsa_switch *ds, int port, int sset);
 
 /* Common eee function */
 int qca8k_set_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *eee);
-int qca8k_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e);
 
 /* Common bridge function */
 void qca8k_port_stp_state_set(struct dsa_switch *ds, int port, u8 state);
-- 
2.30.2


