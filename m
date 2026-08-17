Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F7C5DF7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9T+8NIUGYBAR6mlNIug3Q6VvqG8vRRPcgCMH1v4erc=; b=GQt5SAeuTuV1TC6D8hHTB5/eCL
	XhrvbWA1kANAPQ32MYUpG7Yo5QSIGXXTsX80Ln5Sf9c7W8SHP4AxtGhHK2vuN1MRYqySIhptFwTSP
	J8n50wqVejQOwZv5jVzBCTHrL/YhfSSR3yEKLNZj4uloz17ARhE0mdJPjZckuba9e8+NRw61ffKdF
	QYAShYoJRsX2vidIrISy4Lcjmr0bGtx/ZMr5YZKp3v5pWb/ZZ6nNGN35kJzttlidOrxcMxzovk4rR
	fJ8bULRcMPQRtaMrvezNfLJr6Sqgi2QXoHPTA8JytVo+HlR53UjBWHO7+9CqkT++TUbVS+TCYpctU
	dhPXWmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsag-00000005elq-0bLR;
	Mon, 17 Aug 2026 08:21:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsab-00000005ecu-0BzT
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 08:21:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493b966dd74so20231425e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954859; x=1787559659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M9T+8NIUGYBAR6mlNIug3Q6VvqG8vRRPcgCMH1v4erc=;
        b=M3eTHYSolregJEXWCtXrq4pteXr7yVCTEvnX9GQVeIY4AWeYT4Kw849MkD7LhX+Rss
         neV15GqtBav4LjyOc3r/H139HR4ycZ5s1WrXkrk7b6i7Q49wUB3TScPlKb0jHFhQl+uh
         se1J2pA+cxv4zVVAuTcu9N2v/ZilHcTve9eLUcNnAZhEG8NxV6Yr9RprjnR9+EIUhXfx
         a+Su0/p19VmMbcNAHpaft079740Oj9Ix/91l2eeJFS2inlnPXH0nsicrNCERJzlMzzXh
         1wcZm3F0V5k3FXBDXmXC8uPTPcbVL3DN8D0S69PlkgFRxtny25HgFP5hh2hSum9AIER3
         K/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954859; x=1787559659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M9T+8NIUGYBAR6mlNIug3Q6VvqG8vRRPcgCMH1v4erc=;
        b=BPGcTtyjD+Tbu7qTv+6sXz2Nf4y4XCeDbIDlsWsmcjrOvA2ltrntzUqGpUZn/ma4Z9
         m3WYB9TbpB1U4kTkjiupBDnXqckphjOVwV9Rh5PTkeNOFtvIz1p2a3u7uTWkcfRCgvZb
         v3vPJSrzTozBpUmulF4LV4PQaqs3fec0FDlUiFNatzVpM36LYxCbxq3CsfZKnOfQNMBi
         viLuNt/aPaW22/WNaIxU59OR3WnCFMDJMJgQiIe4Crh331xGB+/jfGzneDOU7aIUmUeI
         fuilLd3XqL9tge3UkF8MrdfSFdvxCcvMkI5umeNYQ/M4UxiRu9erTiw5wG8fbRRhrlc4
         0XOg==
X-Forwarded-Encrypted: i=1; AHgh+RpCprqSvn1ScSx9hR564Q0pZuNVCWL8DRFxcM/jzVuM4bdVhOgEgehGbw3lZhuzqKGSemQelEzCm/p5iB4DtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEcmwrNVrJ7s3ja548z3KAvbNQscXd5muffeIEO/nG+5VWOzVL
	igFNZdHeczBLtUwRUbQh5djM0Ryh4+r9qPfsPUX3UL9JXK21vDJ62FBq
X-Gm-Gg: AR+sD10PjTe+6ne+xta1oQgr0gg0IZHOg+ahW8HlODU9vdMBnsOcHZmUk+HD0MrHfey
	maR0Nm+LyngsHhbF8gb1lJ1XE31kqqaSb1aZOoj2AfFluJPn9Ce9KpwchkVPoMKe/DE00lwhNOX
	5g6dY21EWnlGkoxp+yEQtckTOCD+lO/24vvto4ccQPKyBNzofM7fi1yvSSAngxUGrgAmfIMK/MX
	KzehkybjVFmFYEO76Ll6qGIjQbeo1j1TBDv/A4CzzEuv1Ga32s3A3uIUPTtKEv26FqCPWJKZlae
	NCehPH0ctx5PnJQtHoeZWHaCYUI76f/E/vniU72oziD3bUpzZhuQxrwRt7t4BjQEPOpvtE4Xgh+
	w5hZnZ5LjJRcZ8DA5nd0OhlCfFz3uRunXE3iksvyjPzv6LD9CYRLl8dD3stinmcNAUPojxsLIgq
	oeevGAS39UGWywih3aGHT/Z/ZcVD5stwz42DWMTiQyUjSRkjkWVozw6jgdC6s+Eo4I9hrbhcEVs
	unFtmMp1PgzHtluSvUd5k3keTRQrA21cZnRyQDHR4Pjmwug267i+nIXDAJKHO59E3s=
X-Received: by 2002:a05:600c:4f52:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4998793dafcmr362760695e9.7.1786954859332;
        Mon, 17 Aug 2026 01:20:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 08/10] net: dsa: mt7530: move MDIO bus locking into regmap
Date: Mon, 17 Aug 2026 10:20:30 +0200
Message-ID: <20260817082034.20326-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012101_130219_084C3672 
X-CRM114-Status: GOOD (  14.43  )
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

From: Daniel Golle <daniel@makrotopia.org>

The switch register regmap was created with .disable_locking = true,
relying on callers to manually lock the MDIO bus. Move the locking
into the regmap using .lock/.unlock callbacks, matching the PCS
regmaps that already do this. This allows any code path reaching the
regmap to be automatically protected.

With regmap handling bus locking, the manual mt7530_mutex_lock/unlock
wrappers in mt7530_write(), _mt7530_read(), mt7530_rmw() and
mt7530_port_change_mtu() become redundant and are removed.

The MT7531 indirect PHY access functions need serialization of their
multi-step register sequences, but no longer need to hold bus->mdio_lock
across the whole operation. Switch them to reg_mutex.

core_write()/core_rmw() are the only remaining callers of
mt7530_mutex_lock(). They access TRGMII core PHY registers via the
clause 22 MMD indirect protocol -- a separate register space that
bypasses regmap and needs manual bus->mdio_lock protection.

Generated using the following semantic patch:

// Remove mt7530_mutex_lock/unlock around single regmap-based calls.
@@
expression priv, reg, val;
@@
 {
-	mt7530_mutex_lock(priv);
-
 	mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
 }

@@
expression priv, reg, mask, set;
@@
 {
-	mt7530_mutex_lock(priv);
-
 	regmap_update_bits(priv->regmap, reg, mask, set);
-
-	mt7530_mutex_unlock(priv);
 }

@@
expression p;
identifier val;
@@
 {
-	u32 val;
-	mt7530_mutex_lock(p->priv);
-	val = mt7530_mii_read(p->priv, p->reg);
-	mt7530_mutex_unlock(p->priv);
-	return val;
+	return mt7530_mii_read(p->priv, p->reg);
 }

@@
expression priv;
@@
-	mt7530_mutex_lock(priv);
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	...
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
-	mt7530_mutex_unlock(priv);

@@
expression priv, port;
@@
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);

@@
expression priv;
@@
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530-mdio.c |  9 ++++++---
 drivers/net/dsa/mt7530.c      | 36 ++++++-----------------------------
 2 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 784dd58a7158..422f785d2143 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -148,12 +148,14 @@ static const struct regmap_config regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 	.max_register = MT7530_CREV,
-	.disable_locking = true,
+	.lock = mt7530_mdio_regmap_lock,
+	.unlock = mt7530_mdio_regmap_unlock,
 };
 
 static int
 mt7530_probe(struct mdio_device *mdiodev)
 {
+	struct regmap_config rc = regmap_config;
 	struct mt7530_priv *priv;
 	struct device_node *dn;
 	int ret;
@@ -207,8 +209,9 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->io_pwr);
 	}
 
-	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
-					&regmap_config);
+	rc.lock_arg = &priv->bus->mdio_lock;
+	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus,
+					priv, &rc);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..d01772cfe3a2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -188,29 +188,13 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 static int
 mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
-	int ret;
-
-	mt7530_mutex_lock(priv);
-
-	ret = mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
-
-	return ret;
+	return mt7530_mii_write(priv, reg, val);
 }
 
 static u32
 _mt7530_read(struct mt7530_dummy_poll *p)
 {
-	u32 val;
-
-	mt7530_mutex_lock(p->priv);
-
-	val = mt7530_mii_read(p->priv, p->reg);
-
-	mt7530_mutex_unlock(p->priv);
-
-	return val;
+	return mt7530_mii_read(p->priv, p->reg);
 }
 
 static u32
@@ -226,11 +210,7 @@ static void
 mt7530_rmw(struct mt7530_priv *priv, u32 reg,
 	   u32 mask, u32 set)
 {
-	mt7530_mutex_lock(priv);
-
 	regmap_update_bits(priv->regmap, reg, mask, set);
-
-	mt7530_mutex_unlock(priv);
 }
 
 static void
@@ -597,7 +577,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -645,7 +625,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -681,7 +661,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -717,7 +697,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -1452,8 +1432,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	if (!dsa_is_cpu_port(ds, port))
 		return 0;
 
-	mt7530_mutex_lock(priv);
-
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	val &= ~MAX_RX_PKT_LEN_MASK;
 
@@ -1473,8 +1451,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
 
-	mt7530_mutex_unlock(priv);
-
 	return 0;
 }
 
-- 
2.53.0


