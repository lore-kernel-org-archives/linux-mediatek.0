Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9D606A335
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D8XcR2Q4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulWROBCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ws/YN6ACF8XyocpnxEMNfixqo2alevxFzQaiIzjhqZY=; b=D8XcR2Q4i0YyFL
	dq900ECjqZug7oZZILlnTJ7neIj9DoO3Cf/iHj5eBzD8MoO7Rb4xcz/NliGQDBjEJIr1h+pI6Skea
	Z4MZj8egwlzyYgJNxzLnh7SBTtSUoX8mhZPrZZU18mAFPqyCbfChYwleInSB5R59WO8IlIyuIzjV7
	iQHeDHUA6fUzuKdQz1komObJX4+A3DiRbppX1Na6befrbk14LK+spHyTKnKrwKkTdlDTKNAZUSJq8
	ah9lhtYAY2+ECkD2wn9WxuG3oEDE6bvd8LqOlIHeg+RrmT7Cdc5ZfyGNZ5UqR/9kyt5f6SHpXUiKN
	DtcPrEU2+iN+HjtcmDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfY-00000003FeF-2W0h;
	Mon, 16 Nov 2026 16:35:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfB-00000003FGL-1gqc
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-490585eddfcso2640406f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846875; x=1795451675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ws/YN6ACF8XyocpnxEMNfixqo2alevxFzQaiIzjhqZY=;
        b=ulWROBCNpkPA+U2H06BclVhSq2/Ulfi4TvqlNidduHsh3dmtzNr9ieRiOCHfs23Znp
         ADjlaQ9V48+pd1BtI5kOppI8+XP4IONa+1rYbjV28vGmDrP5kITblGaXC1ddAHxLhK8h
         KP6w2aZIBeQdKaw0OLyTBzIHwo0iIhYfl4i3Iz80TenjtB6/J0HHmQ1fTrqYyyGuaIlP
         RtnLnMD080u0VcaBlgN3qIGg09d1cG/FqxzqNCE9zsTnXQEEfYHGg0HhXl3qnPygc5dW
         fPzVen8mDMOmV6pnNRWof5KF0yZYjq5dYP0m/1k6TR3vlURXv/mcGxRHbAn1t140xhQP
         9Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846875; x=1795451675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ws/YN6ACF8XyocpnxEMNfixqo2alevxFzQaiIzjhqZY=;
        b=pDUe08TR3euXe3zQZY7khBQ70KJl5L6wkMRS54ua97XItdu1iQXqW4oWcFJ8Nttn29
         Mapi6b5tw41qn09I2G9ZS9yiF/xNtHPcTqez/IWGdOQx1/MX2IFn8LR38M5xM4DEEL29
         wKQouuUfuvEy8qtAcwzL1nrLciif7J0YQlFdSIXT3oA13Amz8OMf4OJsKJ/6Io/tl7gG
         3lncTk4GxX7sPXFYD3zsSE1omy7myYugBQ2rMWbY19JmO9fhCUsz1YYMR5iaK9CPpjjs
         TY32T9Sxnc73K0nYG/KxEqMBmJh+cDARqf+UJCUEOuqhUuQYIdKqODJUifcHXpEeEY06
         vhOA==
X-Forwarded-Encrypted: i=1; AL+hErGvPN8WzFgDF7omQi3y9X8qEb0q5pvnbwqLtA2F9ruNUGLdlOK3KgM80mXdGRLotzCVUjj3aUo1rqVbHgfFog==@lists.infradead.org
X-Gm-Message-State: APuU4Z8U7xOGBDC9IPd5QZDxZ3QCto1qaURMs8maRhLIvKz1kchU75gA
	L6cJZmqp6nlGJ9THdXQxqueeX+kwfPHvtARi7Rn1Mf6sRKz9whjk6SJd
X-Gm-Gg: AZFdTZfX1mf5c8ylpp2+oV9vxvWrVRHCIXVXhGxsvqmJWnMz+ToPByRbNhznauDy1ay
	S52Ay6eWGbYarHBQGn/C9CTuCPhXKZc+ZuwsmEB9ow5p4xsrz6Vs5KawjrIXXmabDNa/qz2O+9I
	FP4/kmXW7A0zHZAir0DWsz/JP/bdAIFaVnONfBI4D7lTZAT8MYtbq8aaDuFqHiDi/9cXyH3wqf9
	J7j3/Fs29w/vV30p56dpyfwJ8xQpWkecS60HKleF81SWFiF6II2Rt/SYY1B+B01VVpBqz1ofAse
	UATfjv5MIXAc6wzkwZFhaVEPuva/4y+OmnvwaXRhOOxV5IiiWNMZC6elZEBrYSeouk+KNY3SncV
	lPDV6lsXeJm11vuHwI/eAXhcc8sFjnCc9dYwpj7Air/pTG0ng9LXPu3YFNX5o3qdbtGRznp751Q
	40rcZcAmPaNYwaupR0RcBnTcmtHHsSO+p+ENKUMCRsSt7QMqiHZzdmnVf0yMmIQTXR69xf4ZNbN
	Jtm+oymktkmjh8y8h+t6vB+ijkXApSz0aUaGKroJBGtLGFzC0/6sjxwBmV6ukxYIh6G477nl4ez
	xlIf5D5YCII4w2KrXRJr10KJlFL9SazCpm2bp/9mFxfFtT95QdyTztnMPvk+XhsK57sKyk8vzo2
	zPH/DD6SRr77D15XJsPwojsUfIVt0xi4xEw==
X-Received: by 2002:a05:6000:41d1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-49c72ba72b1mr21569635f8f.51.1794846875361;
        Mon, 16 Nov 2026 08:34:35 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH net-next v21 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Mon, 16 Nov 2026 17:33:50 +0100
Message-ID: <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083437_503749_70C521F9 
X-CRM114-Status: GOOD (  23.48  )
X-Spam-Score: -2.1 (--)
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
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

phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
account for the user-disabled modes, first in the
phylink_sfp_interface_preference loop and then on updating the link_config
advertising.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 93 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 81 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2af665790564..6dcd0d1f960a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,8 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(user_disabled_advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -717,6 +719,41 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_update_capabilities(struct phylink *pl,
+					struct phylink_link_state *config)
+{
+	lockdep_assert_held(&pl->state_mutex);
+
+	/* Calculate the full supported advertisement */
+	linkmode_copy(config->advertising, pl->supported);
+	__phylink_validate(pl, pl->supported, config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, config->advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(config->advertising,
+			pl->advertising, pl->user_disabled_advertising);
+}
+
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
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -815,6 +852,7 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
 
 	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
 			    pl->supported, true);
@@ -840,6 +878,7 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 
 	linkmode_and(pl->link_config.advertising, pl->link_config.advertising,
 		     pl->supported);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
 
 	pl->link_config.link = 1;
 	pl->link_config.an_complete = 1;
@@ -922,6 +961,8 @@ static int phylink_parse_mode(struct phylink *pl,
 				    "failed to validate link configuration for in-band status\n");
 			return -EINVAL;
 		}
+
+		linkmode_copy(pl->advertising, pl->link_config.advertising);
 	}
 
 	return 0;
@@ -2152,7 +2193,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	__phylink_validate(pl, pl->supported, config);
+	phylink_update_capabilities(pl, config);
 
 	pause_state = config->pause;
 
@@ -2252,6 +2293,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2275,9 +2318,10 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	mutex_lock(&pl->state_mutex);
 	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_update_capabilities(pl, &pl->link_config);
+	mutex_unlock(&pl->state_mutex);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
@@ -2534,6 +2578,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	pl->phy_state.rate_matching = RATE_MATCH_NONE;
 	linkmode_copy(pl->supported, supported);
 	linkmode_copy(pl->link_config.advertising, config.advertising);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
 
 	/* Restrict the phy advertisement according to the MAC support. */
 	linkmode_copy(phy->advertising, config.advertising);
@@ -3396,6 +3441,7 @@ static bool phylink_validate_pcs_inband_autoneg(struct phylink *pl,
 int phylink_ethtool_ksettings_set(struct phylink *pl,
 				  const struct ethtool_link_ksettings *kset)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(requested_advertising);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
 	const struct link_capabilities *c;
 	struct phylink_link_state config;
@@ -3485,6 +3531,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 	 */
 	linkmode_mod_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, config.advertising,
 			 kset->base.autoneg == AUTONEG_ENABLE);
+	linkmode_copy(requested_advertising, config.advertising);
 
 	/* If this link is with an SFP, ensure that changes to advertised modes
 	 * also cause the associated interface to be selected such that the
@@ -3532,6 +3579,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 		return -EINVAL;
 
 	mutex_lock(&pl->state_mutex);
+	phylink_update_user_disabled_advertising(pl, requested_advertising);
 	pl->link_config.speed = config.speed;
 	pl->link_config.duplex = config.duplex;
 
@@ -4015,19 +4063,34 @@ static void phylink_sfp_detach(void *upstream, struct sfp_bus *bus)
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
@@ -4045,6 +4108,11 @@ static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
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
@@ -4160,7 +4228,8 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 		return ret;
 	}
 
-	interface = phylink_choose_sfp_interface(pl, pl->sfp_interfaces);
+	interface = phylink_choose_sfp_interface(pl, pl->sfp_interfaces,
+						 pl->sfp_support, &config);
 	if (interface == PHY_INTERFACE_MODE_NA) {
 		phylink_err(pl, "failed to select SFP interface\n");
 		return -EINVAL;
-- 
2.55.0


