Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B993C5AD55
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=; b=QuxFnPU4xcB3VOwBadEy2ZxOkr
	XOThEUHMk4S3uYsHdYHKda6rFiqUgaBLzySXelt7Cth0sZbJ12LdaxXdGkTB2kPSMrMahC+nRXOdV
	5myC8wveYocPF9ToVS7o+tRjCZ/cLY62Q1anCCma51tDqwLSYbf3ToLI7cEqhaiqOQpT4U2y3i9ju
	MXmQaKy/JKm/uCQ9olWBbFal1Uo+L5/kMa7WqWbGaU/aLLcHus1nxTrxcMqaKk7NXrfTY9eYS2IZ1
	mLSqH0FKJ4LBKQ891fP9/c+OhHFY37Ynm2k2GvUchTWsiCSMqAq/XdH+o/DBFSWm1Di40D1Om7+RN
	mgXHcVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABA-0000000Afp8-2xjp;
	Sun, 09 Aug 2026 20:31:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAB8-0000000AfnF-1Mjy
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49557167508so9526365e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307488; x=1786912288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=KklF8i92t2W+j5GKGFdBn+TKZebFCIfq2QLCEwY/KBRd1RPxt64tiSIv5e1j7YCJeS
         nvGbBqiXjpfypYBQCiLgz772MGlDqUiMiottjB8puzRPjvMWGJAZNkG+TpS7NPhZIgfL
         xA0+8xI2RglaGWjQ+0KnkS91xafPS2IzNDAp9/Zq61oAg0hzUmlVXWSHgL2k6qeLibgD
         EvvdvWk0B8nn1Qjvirrd7AzKSYjwl8wzluUg0Lugp/vN6HRM41SXtRA+3fCk+GEMEshq
         M0VnHeoj7KbZiPrL024S5TvzJVq4LPBhtz3QBzSh96cL5rc67YGEq/eDsTHQNKykunCn
         qdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307488; x=1786912288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=KzzM0xaftKGeVcP/gOgtXnQz0CScS4uiZspsBc3vwME9FS7j0Yrn6j/5Q+eIXFlT5Y
         kJeQwLUmiVaIpZBOPEWdglv8srbmampiXsD6EbHeV93U+ZpO8tNc28/jRZCKIUZt79lh
         bJdAgJU8wQsXRR+H+PyktkpRb0IGy6NPx9U4sq826UusB92P1NZjvI9YuBZpZ2g1kHlT
         1QVu3ffNt52KCzJ0hJ+D39ZU0EKL1xrUFFB7Gw4ZTuGkcZks5D5PthHqsODi/nszMmEA
         pzrqkMb7HY7VYce+zF92yHaTaeifEadgN+s9pv6uC134VEavBINnwjXcJupuTkzCFeK2
         6BfA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9HfRSLGN0zXBqGZTws5anMXLwwxeXrcO7a4yRRs+MazAS+VcMbgJ6XOL8ZWsIQWftYqlQ8SaZaopMi80oQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9lSFBZW/BdFOw8ZRawzu1+vAyAaxzZT10B7CuIS9UoBnhTldh
	F47nWfzzMKHW/ZGPQNqkqfwc7kldJ5FfAntMnCy/UNkU0BkYE+x782HD
X-Gm-Gg: AR+sD1095lwFvZ5W9P8CLCJ5JkOfVp30qtEwGac/i4bgE4KeFkrleo4yn8CAt8avI+Q
	/yFqbwMCTlel/5VfJzwXtBchUcnRjD6NQ8OQVOEdADo+ENetkXg4SUICIAufsNGlWVPjNQSfTMl
	+WatnXlppoTKaKcY8Te5+vQs7Xq29oLgmBDZEkBaX+NRD64JI8h75D1lQfCsHJvhPCx5W7efhur
	4xmJ/wl/n+FPEP5NYJYCt8biQe5LaV841W9CWaKowooZqUl1h+nYj0HALNwf+ImvQtLoryTfYnp
	v7OPNsEeU3lAe3itPf5Syv5qA5Hg7au0v8H4tLOgzUaePuBV8Vo0pc1SSanCt+DKjlrRfissycO
	DTxCTmuYg93gBaYLlCeepsBiPUr2f9I4WYThJN4dx5/AIldBRW61RbFnIe+f+ltknX5LZ/bQBRo
	3Cixf2zaL2Mbl4ksKFMCuio2K89KunaPzpm2pfXex8TiicEh1ldz0yIuGWr0qewuc7IYhgqIGxH
	tlXb547SlOpaFdkuYvFXsWnEzi3qJ6mNQ3bn0oYUXu3moPZ
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-49951b8d652mr428256435e9.3.1786307488474;
        Sun, 09 Aug 2026 13:31:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v12 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sun,  9 Aug 2026 22:30:58 +0200
Message-ID: <20260809203116.640271-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133130_385693_B408F797 
X-CRM114-Status: GOOD (  17.91  )
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
index b241768edbcb..b7180ae76cc8 100644
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
@@ -1878,6 +1883,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -2024,7 +2032,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2824,12 +2832,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3757,14 +3765,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3935,7 +3943,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


