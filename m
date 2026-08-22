Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281B2C5DF9C
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2026 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2c7J7LZN/1f9QeAHF6h+0OR2xOM+K9B3aoUShYmicA=; b=j3MNGjz9+hKSWDATf8y5rTTpTU
	5Wu3HhtYZb68k4XNdPoewycFZmBkqWdhV0pNUqGC2KXf0HYRVHO2bB4tJJ9gi5gAW3kNrZhLO+SIY
	yc7sHSqC0RjIY9N+55DXmlWzOjjpOazab1zSIJh/ntQ00HizHwtU1+O02oowK8NTFcC9aXHJDfa5o
	onfwYSe9hydWo6A0sTS1G7boefMkPk/s0DqZwhJoHX0K/YSSbOQV2ykohdUSQ0uE5h7mtg9J87BVE
	N1T3oJ7hCgROd1zujaAKHwmRtQnP9MUydUUU5p6CVw56C58GUTjE0pAcnxXsXskC+1/6GfQd72K8x
	OmHlYFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrm4-0000000Ekx7-3O8L;
	Sat, 22 Aug 2026 19:53:04 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrm0-0000000EktQ-0uXV
	for linux-mediatek@lists.infradead.org;
	Sat, 22 Aug 2026 19:53:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c214e625259so300871866b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Aug 2026 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787428377; x=1788033177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2c7J7LZN/1f9QeAHF6h+0OR2xOM+K9B3aoUShYmicA=;
        b=kmy5gR/lYIHa/8PUU4TtfnltKK4gwsAQdmcrdHAfJUaHigwp6KktYW0GDaqsx607R3
         OxgyqcO3lWZgu3WfenUxQfjNCCIYkSpq42H2vR3qFQvtH0to8o2hm0sY1JST5dARRNa3
         yOrPbk7dQXbadmXHbsJAiH5+LkUraT6317I+cckvKmX+UBywGBW09WE7pU3G1h1e3O40
         aU1dMR/SdGaI1QiY6K4RDVlGz40WfyJCcH/xHRezTmnLEC+07u82ai06w2TEv/wTuoMM
         CMYLO3ZedGFFwztpZbhnSOy+jH5jDUo+IXK3wdUiSt7GEfYvUBzBua6kiOP5MY+M9Nfp
         N0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787428377; x=1788033177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2c7J7LZN/1f9QeAHF6h+0OR2xOM+K9B3aoUShYmicA=;
        b=DjhCOmIykaHYDSou7tn/jv9x9RFPdWiJW1Iic1myyADhi5TsR+zby3qBLik/fZws5S
         JQc2VPmqK65GRh1s3zdjdCoogzSCgWVI7qY0Uxr9SOUpbHbKZ4HKn7V4jEbh8gKXdBpE
         rpMa6AE18BB4Y+ezQvzU9vE/5+Tyn+s/GXQU2qPnzJtoZRa4GgxQCzAZhFoCbaM399bq
         1C6YouSNb2j2UETV7o6Y2suUbLvoxooJw+dMHEAiWYs71BjIlpEsVq6ql4n5vQUTPNMo
         h4w1AX8ujv/vdEtIB0u80YTd1Bv//HNOTc8KRiRhgwBeqnpO/a+5MB+/mitaiA6wS4Rc
         pnqg==
X-Forwarded-Encrypted: i=1; AHgh+RrYEKC4hRlTL246+0yJ3Or8wZxj38T9fW6Hd8sNYXElRHMXfdcKkXOiXrQSZsaos/fLIES2t+FQ+hZeF7frWg==@lists.infradead.org
X-Gm-Message-State: AFuF++k7NuZ1uIPFTcUaLkHbCLPrSi7isUWeXUgVWBLUK4QDboArlqWH
	6BgXNXJVKOA5WqjRk85IofmzR3R5c6lixnzLZE3SCNK2TK/cZ1bqBNWJO8vUBO9WIek=
X-Gm-Gg: AR+sD11fEebl0ed7iVjsDSA0qwY9BfEzISslTljv6gEG7QgyxL5wqsWmthsi9D47jgg
	t4NUyefirM99/Rgf9p/eMUFJFnt+ghp6JUsJavxQnPUsWhSMNvEs1LpWpvcKKVC4viS/8teuHyU
	1lFslMViVlCr/YpiYjztxDr/gEM1J/tm/6wg87Sc5qUEbh/TCIqc6yhGAOvlN4Ca5z06BPk76Yk
	NMlpL9OkCqH44fsCZ3gFjUVINRI1hIJX4r6dMBbFo05oEw/Vfl+pdO03HMKMANJAun9Z0goROOa
	zyKrYgB6ULoGE6hv+kI7Vh69qn8uz5EEnfbjr5Lirxd3eW/DzR33j1i2+CBkTW5Xx+MOb4bIT+N
	lxzhiBhjxTvPFdDOmtvbpN2aFZsV8lMF7XWS/swC4OmMRdDWOuor/3IChrpMv12V3u9HzprCNny
	HBNIHOR+UlZKLn5KLqdMD0C1fT48pUskwCDZUx3fjDLP62wZaRxFIPxv0RqzH6oQzqx9Zi33utq
	HvngOIP
X-Received: by 2002:a17:907:97d5:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c246a33ea8bmr1572189166b.8.1787428376741;
        Sat, 22 Aug 2026 12:52:56 -0700 (PDT)
Received: from ownbook.home.lex.la ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm475032666b.0.2026.08.22.12.52.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 12:52:56 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Sat, 22 Aug 2026 22:52:51 +0300
Message-ID: <20260822195252.2934-2-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822195252.2934-1-f@lex.la>
References: <20260822195252.2934-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_125300_307101_8FBF6DC9 
X-CRM114-Status: GOOD (  28.05  )
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

mt753x_phylink_get_caps() fills in config->lpi_capabilities and
config->lpi_timer_default, but never populates config->lpi_interfaces.
phylink only treats a MAC as supporting phylink managed EEE when the
tx_lpi methods are implemented and both the LPI capabilities and the
LPI interfaces are non-empty, so EEE is unavailable on every port:

  # ethtool --show-eee lan1
  Cannot get EEE settings: Not supported

even though the driver implements mac_enable_tx_lpi() and
mac_disable_tx_lpi() and reads the LPI threshold back out of PMEEECR.
Since the tx_lpi methods are implemented, phylink takes the other
branch and calls phy_disable_eee(), which fills eee_disabled_modes, so
userspace cannot enable EEE either.

Only the first half of what commit 06dfcd4098cf ("net: dsa: mt7530: fix
enabling EEE on MT7531 switch on all boards") arranged therefore
survives. It left EEE off out of the box on purpose, by having
mt7531_setup() clear the switch PHYs' EEE advertisement, and ended
"With this change, EEE can now be enabled using ethtool". It cannot be,
any more.

Copy the supported interfaces into lpi_interfaces. This requires moving
the mac_port_get_caps() call ahead of the EEE block, since that is what
populates supported_interfaces - copying it beforehand would copy an
empty bitmap.

LPI stays off by default. The driver does not set eee_enabled_default,
so phylink leaves tx_lpi_enabled false, and phy_check_link_status()
computes enable_tx_lpi as tx_lpi_enabled && eee_active - nothing
asserts LPI until userspace enables it with ethtool --set-eee. The EEE
advertisement is the part that does change: phylink no longer takes the
phy_disable_eee() branch, so a PHY that advertises EEE out of reset
advertises it again and the link may negotiate EEE. MT7531's five
internal PHYs are the exception, as mt7531_setup() zeroes
MDIO_AN_EEE_ADV before the switch MDIO bus is registered, so
phy_probe() reads an empty advertisement and records eee_cfg.eee_enabled
as false. Nothing does that for an external PHY on port 5 or 6, or on
the other mt753x variants, EN7528 aside - see below.

This also makes lpi_capabilities take effect for the first time, so
correct its value in the same change. PMCR only has force bits for
100 Mbps (PMCR_FORCE_EEE100) and 1 Gbps (PMCR_FORCE_EEE1G), and PMSR
only reports EEE state for those two speeds, so the MAC cannot signal
LPI at 2.5 Gbps: drop MAC_2500FD. Absence from the header is weak
evidence on its own, so for what it is worth, the Airoha AN8855 DSA
driver - posted but not merged [1] - describes a PMCR of the same shape
that does carry AN8855_PMCR_FORCE_EEE2P5G and AN8855_PMCR_FORCE_EEE5G
next to the 1 Gbps and 100 Mbps bits. Correcting the value here rather
than in a separate patch changes nothing observable: while
lpi_interfaces was empty, lpi_capabilities never reached
phy->advertising_eee, so no state ever claimed 2.5 Gbps LPI.

2500BASE-X has to come out of lpi_interfaces as well, because
lpi_capabilities cannot express it: it masks the PHY's EEE
advertisement, a media side property, and never gates LPI activation on
the MAC side speed. phylink raises the MAC speed to the interface
maximum when the PHY rate matches (RATE_MATCH_PAUSE in
phylink_link_up()), so a 1 Gbps media link behind a rate matching 2.5G
PHY would otherwise arm LPI while the MAC runs at 2.5 Gbps. What that
costs is limited to setups that keep the MAC on 2500BASE-X, where there
are no LPI bits to use anyway; a PHY that switches the interface down
to SGMII or 1000BASE-X keeps LPI, as those stay in the mask.

For the same reason, skip ports that support neither 100 Mbps nor
1 Gbps: on MT7988, EN7581 and AN7583, port 6 is 10 Gbps only, and it
shares PHY_INTERFACE_MODE_INTERNAL with the 1 Gbps user ports, so the
interface mask alone cannot tell them apart.

EEE remains unavailable on EN7528, whose GPHYs do not negotiate it
reliably. Both LPI bitmaps stay empty there, so phylink keeps taking
the phy_disable_eee() branch and its advertisement stays off.

[1] https://lore.kernel.org/r/20250315154407.26304-14-ansuelsmth@gmail.com

Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Two pre-existing things this patch makes live, neither addressed here:

- The unit of LPI_THRESH is still unspecified, as the comment above
  lpi_timer_default says. With EEE reachable again, ethtool reports
  that raw value as microseconds and writes userspace values back
  unconverted, while mtk_eth_soc treats a structurally identical field
  as milliseconds (DIV_ROUND_UP(timer, 1000)). Reading the default back
  reproduces the same raw value whatever the unit is, but a timer set
  from userspace in microseconds would be off by 1000 if the field is
  in milliseconds. On an MT7531 board ethtool now reports 30 for a
  switch port, which is the raw LPI_THRESH field; whether the hardware
  means 30 microseconds is exactly the open question. Does anyone have
  the datasheet answer?

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right;
  deliberately not bundled into a fix.
 drivers/net/dsa/mt7530.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..17265eb79008 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3172,23 +3172,37 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
+	priv->info->mac_port_get_caps(ds, port, config);
+
 	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
 	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
 	 * link with dropped frames. Leave the LPI capabilities empty so that
 	 * phylink disables EEE on these PHYs and refuses to enable it from
-	 * userspace.
+	 * userspace. Ports that run at neither 100 Mbps nor 1 Gbps are left
+	 * empty too, as PMCR has no force bit that would apply to them.
 	 */
-	if (priv->id != ID_EN7528) {
+	if (priv->id != ID_EN7528 &&
+	    config->mac_capabilities & (MAC_100FD | MAC_1000FD)) {
 		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
 
-		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+		/* PMCR only has force bits for 100 Mbps and 1 Gbps. That also
+		 * rules out 2500BASE-X, which lpi_capabilities cannot express:
+		 * it masks the PHY's EEE advertisement, a media side property,
+		 * and never gates LPI activation on the MAC side speed. The
+		 * MAC side of 2500BASE-X is never below 2.5 Gbps, not even
+		 * when a rate matching PHY drops the media to 1 Gbps.
+		 */
+		config->lpi_capabilities = MAC_100FD | MAC_1000FD;
+		phy_interface_copy(config->lpi_interfaces,
+				   config->supported_interfaces);
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    config->lpi_interfaces);
+
 		/* tx_lpi_timer should be in microseconds. The time units for
 		 * LPI threshold are unspecified.
 		 */
 		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
 	}
-
-	priv->info->mac_port_get_caps(ds, port, config);
 }
 
 static int mt753x_pcs_validate(struct phylink_pcs *pcs,
-- 
2.55.0


