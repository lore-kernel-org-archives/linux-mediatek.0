Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C74C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=; b=weHM5SdRjxJ7c8QXuthNggJ9Uz
	aXwinFy25YFkJbJm4nh4Alh9Hgc7HaPbqObEygrDQRGQdTkiXWYiUun1kfvNJDK3VC4fL0kHIqPNa
	hiMrArhnpCAw7OJow1pJmqON6I2u9XkPcpnfn8UiRyrHyHjG1vYnTQmVgpEzLJVLaoiAgaHvol3OA
	8kN0A1FlL6NLF2TW59QbWOUtmTgawBeO/Ne8P82NY4t1FEVQ7KvSLFX4/MAWAM0krVFqbELSXKpph
	SsGvBMz0KVoZmj6A3/WZJAXNOQFz/F7Sj7yMLvFgkuPXrlqL6YGZbzdpEMQ1PWFTEMLHow7eI3SFv
	pPIsS1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKO0-000000085Vs-0ssD;
	Fri, 07 Aug 2026 13:13:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNw-000000085Rh-1PhS
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49553515a8bso50273605e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108394; x=1786713194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=H137DNobNEpYeuhl71TH65P0nz02bvBn+W+2xhuXWlkgW2SAGnR23vce5EfeMn0vYi
         Fj1C2fDMdVZEBwE+iKB19FppEfIEkslwEmW04+Su9EqTXRnkkNrJ8LG8QyIJ9S8wIZuV
         EqFjYsYaGYbfqxAomcOPgJXMM6vUOUX5UMDxu2fs1AiUnHeKIq9kweNcF51NwhwBWG3d
         STnnNibwimplBx1zbdonpXosfi2WsBO9N0Un1/nLRUfPO1HpXhyqUN3iU/vFO6DKmY+R
         4jBJiGB9aEj26CsEa0BYbTAbuRLktxvQJIDS9bsVHfgwrtYuyLPB3T9hPQd8DHJmVoYM
         ueSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108394; x=1786713194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=EW0lpEHBkrIokvcnq4vho6J8a/TPZUDvVtrX5lUNv0ADLuXN0qc65EBuDSPQRK+EJ7
         cYp4MC6zgvqxAvcUjJxAiBZmvvwHSWOFKdXI3mDixwlrcPZ/rXs5cRjSVMim6A+Ft/tR
         a4i3vSujXcYCYIDO0O5AyDZ+KesU00H6nwxeopJlrSmpJpum8+r9cvBCX6+yIaXfB5uX
         gRsHb1sSvTnZcLy4br6fJDDuqcmLrlSsBAYts/Ip/0uPC0KPhHtvEkzHFVIUP+LEEv0a
         FlUFw61aGGjZEWTiVoeqXnbzXiYAzZx0stu1kXk2htrOPLLmtHvijvJnjK1Zl14TWsVl
         7kHA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9KPtwxXIN/Lgikh5muVDll3oWaeUCvoq/XpgMX1E4um4QD99U07sUn/G/8Lc6GRf2ihnW713OVNkueWUv7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjrGwf+76piHCMPgQIys1UqdXa2V1SuVxsttYN+PsrzOr5CIXr
	Yv/fqIh3O/emLdzpuC05okYvYofhXw5isGXPe88fg7HxtvbUnK0b1Yko
X-Gm-Gg: AR+sD129s9REy+2zvO0CT1Azz4LByRdecdhH8KlZ4Be4zfsD4UjO6SpX01MYu6VDClK
	f/u29NgmqGoN/0Y5Gbp3sc5ig2LJE71D6eDUDCPPKvVthGBywxePliZMFcyErS8a+pLHBEu8naa
	/iHfVnK8Zenq2Jp3EF4i3N8nLUUqxKmm6JZws8i+i23e9VVQFvP9lEFDnOWBhVmY7aMINTAlWK1
	LoGcqiNor2C8DdTjMOh7mbcTON9tau0PYioDIrsF6DXuVgrtP7MW77DAjE6yb4+xeyfZDvWhVms
	yI7cJqSjJOrNqpU/5jLfoxaLTKViNvLsB6rOnPlse/5yuw96Kee9LBD3DpTIkPyxuggjVTqhf0p
	e78YbI5s0oLjUbS5SWe8ngVzvpTmrt3jqQzJbb+iZ6kXJOMfDh1p5Ip922PcI42v4MPGH/L84zu
	4M0xxqLxuDgXdkFiJytcytK3lngoDHDfBePDUdiqqCWskgAA2pIhGJRyn2qncj7CTOw6Yxn+zu8
	FXDbPnKKdRB8+gBw7eMizMcy6NooBjEPUVz0psPJbcoXAjcAyMfyQ==
X-Received: by 2002:a7b:cc0b:0:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-49959e38ecamr104184045e9.15.1786108394327;
        Fri, 07 Aug 2026 06:13:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:13 -0700 (PDT)
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
Subject: [PATCH net-next v11 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri,  7 Aug 2026 15:12:43 +0200
Message-ID: <20260807131301.192060-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061316_567308_834D4D7F 
X-CRM114-Status: GOOD (  17.53  )
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


