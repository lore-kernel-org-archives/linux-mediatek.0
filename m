Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0FC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1hEryQAzv4aINQksZVb0h+gLBTeh9K6WD5HzVy7o4c=; b=dpYaOC2lrRC14L
	azV1zi+7mn1zZmOH0Qge1MlFf5Hz34Fgb7b/tTodhZ9doHEzwJhHPIMkKNu8C6Kstwq8MTRV3R4MT
	/1mejQ0rmjxD1+TzGwp1Qsg+b4FeMJpSppAag7jUSBlSjHWW2yLAs+LM48LqIqKW7P11R5TrBKP6o
	/9WZSny4iOEY/BTA7ZA/5542wloP2qpMM00dbeZ+dbyDUas+47TIYAkiUml0h69s78NaiArVRm8FC
	BNNUXteZFQVpy7gMvRSN1ElLz1dHK5mUyHsFoRYmQQIRSvCiMlZ/+SM3pWccUOPmQeiSgLbrQp7UF
	ojo779IMl4HcfcaRi37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4W-000VA9-2d;
	Tue, 25 Apr 2023 08:30:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE47-000Umd-2n;
	Tue, 25 Apr 2023 08:30:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-959a3e2dc72so416344466b.2;
        Tue, 25 Apr 2023 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411421; x=1685003421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1hEryQAzv4aINQksZVb0h+gLBTeh9K6WD5HzVy7o4c=;
        b=a/DDBHyMc1TxlYJRDs0WMi6praxgJ15QDsq//WPEEJXVG6leYyGLzaRVwiFTADuwX+
         3PibbXoE+pRFr8V/9mpHlWAbtRLcLg5cPRkBvv4AS1HPTdea4KLLGELkI4Tp7WovuYAp
         /lNOWU5U65ZhSHf1Q03VjuhOxkfqWEtI9U4e0NAVhkatNTPU71sAnori5xYKkJGRFTWD
         Da7X8zGYv5FQAwtU7H123DWGFFrhwl+FN8l8LTVNiDxGQOeMu/L+FlqSN2WopqFBcOEd
         +N+JG18nfcSHkv7h4ue2hP/z1sM5Jw46EhDehzPbp64ow5rRCxsfqw6e3EhcfXxObcei
         Q7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411421; x=1685003421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1hEryQAzv4aINQksZVb0h+gLBTeh9K6WD5HzVy7o4c=;
        b=TR/NbbY8qFeahC/LeczmjZkMVVCc4hp0i84U0yyVnIuBBFZoeiC4YXaAwUpoMhhEat
         97tyUo4t8+LbKy5Nb9IjEgftk919LjwwrXhrfZUTetY2cHzyuqg2uBcGDYYwrJteaut8
         abTevTdVDWEZEUVwiu6Xnqb8o1XP9T4v9tzuBRnbayEIsGFuh2yfYI2KSYSS0HvS7gQk
         iY00PlUT4nVZT5YMPaq9y9PyQk4A4GnDppjBUOP3F2pH02uHTVHkajI36Lp8mopt5Lxt
         Y2RqWf03rCvNdFlA/QKCiC2jLn5A50zqT27ZY2sc6QX1KIT85dt5MkAmk5fzHG9zjORk
         QFaQ==
X-Gm-Message-State: AAQBX9clVX0zvP+K78WRLB+IxrXpxLapXnfUoIMXuAMCB9QK8cAV54n2
	tNXTWzv6F788QDecnuNTO9Q=
X-Google-Smtp-Source: AKy350bbEUf6faVX9nY72/m6dHPexWm/Y7Qm2r6MQAFGPF0ZB04oT2/UEiGiqF0BgVcLGpUZ2IrowQ==
X-Received: by 2002:a17:906:d210:b0:8b1:7de3:cfaa with SMTP id w16-20020a170906d21000b008b17de3cfaamr11259984ejz.3.1682411420827;
        Tue, 25 Apr 2023 01:30:20 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:20 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 12/24] net: dsa: mt7530: remove pad_setup function pointer
Date: Tue, 25 Apr 2023 11:29:21 +0300
Message-Id: <20230425082933.84654-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013023_924580_77F3F09C 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The pad_setup function pointer was introduced with 88bdef8be9f6 ("net: dsa:
mt7530: Extend device data ready for adding a new hardware"). It was being
used to set up the core clock and port 6 of the MT7530 switch, and pll of
the MT7531 switch.

All of these were moved to more appropriate locations, and it was never
used for the switch on the MT7988 SoC. Therefore, this function pointer
hasn't got a use anymore. Remove it.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 36 ++----------------------------------
 drivers/net/dsa/mt7530.h |  3 ---
 2 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6815d2579f37..2addd5e7fbe6 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -473,18 +473,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 	return 0;
 }
 
-static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
-{
-	return 0;
-}
-
-static int
-mt7531_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
-{
-	return 0;
-}
-
 static void
 mt7531_pll_setup(struct mt7530_priv *priv)
 {
@@ -2563,14 +2551,6 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	}
 }
 
-static int
-mt753x_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
-{
-	struct mt7530_priv *priv = ds->priv;
-
-	return priv->info->pad_setup(ds, state->interface);
-}
-
 static int
 mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
@@ -2737,8 +2717,6 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p6_configured)
 			break;
 
-		mt753x_pad_setup(ds, state);
-
 		if (mt753x_mac_config(ds, port, mode, state) < 0)
 			goto unsupported;
 		break;
@@ -3040,11 +3018,6 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
-static int mt7988_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
-{
-	return 0;
-}
-
 static int mt7988_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
@@ -3106,7 +3079,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c22 = mt7530_phy_write_c22,
 		.phy_read_c45 = mt7530_phy_read_c45,
 		.phy_write_c45 = mt7530_phy_write_c45,
-		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3118,7 +3090,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c22 = mt7530_phy_write_c22,
 		.phy_read_c45 = mt7530_phy_read_c45,
 		.phy_write_c45 = mt7530_phy_write_c45,
-		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3130,7 +3101,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c22 = mt7531_ind_c22_phy_write,
 		.phy_read_c45 = mt7531_ind_c45_phy_read,
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
-		.pad_setup = mt7531_pad_setup,
 		.cpu_port_config = mt7531_cpu_port_config,
 		.mac_port_get_caps = mt7531_mac_port_get_caps,
 		.mac_port_config = mt7531_mac_config,
@@ -3143,7 +3113,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c22 = mt7531_ind_c22_phy_write,
 		.phy_read_c45 = mt7531_ind_c45_phy_read,
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
-		.pad_setup = mt7988_pad_setup,
 		.cpu_port_config = mt7988_cpu_port_config,
 		.mac_port_get_caps = mt7988_mac_port_get_caps,
 		.mac_port_config = mt7988_mac_config,
@@ -3173,9 +3142,8 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	/* Sanity check if these required device operations are filled
 	 * properly.
 	 */
-	if (!priv->info->sw_setup || !priv->info->pad_setup ||
-	    !priv->info->phy_read_c22 || !priv->info->phy_write_c22 ||
-	    !priv->info->mac_port_get_caps ||
+	if (!priv->info->sw_setup || !priv->info->phy_read_c22 ||
+	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps ||
 	    !priv->info->mac_port_config)
 		return -EINVAL;
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 06037be5882c..f7a504e4c17b 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -696,8 +696,6 @@ struct mt753x_pcs {
  * @phy_write_c22:	Holding the way writing PHY port using C22
  * @phy_read_c45:	Holding the way reading PHY port using C45
  * @phy_write_c45:	Holding the way writing PHY port using C45
- * @pad_setup:		Holding the way setting up the bus pad for a certain
- *			MAC port
  * @phy_mode_supported:	Check if the PHY type is being supported on a certain
  *			port
  * @mac_port_validate:	Holding the way to set addition validate type for a
@@ -718,7 +716,6 @@ struct mt753x_info {
 			    int regnum);
 	int (*phy_write_c45)(struct mt7530_priv *priv, int port, int devad,
 			     int regnum, u16 val);
-	int (*pad_setup)(struct dsa_switch *ds, phy_interface_t interface);
 	int (*cpu_port_config)(struct dsa_switch *ds, int port);
 	void (*mac_port_get_caps)(struct dsa_switch *ds, int port,
 				  struct phylink_config *config);
-- 
2.37.2


