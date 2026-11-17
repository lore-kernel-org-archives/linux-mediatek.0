Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED758606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RvpSWoMe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g1Wti88o;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIr/+LlH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qdzwW9sXL49uPBuMOv4Ook/F55A8b545MKr0gm+X/30=; b=RvpSWoMeGckq7/
	KDrg/Lzub+yoVJwpC9WfmGSXmCXJDVrs5BDSmOE9MflIkaOXtSPMh8RaEHOXioVbIC8WGBlmrrqML
	Yb1cGIq4Auq1PmSiHm/BAb0S4ZieNlzEo2Ff1qDnrE1XO9quBSfD+ab3A4GdCXKbhvPQ8LatN/Y3d
	fKFoqi1j9zlSFEYGxGVe2xM1/Uu6R7hKUkxxBUCu58OpohmyxdjBDqmwlrGf5tP3E0ptuHTzKn6uW
	nDHbGIThyg2KBXgM+Ct66QQQSFxzS2hv/7ufptoSVvgD5XQ3UQ4MJmQ+4VrwYBTydljCU1LipTFt4
	fSHQYoZwpZINMxJpDYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIV1-00000005gRl-2Gwz;
	Tue, 17 Nov 2026 12:41:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUF-00000005fTG-1x9N
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Nov 2026 12:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=qdzwW9sXL49uPBuMOv4Ook/F55A8b545MKr0gm+X/30=; b=g1Wti88o9BGHpK1uOQfNvUulGj
	x9YO+Gmz2eQglaxB5hz1jYWanxCYfcZrZ9NmLhmmXyujAj304CPCiG/xwjvju3Olkd3LdFYelhvZr
	UZy4s+DpEaBWJX3fJAi1iX5oNZeX1U2KpKpBgeAUY2JeFw3MQBFeZFjZjK3pRJaYoEfJwPJWxXp0E
	RCZ36EQHCfSnnBe0hBWw6tWDRumteTdGu+Sqr3IZTuT89Pkpxzi1d+fqnrRbHqQjN/jpwBPZ2xr+v
	V2D0ANXuTBwRQbVhN75y7ibDxbT92Ji+TxXJesHXOlwZ4oO0wGdYgk+jbUENYbteZDwkntorUVfgc
	dbZLe3sg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIU4-0000000EwzF-0lJM
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso39067335e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919223; x=1795524023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qdzwW9sXL49uPBuMOv4Ook/F55A8b545MKr0gm+X/30=;
        b=DIr/+LlH0kDO5njVDyAWPIrxqMU4I1/qE8tBE3mEGftzABL1uCqIg0N35hwsVxkvJ7
         YApyMAjWwBwL/GA3Ad6v6OFqRS0Z3tK45/+9RxErngBRkrmTEt+qK0dg4PEhOG3j2h3k
         Ftg1V8xj9jed6E/kz8Dh36heXx0Hg6DYE/VpVlT8hBIXIzcaZQIfz7Ut9/GSOMMclPqy
         4CHR32NrX1FqR77LI9Z150LhuOT4FXkeA79Mh8NoiJaUvpDbVf1hyNZhUXivmcRbFm8S
         tJhnQKOA5/ryK66p1pr+csElWdVYnbVPyyjXbFfbYvk7tikewNNeUBFa4hqXI6MWBNOs
         Eg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919223; x=1795524023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qdzwW9sXL49uPBuMOv4Ook/F55A8b545MKr0gm+X/30=;
        b=Lcdme41n4zHO7+nOjcT9T1/Sw+rzuKNZ26uBiR9pr/AQplNC685zxU7zdC7e5IcpT4
         XJi18mPja0loJJg2iEAzq5FP2qOoOkF1+XxekIy9d/ujidzQitJ0WyemmtcVyA32QWyY
         7NAXR0e+ukrGLGLboQeNBwej7mH9T4wN3Jdtabo816W8v6FnU76cEbDShiBfuUoElbaO
         IxUrNPVtkg6JLJIwDuSKYhtAH55c6PwI9iWfBmvDFWazuKMYAA2yZUGHjPAXc1QYlgSU
         GSWt6AZ7T8be0wN6i1imUc6uf1GKokwe+5ZcPAzI7MIzePk9cw1YoePDTcHs0zGzCIUP
         43Ew==
X-Forwarded-Encrypted: i=1; AL+hErEqddHzcMlo1wht7JEsp9rkaaR9Kdq3uwbgscERVG7OMBkXdKJYOZWS1eheYscpklMuFHFtzS7JlQiek/sRow==@lists.infradead.org
X-Gm-Message-State: APuU4Z/NPPa1zbZyUMZGzIdYfABEG/aDCKD6bBtdps8CsereN1EzWBYl
	6ybuo/9DAAf6lqcDUHK7DwG2gJwbaSceeZ7l292Yz4NMzoLHZIsW0qxs
X-Gm-Gg: AYBFou3LtSXWgRCJsO+1F1BlzXRKJs9uaQ5xWFNu+8zqY0hDpotoVbOOqtP/ukjJSKy
	tzTIFDQPY/XzyixVPGdvPbfecvcN12KSCrng3lcYZmDg5hj2/cQbXM1PqDgprsw03g3pw/vUU4K
	pWebr6OMSGmtM1v2sa0gbn8V2bfgXV1gv9/I9u9MrIiKqerTWXC+lHNx+Jck3C8eIuFD/fY2mes
	+DPn/t+sEMKVU3YcylTf0nUMh2USNqQ13Uob/0YbWyx2IaO8UJajhqwKyQpQ/XMaB6+Nt5M9DsJ
	r44QJfMWobpuI6G/COtbn38OpdiVt/Awf/dYU6NyW3UPrNvYiycESjMfHBoKM4LDvg6zCHBn2Mx
	JvCzBeqRa3ZqNaPmAwnbP6stpxiTLjR7ivNewEDu+Sg1udLAv76wflaKRsXP4NjiV2vY4mS5A9O
	sUBYK4sYTKzksfk11eQZOcKJMvEIprBQ49TxYWvlaZikSMEY4bfdqoS8ojSLFgclpl5F9E9l+sm
	5b4t+0csIMWx0Ny9nPRSSD8x8+nzMPgro1mVrNFZMct60m5z9XKZukNdQb4PNNw5R1KOfDn779F
	G/31amMqh6dveqVHlUBOjLTs86l4Mz8Hwi5olXpVZm/P26nu5YjO6N+IRKqhTWtFmHELRAWdwFd
	scR48vZKk5iA63T6dGGyXRLEuinBaRgp4DDbf2cpU1gRgCxSKrxJHHok=
X-Received: by 2002:a05:600c:4e01:b0:4bb:71c1:3ca6 with SMTP id 5b1f17b1804b1-4bb71c13d09mr130767805e9.21.1794919222461;
        Tue, 17 Nov 2026 04:40:22 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:21 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 07/15] net: phylink: add capabilities helpers and track modified advertising
Date: Tue, 17 Nov 2026 13:39:47 +0100
Message-ID: <20261117123956.11981-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124024_626791_2A9C9CA8 
X-CRM114-Status: GOOD (  27.40  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation for PCS release/late attach, it's needed to introduce a
helpers to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce dedicated advertising variables in phylink
struct and update it when the new phylink_update_capabilities() is called
or advertise is updated in link_config.

In phylink struct the new advertising will contain the full advertising
bits right after a phylink_validate and the new user_disabled_advertising
will be the mask of modes that were disabled from an ethtool ksettings
(with the parsing done in phylink_update_user_disabled_advertising()).

This double reference is needed to account case when a PCS gets removed and
attached again to preserve user-defined advertising rules.

phylink_update_capabilities() will calculate the new supported modes and
the new capabilities, update the full advertising in phylink and restore
the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

phylink_update_mac_pause_capabilities() is updated to use the new
phylink_update_capabilities() to account for user-disabled advertising
modes and update the full advertising in phylink.

Some rework were needed in the context of fixed-link, In-Band, PHY and SFP
to permit detaching the supported and link_config advertising parsing
outside the original config.

SFP logic is changed to not restrict the sfp_support mask in place but
instead propagate the restricted mask to phylink_sfp_set_config()
similar to how it's done for the PHY codepath.
This is needed to always have an unmodified source to reparse the
capabilities.

PHY advertising is changed to save the original advertising before
restricting it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 607 +++++++++++++++++++++++++-------------
 1 file changed, 397 insertions(+), 210 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 88280866c19a..921c227a5b3c 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,8 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(user_disabled_advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -85,6 +87,8 @@ struct phylink {
 	/* Serialize updates to pl->phydev with phylink_resolve() */
 	struct mutex phydev_mutex;
 	struct phylink_link_state phy_state;
+	/* PHY advertisement before restricting it to MAC/PCS capabilities */
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_advertising);
 	unsigned int phy_ib_mode;
 	struct work_struct resolve;
 	unsigned int pcs_neg_mode;
@@ -724,6 +728,79 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static int __phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
+				  unsigned long *supported,
+				  struct phylink_link_state *state)
+{
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
+
+	/* If the PHY provides a bitmap of the interfaces it will be using
+	 * depending on the negotiated media speeds, use this to validate
+	 * which ethtool link modes can be used.
+	 */
+	if (!phy_interface_empty(phy->possible_interfaces)) {
+		/* We only care about the union of the PHY's interfaces and
+		 * those which the host supports.
+		 */
+		phy_interface_and(interfaces, phy->possible_interfaces,
+				  pl->supported_interfaces);
+
+		if (phy_interface_empty(interfaces)) {
+			phylink_err(pl, "PHY has no common interfaces\n");
+			return -EINVAL;
+		}
+
+		if (phy_on_sfp(phy)) {
+			/* If the PHY is on a SFP, limit the interfaces to
+			 * those that can be used with a SFP module.
+			 */
+			phy_interface_and(interfaces, interfaces,
+					  phylink_sfp_interfaces);
+
+			if (phy_interface_empty(interfaces)) {
+				phylink_err(pl, "SFP PHY's possible interfaces becomes empty\n");
+				return -EINVAL;
+			}
+		}
+
+		phylink_dbg(pl, "PHY %s uses interfaces %*pbl, validating %*pbl\n",
+			    phydev_name(phy),
+			    (int)PHY_INTERFACE_MODE_MAX,
+			    phy->possible_interfaces,
+			    (int)PHY_INTERFACE_MODE_MAX, interfaces);
+
+		return __phylink_validate_mask(pl, phy, supported, state,
+					      interfaces);
+	}
+
+	phylink_dbg(pl, "PHY %s doesn't supply possible interfaces\n",
+		    phydev_name(phy));
+
+	/* Check whether we would use rate matching for the proposed interface
+	 * mode.
+	 */
+	state->rate_matching = __phy_get_rate_matching(phy, state->interface);
+
+	/* Clause 45 PHYs may switch their Serdes lane between, e.g. 10GBASE-R,
+	 * 5GBASE-R, 2500BASE-X and SGMII if they are not using rate matching.
+	 * For some interface modes (e.g. RXAUI, XAUI and USXGMII) switching
+	 * their Serdes is either unnecessary or not reasonable.
+	 *
+	 * For these which switch interface modes, we really need to know which
+	 * interface modes the PHY supports to properly work out which ethtool
+	 * linkmodes can be supported. For now, as a work-around, we validate
+	 * against all interface modes, which may lead to more ethtool link
+	 * modes being advertised than are actually supported.
+	 */
+	if (phy->is_c45 && state->rate_matching == RATE_MATCH_NONE &&
+	    state->interface != PHY_INTERFACE_MODE_RXAUI &&
+	    state->interface != PHY_INTERFACE_MODE_XAUI &&
+	    state->interface != PHY_INTERFACE_MODE_USXGMII)
+		state->interface = PHY_INTERFACE_MODE_NA;
+
+	return __phylink_validate(pl, supported, state);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -740,12 +817,51 @@ static void phylink_fill_fixedlink_supported(unsigned long *supported)
 	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported);
 }
 
-static int phylink_parse_fixedlink(struct phylink *pl,
-				   const struct fwnode_handle *fwnode)
+static int phylink_parse_fixedlink_capabilities(struct phylink *pl,
+						struct phylink_link_state *config)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(match) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
 	const struct link_capabilities *c;
+
+	lockdep_assert_held(&pl->state_mutex);
+
+	linkmode_zero(pl->supported);
+	phylink_fill_fixedlink_supported(pl->supported);
+
+	linkmode_copy(config->advertising, pl->supported);
+	__phylink_validate(pl, pl->supported, config);
+
+	linkmode_copy(pl->advertising, config->advertising);
+
+	c = phy_caps_lookup(config->speed, config->duplex,
+			    pl->supported, true);
+	if (c)
+		linkmode_and(match, pl->supported, c->linkmodes);
+
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);
+	linkmode_and(pl->supported, pl->supported, mask);
+
+	phylink_set(pl->supported, MII);
+
+	if (c) {
+		linkmode_or(pl->supported, pl->supported, match);
+		linkmode_or(config->lp_advertising,
+			    config->lp_advertising, match);
+	}
+
+	linkmode_and(config->advertising, config->advertising,
+		     pl->supported);
+	linkmode_copy(pl->advertising, config->advertising);
+
+	return c ? 0 : -EINVAL;
+}
+
+static int phylink_parse_fixedlink(struct phylink *pl,
+				   const struct fwnode_handle *fwnode)
+{
 	struct fwnode_handle *fixed_node;
 	struct gpio_desc *desc;
 	u32 speed;
@@ -817,39 +933,77 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 		phylink_warn(pl, "fixed link specifies half duplex for %dMbps link?\n",
 			     pl->link_config.speed);
 
-	linkmode_zero(pl->supported);
-	phylink_fill_fixedlink_supported(pl->supported);
+	mutex_lock(&pl->state_mutex);
+	ret = phylink_parse_fixedlink_capabilities(pl, &pl->link_config);
+	mutex_unlock(&pl->state_mutex);
+	if (ret)
+		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
+			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
+			     pl->link_config.speed);
 
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	pl->link_config.link = 1;
+	pl->link_config.an_complete = 1;
 
-	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
-			    pl->supported, true);
-	if (c)
-		linkmode_and(match, pl->supported, c->linkmodes);
+	return 0;
+}
 
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);
-	linkmode_and(pl->supported, pl->supported, mask);
+static int phylink_parse_inband_capabilities(struct phylink *pl,
+					     struct phylink_link_state *config)
+{
+	unsigned long caps;
+
+	lockdep_assert_held(&pl->state_mutex);
 
+	linkmode_zero(pl->supported);
 	phylink_set(pl->supported, MII);
+	phylink_set(pl->supported, Autoneg);
+	phylink_set(pl->supported, Asym_Pause);
+	phylink_set(pl->supported, Pause);
 
-	if (c) {
-		linkmode_or(pl->supported, pl->supported, match);
-		linkmode_or(pl->link_config.lp_advertising,
-			    pl->link_config.lp_advertising, match);
-	} else {
-		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
-			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
-			     pl->link_config.speed);
+	switch (config->interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_PSGMII:
+	case PHY_INTERFACE_MODE_QSGMII:
+	case PHY_INTERFACE_MODE_QUSGMII:
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RTBI:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_5GBASER:
+	case PHY_INTERFACE_MODE_25GBASER:
+	case PHY_INTERFACE_MODE_USXGMII:
+	case PHY_INTERFACE_MODE_10G_QXGMII:
+	case PHY_INTERFACE_MODE_10GKR:
+	case PHY_INTERFACE_MODE_10GBASER:
+	case PHY_INTERFACE_MODE_XLGMII:
+	case PHY_INTERFACE_MODE_50GBASER:
+	case PHY_INTERFACE_MODE_LAUI:
+	case PHY_INTERFACE_MODE_100GBASEP:
+		caps = ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
+		caps = phylink_get_capabilities(config->interface, caps,
+						RATE_MATCH_NONE);
+		phylink_caps_to_linkmodes(pl->supported, caps);
+		break;
+
+	default:
+		phylink_err(pl,
+			    "incorrect link mode %s for in-band status\n",
+			    phy_modes(config->interface));
+		return -EINVAL;
 	}
 
-	linkmode_and(pl->link_config.advertising, pl->link_config.advertising,
-		     pl->supported);
+	linkmode_copy(config->advertising, pl->supported);
 
-	pl->link_config.link = 1;
-	pl->link_config.an_complete = 1;
+	if (__phylink_validate(pl, pl->supported, config)) {
+		phylink_err(pl,
+			    "failed to validate link configuration for in-band status\n");
+		return -EINVAL;
+	}
+
+	linkmode_copy(pl->advertising, config->advertising);
 
 	return 0;
 }
@@ -859,7 +1013,7 @@ static int phylink_parse_mode(struct phylink *pl,
 {
 	struct fwnode_handle *dn;
 	const char *managed;
-	unsigned long caps;
+	int ret;
 
 	if (pl->config->default_an_inband)
 		pl->cfg_link_an_mode = MLO_AN_INBAND;
@@ -881,54 +1035,11 @@ static int phylink_parse_mode(struct phylink *pl,
 	}
 
 	if (pl->cfg_link_an_mode == MLO_AN_INBAND) {
-		linkmode_zero(pl->supported);
-		phylink_set(pl->supported, MII);
-		phylink_set(pl->supported, Autoneg);
-		phylink_set(pl->supported, Asym_Pause);
-		phylink_set(pl->supported, Pause);
-
-		switch (pl->link_config.interface) {
-		case PHY_INTERFACE_MODE_SGMII:
-		case PHY_INTERFACE_MODE_PSGMII:
-		case PHY_INTERFACE_MODE_QSGMII:
-		case PHY_INTERFACE_MODE_QUSGMII:
-		case PHY_INTERFACE_MODE_RGMII:
-		case PHY_INTERFACE_MODE_RGMII_ID:
-		case PHY_INTERFACE_MODE_RGMII_RXID:
-		case PHY_INTERFACE_MODE_RGMII_TXID:
-		case PHY_INTERFACE_MODE_RTBI:
-		case PHY_INTERFACE_MODE_1000BASEX:
-		case PHY_INTERFACE_MODE_2500BASEX:
-		case PHY_INTERFACE_MODE_5GBASER:
-		case PHY_INTERFACE_MODE_25GBASER:
-		case PHY_INTERFACE_MODE_USXGMII:
-		case PHY_INTERFACE_MODE_10G_QXGMII:
-		case PHY_INTERFACE_MODE_10GKR:
-		case PHY_INTERFACE_MODE_10GBASER:
-		case PHY_INTERFACE_MODE_XLGMII:
-		case PHY_INTERFACE_MODE_50GBASER:
-		case PHY_INTERFACE_MODE_LAUI:
-		case PHY_INTERFACE_MODE_100GBASEP:
-			caps = ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
-			caps = phylink_get_capabilities(pl->link_config.interface, caps,
-							RATE_MATCH_NONE);
-			phylink_caps_to_linkmodes(pl->supported, caps);
-			break;
-
-		default:
-			phylink_err(pl,
-				    "incorrect link mode %s for in-band status\n",
-				    phy_modes(pl->link_config.interface));
-			return -EINVAL;
-		}
-
-		linkmode_copy(pl->link_config.advertising, pl->supported);
-
-		if (phylink_validate(pl, pl->supported, &pl->link_config)) {
-			phylink_err(pl,
-				    "failed to validate link configuration for in-band status\n");
-			return -EINVAL;
-		}
+		mutex_lock(&pl->state_mutex);
+		ret = phylink_parse_inband_capabilities(pl, &pl->link_config);
+		mutex_unlock(&pl->state_mutex);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -2087,6 +2198,8 @@ static void phylink_update_pause_state(struct phylink *pl, int pause_state)
 	 */
 	linkmode_set_pause(config->advertising, tx_pause,
 			   rx_pause);
+	if (pl->phydev)
+		linkmode_set_pause(pl->phy_advertising, tx_pause, rx_pause);
 
 	manual_changed = (config->pause ^ pause_state) & MLO_PAUSE_AN ||
 			 (!(pause_state & MLO_PAUSE_AN) &&
@@ -2120,6 +2233,142 @@ static void phylink_update_pause_state(struct phylink *pl, int pause_state)
 	}
 }
 
+static void phylink_update_user_disabled_advertising(struct phylink *pl,
+						     const unsigned long *advertising)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled);
+
+	/* Preserve restrictions for modes absent from the current full mask. */
+	linkmode_andnot(disabled, pl->user_disabled_advertising,
+			pl->advertising);
+
+	/* Update restrictions for modes in the current full advertisement. */
+	linkmode_andnot(pl->user_disabled_advertising, pl->advertising,
+			advertising);
+
+	/* Combine the updated restrictions with those preserved above. */
+	linkmode_or(pl->user_disabled_advertising,
+		    pl->user_disabled_advertising, disabled);
+}
+
+static void phylink_sfp_update_capabilities(struct phylink *pl,
+					    unsigned long *supported,
+					    struct phylink_link_state *config,
+					    phy_interface_t interface)
+{
+	enum inband_type inband_type;
+
+	inband_type = phylink_get_inband_type(interface);
+	if (inband_type == INBAND_NONE) {
+		/* If this is the sole interface, and there is no inband
+		 * support, clear the advertising mask and Autoneg bit in
+		 * the support mask. Otherwise, just clear the Autoneg bit
+		 * in the advertising mask.
+		 */
+		if (phy_interface_weight(pl->sfp_interfaces) == 1) {
+			linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+					   supported);
+			linkmode_zero(config->advertising);
+		} else {
+			linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+					   config->advertising);
+		}
+	}
+}
+
+static int phylink_phy_update_capabilities(struct phylink *pl, struct phy_device *phy,
+					   phy_interface_t interface)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+	struct phylink_link_state config;
+	int ret;
+
+	lockdep_assert_held(&pl->phydev_mutex);
+	lockdep_assert_held(&phy->lock);
+	lockdep_assert_held(&pl->state_mutex);
+
+	memset(&config, 0, sizeof(config));
+	linkmode_copy(supported, phy->supported);
+	linkmode_copy(config.advertising, pl->phy_advertising);
+	config.interface = interface;
+
+	ret = __phylink_validate_phy(pl, phy, supported, &config);
+	if (ret) {
+		phylink_warn(pl, "validation of %s with support %*pb and advertisement %*pb failed: %pe\n",
+			     phy_modes(config.interface),
+			     __ETHTOOL_LINK_MODE_MASK_NBITS, phy->supported,
+			     __ETHTOOL_LINK_MODE_MASK_NBITS, config.advertising,
+			     ERR_PTR(ret));
+		return ret;
+	}
+
+	linkmode_copy(pl->supported, supported);
+	linkmode_copy(pl->link_config.advertising, config.advertising);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Restrict the phy advertisement according to the MAC support. */
+	linkmode_copy(phy->advertising, config.advertising);
+
+	return 0;
+}
+
+static void phylink_update_capabilities(struct phylink *pl,
+					struct phylink_link_state *config)
+{
+	if (pl->phydev) {
+		lockdep_assert_held(&pl->phydev_mutex);
+		lockdep_assert_held(&pl->phydev->lock);
+	}
+	lockdep_assert_held(&pl->state_mutex);
+
+	if (pl->phydev) {
+		phylink_phy_update_capabilities(pl, pl->phydev,
+						pl->phy_state.interface);
+		return;
+	}
+
+	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
+		phylink_parse_fixedlink_capabilities(pl, config);
+		goto exit;
+	}
+
+	if (pl->cfg_link_an_mode == MLO_AN_INBAND) {
+		phylink_parse_inband_capabilities(pl, config);
+		goto exit;
+	}
+
+	/* Revalidate the SFP module modes against every available interface. */
+	if (pl->sfp_bus && !pl->phydev && config->interface &&
+	    !phy_interface_empty(pl->sfp_interfaces)) {
+		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+
+		linkmode_copy(supported, pl->sfp_support);
+		linkmode_copy(config->advertising, pl->sfp_support);
+		if (!__phylink_validate_mask(pl, NULL, supported, config,
+					     pl->sfp_interfaces)) {
+			phylink_sfp_update_capabilities(pl, supported, config,
+							config->interface);
+			linkmode_copy(pl->supported, supported);
+			linkmode_copy(pl->advertising, config->advertising);
+		}
+
+		goto exit;
+	}
+
+	/* No media is attached yet. Recalculate the generic capabilities. */
+	linkmode_fill(pl->supported);
+	linkmode_copy(config->advertising, pl->supported);
+	__phylink_validate(pl, pl->supported, config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, config->advertising);
+
+exit:
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(config->advertising,
+			pl->advertising, pl->user_disabled_advertising);
+}
+
 /**
  * phylink_update_mac_pause_capabilities() - Dynamically update MAC pause
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2132,6 +2381,7 @@ static void phylink_update_pause_state(struct phylink *pl, int pause_state)
 void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac_pause)
 {
 	struct phylink_link_state *config = &pl->link_config;
+	struct phy_device *phydev;
 	unsigned long old_pause;
 	int pause_state;
 
@@ -2146,20 +2396,16 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	if (old_pause == mac_pause)
 		return;
 
+	mutex_lock(&pl->phydev_mutex);
+	phydev = pl->phydev;
+	if (phydev)
+		mutex_lock(&phydev->lock);
 	mutex_lock(&pl->state_mutex);
 
 	pl->config->mac_capabilities &= ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
 	pl->config->mac_capabilities |= mac_pause;
 
-	phylink_set(pl->supported, Pause);
-	phylink_set(pl->supported, Asym_Pause);
-
-	if (pl->phydev)
-		linkmode_and(pl->supported, pl->supported, pl->phydev->supported);
-	else if (pl->sfp_bus)
-		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
-
-	__phylink_validate(pl, pl->supported, config);
+	phylink_update_capabilities(pl, config);
 
 	pause_state = config->pause;
 
@@ -2171,6 +2417,9 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	}
 
 	mutex_unlock(&pl->state_mutex);
+	if (phydev)
+		mutex_unlock(&phydev->lock);
+	mutex_unlock(&pl->phydev_mutex);
 
 	phylink_update_pause_state(pl, pause_state);
 }
@@ -2259,6 +2508,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2282,9 +2533,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	mutex_lock(&pl->state_mutex);
+	phylink_update_capabilities(pl, &pl->link_config);
+	mutex_unlock(&pl->state_mutex);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
@@ -2417,84 +2668,9 @@ static void phylink_phy_change(struct phy_device *phydev, bool up)
 		    phydev->enable_tx_lpi ? "" : "no");
 }
 
-static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
-				unsigned long *supported,
-				struct phylink_link_state *state)
-{
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-
-	/* If the PHY provides a bitmap of the interfaces it will be using
-	 * depending on the negotiated media speeds, use this to validate
-	 * which ethtool link modes can be used.
-	 */
-	if (!phy_interface_empty(phy->possible_interfaces)) {
-		/* We only care about the union of the PHY's interfaces and
-		 * those which the host supports.
-		 */
-		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->supported_interfaces);
-
-		if (phy_interface_empty(interfaces)) {
-			phylink_err(pl, "PHY has no common interfaces\n");
-			return -EINVAL;
-		}
-
-		if (phy_on_sfp(phy)) {
-			/* If the PHY is on a SFP, limit the interfaces to
-			 * those that can be used with a SFP module.
-			 */
-			phy_interface_and(interfaces, interfaces,
-					  phylink_sfp_interfaces);
-
-			if (phy_interface_empty(interfaces)) {
-				phylink_err(pl, "SFP PHY's possible interfaces becomes empty\n");
-				return -EINVAL;
-			}
-		}
-
-		phylink_dbg(pl, "PHY %s uses interfaces %*pbl, validating %*pbl\n",
-			    phydev_name(phy),
-			    (int)PHY_INTERFACE_MODE_MAX,
-			    phy->possible_interfaces,
-			    (int)PHY_INTERFACE_MODE_MAX, interfaces);
-
-		return phylink_validate_mask(pl, phy, supported, state,
-					     interfaces);
-	}
-
-	phylink_dbg(pl, "PHY %s doesn't supply possible interfaces\n",
-		    phydev_name(phy));
-
-	/* Check whether we would use rate matching for the proposed interface
-	 * mode.
-	 */
-	state->rate_matching = phy_get_rate_matching(phy, state->interface);
-
-	/* Clause 45 PHYs may switch their Serdes lane between, e.g. 10GBASE-R,
-	 * 5GBASE-R, 2500BASE-X and SGMII if they are not using rate matching.
-	 * For some interface modes (e.g. RXAUI, XAUI and USXGMII) switching
-	 * their Serdes is either unnecessary or not reasonable.
-	 *
-	 * For these which switch interface modes, we really need to know which
-	 * interface modes the PHY supports to properly work out which ethtool
-	 * linkmodes can be supported. For now, as a work-around, we validate
-	 * against all interface modes, which may lead to more ethtool link
-	 * modes being advertised than are actually supported.
-	 */
-	if (phy->is_c45 && state->rate_matching == RATE_MATCH_NONE &&
-	    state->interface != PHY_INTERFACE_MODE_RXAUI &&
-	    state->interface != PHY_INTERFACE_MODE_XAUI &&
-	    state->interface != PHY_INTERFACE_MODE_USXGMII)
-		state->interface = PHY_INTERFACE_MODE_NA;
-
-	return phylink_validate(pl, supported, state);
-}
-
 static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 			       phy_interface_t interface)
 {
-	struct phylink_link_state config;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	char *irq_str;
 	int ret;
 
@@ -2507,18 +2683,17 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	 */
 	phy_support_asym_pause(phy);
 
-	memset(&config, 0, sizeof(config));
-	linkmode_copy(supported, phy->supported);
-	linkmode_copy(config.advertising, phy->advertising);
-	config.interface = interface;
+	mutex_lock(&pl->phydev_mutex);
+	mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
+
+	linkmode_copy(pl->phy_advertising, phy->advertising);
 
-	ret = phylink_validate_phy(pl, phy, supported, &config);
+	ret = phylink_phy_update_capabilities(pl, phy, interface);
 	if (ret) {
-		phylink_warn(pl, "validation of %s with support %*pb and advertisement %*pb failed: %pe\n",
-			     phy_modes(config.interface),
-			     __ETHTOOL_LINK_MODE_MASK_NBITS, phy->supported,
-			     __ETHTOOL_LINK_MODE_MASK_NBITS, config.advertising,
-			     ERR_PTR(ret));
+		mutex_unlock(&pl->state_mutex);
+		mutex_unlock(&phy->lock);
+		mutex_unlock(&pl->phydev_mutex);
 		return ret;
 	}
 
@@ -2531,19 +2706,11 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 		     dev_name(&phy->mdio.dev), phy->drv->name, irq_str);
 	kfree(irq_str);
 
-	mutex_lock(&pl->phydev_mutex);
-	mutex_lock(&phy->lock);
-	mutex_lock(&pl->state_mutex);
 	pl->phy_state.interface = interface;
 	pl->phy_state.pause = MLO_PAUSE_NONE;
 	pl->phy_state.speed = SPEED_UNKNOWN;
 	pl->phy_state.duplex = DUPLEX_UNKNOWN;
 	pl->phy_state.rate_matching = RATE_MATCH_NONE;
-	linkmode_copy(pl->supported, supported);
-	linkmode_copy(pl->link_config.advertising, config.advertising);
-
-	/* Restrict the phy advertisement according to the MAC support. */
-	linkmode_copy(phy->advertising, config.advertising);
 
 	/* If the MAC supports phylink managed EEE, restrict the EEE
 	 * advertisement according to the MAC's LPI capabilities.
@@ -3403,6 +3570,7 @@ static bool phylink_validate_pcs_inband_autoneg(struct phylink *pl,
 int phylink_ethtool_ksettings_set(struct phylink *pl,
 				  const struct ethtool_link_ksettings *kset)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(requested_advertising);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
 	const struct link_capabilities *c;
 	struct phylink_link_state config;
@@ -3411,6 +3579,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 
 	if (pl->phydev) {
 		struct ethtool_link_ksettings phy_kset = *kset;
+		int ret;
 
 		linkmode_and(phy_kset.link_modes.advertising,
 			     phy_kset.link_modes.advertising,
@@ -3434,7 +3603,15 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 		 *   the presence of a PHY, this should not be changed as that
 		 *   should be determined from the media side advertisement.
 		 */
-		return phy_ethtool_ksettings_set(pl->phydev, &phy_kset);
+		ret = phy_ethtool_ksettings_set(pl->phydev, &phy_kset);
+		if (!ret) {
+			mutex_lock(&pl->state_mutex);
+			linkmode_copy(pl->phy_advertising,
+				      phy_kset.link_modes.advertising);
+			mutex_unlock(&pl->state_mutex);
+		}
+
+		return ret;
 	}
 
 	config = pl->link_config;
@@ -3492,6 +3669,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 	 */
 	linkmode_mod_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, config.advertising,
 			 kset->base.autoneg == AUTONEG_ENABLE);
+	linkmode_copy(requested_advertising, config.advertising);
 
 	/* If this link is with an SFP, ensure that changes to advertised modes
 	 * also cause the associated interface to be selected such that the
@@ -3539,6 +3717,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 		return -EINVAL;
 
 	mutex_lock(&pl->state_mutex);
+	phylink_update_user_disabled_advertising(pl, requested_advertising);
 	pl->link_config.speed = config.speed;
 	pl->link_config.duplex = config.duplex;
 
@@ -4022,19 +4201,34 @@ static void phylink_sfp_detach(void *upstream, struct sfp_bus *bus)
 }
 
 static phy_interface_t phylink_choose_sfp_interface(struct phylink *pl,
-						    const unsigned long *intf)
+						    const unsigned long *intf,
+						    const unsigned long *supported,
+						    const struct phylink_link_state *state)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
+	struct phylink_link_state tmp_state;
 	phy_interface_t interface;
 	size_t i;
 
-	interface = PHY_INTERFACE_MODE_NA;
-	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++)
-		if (test_bit(phylink_sfp_interface_preference[i], intf)) {
-			interface = phylink_sfp_interface_preference[i];
-			break;
-		}
+	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++) {
+		interface = phylink_sfp_interface_preference[i];
+		if (!test_bit(interface, intf))
+			continue;
 
-	return interface;
+		tmp_state = *state;
+		tmp_state.interface = interface;
+		linkmode_copy(tmp_supported, supported);
+		if (phylink_validate(pl, tmp_supported, &tmp_state))
+			continue;
+
+		/* Skip this preferred interface if user-disabled in advertising */
+		linkmode_andnot(tmp_state.advertising, tmp_state.advertising,
+				pl->user_disabled_advertising);
+		if (!phylink_is_empty_linkmode(tmp_state.advertising))
+			return interface;
+	}
+
+	return PHY_INTERFACE_MODE_NA;
 }
 
 static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
@@ -4052,6 +4246,11 @@ static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
 		changed = true;
 	}
 
+	linkmode_copy(pl->advertising, state->advertising);
+	if (!pl->phydev)
+		linkmode_andnot(state->advertising, pl->advertising,
+				pl->user_disabled_advertising);
+
 	if (!linkmode_equal(pl->link_config.advertising, state->advertising)) {
 		linkmode_copy(pl->link_config.advertising, state->advertising);
 		changed = true;
@@ -4128,8 +4327,8 @@ static int phylink_sfp_config_phy(struct phylink *pl, struct phy_device *phy)
 static int phylink_sfp_config_optical(struct phylink *pl)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_supported);
 	struct phylink_link_state config;
-	enum inband_type inband_type;
 	phy_interface_t interface;
 	int ret;
 
@@ -4151,15 +4350,16 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	memset(&config, 0, sizeof(config));
 	linkmode_copy(support, pl->sfp_support);
+	linkmode_copy(sfp_supported, support);
 	linkmode_copy(config.advertising, pl->sfp_support);
 	config.speed = SPEED_UNKNOWN;
 	config.duplex = DUPLEX_UNKNOWN;
 	config.pause = MLO_PAUSE_AN;
 
-	/* For all the interfaces that are supported, reduce the sfp_support
+	/* For all the interfaces that are supported, reduce the temporary
 	 * mask to only those link modes that can be supported.
 	 */
-	ret = phylink_validate_mask(pl, NULL, pl->sfp_support, &config,
+	ret = phylink_validate_mask(pl, NULL, sfp_supported, &config,
 				    pl->sfp_interfaces);
 	if (ret) {
 		phylink_err(pl, "unsupported SFP module: validation with support %*pb failed\n",
@@ -4167,7 +4367,8 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 		return ret;
 	}
 
-	interface = phylink_choose_sfp_interface(pl, pl->sfp_interfaces);
+	interface = phylink_choose_sfp_interface(pl, pl->sfp_interfaces,
+						 sfp_supported, &config);
 	if (interface == PHY_INTERFACE_MODE_NA) {
 		phylink_err(pl, "failed to select SFP interface\n");
 		return -EINVAL;
@@ -4176,22 +4377,8 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 	phylink_dbg(pl, "optical SFP: chosen %s interface\n",
 		    phy_modes(interface));
 
-	inband_type = phylink_get_inband_type(interface);
-	if (inband_type == INBAND_NONE) {
-		/* If this is the sole interface, and there is no inband
-		 * support, clear the advertising mask and Autoneg bit in
-		 * the support mask. Otherwise, just clear the Autoneg bit
-		 * in the advertising mask.
-		 */
-		if (phy_interface_weight(pl->sfp_interfaces) == 1) {
-			linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-					   pl->sfp_support);
-			linkmode_zero(config.advertising);
-		} else {
-			linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-					   config.advertising);
-		}
-	}
+	phylink_sfp_update_capabilities(pl, sfp_supported, &config,
+					interface);
 
 	if (!phylink_validate_pcs_inband_autoneg(pl, interface,
 						 config.advertising)) {
@@ -4212,7 +4399,7 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	pl->link_port = pl->sfp_port;
 
-	phylink_sfp_set_config(pl, pl->sfp_support, &config, false);
+	phylink_sfp_set_config(pl, sfp_supported, &config, false);
 
 	return 0;
 }
-- 
2.55.0


