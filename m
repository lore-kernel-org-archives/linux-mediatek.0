Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B306CA601F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 18:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=; b=cygyP8hh1p1h7kBqfDqG1K0lx9
	PDCaDTSKxYyg3+cAjG43H+SGkL7+AqFDQTL1cZVT/JUSLQf/9/vOKm2R41pKuS2so0X+8Hr09hMZj
	gphQNWPbzeuMcGZ6aX3aftq4+83PCS+CxmFoIQjps+v6HCOKotw4BbaLegvwkDvwCC6tWnLDk2JyU
	/HMPdwhQWhJtenZx80lom9M0CFOPLQGFXHMyhOf+mODQ6hOLasocujDO7a3f2fAObme5PS8jkETSF
	0sGjiOV+nFfV6lh93/aT72IlGDdkJyvfrMGDUr8e5y8W/Y12XOtkjfmpAc8JV2YYMgXmqaHr/UTs+
	pixGdhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFL0-00000006xIz-1EC1;
	Fri, 09 Oct 2026 18:28:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFKw-00000006xF4-0z4C
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 18:28:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so1581975e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570532; x=1792175332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=k4ezK2MiQWkfDjF8nw+1AfpOUrMZAoCb6mHt+1KGHdTVh9reeRN1/vahbh8VlCVi64
         HI2cJspkL0ZeQPGOFxkPA/3JA/u7RKaDrtDYY2xq8ym45dqNDt+pPqFU8yh2gjbpYRx0
         ud5lmliCbciJvV/5SQEy+lq1rWciXL/8C9wbOF1z8PugmlJSBqKrdDKCUnDbeqsFU4/S
         OyCEOXfMlUnnp+UFgh9wH0PjgREyCVMiSruGBzGrKneeVgWbD7TvEji8K1qD4i55QXoS
         7I0MOgrSNMQi46IqLqmAHcFaHBEDBEYjK69nq1MG/PCuVnlpuUZt7Vg5KDzFSspnMaV3
         jVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570532; x=1792175332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=lZq2DcYjjC8raZzi+AYUQofF8DVDdTQohg0byNBxfxHMddW9ATW5g8xjov0G0gmYGg
         OHLx3wDXWcmUWdidSK0JybVgTtHHgYY2vo3YQavTMGxj1X1IWP9ExKgFxpkDUVNVsVla
         k2qR6aXc7XfrAmODmYaKnVjyTqYjkiJiz/Bb/95+DUMa4jFyalSQR897Vin4cz1F9GI4
         IA6Ob1EBTsrnFdBuWJKyK4MO0W2OCeJpWOiA300tCsBHgYOxjJWoCkAmYjexi69BkUmx
         45ALM0zOVCNswmY1MKePt8CAGZRIRofNug9Xww/547AViFf0hcLMaqY3+cm+GvKKpaH7
         5Qgg==
X-Forwarded-Encrypted: i=1; AKwUvByLvpsB8QsZMXz/mCA5VoMswredpTtsnOCKPjeZhnxO3poC/Av2BbIyql+DwiazMIH+h2maHIZ7Bb5agEsHeA==@lists.infradead.org
X-Gm-Message-State: AFuF++ntpy5mGvrxIu0BEfoqQi8n2vKKVZSW42M5sAIma7oCWGpcNhRS
	gSdRoBKhScaZQOj6/KSZfPfjC2UUIRPbrUaHD21sUgL3R67MsWkQOc63
X-Gm-Gg: AYBFou1hQfpGe05Ik8ByMrQgmlJCYhMDgHPttXfO4FlrX/L0TwRF8ua7BmI2+UxeoHx
	Dov5wWQY3/j0EfoRRu67/pF1rgVlXJfHIfY5vjguV8lehbuujeSlDG+Gls6evpwNGArql0xdZLA
	kTWUyyr/cpIHTmWjy11SqlSZMEynA7FGmmIodjPJvMMFQJfXMZPcBm285h/Cu5vqvg5oxj3zl+6
	0E3E4RTqW4IUf46lh84uvGYizsC+/CNsoIx7hF9PQwUxMeaE2V6jzOMuTKauA3E1TB5EGwiZzrm
	SauI1Xp11kMW0gDYryRoPJ++WHlNwyUGmDDLMBFrr8Jg7aRAstDjXjWhnFvDm9ARDjlY7gQwfzC
	AhP9TfTcpUQQslWoxYB3O2nGV+UpB0dn+xzCNZVkp2id8yrJPau4JuxWn5ToLxN0N+Ji7jQkPYb
	L/4/8cFe+PT05aUfTNM5odkCusBpmTd8DwSaIAg20KuHqiAcvpegNqHO2CyYijQ3d5x4qr510pO
	eavwzrKMkINkiJiYRN7s8DSyAQNy+LADWHiU5EW3fh1cP2E6wp/pNM+tjtG0/nIXOAFYKCnkr11
	mO0iCtZy28z31kW/BA==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr40285605e9.32.1791570531906;
        Fri, 09 Oct 2026 11:28:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:28:50 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri,  9 Oct 2026 20:27:57 +0200
Message-ID: <20261009182836.50631-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112854_299438_99534EC5 
X-CRM114-Status: GOOD (  17.58  )
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

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a7d086cdc9b2..a98e62fa4bd2 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2026,6 +2031,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2147,7 +2155,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2961,12 +2969,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3845,14 +3853,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -4023,7 +4031,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0


