Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A06C4706C
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaf7A980b4L6Aj8H9mVZceUkci0b4MQj48JLLc3HlD4=; b=DlFgutzmZH6Pac3VexUM+h2HQL
	o7c0d+lK7oa/ENNyisuiHAZluEl1Pv77xaWmAv4LkCwiS6L0WqELgWRiOUgY2cVCBG/TGHZY5iWu6
	2bgP/f2NBd/KcMLSsgwSajL07+ba1zuZ1IJl/1dwzwFdI98zwFyh3GjA7Apxmzk/2BuL91llZgO6O
	rcaGiKDoJRfkIOAtJSTWQWE8VG4TEZ1fFJC9+UH2RUV+esi2hdtsi6Lcc4GVEGi1qIlqAo1a6Mjtn
	l8bR6HE3HoATsYxFu7fL/TBdixC4DGlIMbmP7DTd1FaEHGGed2E0UjksAjkzQaTIjjCpp25tufdvB
	/qhzJ6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDn-004tQn-0r;
	Sat, 13 Jan 2024 10:26:35 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDg-004tMb-2x;
	Sat, 13 Jan 2024 10:26:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60BCE60004;
	Sat, 13 Jan 2024 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705141567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xaf7A980b4L6Aj8H9mVZceUkci0b4MQj48JLLc3HlD4=;
	b=JPWSzPJb/ZJuXFOG6/qZJGuGYn1+1a6oWqS+MCC225SsMfF5fGk7whFKbpH7ZlwokZXZY7
	LKBXVKboka681i6ubpxp9ZoTgXaoVd+8D/n23IjoYgzyripoMHq+6vMob+Z9KdUS/Mr1Gc
	Q0sRpowPtPfCAogrhIvrwUUIaH6yXOk0T003qXfq8NXJYAxkuNMhGiEjCkTcCZhhasd1Gd
	PSwtw75H8RkuUMMH42WPMWxASg8IUmXbznqgTaanGnp+gqMI2E+qaawsnXShwzrLRCw2Rh
	sV/JYSJdUCjnWu925pHZDgIsHN1fzNkw7ndYK3bfD/+V6i+Kf3Sp44p/oSpsxA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 5/8] net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
Date: Sat, 13 Jan 2024 13:25:26 +0300
Message-Id: <20240113102529.80371-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240113102529.80371-1-arinc.unal@arinc9.com>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_022629_087412_EBD7B119 
X-CRM114-Status: GOOD (  11.35  )
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

Enable port 6 only when port 6 is being used. Update the comment on
mt7530_setup() with a better explanation. Do not set MHWTRAP_MANUAL on
mt7530_setup_port5() as it's already done on mt7530_setup() beforehand.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d3e1e31ac8d0..3ce4e0bb04dd 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -420,6 +420,8 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
 
+	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
+
 	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
 
 	switch (interface) {
@@ -910,7 +912,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 
-	val |= MHWTRAP_MANUAL | MHWTRAP_P5_MAC_SEL | MHWTRAP_P5_DIS;
+	val |= MHWTRAP_P5_MAC_SEL | MHWTRAP_P5_DIS;
 	val &= ~MHWTRAP_P5_RGMII_MODE & ~MHWTRAP_PHY0_SEL;
 
 	switch (priv->p5_intf_sel) {
@@ -2250,9 +2252,11 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
-	/* Enable port 6 */
+	/* Directly access the PHY registers via C_MDC/C_MDIO. The bit that
+	 * enables modifying the hardware trap must be set for this.
+	 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val &= ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-- 
2.40.1


